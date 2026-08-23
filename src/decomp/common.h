#ifndef _COMMON_H_
#define _COMMON_H_

#include <stdint.h>

// Mock __thiscall calling convention by using __fastcall and a dummy second parameter.
// `this` loaded into `ecx`, `_` loaded into `edx` and safely ignored, rest pushed onto stack.
#define UNUSED 0
typedef uint32_t unused_t;

// Component types
#define TYPE_NONE 0x0
#define TYPE_INTEGER 0x1
#define TYPE_FLOAT 0x2
#define TYPE_STRING 0x3
#define TYPE_LOCALSTRING 0x4
#define TYPE_PAIR 0x5
#define TYPE_VECTOR 0x6
#define TYPE_QSCRIPT 0x7
#define TYPE_CFUNCTION 0x8
#define TYPE_MEMBERFUNCTION 0x9
#define TYPE_STRUCTURE 0xA
#define TYPE_STRUCTUREPOINTER 0xB
#define TYPE_ARRAY 0xC
#define TYPE_NAME 0xD
#define TYPE_INT8 0xE
#define TYPE_INT16 0xF
#define TYPE_UINT8 0x11
#define TYPE_UINT16 0x12
#define TYPE_ZEROFLOAT 0x13

#endif
