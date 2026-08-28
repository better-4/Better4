#include "decomp/Prefs_Preferences.h"

#include "decomp/common.h"

#include <stdint.h>

CStruct *Prefs_Preferences_GetPreference(Prefs_Preferences *this, uint32_t checksum) {
    static void (__fastcall* _GetPreference)(Prefs_Preferences *, unused_t, uint32_t) = (void *)0x004712e0;
    _GetPreference(this, UNUSED, checksum);
}
