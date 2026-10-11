#include "cas.h"

#include "decomp/common.h"
#include "decomp/CArray.h"
#include "decomp/CStruct.h"
#include "log.h"

#include "partymod-thps4/src/patch.h"

// TODO (ellie): find somewhere else to put this
typedef int(__cdecl* CFunc_PrintStruct_t)(CStruct *, int);
static CFunc_PrintStruct_t CFunc_PrintStruct = (CFunc_PrintStruct_t)0x0041a4c0;

void resize_specials(CArray *specials) {
	if (specials->size < 13) {
		logInfo("resizing specials from 12 to 13");
		CStruct *tmp_specials[12] = { 0 };

		for (int i = 0; i < specials->size; i++) {
			tmp_specials[i] = CArray_Get(specials, i);
			logDebug("tmp_specials[%d]=%p", i, tmp_specials[i]);
		}
		logDebug("setting specials array size to 13");
		CArray_SetSizeAndType(specials, 13, specials->type);

		for (int i = 0; i < 12; i++) {
			if (tmp_specials[i]) {
				logDebug("setting specials[%d]=%p", i, tmp_specials[i]);
				CArray_SetStructure(specials, i, tmp_specials[i]);
			}
		}

		CStruct *unassigned_slot = CStruct_New();
		CStruct_AddChecksum(unassigned_slot, 0x5b077ce1/*trickname*/, 0xf60c9090/*unassigned*/);
		CStruct_AddChecksum(unassigned_slot, 0xa92a2280/*trickslot*/, 0xf60c9090/*unassigned*/);

		CArray_SetStructure(specials, 12, unassigned_slot);
	}
}

CStruct *create_accessories_struct(CStruct *accessories, uint32_t desc_id) {
    CStruct *out = CStruct_New();
    CStruct_AddChecksum(out, 0x4bb2084e/*desc_id*/, desc_id);

    int use_default_hsv = 0;
    int h = 0;
    int s = 0;
    int v = 0;

	if (
        CStruct_GetInteger(accessories, 0x97dbdde6/*use_default_hsv*/, &use_default_hsv, 0)
        && CStruct_GetInteger(accessories, 0x6e94f918/*h*/, &h, 0)
        && CStruct_GetInteger(accessories, 0xe4f130f4/*s*/, &s, 0)
        && CStruct_GetInteger(accessories, 0x949bc47b/*v*/, &v, 0)
    ) {
        CStruct_AddInteger(out, 0x97dbdde6/*use_default_hsv*/, use_default_hsv);
        CStruct_AddInteger(out, 0x6e94f918/*h*/, h);
        CStruct_AddInteger(out, 0xe4f130f4/*s*/, s);
        CStruct_AddInteger(out, 0x949bc47b/*v*/, v);
	}

    return out;
}

void add_l_accessory(CStruct *appearance, uint32_t desc_id, CStruct *accessories) {
    CStruct *accessories_l = create_accessories_struct(accessories, desc_id);
    CStruct_AddStructure(appearance, 0x1f0476b7/*accessoriesL*/, accessories_l);
}

void add_r_accessory(CStruct *appearance, uint32_t desc_id, CStruct *accessories) {
    CStruct *accessories_r = create_accessories_struct(accessories, desc_id);
    CStruct_AddStructure(appearance, 0xe50b4bd4/*accessoriesR*/, accessories_r);
}

