#ifndef _PS2CONVERSION_H_
#define _PS2CONVERSION_H_

#include "cfuncs.h"
#include <stdbool.h>

#define NAME_OFFSET 0x19 // byte where name starts in .SKA/.PRK
#define PSU_SAVE_OFFSET 0x3800 // byte where save data starts in .PSU
#define PRODUCT_CODE_OFFSET 0x42 // byte where product code starts in .PSU
#define PSU_SKA_SIZE 16384
#define SKA_SIZE 2048
#define PSU_PRK_SIZE 30720
#define PRK_SIZE 16384
#define NAME_SIZE 16 // 15 + null terminator

typedef enum save_t
{
  SAVE_TYPE_CAR = 'a',
  SAVE_TYPE_SKA = 'b',
  SAVE_TYPE_PRK = 'c',
  SAVE_TYPE_RPL = 'd', // thanks ellie
  SAVE_TYPE_NET = 'e'
} save_t;

int __cdecl CFunc_PS2CasCheckAndConversion(CStruct* params);
int __cdecl CFunc_PS2PrkCheckAndConversion(CStruct* params);
int __cdecl CFunc_GetProperSaveFileCount(CStruct *params, CScript *script);
int GetProperSaveFileCount ();
bool PS2SaveConversion(int saveFileSize, save_t saveType);
bool psuValidation (save_t saveType, uint8_t *psuData, uint8_t psuFileSize);
bool getSaveName (uint8_t *saveData, char *saveName);

#endif