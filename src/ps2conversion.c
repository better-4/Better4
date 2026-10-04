#include "ps2conversion.h"
//todo: implement page system for 'unlimited saves' , cleanup?
// more rewrite :p
directory_t directory = {0};
const char TH4ProductCodesPS2 [5][20] = 
{
	"SLUS-20504", // NTSC
	"SLES-51130", // PAL
	"SLES-51132", // PAL
	"SLES-51131", // Greatest Hits PAL
	"SLPM-65419" // JPN
};

bool doesSaveExist (th4_save *save)
{
	if (save->type == SAVE_TYPE_SKA)
		snprintf(save->path, sizeof(save->path), ".\\Save\\%s.SKA", save->name);
	else
		snprintf(save->path, sizeof(save->path), ".\\Save\\%s.PRK", save->name);
	
	FILE *cas_check = fopen(save->path, "r");
	if (cas_check != NULL) {
		fclose(cas_check);
		printf("this save already exists in the directory, next!\n\n");
		return true;
	}
	//printf("new path : %s\n", path);
	return false;
}

bool getSaveName (th4_save *save)
{
	int index = SKA_PRK_NAME_OFFSET;
	int name_len = 0;

	while ( (save->data[index] != 0) && (name_len < NAME_SIZE - 1) ) {
		if (save->data[index] == ':') {
			printf("name contains colon, cannot be converted. next!\n\n");
			return false;
		}
		save->name[name_len] = save->data[index];
		index++;
		name_len++;
	}
	save->name [name_len] = '\0';
	printf("save name : %s\n", save->name);
	return true;
}

bool actualNameCheck (char *name, save_t type) // basic check to see if geniune save, size is checked prior to this
{
	char path [MAX_PATH] = {0};
	uint8_t save_data [60] ={0};
	char actual_name [NAME_SIZE] = {0};
	int index = 0;
	int name_len = 0;
	switch (type)
	{
		case SAVE_TYPE_SKA:
			snprintf(path, sizeof(path), ".\\Save\\%s.SKA", name);
			break;
		case SAVE_TYPE_PRK:
			snprintf(path, sizeof(path), ".\\Save\\%s.PRK", name);
			break;
		case SAVE_TYPE_NWS:
			snprintf(path, sizeof(path), ".\\Save\\%s.NWS", name);
			break;
		case SAVE_TYPE_CAR:
			snprintf(path, sizeof(path), ".\\Save\\%s.CAR", name);
			break;
		default:
			return false;
			break;
	}
	
	FILE *cas_check = fopen(path, "rb+");
	if (cas_check == NULL) {
		printf("this cas doesn't exist!\n");
		return false;
	}

	fread(save_data, sizeof(uint8_t), 60, cas_check);
	bool found_filename = false;
	char filename_indicator [4] = {0};
	for (int i = 0; i < 60; i++)
	{
		if (save_data [i] == 0x16)
			if (i <= 57) 
			{
				strncpy(filename_indicator, save_data + i, 3);
				//printf(" file name indicator found : %s\n",filename_indicator  );
				if (!strcmp(filename_indicator, "\x16\xF4\xC3")) {
					index = i + 3;
					found_filename = true;
					break;
				}
			}
	}
	if (!found_filename) return false;

	while ( (save_data[index] != 0) && (name_len < NAME_SIZE - 1) ) {
		if (save_data[index] == ':') {
			printf("name contains colon, invalid!\n\n");
			return false;
		}
		actual_name[name_len] = save_data[index];
		index++;
		name_len++;
	}
	actual_name [name_len] = '\0';
	//printf ("actual name : %s file name : %s\n", actual_name, name);
	if (strcmp(actual_name, name))
	{
		printf("invalid cas, not listing\n");
		return false;
	}
	fclose(cas_check);
	return true;
}

bool psuValidation (psu_t *psu, th4_save *save)
{
	char psuProductCode [11] = {0}; 
	save_t saveTypeFound = 0;
	int index = PRODUCT_CODE_OFFSET;
	int product_len = 0;

	memcpy(psuProductCode, psu->data + PRODUCT_CODE_OFFSET, 10);
	saveTypeFound = psu->data[PRODUCT_CODE_OFFSET + 17]; // last letter of 8 letter save code
	for (int i = 0; i < 5; i++) {
		if (!strcmp(TH4ProductCodesPS2[i], psuProductCode)) {
			//printf("this is a THPS4 psu file\n");
			if (saveTypeFound == psu->saveType) {
				//printf("validated! proceeding...\n");
				return true;
			}
			else break;
		}
	}

	printf("the current .psu being processed is corrupted or not a THPS4 CAS/PRK file \n");
	printf("next!\n\n");
	return false;
}

