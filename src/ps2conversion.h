#ifndef _PS2CONVERSION_H_
#define _PS2CONVERSION_H_

#include "cfuncs.h"
#include <stdbool.h>

#define NAME_OFFSET 0x19 // byte where name starts in .SKA/.PRK
#define PSU_SAVE_OFFSET 0x3800 // byte where save data starts in .PSU
#define PRODUCT_CODE_OFFSET 0x42 // byte where product code starts in .PSU
#define SKA_SIZE 2048
#define PRK_SIZE 16384
#define NAME_SIZE 16 // 15 + null terminator

typedef enum save_type
{
  SAVE_TYPE_CAR = 'a',
  SAVE_TYPE_SKA = 'b',
  SAVE_TYPE_PRK = 'c',
  // skips d? idk what would it be
  SAVE_TYPE_NET = 'e'
} save_type;


int PS2SaveConversion(int saveFileSize, save_type saveType);
int __cdecl CFunc_PS2CasCheckAndConversion(CStruct* params);
int __cdecl CFunc_PS2PrkCheckAndConversion(CStruct* params);
bool validatePSU (save_type psuSaveType, uint8_t *psuData);
bool getSaveName (uint8_t *saveData, char *saveName);

#endif