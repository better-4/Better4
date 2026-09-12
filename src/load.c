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
	// printLog("Pip::Load: loading \"%s\"\n", path);

	if (override) {
		printLog("Pip::Load: Override \"%s\" with \"%s\"\n", path, override);
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
		printLog("Pip::Unload: Override \"%s\" with \"%s\"\n", path, override);
		ret = _Unload(override);
	} else {
		ret = _Unload(path);
	}

	return ret;
}

void *__cdecl File_Open(char *path, char *mode) {
    static void *(__cdecl* _Open)(char *, char *) = (void *)0x00536250;

	// printLog("File::Open: \"%s\"\n", path);
	void *ret;
	char *override = map_get(override_map, path, strlen(path));

	if (override) {
		printLog("File::Open: Override \"%s\" with \"%s\"\n", path, override);
		ret = _Open(override, mode);
	} else {
		ret = _Open(path, mode);
	}

	return ret;
}

void *__cdecl Script_LoadQB(char *path, int unk) {
    static void *(__cdecl* _LoadQB)(char *, int) = (void *)0x0040b4c0;

	printLog("Script::LoadQB: (\"%s\", \"%d\")\n", path, unk);

	return _LoadQB(path, unk);
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

	add_path_override("levels\\LA\\LA.col.Xbx", "levels\\better4\\LA\\LA.col.Xbx");
	add_path_override("levels\\LA\\LA.scn.Xbx", "levels\\better4\\LA\\LA.scn.Xbx");
	add_path_override("levels\\LA\\LA.tex.Xbx", "levels\\better4\\LA\\LA.tex.Xbx");

	// patchCall(0x0040b50e, (void *)Pip_Load); // ??
	// patchCall(0x00464cd4, (void *)Pip_Load); // ??
	// patchCall(0x0046c78f, (void *)Pip_Load); // Nx::CScene::read_collision
	// patchCall(0x00511f78, (void *)Pip_Load); // SkateScript::LoadAllStartupQBFiles
	//
	// patchCall(0x0040b628, (void *)Pip_Unload); // ??
	// patchCall(0x00464b83, (void *)Pip_Unload); // ??
	// patchCall(0x0046be14, (void *)Pip_Unload); // ??
	// patchCall(0x0046bef5, (void *)Pip_Unload); // ??
	// patchCall(0x005120ac, (void *)Pip_Unload); // SkateScript::LoadAllStartupQBFiles

	patchCall(0x00538e43, (void *)File_Open); // Pip::Load
	patchCall(0x00447203, (void *)File_Open); // Nx::CEngine::s_plat_load_scene
	patchCall(0x00439f5d, (void *)File_Open); // NxXbox::LoadTextureFile
	// patchCall(0x004358df, (void *)File_Open); // ??
	// patchCall(0x00438608, (void *)File_Open); // ??
	// patchCall(0x00445ed2, (void *)File_Open); // ??
	// patchCall(0x0044ae41, (void *)File_Open); // ??
	// patchCall(0x0045bcce, (void *)File_Open); // ??
	// patchCall(0x0045bd0e, (void *)File_Open); // ??
	// patchCall(0x0045c52b, (void *)File_Open); // ??
	// patchCall(0x00479c5f, (void *)File_Open); // ??
	// patchCall(0x00520789, (void *)File_Open); // ??
	// patchCall(0x005207c9, (void *)File_Open); // ??
	// patchCall(0x00537439, (void *)File_Open); // ??

	// patchCall(0x005120e0, (void *)Script_LoadQB); // SkateScript::LoadQB
	// patchCall(0x00512045, (void *)Script_LoadQB); // SkateScript::LoadAllStartupQBFiles

	// patchCall(0x0051ab13, (void *)Obj_CSkaterCareer_StartLevel);
}
