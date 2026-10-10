#include "updater.h"

#include "log.h"
#include "version.h"

#include "partymod-thps4/src/config.h"

#include <windows.h>
#include <stdio.h>
#include <string.h>

extern char executableDirectory[1024];
extern char configFile[1024];

#define UPDATE_EXIT_CODE_UPDATING 2

void checkForUpdate() {
	if (!getIniBool("Updater", "CheckForUpdates", 1, configFile)) {
		logInfo("checkForUpdate: disabled via ini; skipping");
		return;
	}

	char scriptPath[1024];
	_snprintf(scriptPath, sizeof(scriptPath), "%sbetter4updater.ps1", executableDirectory);
	scriptPath[sizeof(scriptPath) - 1] = '\0';

	logDebug("checkForUpdate: looking for updater at \"%s\"", scriptPath);

	if (GetFileAttributesA(scriptPath) == INVALID_FILE_ATTRIBUTES) {
		logWarning("checkForUpdate: no script found; skipping update check");
		return;
	}

	DWORD ourPid = GetCurrentProcessId();
	char cmdLine[2048];
	_snprintf(cmdLine, sizeof(cmdLine),
		"powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -File \"%s\" -CurrentVersion \"%s\" -CallerPid %lu",
		scriptPath, BETTER4_VERSION, ourPid);
	cmdLine[sizeof(cmdLine) - 1] = '\0';

	logDebug("checkForUpdate: launching: %s", cmdLine);

	HANDLE hNul = CreateFileA("NUL", GENERIC_READ | GENERIC_WRITE,
		FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL);
	if (hNul == INVALID_HANDLE_VALUE) {
		logWarning("checkForUpdate: CreateFileA(NUL) failed (error %lu)", GetLastError());
		return;
	}
	SetHandleInformation(hNul, HANDLE_FLAG_INHERIT, HANDLE_FLAG_INHERIT);

	STARTUPINFOA si;
	memset(&si, 0, sizeof(si));
	si.cb = sizeof(si);
	si.dwFlags = STARTF_USESTDHANDLES;
	si.hStdInput = hNul;
	si.hStdOutput = hNul;
	si.hStdError = hNul;
	PROCESS_INFORMATION pi;
	memset(&pi, 0, sizeof(pi));

	BOOL created = CreateProcessA(NULL, cmdLine, NULL, NULL, TRUE, CREATE_NO_WINDOW, NULL, NULL, &si, &pi);
	CloseHandle(hNul);

	if (!created) {
		logWarning("checkForUpdate: CreateProcessA failed (error %lu)", GetLastError());
		return;
	}

	logDebug("checkForUpdate: spawned better4updater.ps1 as PID %lu, waiting for it to finish...", pi.dwProcessId);

	WaitForSingleObject(pi.hProcess, INFINITE);

	logDebug("checkForUpdate: better4updater.ps1 (PID %lu) finished", pi.dwProcessId);

	DWORD exitCode = 0;
	GetExitCodeProcess(pi.hProcess, &exitCode);

	logDebug("checkForUpdate: better4updater.ps1 exit code = %lu", exitCode);

	CloseHandle(pi.hProcess);
	CloseHandle(pi.hThread);

	if (exitCode == UPDATE_EXIT_CODE_UPDATING) {
		logInfo("checkForUpdate: update in progress; exiting to let it finish");
		ExitProcess(0);
	}

	logInfo("checkForUpdate: done; loading normally");
}