void fix_accessories(CStruct *appearance) {
    CStruct *accessories = 0;
    CStruct *accessories_l = 0;
    CStruct *accessories_r = 0;

    // If the CAS has accessories set, but no L or R accessories, map the original accessory
    // to the correct L or R accessory.
    if (
        CStruct_GetStructure(appearance, 0xdef5d9bf/*accessories*/, &accessories, 0)
        && !CStruct_GetStructure(appearance, 0x1f0476b7/*accessoriesL*/, &accessories_l, 0)
        && !CStruct_GetStructure(appearance, 0xe50b4bd4/*accessoriesR*/, &accessories_r, 0)
    ) {
        logInfo("fix_accessories: got accessories but no L or R accessories; performing conversion");

        uint32_t desc_id;
        if (CStruct_GetChecksum(accessories, 0x4bb2084e/*desc_id*/, &desc_id, 0)) {
            switch (desc_id) {
            case 0x2f0beb57:
                // "Wrist Band R" (0x2f0beb57) -> R "Wrist Band R" (0x2f0beb57)
                logInfo("fix_accessories: converting \"Wrist Band R\"");
                add_r_accessory(appearance, 0x2f0beb57, accessories);
                break;
            case 0xd504d634:
                // "Wrist Band L" (0xd504d634) -> L "Wrist Band L" (0xd504d634)
                logInfo("fix_accessories: converting \"Wrist Band L\"");
                add_l_accessory(appearance, 0xd504d634, accessories);
                break;
            case 0x96f5d000:
                // "Wrist Bands" (0x96f5d000) -> R "Wrist Band R" (0x2f0beb57), L "Wrist Band L" (0xd504d634)
                logInfo("fix_accessories: converting \"Wrist Bands\"");
                add_r_accessory(appearance, 0x2f0beb57, accessories);
                add_l_accessory(appearance, 0xd504d634, accessories);
                break;
            case 0xc10f603d:
                // "Koston band" (0xc10f603d) -> L "Koston band L" (0xf6dae138)
                logInfo("fix_accessories: converting \"Koston band\"");
                add_l_accessory(appearance, 0xf6dae138, accessories);
                break;
            case 0x3f4e38f1:
                // "Wrist Watch R" (0x3f4e38f1) -> R "Wrist Watch R" (0x3f4e38f1)
                logInfo("fix_accessories: converting \"Wrist Watch R\"");
                add_r_accessory(appearance, 0x3f4e38f1, accessories);
                break;
            case 0xc5410592:
                // "Wrist Watch L" (0xc5410592) -> L "Wrist Watch L" (0xc5410592)
                logInfo("fix_accessories: converting \"Wrist Watch L\"");
                add_l_accessory(appearance, 0xc5410592, accessories);
                break;
            case 0x8a030a7b:
                // "Gold Watch R" (0x8a030a7b) -> R "Gold Watch R" (0x8a030a7b)
                logInfo("fix_accessories: converting \"Gold Watch R\"");
                add_r_accessory(appearance, 0x8a030a7b, accessories);
                break;
            case 0x700c3718:
                // "Gold Watch L" (0x700c3718) -> L "Gold Watch L" (0x700c3718)
                logInfo("fix_accessories: converting \"Gold Watch L\"");
                add_l_accessory(appearance, 0x700c3718, accessories);
                break;
            case 0x19e833df:
                // "Rocker Watch" (0x19e833df) -> R "Rocker Watch R" (0x92ff959c)
                logInfo("fix_accessories: converting \"Rocker Watch\"");
                add_r_accessory(appearance, 0x92ff959c, accessories);
                break;
            case 0x2e8cb94a:
                // "Bracelet 1" (0x2e8cb94a) -> R "Bracelet 1" (0x2e8cb94a)
                logInfo("fix_accessories: converting \"Bracelet 1\"");
                add_r_accessory(appearance, 0x2e8cb94a, accessories);
                break;
            case 0xb785e8f0:
                // "Bracelet 2" (0xb785e8f0) -> R "Bracelet 2" (0xb785e8f0)
                logInfo("fix_accessories: converting \"Bracelet 2\"");
                add_r_accessory(appearance, 0xb785e8f0, accessories);
                break;
            case 0xc082d866:
                // "Bracelet 3" (0xc082d866) -> R "Bracelet 3" (0xc082d866)
                logInfo("fix_accessories: converting \"Bracelet 3\"");
                add_r_accessory(appearance, 0xc082d866, accessories);
                break;
            case 0x5ee64dc5:
                // "Bracelet 4" (0x5ee64dc5) -> R "Bracelet 4" (0x5ee64dc5)
                logInfo("fix_accessories: converting \"Bracelet 4\"");
                add_r_accessory(appearance, 0x5ee64dc5, accessories);
                break;
            case 0x2a4c8933:
                // "Wrist Tape" (0x2a4c8933) -> R "Wrist Tape R" (0x4b80404a)
                logInfo("fix_accessories: converting \"Wrist Tape\"");
                add_r_accessory(appearance, 0x4b80404a, accessories);
                break;
            }
        }
    }
}

