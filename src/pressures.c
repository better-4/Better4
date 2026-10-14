#include "pressures.h"

#include "decomp/common.h"
#include "decomp/CStruct.h"
#include "decomp/CScript.h"
#include "decomp/Front_CSpriteElement.h"
#include "decomp/Front_CScreenElement.h"
#include "decomp/Obj_CSkater.h"

#include <stdint.h>

static uint8_t in_pressure = 0;

void __stdcall SetBoardStanceIcon(Obj_CSkater *this, Front_CSpriteElement *element) {
    uint8_t is_switched = this->is_goofy ? this->is_flipped : !this->is_flipped;

    uint32_t checksum = 0;
    float alpha = 1.0;

    if (CFunc_InPressure(0, 0)) {
        if (is_switched) {
            checksum = 0x1e55f6f4/*swpress_icon*/;
            // alpha = 0.9;
            // logDebug("SetBoardStanceIcon: in switch pressure stance");
        } else {
            checksum = 0x2c74c99/*press_icon*/;
            // alpha = 0.9;
            // logDebug("SetBoardStanceIcon: in pressure stance");
        }
    } else {
        if (is_switched) {
            if (this->in_nollie) {
                checksum = 0xbe91f3b6/*fakie_icon*/;
                // logDebug("SetBoardStanceIcon: in fakie stance");
            } else {
                checksum = 0x9f9d3907/*switch_icon*/;
                // logDebug("SetBoardStanceIcon: in switch stance");
            }
        } else {
            if (this->in_nollie) {
                checksum = 0x33a15296/*nollie_icon*/;
                // logDebug("SetBoardStanceIcon: in nollie stance");
            } else {
                alpha = 0.0;
                // logDebug("SetBoardStanceIcon: in regular stance");
            }
        }
    }

    if (checksum) {
        Front_CSpriteElement_SetTexture(element, checksum);
    }

    Front_CScreenElement_SetAlpha(element, alpha, 1);
}

void patchPressures() {
    patchNop(0x004c9e24, 0x87);
    patchByte(0x004c9e24, 0x57); // PUSH EDI
    patchByte(0x004c9e24 + 1, 0x56); // PUSH ESI
    patchCall(0x004c9e24 + 2, (void *)SetBoardStanceIcon);
}

int __cdecl CFunc_InPressure(CStruct *_, CScript *__) {
    return in_pressure;
}

int __cdecl CFunc_PressureOn(CStruct *_, CScript *__) {
    in_pressure = 1;
    return 1;
}

int __cdecl CFunc_PressureOff(CStruct *_, CScript *__) {
    in_pressure = 0;
    return 1;
}
