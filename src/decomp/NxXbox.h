#ifndef _DECOMP_NXXBOX_H_
#define _DECOMP_NXXBOX_H_

#include <stdint.h>

// See: https://learn.microsoft.com/en-us/previous-versions/ms886344(v=msdn.10)
#define D3DRS_ZBIAS 47

// The IDirect3DDevice8 the engine creates in NxXbox::InitialiseEngine
// (0x0043efb0). NULL before that runs.
void *NxXbox_GetDevice();

// IDirect3DDevice8::SetRenderState on that device.
void NxXbox_SetDeviceRenderState(uint32_t state, uint32_t value);

// NxXbox::sMaterial::Submit (0x0043bbd0)
void NxXbox_sMaterial_Submit(void *material);

#endif