void fix_bald(CStruct *appearance) {
	CStruct *hat = 0;

    // Only fix CAS that have a hat on
    if (CStruct_GetStructure(appearance, 0x6df453b6/*hat*/, &hat, 0)) {
        // skater_m_hat_hair and skater_f_hat_hair are different components, so check if
        // skater_m_head or skater_f_head exists to know which component to check
        CStruct *head = 0;
        CStruct *hat_hair = 0;
        if (CStruct_GetStructure(appearance, 0x650fab6d/*skater_m_head*/, &head, 0)) {
            if (!CStruct_GetStructure(appearance, 0x6a3794ee/*skater_m_hat_hair*/, &hat_hair, 0)) {
                logInfo("fix_accessories: got hat but no hat hair; adding \"Buzzed Dark\"");
                CStruct *hat_hair_m = CStruct_New();
                CStruct_AddChecksum(hat_hair_m, 0x4bb2084e/*desc_id*/, 0x85e06345/*Buzzed Dark HAT*/);
                CStruct_AddStructure(appearance, 0x6a3794ee/*skater_m_hat_hair*/, hat_hair_m);
            }
        } else if (CStruct_GetStructure(appearance, 0xfc85bae/*skater_f_head*/, &head, 0)) {
            if (!CStruct_GetStructure(appearance, 0x92d76f19/*skater_f_hat_hair*/, &hat_hair, 0)) {
                logInfo("fix_accessories: got hat but no hat hair; adding \"Very Short Dark\"");
                CStruct *hat_hair_f = CStruct_New();
                CStruct_AddChecksum(hat_hair_f, 0x4bb2084e/*desc_id*/, 0xa6b111ab/*Very Short Dark HAT*/);
                CStruct_AddStructure(appearance, 0x92d76f19/*skater_f_hat_hair*/, hat_hair_f);
            }
        }
    }
}

void __fastcall Obj_CPlayerProfileManager_LoadCASProfileInfo(void *this, unused_t _, CStruct *struc) {
	static void (__fastcall *_LoadCASProfileInfo)(void *, unused_t, CStruct *) = (void *)0x004af010;

	CStruct *custom = 0;
	if (CStruct_GetStructure(struc, 0xa7be964/*custom*/, &custom, 0)) {
		CStruct *info = 0;
		if (CStruct_GetStructure(custom, 0x3476cea8/*info*/, &info, 0)) {
			CStruct *specials_struc = 0;
			if (CStruct_GetStructure(info, 0xddbee809/*specials*/, &specials_struc, 0)) {
				CArray *specials = 0;
				if (CStruct_GetArray(specials_struc, 0, &specials, 0)) {
					resize_specials(specials);
				}
			}
		}

		CStruct *appearance = 0;
		if (CStruct_GetStructure(custom, 0x554c7d6f/*appearance*/, &appearance, 0)) {
            fix_accessories(appearance);
            fix_bald(appearance);
		}
	}

	_LoadCASProfileInfo(this, UNUSED, struc);
}

void patchCas() {
	patchCall(0x00514ea8, (void *)Obj_CPlayerProfileManager_LoadCASProfileInfo);
	patchCall(0x00514ea8, (void *)Obj_CPlayerProfileManager_LoadCASProfileInfo);

	// Obj::CSkater::UpdateTrickMappings (0x004cda50)
	patchByte(0x004cdc11 + 2, 13);

	// Game::CGoal::RemoveTempSpecialTrick (0x004e8a30)
	patchByte(0x004e8a9e + 2, 13);
}
