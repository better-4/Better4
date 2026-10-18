#include "directory_list.h"

int __cdecl CFunc_GetMostRecentCAS(CStruct *params, CScript *script) // if no cas found, game goes to vanilla routine
{
	CStruct *out = CScript_GetParams(script);
	uint64_t newestTimestamp = 0;
	char newestCasName[NAME_SIZE] = {0};
	WIN32_FIND_DATA save_dir;
	HANDLE ska_search = FindFirstFile(".\\Save\\*.SKA", &save_dir);

	if (ska_search == INVALID_HANDLE_VALUE) return 0;

	do
	{
		if (save_dir.nFileSizeLow != SKA_SIZE) continue;
		uint64_t saveTimestamp;
		memcpy(&saveTimestamp, &save_dir.ftLastWriteTime, sizeof(uint64_t)); // ftLastWriteTime is struct of high and low 32 bit
		if (saveTimestamp > newestTimestamp)
		{
			int name_len = strlen(save_dir.cFileName);
			if (name_len > 4 && name_len < NAME_SIZE + 4) save_dir.cFileName [name_len - 4] = '\0'; // cut off .ska
			else continue;
			newestTimestamp = saveTimestamp;
			snprintf(newestCasName, sizeof(newestCasName), "%s", save_dir.cFileName);
		}
	} while (FindNextFile(ska_search, &save_dir) != 0);
	FindClose(ska_search);

	// if corrupt cas does get passed, game will load default dude
	if (newestTimestamp == 0) return 0;
	logInfo("most recent cas : %s",newestCasName);
	CStruct_AddString(out,0xF36C1878/*casfilename*/, newestCasName);
	return 1;
}
