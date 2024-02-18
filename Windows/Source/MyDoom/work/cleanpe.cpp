#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>

#define VERBOSE
#define STUBSIZE 0x40	/* 64 */

void main(int argc, char *argv[])
{
	if (argc < 2) {
		printf("Usage: %s <filename.exe>\n", argv[0]);
		return;
	}

	HANDLE h = CreateFile(argv[1], GENERIC_READ|GENERIC_WRITE, FILE_SHARE_READ, 0,
		OPEN_EXISTING, 0, 0);
	if (h == INVALID_HANDLE_VALUE) {
		printf("%s: cannot open \"%s\"\n", argv[0], argv[1]);
		return;
	}

	if (GetFileSize(h,0) < 0x100) {
		printf("%s: invalid size\n", argv[0]);
		CloseHandle(h);
		return;
	}

	DWORD dwPeOffs, dwRead, dwWritten;
	SetFilePointer(h, 0x3C, 0, FILE_BEGIN);
	ReadFile(h, &dwPeOffs, 4, &dwRead, 0);

#ifdef VERBOSE
	printf("PE header offset: 0x%.8X\n", dwPeOffs);
#endif

	DWORD i;
	SetFilePointer(h, STUBSIZE, 0, FILE_BEGIN);
	for (i=STUBSIZE; i<dwPeOffs; i++) {
		BYTE c = 0;
		WriteFile(h, &c, 1, &dwWritten, 0);
	}

#ifdef VERBOSE
	DWORD dwOldTime;
	SetFilePointer(h, dwPeOffs+0x08, 0, FILE_BEGIN);
	ReadFile(h, &dwOldTime, 4, &dwRead, 0);
	printf("Old timestamp: 0x%.8X\n", dwOldTime);
#endif

	SetFilePointer(h, dwPeOffs+0x08, 0, FILE_BEGIN);
	i = 0;
	WriteFile(h, &i, 4, &dwWritten, 0);

	CloseHandle(h);
}