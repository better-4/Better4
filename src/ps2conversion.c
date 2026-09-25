#include "ps2conversion.h"
#include <windows.h>
#include <stdio.h>


char TH4ProductCodesPS2 [5][20] = 
{
	"SLUS-20504", // NTSC
	"SLES-51130", // PAL
	"SLES-51132", // PAL
	"SLES-51131", // Greatest Hits PAL
	"SLPM-65419" // JPN
};


bool doesSaveExist (char *path)
{
	FILE *cas_check = fopen(path, "r");
	if (cas_check != NULL) {
		fclose(cas_check);
		printf("this save already exists in the directory, next!\n\n");
		return true;
	}
	//printf("new path : %s\n", path);
	return false;
}

bool getSaveName (uint8_t *saveData, char *saveName)
{
	int index = NAME_OFFSET;
	int name_len = 0;

	while ( (saveData[index] != 0) && (name_len < NAME_SIZE - 1) ) {
		if (saveData[index] == ':') {
			printf("name contains colon, cannot be converted. next!\n\n");
			return false;
		}
		saveName[name_len] = saveData[index];
		index++;
		name_len++;
	}
	saveName [name_len] = '\0';
	printf("save name : %s\n", saveName);
	return true;
}

bool psuValidation (save_type saveType, uint8_t *psuData)
{
	char psuProductCode [11] = {0}; 
	save_type psuSaveType = 0;
	int index = PRODUCT_CODE_OFFSET;
	int product_len = 0;
	
	while ( (psuData[index] < 'a' || psuData[index] > 'z') && (product_len < 10) ) {
		psuProductCode[product_len] = psuData[index];
		index++;
		product_len++;
	}
	psuProductCode[product_len] = '\0';
	psuSaveType = psuData[index + 7]; // last letter of 8 letter save code
	for (int i = 0; i < 5; i++) {
		if (!strcmp(TH4ProductCodesPS2[i], psuProductCode)) {
			//printf("this is a THPS4 psu file\n");
			if (psuSaveType == saveType) {
				//printf("validated! proceeding...\n");
				return true;
			}
			else {
				//printf("this is not the save type we're looking for, next!\n\n");
				return false;
			}
		}
	}

	printf("the current .psu being processed is not a THPS4 psu file or corrupted\n");
	printf("product code : %s\n", psuProductCode);
	printf("save type : %c\n", psuSaveType);
	printf("next!\n\n");
	return false;
}

int __cdecl CFunc_PS2CasCheckAndConversion(CStruct* params) 
{
	printf("\nps2 cas check and conversion:\n\n");
	bool new_save_flag = PS2SaveConversion (SKA_SIZE, SAVE_TYPE_SKA);
	return new_save_flag;
}

int __cdecl CFunc_PS2PrkCheckAndConversion(CStruct* params) 
{
	printf("\nps2 prk check and conversion:\n\n");
	bool new_save_flag = PS2SaveConversion (PRK_SIZE, SAVE_TYPE_PRK);
	printf("\nall conversions complete!\n");
	return new_save_flag;
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

bool PS2SaveConversion(int saveFileSize, save_type saveType) 
{
	// setup directory search
	bool new_save_flag = false;
	WIN32_FIND_DATA ps2_dir;
	HANDLE psu_search = FindFirstFile(".\\SavePS2\\*.psu", &ps2_dir);
	if (psu_search == INVALID_HANDLE_VALUE) {
		printf("no .psu files found in the directory.\n");
		return false;
	}

	do
	{
		if (ps2_dir.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) continue; 

		// grab psu data
		int psuFileSize = ps2_dir.nFileSizeLow;
		uint8_t *psuData = (uint8_t *)malloc(psuFileSize * sizeof(uint8_t));
    if (psuData == NULL) {
        printf("unable to allocate space for psu data, next!\n\n");
        continue; 
    }
		memset(psuData, 0, psuFileSize * sizeof(uint8_t));
		
		char psuPath[MAX_PATH] = {0};
		snprintf(psuPath, sizeof(psuPath), ".\\SavePS2\\%s", ps2_dir.cFileName);
		//printf("directory : %s\n", psuPath);
		
		FILE *psuFile = fopen(psuPath, "rb+");
		if (psuFile == NULL) {
			printf("unable to read psu file, next!\n\n");
			goto free_psu_data;
		}
		fread(psuData, sizeof(uint8_t), psuFileSize, psuFile);
		//printf("processing: %s\n", ps2_dir.cFileName);
		fclose(psuFile);
		
		// validation
		bool valid_psu = psuValidation(saveType, psuData);
		if (!valid_psu) goto free_psu_data;

		// copy save data from psu
		uint8_t *convertedSave = (uint8_t *)malloc(saveFileSize * sizeof(uint8_t));
    if (convertedSave == NULL) {
        printf("unable to allocate space for converted save data, next!");
        goto free_psu_data; 
    }
		memset(convertedSave, 0, saveFileSize * sizeof(uint8_t));
		for (int i = PSU_SAVE_OFFSET; i != psuFileSize; i++) {
			convertedSave[i - PSU_SAVE_OFFSET] = psuData[i];
		}

		// get name + validation
		char saveName[NAME_SIZE] = {0};
		bool valid_name = getSaveName (convertedSave, saveName);
		if (!valid_name) goto free_all;

		// save already exist check
		char newSavePath [MAX_PATH] = {0};
		if (saveType == SAVE_TYPE_SKA)
			snprintf(newSavePath, sizeof(newSavePath), ".\\Save\\%s.SKA", saveName);
		else
			snprintf(newSavePath, sizeof(newSavePath), ".\\Save\\%s.PRK", saveName);
		bool save_exist = doesSaveExist(newSavePath);
		if (save_exist) goto free_all;

		// write new save file
		FILE *newSaveFile = fopen(newSavePath, "wb");
		if (newSaveFile == NULL) {
			printf("unable to create new save file, next!\n\n");
			goto free_all;
		}
		fwrite(convertedSave, sizeof(uint8_t), saveFileSize, newSaveFile);
		fclose(newSaveFile);
		printf("conversion complete, next!\n\n");
		new_save_flag = true;

		free_all:
		free(convertedSave);
		free_psu_data:
		free(psuData);
	} while (FindNextFile(psu_search, &ps2_dir) != 0);

	FindClose(psu_search);
	return new_save_flag;
}