int __cdecl CFunc_GetProperSaveFileCount(CStruct *params, CScript *script) // also builds directory list
{
	printf("doing file count\n");
	directory.amount = 0;
	directory.current_count = 0;
	directory.expected_file_size = 0;
	memset(directory.list, 0, sizeof(directory.list));

	WIN32_FIND_DATA save_dir;
	char *FileType = "";
	int build_list = 0;
	HANDLE save_search;
	CStruct *out = CScript_GetParams(script);
	CStruct_GetString(params,0x11093FB5, &FileType, 0);
	CStruct_GetInteger(params,0xBC4B6A0D, &build_list, 0);
	
	if (!strcmp(FileType,"SKATER"))
	{
		save_search = FindFirstFile(".\\Save\\*.SKA", &save_dir);
		directory.expected_file_size = SKA_SIZE;
		directory.type = SAVE_TYPE_SKA;
	}
	else if (!strcmp(FileType,"CAREER"))
	{
		save_search = FindFirstFile(".\\Save\\*.CAR", &save_dir);
		directory.expected_file_size = CAR_SIZE;
		directory.type = SAVE_TYPE_CAR;
	}
	else if (!strcmp(FileType,"NETWORK SETTINGS"))
	{
		save_search = FindFirstFile(".\\Save\\*.NWS", &save_dir);
		directory.expected_file_size = NWS_SIZE;
		directory.type = SAVE_TYPE_NWS;
	}
	else if (!strcmp(FileType,"PARK"))
	{
		save_search = FindFirstFile(".\\Save\\*.PRK", &save_dir);
		directory.expected_file_size = PRK_SIZE;
		directory.type = SAVE_TYPE_PRK;
	}
	else return 0;
	if (save_search == INVALID_HANDLE_VALUE) {
		printf("\nno %s files found in the directory.\n",FileType);
		CStruct_AddInteger(out,0x0A80A097/*proper_file_count*/, 0);
		return 0;
	}

	do 
	{
		if (strcmp(save_dir.cFileName, ".") == 0 || strcmp(save_dir.cFileName, "..") == 0) // thps4 file count doesn't do this lol
			continue; 
		if (directory.expected_file_size != save_dir.nFileSizeLow) continue;

		int name_len = strlen(save_dir.cFileName);
		if (name_len > 4 && name_len < NAME_SIZE + 4) save_dir.cFileName [name_len - 4] = '\0'; // cut off .ska
		else continue;

		bool actual_name = actualNameCheck (save_dir.cFileName, directory.type);
		if (!actual_name) continue;

		if (directory.amount < 200) 
		{
				if (build_list) strcpy(directory.list[directory.amount], save_dir.cFileName);
				//printf("directory #%d : %s\n",directory.amount,directory.list[directory.amount] );
		}
		directory.amount++;
	} while (FindNextFile(save_search, &save_dir) != 0);

	FindClose (save_search);
	printf("%s total file count: %d\n",FileType, directory.amount);
	if (build_list) CStruct_AddInteger(out,0x0A80A097/*proper_file_count*/, directory.amount); 
	return 1;
}

int __cdecl CFunc_PS2SaveConversion (CStruct *params, CScript *script)
{
	// setup directory search
	char *FileType = "";
	int expected_psu_size = 0;
	CStruct *out = CScript_GetParams(script);
	bool new_save_flag = false;
	WIN32_FIND_DATA ps2_dir;

	CStruct_GetString(params,0x11093FB5, &FileType, 0);
	if (!strcmp(FileType,"SKATER")) expected_psu_size = PSU_SKA_SIZE;
	else if (!strcmp(FileType,"PARK"))expected_psu_size = PSU_PRK_SIZE;
	else return 0;

	printf("\n\n\nps2 save check and conversion : \n\n\n");
	HANDLE psu_search = FindFirstFile(".\\SavePS2\\*.psu", &ps2_dir);
	if (psu_search == INVALID_HANDLE_VALUE) {
		printf("no .psu files found in the directory.\n\n"); 
		return 0;
	}

	do
	{
		
		//printf("directory amount : %d\n", directory.amount);
		if (directory.amount >= 200) break;
		psu_t psu = {0};
		th4_save new_save = {0};
		if (ps2_dir.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) continue; 

		// grab psu data + size check
		psu.size = ps2_dir.nFileSizeLow;
		if (psu.size != expected_psu_size) continue;

		switch (psu.size)
		{
			case PSU_PRK_SIZE:
				psu.saveType = SAVE_TYPE_PRK;
				new_save.type = SAVE_TYPE_PRK;
				new_save.size = PRK_SIZE;
				break;

			case PSU_SKA_SIZE:
				psu.saveType = SAVE_TYPE_SKA;
				new_save.type = SAVE_TYPE_SKA;
				new_save.size = SKA_SIZE;
				break;

			default:
				continue;
				break;
		}
		
		snprintf(psu.path, sizeof(psu.path), ".\\SavePS2\\%s", ps2_dir.cFileName);
		psu.file = fopen(psu.path, "rb+");
		if (psu.file == NULL) {
			printf("unable to read psu file, next!\n\n");
			continue;
		}
		fread(psu.data, sizeof(uint8_t), psu.size, psu.file);
		//printf("processing: %s\n", ps2_dir.cFileName);
		fclose(psu.file);
		
		// validation + copy
		bool valid_psu = psuValidation(&psu,&new_save);
		if (!valid_psu) continue;
		memcpy(new_save.data, psu.data + PSU_SAVE_OFFSET, new_save.size);

		// get name + validation
		bool valid_name = getSaveName (&new_save);
		if (!valid_name) continue;

		// save already exist check
		bool save_exist = doesSaveExist(&new_save);
		if (save_exist) continue;

		// write new save file
		new_save.file = fopen(new_save.path, "wb");
		if (new_save.file == NULL) {
			printf("unable to create new save file, next!\n\n");
			continue;
		}
		fwrite(new_save.data, sizeof(uint8_t), new_save.size, new_save.file);
		fclose(new_save.file);
		printf("conversion complete, next!\n\n");
		new_save_flag = true;

	} while (FindNextFile(psu_search, &ps2_dir) != 0);

	FindClose(psu_search);
	return new_save_flag;
}

