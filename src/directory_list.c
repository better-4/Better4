#include "directory_list.h"
directory_data directory = {0};

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
	// called in loop on scriptside
	CStruct *out = CScript_GetParams(script);
	int index = directory.current_count + (75*directory.page);
	if (directory.count == 0) return 0;
	printf("index : %d\n", index);
	if (index < directory.count && directory.current_count < 75)
	{
		CStruct_AddString(out,0x91D9667F/*save_filename*/, directory.list [index].name);
		//printf("save to list: %s\n", directory.list [directory.current_count]);
		directory.current_count++;
	}
	else 
	{
		free(directory.list);
		directory.list = NULL;
		return 0;
	}

	return 1; 
}

int __cdecl CFunc_BuildSaveDirectory (CStruct *params, CScript *script) // also returns file count of specific type
{
  // directory search setup
	WIN32_FIND_DATA save_dir;
	HANDLE save_search;

	char search_string[20] = {0};
	char *FileType = "";

	int PageCycle = 0;
	float f_PageCycle = 0;
	
	CStruct *out = CScript_GetParams(script);
	CStruct_GetFloat (params,0x959842AD, &f_PageCycle, 0);
	CStruct_GetString(params,0x11093FB5, &FileType, 0);
	PageCycle = (int) f_PageCycle;

	// set directory type, search based on size
	if (!strcmp(FileType,"SKATER")) {strcpy(directory.type_ext,"SKA"); directory.type_size = SKA_SIZE;}
	else if (!strcmp(FileType,"CAREER")) {strcpy(directory.type_ext,"CAR"); directory.type_size = CAR_SIZE;}
	else if (!strcmp(FileType,"NETWORK SETTINGS")) {strcpy(directory.type_ext,"NWS"); directory.type_size = NWS_SIZE;}
	else if (!strcmp(FileType,"PARK")) {strcpy(directory.type_ext,"PRK"); directory.type_size = PRK_SIZE;}
	else goto fail_path;

	snprintf(search_string, sizeof(search_string), ".\\Save\\*.%s", directory.type_ext);
	save_search = FindFirstFile(search_string, &save_dir);
	if (save_search == INVALID_HANDLE_VALUE) goto fail_path;

	directory.current_count = 0;
	directory.count = 0;
	directory.capacity = 0;
	//memset(directory.list,0,sizeof(directory.list));
	
	// directory search + build
	do 
	{
		if ((save_dir.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)) continue; // reject sub directories
		if (directory.type_size != save_dir.nFileSizeLow || save_dir.nFileSizeHigh != 0 ) continue; // size check

		// name check and extension cuttoff
		uint16_t name_len = strlen(save_dir.cFileName);
		if (name_len <= 4 || name_len >= NAME_SIZE + 4) continue;
		save_dir.cFileName [name_len - 4] = '\0';
		//bool actual_name = actualNameCheck (save_dir.cFileName, directory.type);
		//if (!actual_name) continue;

		// timestamps are compared as 64 bit value
		uint64_t save_timestamp;
		memcpy(&save_timestamp, &save_dir.ftLastWriteTime, sizeof(uint64_t));
		bool inserted = false;
		
		// make sure theres room
		if (directory.count == directory.capacity)
		{
			uint32_t new_cap = directory.capacity ? directory.capacity * 2 : 16;
			save_entry *tmp = realloc(directory.list, new_cap * sizeof(*tmp));
			if (!tmp)
			{
				logInfo ("allocation failure with directory :(");
				goto fail_path;
			}
			directory.list = tmp;
			directory.capacity = new_cap;
		}
 
		// add entry to list
		strcpy(directory.list[directory.count].name, save_dir.cFileName);
		directory.list[directory.count].timestamp = save_timestamp;
		directory.count++;
		
	} 
	while (FindNextFile(save_search, &save_dir) != 0);
	FindClose (save_search);

	if ( ((int)directory.page + PageCycle >= 0) && PageCycle != 0) directory.page += PageCycle;
	if (directory.page*75 > directory.count) directory.page--;

	qsort(directory.list,directory.count,sizeof(save_entry),CompareTimestamp);
	logInfo("%s total file count: %d",FileType, directory.count);
	CStruct_AddInteger(out,0x0A80A097/*proper_file_count*/, directory.count); 
	return 1;

	fail_path:
	logInfo("no %s files found in the directory.",FileType);
	CStruct_AddInteger(out,0x0A80A097/*proper_file_count*/, 0);
	return 0;
}


int CompareTimestamp(const void *a, const void *b) 
{
    const save_entry *entryA = (const save_entry *)a;
    const save_entry *entryB = (const save_entry *)b;

    // returns -1 if A > B (so A comes first), 1 if A < B, 0 if equal
    return (entryB->timestamp > entryA->timestamp) - (entryB->timestamp < entryA->timestamp);
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
