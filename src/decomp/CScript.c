#include "decomp/CScript.h"


struct CStruct *CScript_GetParams(CScript *this) {
    // inlined during compilation; access member directly
    return this->params;
    // return *(CStruct **)(((char *)this) + 0x14);
}