int __cdecl CFunc_GetMostRecentCAS(CStruct *params, CScript *script)
{
	CStruct *out = CScript_GetParams(script);
	uint64_t newestTimestamp = 0;
	char newestCasName[NAME_SIZE] = {0};
	WIN32_FIND_DATA save_dir;
	HANDLE ska_search = FindFirstFile(".\\Save\\*.SKA", &save_dir);
	if (ska_search == INVALID_HANDLE_VALUE) {
		printf("\nno CAS file found in the directory.\n");
		return 0;
	}

	do
	{
		if (save_dir.nFileSizeLow != SKA_SIZE) continue;
		uint64_t saveTimestamp;
		memcpy(&saveTimestamp, &save_dir.ftLastWriteTime, sizeof(uint64_t));
		if (saveTimestamp > newestTimestamp)
		{
			int name_len = strlen(save_dir.cFileName);
			if (name_len > 4 && name_len < NAME_SIZE + 4) save_dir.cFileName [name_len - 4] = '\0'; // cut off .ska
			else continue;
			newestTimestamp = saveTimestamp;
			snprintf(newestCasName, sizeof(newestCasName), "%s", save_dir.cFileName);
		}
	} while (FindNextFile(ska_search, &save_dir) != 0);
	if (newestTimestamp == 0) return 0; // no valid cas found

	printf("\n\nmost recent cas : %s\n\n",newestCasName);
	CStruct_AddString(out,0xF36C1878/*casfilename*/, newestCasName);
	FindClose(ska_search);
	return 1;
}


int __cdecl CFunc_GetSaveDirectoryListing(CStruct *params, CScript *script)
{
	CStruct *out = CScript_GetParams(script);
	if (directory.amount == 0) return 0;
	if (directory.current_count < directory.amount && directory.current_count < 200)
	{
		CStruct_AddString(out,0x91D9667F/*save_filename*/, directory.list [directory.current_count]);
		//printf("save to list: %s\n", directory.list [directory.current_count]);
		directory.current_count++;
	}
	else return 0;

	return 1; 
}

int __cdecl CFunc_DeleteSaveFile (CStruct *params, CScript *script)
{
	char *FileType = "";
	char *save_filename;
	char save_path [MAX_PATH];

	CStruct *out = CScript_GetParams(script);
	CStruct_GetString(params,0x11093FB5, &FileType, 0);
	CStruct_GetString(params,0x91D9667F, &save_filename, 0);

	if (!strcmp(FileType,"SKATER"))
	{
		snprintf(save_path, sizeof(save_path), ".\\Save\\%s.SKA", save_filename);
	}
	else if (!strcmp(FileType,"CAREER"))
	{
		snprintf(save_path, sizeof(save_path), ".\\Save\\%s.CAR", save_filename);
	}
	else if (!strcmp(FileType,"NETWORK SETTINGS"))
	{
		snprintf(save_path, sizeof(save_path), ".\\Save\\%s.NWS", save_filename);
	}
	else if (!strcmp(FileType,"PARK"))
	{
		snprintf(save_path, sizeof(save_path), ".\\Save\\%s.PRK", save_filename);
	}
	else return 0;

	if (DeleteFileA(save_path)) 
	{
		printf("file deleted successfully\n");
		return 1;
	} 
	else printf("failed to delete file!\n");
	
	return 0;
}