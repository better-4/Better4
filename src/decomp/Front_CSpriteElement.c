#include "decomp/Front_CSpriteElement.h"

#include "decomp/common.h"

void Front_CSpriteElement_SetTexture(Front_CSpriteElement *this, uint32_t checksum) {
    static void (__fastcall *_SetTexture)(Front_CSpriteElement *, unused_t, uint32_t) = (void *)0x0045ab40;
    _SetTexture(this, UNUSED, checksum);
}
