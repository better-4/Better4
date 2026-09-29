#include "ps2conversion.h"

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
	int index = NAME_OFFSET;
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

int __cdecl CFunc_GetProperSaveFileCount(CStruct *params, CScript *script)
{
	directory.amount = 0;
	directory.current_count = 0;
	directory.size = 1;
	directory.list = malloc(NAME_SIZE * sizeof(char*));

	if (directory.list == NULL) return 0;
	WIN32_FIND_DATA save_dir;
	char *FileType = "";
	HANDLE save_search;
	CStruct *out = CScript_GetParams(script);
	CStruct_GetString(params,0x11093FB5, &FileType, 0);

	if (!strcmp(FileType,"SKATER"))
	{
		save_search = FindFirstFile(".\\Save\\*.SKA", &save_dir);
	}
	else if (!strcmp(FileType,"CAREER"))
	{
		save_search = FindFirstFile(".\\Save\\*.CAR", &save_dir);
	}
	else if (!strcmp(FileType,"NETWORK SETTINGS"))
	{
		save_search = FindFirstFile(".\\Save\\*.NWS", &save_dir);
	}
	else if (!strcmp(FileType,"PARK"))
	{
		save_search = FindFirstFile(".\\Save\\*.PRK", &save_dir);
	}
	else return 0;
	if (save_search == INVALID_HANDLE_VALUE) {
		printf("\nno CAS file found in the directory.\n");
		return 0;
	}
	CStruct_RemoveComponent(params, 0x11093FB5);

	do 
	{
		if (strcmp(save_dir.cFileName, ".") == 0 || strcmp(save_dir.cFileName, "..") == 0) // thps4 file count doesn't do this lol
			continue; 

		int name_len = strlen(save_dir.cFileName);
		if (name_len > 4 && name_len < NAME_SIZE + 4) save_dir.cFileName [name_len - 4] = '\0'; // cut off .ska
		else continue;
		if (directory.amount > directory.size)
		{
			directory.size*=2;
			char **temp = realloc(directory.list, directory.size * NAME_SIZE * sizeof(char*));
			if (temp == NULL) {
					for (int i = 0; i < directory.amount; i++) free(directory.list[i]);
					free(directory.list);
					return 1;
			}
			directory.list = temp;
		}
		directory.list[directory.amount]  = malloc(strlen(save_dir.cFileName) + 1);
		if (directory.list[directory.amount] != NULL) {
				strcpy(directory.list[directory.amount], save_dir.cFileName);
				//printf("directory #%d : %s\n",directory.amount,directory.list[directory.amount] );
				directory.amount++;
		}
	} while (FindNextFile(save_search, &save_dir) != 0);

	FindClose (save_search);
	printf("%s total file count: %d\n",FileType, directory.amount);
	CStruct_AddInteger(out,0x0A80A097/*proper_file_count*/, directory.amount); 
	return 1;
}


int __cdecl CFunc_PS2SaveConversion(CStruct* params) 
{
	// setup directory search
	printf("\n\n\nps2 save check and conversion : \n\n\n");
	bool new_save_flag = false;
	WIN32_FIND_DATA ps2_dir;
	HANDLE psu_search = FindFirstFile(".\\SavePS2\\*.psu", &ps2_dir);
	if (psu_search == INVALID_HANDLE_VALUE) {
		printf("no .psu files found in the directory.\n\n"); 
		return 0;
	}

	do
	{
		psu_t psu = {0};
		th4_save new_save = {0};
		if (ps2_dir.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) continue; 

		// grab psu data + size check
		psu.size = ps2_dir.nFileSizeLow;
		switch (psu->size)
		{
			case PSU_SKA_SIZE:
				psu->saveType = SAVE_TYPE_SKA;
				save->type = SAVE_TYPE_SKA;
				save->size = SKA_SIZE;
				break;
			
			case PSU_PRK_SIZE:
				psu->saveType = SAVE_TYPE_PRK;
				save->type = SAVE_TYPE_PRK;
				save->size = PRK_SIZE;
				break;
			
			default:
				continue;
				break;
		}
		psu.data = (uint8_t *)malloc(psu.size * sizeof(uint8_t));
    if (psu.data == NULL) {
        printf("unable to allocate space for psu data, next!\n\n");
        continue; 
    }
		snprintf(psu.path, sizeof(psu.path), ".\\SavePS2\\%s", ps2_dir.cFileName);
		
		psu.file = fopen(psu.path, "rb+");
		if (psu.file == NULL) {
			printf("unable to read psu file, next!\n\n");
			goto free_psu_data;
		}
		fread(psu.data, sizeof(uint8_t), psu.size, psu.file);
		//printf("processing: %s\n", ps2_dir.cFileName);
		fclose(psu.file);
		
		// validation
		bool valid_psu = psuValidation(&psu,&new_save);
		if (!valid_psu) goto free_psu_data;

		// copy save data from psu
		new_save.data = (uint8_t *)malloc(new_save.size * sizeof(uint8_t));
    if (new_save.data == NULL) {
        printf("unable to allocate space for converted save data, next!");
        goto free_psu_data; 
    }
		memcpy(new_save.data, psu.data + PSU_SAVE_OFFSET, new_save.size);

		// get name + validation
		bool valid_name = getSaveName (&new_save);
		if (!valid_name) goto free_all;

		// save already exist check
		bool save_exist = doesSaveExist(&new_save);
		if (save_exist) goto free_all;

		// write new save file
		new_save.file = fopen(new_save.path, "wb");
		if (new_save.file == NULL) {
			printf("unable to create new save file, next!\n\n");
			goto free_all;
		}
		fwrite(new_save.data, sizeof(uint8_t), new_save.size, new_save.file);
		fclose(new_save.file);
		printf("conversion complete, next!\n\n");
		new_save_flag = true;

		free_all:
		free(new_save.data);
		free_psu_data:
		free(psu.data);
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

	printf("\n\nmost recent cas : %s\n\n",newestCasName);
	CStruct_AddString(out,0xF36C1878/*casfilename*/, newestCasName);
	FindClose(ska_search);
	return 1;
}


int __cdecl CFunc_GetSaveDirectoryListing(CStruct *params, CScript *script)
{
	CStruct *out = CScript_GetParams(script);
	if (directory.current_count < directory.amount)
	{
		CStruct_AddString(out,0x91D9667F/*save_filename*/, directory.list [directory.current_count]);
		//printf("save to list: %s\n", directory.list [directory.current_count]);
		directory.current_count++;
	}
	else 
	{
		for (int i = 0; i < directory.amount; i++) free(directory.list[i]);
			free(directory.list);
		printf("freed list!\n");
		return 0;
	}

	return 1; 
}