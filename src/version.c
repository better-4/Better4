#include "version.h"

#include "log.h"
#include "decomp/CStruct.h"
#include "decomp/CScript.h"

int __cdecl CFunc_Better4Version(CStruct *params, CScript *script) {
    printLog("better4 version: %s\n", BETTER4_VERSION);
    CStruct *out = CScript_GetParams(script);
	CStruct_AddString(out, 0x40e32c3c/*version*/, BETTER4_VERSION);
	return 1;
}
