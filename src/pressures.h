#ifndef _PRESSURES_H_
#define _PRESSURES_H_

#include "decomp/CStruct.h"
#include "decomp/CScript.h"

void patchPressures();

int __cdecl CFunc_InPressure(CStruct *_, CScript *__);
int __cdecl CFunc_PressureOn(CStruct *_, CScript *__);
int __cdecl CFunc_PressureOff(CStruct *_, CScript *__);

#endif
