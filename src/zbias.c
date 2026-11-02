#include "zbias.h"

#include "decomp/common.h"
#include "decomp/NxXbox.h"

#include "partymod-thps4/src/patch.h"

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <windows.h>

// `set_material` (NxXbox::sMaterial::Submit) calls, from the xrefs of `0x0043bbd0`.
// leaving out `0x0044d993`, since that is inside Nx::plat_texture_splat_render (0x0044d8a0),
// which already runs with ZBIAS 1 for the whole pass (it's the decals pass).
static void *const set_material_calls[] = {
	(void *)0x00443312, // NxXbox::render_scene (0x00443250)
	(void *)0x00443384, // NxXbox::render_scene (0x00443250)
	(void *)0x004433c3, // NxXbox::render_scene (0x00443250)
	(void *)0x004434ef, // NxXbox::render_scene (0x00443250)
	(void *)0x0044361d, // NxXbox::render_scene (0x00443250)
	(void *)0x004436a6, // NxXbox::render_scene (0x00443250)
	(void *)0x0044e6dc, // Nx::plat_shatter_render (0x0044e6d0)
	(void *)0x0044f521, // Nx::CXboxParticleFlat::plat_render (0x0044f3e0)
	(void *)0x0044ff76, // Nx::CXboxParticleGlow::plat_render (0x0044fe00)
	(void *)0x00451554, // Nx::CXboxParticleGlowRibbonTrail::plat_render (0x00451420)
};

#define MAX_ZBIAS 16
#define MAX_ENTRIES 256

// 4 bytes material checksum + 1 byte zbias.
#define ZB_RECORD 5

// data/levels/<Lvl>/<lvl>.zb
// uint32 material checksum (little endian), then one byte of D3DRS_ZBIAS:
//   cd 4d 25 41 02  ->  material 0x41254dcd, bias 2
typedef struct {
	uint32_t checksum;
	uint8_t bias;
} Better4ZBias;

static Better4ZBias s_entries[MAX_ENTRIES];
static int s_count;

static int lookupBias(uint32_t checksum) {
	int i;

	// If we reach the magnitude of hundreds
	// then a hashmap might be more performant.
	for (i = 0; i < s_count; i++) {
		if (s_entries[i].checksum == checksum) {
			return s_entries[i].bias;
		}
	}

	return 0;
}

void __fastcall SetMaterial_Wrapper(void *material, unused_t _) {
	NxXbox_sMaterial_Submit(material);

	if (s_count && material) {
		NxXbox_SetDeviceRenderState(D3DRS_ZBIAS, lookupBias(*(uint32_t *)material));
	}
}

static void loadZbiasFile(const char *level) {
	uint8_t records[MAX_ENTRIES * ZB_RECORD];
	char exeDirectory[MAX_PATH];
	char path[MAX_PATH];
	char *slash;
	FILE *file;
	size_t size;
	size_t i;
	uint8_t bias;

	s_count = 0;

	if (!level || !level[0]) {
		return;
	}

	GetModuleFileName(NULL, exeDirectory, sizeof(exeDirectory));
	slash = strrchr(exeDirectory, '\\');
	if (!slash) {
		return;
	}
	*(slash + 1) = '\0';

	sprintf(path, "%sdata\\levels\\better4\\%s\\%s.zb", exeDirectory, level, level);

	file = fopen(path, "rb");
	if (!file) {
		return;
	}

	size = fread(records, 1, sizeof(records), file);
	fclose(file);

	for (i = 0; i + ZB_RECORD <= size; i += ZB_RECORD) {
		bias = records[i + 4];
		if (bias > MAX_ZBIAS) {
			bias = MAX_ZBIAS;
		}

		memcpy(&s_entries[s_count].checksum, &records[i], 4);
		s_entries[s_count].bias = bias;
		s_count++;
	}
}

// `LoadZBias level = <level>`, called once per level from `load_level`.
int __cdecl CFunc_LoadZBias(CStruct *params, CScript *script) {
	const char *level = NULL;

	CStruct_GetText(params, 0x651533ec /*level*/, &level, 0);
	loadZbiasFile(level);

	return 1;
}

void patchZBias() {
	int i;
	int sites = sizeof(set_material_calls) / sizeof(set_material_calls[0]);

	for (i = 0; i < sites; i++) {
		patchCall(set_material_calls[i], (void *)SetMaterial_Wrapper);
	}
}
