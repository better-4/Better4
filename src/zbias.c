#include "zbias.h"

#include "decomp/common.h"

#include "partymod-thps4/src/patch.h"

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <windows.h>

// `set_material` calls, from the xrefs of `0x0043bbd0`.
// leaving out `0x0044d993`, since that is inside the decal pass.
static void *const set_material_calls[] = {
	(void *)0x00443312, /* FUN_00443250, the world scene render */
	(void *)0x00443384, (void *)0x004433c3, (void *)0x004434ef, (void *)0x0044361d,
	(void *)0x004436a6, (void *)0x0044e6dc, (void *)0x0044f521, /* plat_render */
	(void *)0x0044ff76, (void *)0x00451554,
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

typedef HRESULT(__stdcall *SetRenderStateFn)(void *device, uint32_t state, uint32_t value);

static int lookupBias(uint32_t checksum) {
	int i;

	for (i = 0; i < s_count; i++) {
		if (s_entries[i].checksum == checksum) {
			return s_entries[i].bias;
		}
	}

	return 0;
}

static void applyBias(int bias) {
	void *device = *(void **)0x00aab478 /* IDirect3DDevice8 */;
	void **vtable;

	if (!device) {
		return;
	}

	vtable = *(void ***)device;
	// `50` is the vtable entry idx of SetRenderState.
	((SetRenderStateFn)vtable[50])(device, 47 /*D3DRS_ZBIAS*/, (uint32_t)bias);
}

void __fastcall SetMaterial_Wrapper(void *material, unused_t _) {
	static void(__fastcall * _SetMaterial)(void *, unused_t) = (void *)0x0043bbd0;

	_SetMaterial(material, UNUSED);

	if (s_count && material) {
		applyBias(lookupBias(*(uint32_t *)material));
	}
}

// Resolves level base name: "levels\zoo\zoo.scn.Xbx" -> "zoo".
static void levelBaseName(const char *path, char *out, int size) {
	const char *base = path;
	const char *p;
	int i;

	for (p = path; *p; p++) {
		if (*p == '\\' || *p == '/') {
			base = p + 1;
		}
	}

	for (i = 0; i < size - 1 && base[i] && base[i] != '.'; i++) {
		out[i] = base[i];
	}

	out[i] = '\0';
}

static void loadZbiasFile(const char *scenePath) {
	uint8_t records[MAX_ENTRIES * ZB_RECORD];
	char exeDirectory[MAX_PATH];
	char level[64];
	char path[MAX_PATH];
	char *slash;
	FILE *file;
	size_t size;
	size_t i;
	uint8_t bias;

	s_count = 0;

	levelBaseName(scenePath, level, sizeof(level));
	if (!level[0]) {
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

int *__cdecl Nx_s_plat_load_scene(char *name, int param_2, void *param_3, void *param_4, void *param_5) {
	static int *(__cdecl * _s_plat_load_scene)(char *, int, void *, void *, void *) = (void *)0x00447070;

	int *scene = _s_plat_load_scene(name, param_2, param_3, param_4, param_5);

	loadZbiasFile(name);

	return scene;
}

void patchZBias() {
	int i;
	int sites = sizeof(set_material_calls) / sizeof(set_material_calls[0]);

	patchCall((void *)0x00461a36, (void *)Nx_s_plat_load_scene);

	for (i = 0; i < sites; i++) {
		patchCall(set_material_calls[i], (void *)SetMaterial_Wrapper);
	}
}
