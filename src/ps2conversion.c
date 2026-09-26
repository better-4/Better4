#include "ps2conversion.h"


char TH4ProductCodesPS2 [5][20] = 
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
				goto invalid;
				break;
	}

	while ( (psu->data[index] < 'a' || psu->data[index] > 'z') && (product_len < 10) ) {
		psuProductCode[product_len] = psu->data[index];
		index++;
		product_len++;
	}
	psuProductCode[product_len] = '\0';
	saveTypeFound = psu->data[index + 7]; // last letter of 8 letter save code
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

	invalid:
	printf("the current .psu being processed is corrupted or not a THPS4 CAS/PRK file \n");
	printf("next!\n\n");
	return false;
}

int __cdecl CFunc_GetProperSaveFileCount(CStruct *params, CScript *script)
{
	CStruct *out = CScript_GetParams(script);
	int fileCount = GetProperSaveFileCount();
	printf("file count from cfunc: %d\n", fileCount);
	CStruct_AddInteger(out,0x0A80A097/*proper_file_count*/, fileCount); 
	return 1;
}

int GetProperSaveFileCount ()
{
	// setup directory search
	int fileCount = 0;
	WIN32_FIND_DATA save_dir;
	HANDLE save_search = FindFirstFile(".\\Save\\*", &save_dir);
	if (save_search == INVALID_HANDLE_VALUE) {
		printf("no save files found in the directory.\n");
		return 0;
	}

	do 
	{
		if (strcmp(save_dir.cFileName, ".") == 0 || strcmp(save_dir.cFileName, "..") == 0) // thps4 file count doesn't do this lol
			continue; 
		fileCount++;
	} while (FindNextFile(save_search, &save_dir) != 0);

	FindClose (save_search);
	return fileCount;
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
		return false;
	}

	do
	{
		psu_t psu = {0};
		th4_save new_save = {0};
		if (ps2_dir.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) continue; 

		// grab psu data
		psu.size = ps2_dir.nFileSizeLow;
		psu.data = (uint8_t *)malloc(psu.size * sizeof(uint8_t));
    if (psu.data == NULL) {
        printf("unable to allocate space for psu data, next!\n\n");
        continue; 
    }
		memset(psu.data, 0, psu.size * sizeof(uint8_t));
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
		memset(new_save.data, 0, new_save.size * sizeof(uint8_t));
		for (int i = PSU_SAVE_OFFSET; i != psu.size; i++) {
			new_save.data[i - PSU_SAVE_OFFSET] = psu.data[i];
		}

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