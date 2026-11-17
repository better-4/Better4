#ifndef _DIRECTORY_LIST_H_
#define _DIRECTORY_LIST_H_

#include "cfuncs.h"
#include <stdbool.h>
#include <stdio.h>
#include <windows.h>
#include <log.h>

#define SKA_SIZE 2048
#define NAME_SIZE 16 // 15 + null
#define PRK_SIZE 16384
#define NWS_SIZE 2048
#define CAR_SIZE 40960

typedef struct
{
  char name [NAME_SIZE];
  uint64_t timestamp;
} save_entry;

typedef struct
{
  save_entry list [75];
  uint32_t count;
  uint32_t current_count;
  uint32_t type_size;
  char type_ext [4];
  uint32_t page;
} directory_data;



int __cdecl CFunc_GetMostRecentCAS(CStruct *params, CScript *script);
int __cdecl CFunc_GetSaveDirectoryListing(CStruct *params, CScript *script);
int __cdecl CFunc_DeleteSaveFile (CStruct *params, CScript *script);
int __cdecl CFunc_BuildSaveDirectory (CStruct *params, CScript *script); 

#endif