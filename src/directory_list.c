#include "directory_list.h"
directory_data directory;

int __cdecl CFunc_DeleteSaveFile (CStruct *params, CScript *script)
{
	char *FileType = "";
	char *save_filename;
	char save_path [MAX_PATH];
	CStruct *out = CScript_GetParams(script);
	CStruct_GetString(params,0x91D9667F, &save_filename, 0);
	
	snprintf(save_path, sizeof(save_path), ".\\Save\\%s.%s", save_filename,directory.type_ext);
	if (DeleteFileA(save_path)) 
	{
		logInfo("file deleted successfully");
		return 1;
	} 
	else logInfo("failed to delete file!");

	return 0;
}

int __cdecl CFunc_GetSaveDirectoryListing(CStruct *params, CScript *script)
{
	CStruct *out = CScript_GetParams(script);
	if (directory.count == 0) return 0;
	if (directory.current_count < directory.count && directory.current_count < 75)
	{
		CStruct_AddString(out,0x91D9667F/*save_filename*/, directory.list [directory.current_count].name);
		//printf("save to list: %s\n", directory.list [directory.current_count]);
		directory.current_count++;
	}
	else return 0;

	return 1; 
}

int __cdecl CFunc_BuildSaveDirectory (CStruct *params, CScript *script) // also returns file count of specific type
{
  // directory search setup
	CStruct *out = CScript_GetParams(script);
	WIN32_FIND_DATA save_dir;
	HANDLE save_search;
	char search_string[20] = {0};
	char *FileType = "";
	float f_PageCycle = 0;
	CStruct_GetFloat (params,0x959842AD, &f_PageCycle, 0);
	CStruct_GetString(params,0x11093FB5, &FileType, 0);
	int PageCycle = (uint8_t) f_PageCycle;

	// set directory type, search based on size
	if (!strcmp(FileType,"SKATER")) {strcpy(directory.type_ext,"SKA"); directory.type_size = SKA_SIZE;}
	else if (!strcmp(FileType,"CAREER")) {strcpy(directory.type_ext,"CAR"); directory.type_size = CAR_SIZE;}
	else if (!strcmp(FileType,"NETWORK SETTINGS")) {strcpy(directory.type_ext,"NWS"); directory.type_size = NWS_SIZE;}
	else if (!strcmp(FileType,"PARK")) {strcpy(directory.type_ext,"PRK"); directory.type_size = PRK_SIZE;}
	else goto fail_path;

	snprintf(search_string, sizeof(search_string), ".\\Save\\*.%s", directory.type_ext);
	save_search = FindFirstFile(search_string, &save_dir);
	if (save_search == INVALID_HANDLE_VALUE) goto fail_path;

  if ( (directory.page + PageCycle >= 0) && PageCycle != 0) directory.page += PageCycle;
	directory.current_count = 0;
	directory.count = 0;
	memset(directory.list,0,sizeof(directory.list));
	
	// directory search + build
	do // first pass count check
	{
		if ((save_dir.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)) continue; // reject sub directories
		if (directory.type_size != save_dir.nFileSizeLow || save_dir.nFileSizeHigh != 0 ) continue;
		directory.count++;
	} while (FindNextFile(save_search, &save_dir) != 0);
	FindClose (save_search);

	if (directory.count == 0) goto fail_path;
	if (directory.count < (directory.page*75)) directory.page-=1;
	save_search = FindFirstFile(search_string, &save_dir);

	do 
	{
		if ((save_dir.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)) continue; // reject sub directories
		if (directory.type_size != save_dir.nFileSizeLow || save_dir.nFileSizeHigh != 0 ) continue;

		int name_len = strlen(save_dir.cFileName);
		if (name_len <= 4 || name_len >= NAME_SIZE + 4) continue;
		save_dir.cFileName [name_len - 4] = '\0'; // cut off .ska

		//bool actual_name = actualNameCheck (save_dir.cFileName, directory.type);
		//if (!actual_name) continue;
		uint64_t save_timestamp;
		memcpy(&save_timestamp, &save_dir.ftLastWriteTime, sizeof(uint64_t));
		bool inserted = false;
		if (directory.current_count < 75)
		{
			for (int i = 0; i < directory.current_count; i++)
			{
				if (save_timestamp > directory.list[i].timestamp)
				{
					for (int j = directory.current_count - 1; j >= i; j--)
					{
						strcpy(directory.list[j+1].name, directory.list[j].name);
						directory.list[j+1].timestamp = directory.list[j].timestamp;
					}
					strcpy(directory.list[i].name, save_dir.cFileName);
					directory.list[i].timestamp = save_timestamp;
					inserted = true;
					break;
				}
			}
		}
		if (!inserted)
		{
			strcpy(directory.list[directory.current_count].name, save_dir.cFileName);
			directory.list[directory.current_count].timestamp = save_timestamp;
		}
		directory.current_count++;
	} while (FindNextFile(save_search, &save_dir) != 0);
	directory.current_count = 0;
	FindClose (save_search);
	
	logInfo("%s total file count: %d",FileType, directory.count);
	CStruct_AddInteger(out,0x0A80A097/*proper_file_count*/, directory.count); 
	return 1;

	fail_path:
	logInfo("no %s files found in the directory.",FileType);
	CStruct_AddInteger(out,0x0A80A097/*proper_file_count*/, 0);
	return 0;
}










// zed :
// we could just use `GetMostRecentSave`, but that won't work once directory changes come
// at some point this will become `BetterGetMostRecentSave` that takes param of what type needing

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
		if (save_dir.nFileSizeLow != SKA_SIZE || save_dir.nFileSizeHigh != 0) continue;
		uint64_t saveTimestamp;
		memcpy(&saveTimestamp, &save_dir.ftLastWriteTime, sizeof(uint64_t)); // ftLastWriteTime is struct of high and low 32 bit
		if (saveTimestamp > newestTimestamp)
		{
			int name_len = strlen(save_dir.cFileName);
			if (name_len <= 4 || name_len >= NAME_SIZE + 4 || _stricmp(save_dir.cFileName + name_len - 4, ".ska") != 0) continue;
			save_dir.cFileName [name_len - 4] = '\0'; // cut off .ska
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
