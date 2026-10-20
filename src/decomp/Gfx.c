#include "decomp/Gfx.h"

void Gfx_HSVtoRGB(float *r, float *g, float *b, float h, float s, float v) {
    static void (__cdecl *_HSVtoRGB)(float *, float *, float *, float, float, float) = (void *)0x0045f530;
    _HSVtoRGB(r, g, b, h, s, v);
}
