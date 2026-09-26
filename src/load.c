#include "load.h"

#include "decomp/common.h"

#include <partymod-thps4/src/hash.h>
#include <partymod-thps4/src/patch.h>

map_t *override_map;

// Init to 0 so is initialized by better4_controls_init
static int use_updated_collision = 0;

void add_path_override(char *original_path, char *new_path) {
	map_put(override_map, original_path, strlen(original_path), new_path, strlen(new_path) + 1);
	printLog("Adding path override \"%s\" -> \"%s\"\n", original_path, new_path);
}

void remove_path_override(char *original_path) {
	map_del(override_map, original_path, strlen(original_path));
	printLog("Removing path override \"%s\"\n", original_path);
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

	printLog("File::Open: \"%s\"\n", path);
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

void add_path_overrides() {
	add_path_override("levels\\hof\\hof.col.Xbx", "levels\\better4\\hof\\hof.col.Xbx");
	add_path_override("levels\\sch\\sch.col.Xbx", "levels\\better4\\sch\\sch.col.Xbx");
	add_path_override("levels\\sf2\\sf2.col.Xbx", "levels\\better4\\sf2\\sf2.col.Xbx");
	add_path_override("levels\\alc\\alc.col.Xbx", "levels\\better4\\alc\\alc.col.Xbx");
	add_path_override("levels\\kon\\kon.col.Xbx", "levels\\better4\\kon\\kon.col.Xbx");
	add_path_override("levels\\jnk\\jnk.col.Xbx", "levels\\better4\\jnk\\jnk.col.Xbx");
	add_path_override("levels\\lon\\lon.col.Xbx", "levels\\better4\\lon\\lon.col.Xbx");
	add_path_override("levels\\zoo\\zoo.col.Xbx", "levels\\better4\\zoo\\zoo.col.Xbx");
	add_path_override("levels\\cnv\\cnv.col.Xbx", "levels\\better4\\cnv\\cnv.col.Xbx");
}

void remove_path_overrides() {
	remove_path_override("levels\\hof\\hof.col.Xbx");
	remove_path_override("levels\\sch\\sch.col.Xbx");
	remove_path_override("levels\\sf2\\sf2.col.Xbx");
	remove_path_override("levels\\alc\\alc.col.Xbx");
	remove_path_override("levels\\kon\\kon.col.Xbx");
	remove_path_override("levels\\jnk\\jnk.col.Xbx");
	remove_path_override("levels\\lon\\lon.col.Xbx");
	remove_path_override("levels\\zoo\\zoo.col.Xbx");
	remove_path_override("levels\\cnv\\cnv.col.Xbx");
}

void patchLoad() {
	static int num_overrides = 256;
	override_map = map_alloc(num_overrides, NULL, NULL);

	// Always override new levels
	// THPS

    add_path_override("levels\\Ware\\Ware.col.Xbx", "levels\\better4\\Ware\\Ware.col.Xbx");
	add_path_override("levels\\Ware\\Ware.scn.Xbx", "levels\\better4\\Ware\\Ware.scn.Xbx");
	add_path_override("levels\\Ware\\Ware.tex.Xbx", "levels\\better4\\Ware\\Ware.tex.Xbx");

	add_path_override("levels\\Vans\\Vans.col.Xbx", "levels\\better4\\Vans\\Vans.col.Xbx");
	add_path_override("levels\\Vans\\Vans.scn.Xbx", "levels\\better4\\Vans\\Vans.scn.Xbx");
	add_path_override("levels\\Vans\\Vans.tex.Xbx", "levels\\better4\\Vans\\Vans.tex.Xbx");

	add_path_override("levels\\Streets\\Streets.col.Xbx", "levels\\better4\\Streets\\Streets.col.Xbx");
	add_path_override("levels\\Streets\\Streets.scn.Xbx", "levels\\better4\\Streets\\Streets.scn.Xbx");
	add_path_override("levels\\Streets\\Streets.tex.Xbx", "levels\\better4\\Streets\\Streets.tex.Xbx");

	// THPS3
	add_path_override("levels\\AP\\AP.col.Xbx", "levels\\better4\\AP\\AP.col.Xbx");
	add_path_override("levels\\AP\\AP.scn.Xbx", "levels\\better4\\AP\\AP.scn.Xbx");
	add_path_override("levels\\AP\\AP.tex.Xbx", "levels\\better4\\AP\\AP.tex.Xbx");

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

int __cdecl CFunc_SetUpdatedCollision(CStruct* params) {
	float index;
	if (!CStruct_GetFloat(params, 0x7f8c98fe, &index, 0)) {
		printLog("SetUpdatedCollision missing param \"index\" (0x7f8c98fe)\n");
		return 0;
	}
	
	int prev_use_updated_collision = use_updated_collision;
	use_updated_collision = (int)index;
	printLog("Set use_updated_collision=%d\n", use_updated_collision);

	if (prev_use_updated_collision != use_updated_collision) {
		if (use_updated_collision) {
			add_path_overrides();
		} else {
			remove_path_overrides();
		}
	}
}
