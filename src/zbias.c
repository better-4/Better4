#include "zbias.h"

#include "decomp/common.h"

#include "partymod-thps4/src/patch.h"

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
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
#define MAX_LINE 256

// D3DRS_ZBIAS value of 0-16.
// data/levels/<Lvl>/<lvl>.zbias.txt
//   # College (sch)
//   0x1a2b3c4d  2   # We can add some comment here for material name.
typedef struct {
	uint32_t checksum;
	int bias;
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
	void *device = *(void **)0x00aab478/* IDirect3DDevice8 */;
	void **vtable;

	if (!device) {
		return;
	}

	vtable = *(void ***)device;
	// `50` is the vtable entry idx of SetRenderState.
	((SetRenderStateFn)vtable[50])(device, 47/*D3DRS_ZBIAS*/, (uint32_t)bias);
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

static void parseLine(char *line) {
	char checksum[32];
	int bias = 0;
	char *hash = strchr(line, '#');

	if (hash) {
		*hash = '\0';
	}

	if (sscanf(line, "%31s %d", checksum, &bias) != 2) {
		return;
	}

	// Checksums only.
	if (checksum[0] != '0' || (checksum[1] != 'x' && checksum[1] != 'X')) {
		return;
	}

	if (bias < 0) {
		bias = 0;
	}
	if (bias > MAX_ZBIAS) {
		bias = MAX_ZBIAS;
	}

	if (s_count >= MAX_ENTRIES) {
		return;
	}

	s_entries[s_count].checksum = (uint32_t)strtoul(checksum + 2, NULL, 16);
	s_entries[s_count].bias = bias;
	s_count++;
}

static void loadZbiasFile(const char *scenePath) {
	char exeDirectory[MAX_PATH];
	char level[64];
	char path[MAX_PATH];
	char line[MAX_LINE];
	char *slash;
	FILE *file;

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

	sprintf(path, "%sdata\\levels\\better4\\%s\\%s.zbias.txt", exeDirectory, level, level);

	file = fopen(path, "r");
	if (!file) {
		return;
	}

	while (fgets(line, sizeof(line), file)) {
		parseLine(line);
	}

	fclose(file);
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
