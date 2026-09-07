#include "load.h"

#include "decomp/common.h"

#include <partymod-thps4/src/hash.h>
#include <partymod-thps4/src/patch.h>

map_t *override_map;

void add_path_override(char *original_path, char *new_path) {
	map_put(override_map, original_path, strlen(original_path), new_path, strlen(new_path) + 1);
	printLog("Adding path override \"%s\" -> \"%s\"\n", original_path, new_path);
}

void *__cdecl Pip_Load(char *path) {
    static void *(__cdecl* _Load)(char *) = (void *)0x00538680;

	void *ret;
	char *override = map_get(override_map, path, strlen(path));
	printLog("Pip::Load: loading \"%s\"\n", path);

	if (override) {
		printLog("Pip::Load: Override load of \"%s\" with \"%s\"\n", path, override);
		ret = _Load(override);
	} else {
		ret = _Load(path);
	}

	return ret;
}

void *__cdecl Pip_Unload(char *path) {
    static void *(__cdecl* _Unload)(char *) = (void *)0x00538800;

	void *ret;
	char *override = map_get(override_map, path, strlen(path));

	if (override) {
		printLog("Pip::Unload: Override unload of \"%s\" with \"%s\"\n", path, override);
		ret = _Unload(override);
	} else {
		ret = _Unload(path);
	}

	return ret;
}

void __fastcall Obj_CSkaterCareer_StartLevel(void *career, unused_t _, int level_num) {
    static void (__fastcall* _StartLevel)(void *, unused_t, int) = (void *)0x004dc760;
	printLog("Obj::CSkaterCareer::StartLevel: level_num=%d\n", level_num);
	_StartLevel(career, UNUSED, level_num);
}

void patchLoad() {
	static int num_overrides = 1;
	override_map = map_alloc(num_overrides, NULL, NULL);

	// add_path_override("scripts\\qdir.txt", "scripts\\better4\\qdir.txt");
	add_path_override("levels\\hof\\hof.col.Xbx", "levels\\better4\\hof\\hof.col.Xbx");

	patchCall(0x0040b50e, (void *)Pip_Load); // ??
	patchCall(0x00464cd4, (void *)Pip_Load); // ??
	patchCall(0x0046c78f, (void *)Pip_Load); // Nx::CScene::read_collision
	patchCall(0x00511f78, (void *)Pip_Load); // SkateScript::LoadAllStartupQBFiles

	patchCall(0x0040b628, (void *)Pip_Unload); // ??
	patchCall(0x00464b83, (void *)Pip_Unload); // ??
	patchCall(0x0046be14, (void *)Pip_Unload); // ??
	patchCall(0x0046bef5, (void *)Pip_Unload); // ??
	patchCall(0x005120ac, (void *)Pip_Unload); // SkateScript::LoadAllStartupQBFiles

	patchCall(0x0051ab13, (void *)Obj_CSkaterCareer_StartLevel);
}
