#include "decomp/Front_CScreenElement.h"

#include "decomp/common.h"

void Front_CScreenElement_SetAlpha(Front_CScreenElement *this, float alpha, int unk) {
    static void (__fastcall *_SetAlpha)(Front_CScreenElement *, unused_t, float, int) = (void *)0x00471d70;
    _SetAlpha(this, UNUSED, alpha, unk);
}
