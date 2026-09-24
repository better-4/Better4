#include "ps2conversion.h"
#include <windows.h>
#include <stdio.h>


char TH4ProductCodesPS2 [7][20] = 
{
	"SLUS-20504", // NTSC
	"SLUS-20504GH", // Greatest Hits NTSC
	"SLES-51130", // PAL
	"SLES-51132", // PAL
	"SLES-51130-P", // Greatest Hits PAL
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
	printf("new path : %s\n", path);
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

bool validatePSU (save_type saveType, uint8_t *psuData)
{
	char psuProductCode [20] = {0}; 
	save_type psuSaveType = 0;
	int index = PRODUCT_CODE_OFFSET;
	int product_len = 0;
	
	while ( (psuData[index] < 'a' || psuData[index] > 'z') && (product_len < 19) ) {
		psuProductCode[product_len] = psuData[index];
		index++;
		product_len++;
	}
	psuProductCode[product_len] = '\0';
	psuSaveType = psuData[index + 7]; // last letter of 8 letter save code
	printf("product code : %s\n", psuProductCode);
	printf("save type : %c\n", psuSaveType);
	for (int i = 0; i < 7; i++) {
		if (!strcmp(TH4ProductCodesPS2[i], psuProductCode)) {
			printf("this is a THPS4 psu file\n");
			if (psuSaveType == saveType) {
				printf("correct save type! proceeding...\n");
				return true;
			}
			else {
				printf("this is not the save type we're looking for, next!\n\n");
				return false;
			}
		}
	}
	printf("this is not a THPS4 psu file or corrupted. next!\n\n");
	return false;
}

int __cdecl CFunc_PS2CasCheckAndConversion(CStruct* params) 
{
	PS2SaveConversion (SKA_SIZE, SAVE_TYPE_SKA);
	return 1;
}

int __cdecl CFunc_PS2PrkCheckAndConversion(CStruct* params) 
{
	PS2SaveConversion (PRK_SIZE, SAVE_TYPE_PRK);
	return 1;
}


int PS2SaveConversion(int saveFileSize, save_type saveType) 
{
	// setup directory search
	WIN32_FIND_DATA ps2_dir;
	char *extension_psu = ".\\SavePS2\\*.psu";
	HANDLE psu_search = FindFirstFile(extension_psu, &ps2_dir);
	if (psu_search == INVALID_HANDLE_VALUE) {
		printf("no .psu files found in the directory.\n");
		return 0;
	}

	do
	{
		if (ps2_dir.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) continue;

		// grab psu data
		int psuFileSize = ps2_dir.nFileSizeLow;
		uint8_t *psuData = (uint8_t *)malloc(psuFileSize * sizeof(uint8_t));
    if (psuData == NULL) {
        printf("unable to allocate space for psu data, next!");
        continue; 
    }
		memset(psuData, 0, psuFileSize * sizeof(uint8_t));
		
		char psuPath[MAX_PATH] = {0};
		snprintf(psuPath, sizeof(psuPath), ".\\SavePS2\\%s", ps2_dir.cFileName);
		//printf("directory : %s\n", psuPath);
		
		FILE *psuFile = fopen(psuPath, "rb+");
		if (psuFile == NULL) {
			printf("unable to read psu file, next!\n\n");
			continue;
		}
		fread(psuData, sizeof(uint8_t), psuFileSize, psuFile);
		printf("processing: %s\n", ps2_dir.cFileName);
		fclose(psuFile);
		
		// validation
		bool valid_psu = validatePSU(saveType, psuData);
		if (!valid_psu) continue;

		// copy save data from psu
		uint8_t *convertedSave = (uint8_t *)malloc(saveFileSize * sizeof(uint8_t));
    if (convertedSave == NULL) {
        printf("unable to allocate space for converted save data, next!");
        continue; 
    }
		memset(convertedSave, 0, saveFileSize * sizeof(uint8_t));
		for (int i = PSU_SAVE_OFFSET; i != psuFileSize; i++) {
			convertedSave[i - PSU_SAVE_OFFSET] = psuData[i];
		}

		// get name + validation
		char saveName[NAME_SIZE] = {0};
		bool valid_name = getSaveName (convertedSave, saveName);
		if (!valid_name) continue;

		// save already exist check
		char newSavePath [MAX_PATH] = {0};
		if (saveType == SAVE_TYPE_SKA)
			snprintf(newSavePath, sizeof(newSavePath), ".\\Save\\%s.SKA", saveName);
		else
			snprintf(newSavePath, sizeof(newSavePath), ".\\Save\\%s.PRK", saveName);
		bool save_exist = doesSaveExist(newSavePath);
		if (save_exist) continue;

		// write new save file
		FILE *newSaveFile = fopen(newSavePath, "wb");
		if (newSaveFile == NULL) {
			printf("unable to create new save file, next!\n\n");
			continue;
		}
		fwrite(convertedSave, sizeof(uint8_t), saveFileSize, newSaveFile);
		fclose(newSaveFile);
		printf("conversion complete, next!\n\n");
		free(psuData);
		free(convertedSave);
	} while (FindNextFile(psu_search, &ps2_dir) != 0);

	FindClose(psu_search);
	printf("\nall conversions complete!");
	return 1;
}