#include "playlist.h"

#include <stdint.h>
#include <windows.h>

#include "cfuncs.h"
#include "decomp/CStruct.h"
#include "decomp/CScript.h"
#include "decomp/common.h"
#include "partymod-thps4/src/patch.h"

// The playlist enable/disable state is a single 64-bit mask with one bit per
// track. A set bit means the track is forbidden (disabled), which is exactly
// what TrackEnabled (0x00509200) reads: it shifts 1 << index and returns 1
// when the bit is clear.
#define TRACK_MASK_LOW 0x006365c8
#define TRACK_MASK_HIGH 0x006365cc
#define MAX_TRACKS 64

#define CHECKSUM_ENABLED 0xaf06447b // "enabled"
#define CHECKSUM_INDEX 0x7f8c98fe   // "index"

// Replaces the vanilla ChangeTrackState (0x005091c0).
//
// The vanilla command looks up a component literally named "Off" and passes its
// value to the engine setter. Bare words in qscript are global variable
// references, so `ChangeTrackState <index> on` passes 0 and the only form a
// script can actually produce is the disabling one - mashing the toggle could
// turn tracks off but never back on.
//
// Here the argument is an explicit flag instead:
//   ChangeTrackState <index>              -> disable
//   ChangeTrackState <index> enabled = 1  -> enable
//
// The mask is written directly rather than through the engine setter at
// 0x0042cf40: that function takes an extra argument which selects the mask, and
// getting it wrong writes outside the global mask that TrackEnabled reads.
//
// The index is read by name, not positionally. The vanilla command used the
// positional accessor at 0x00418060, but it only matches integer components,
// and qscript passes numbers as floats, so the index always came back as 0.
int __cdecl Better4_ChangeTrackState(CStruct *params) {
	float index_float = 0;
	if (!CStruct_GetFloat(params, CHECKSUM_INDEX, &index_float, 0)) {
		logWarning("ChangeTrackState missing track index");
		return 0;
	}

	int index = (int)index_float;
	if (index < 0 || index >= MAX_TRACKS) {
		logWarning("ChangeTrackState track index out of range: %d", index);
		return 0;
	}

	float enabled_float = 0;
	CStruct_GetFloat(params, CHECKSUM_ENABLED, &enabled_float, 0);

	uint32_t bit = 1u << (index & 31);
	uint32_t *mask = (uint32_t *)(index < 32 ? TRACK_MASK_LOW : TRACK_MASK_HIGH);

	if (enabled_float != 0) {
		*mask &= ~bit;
	} else {
		*mask |= bit;
	}

	return 1;
}

void patchPlaylist() {
	patchJmp(0x005091c0, (void *)Better4_ChangeTrackState);
}
