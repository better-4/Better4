#ifndef _PREFS_PREFERENCES_H_
#define _PREFS_PREFERENCES_H_

#include "decomp/CStruct.h"

typedef void Prefs_Preferences;

CStruct *Prefs_Preferences_GetPreference(Prefs_Preferences *this, uint32_t checksum);

#endif
