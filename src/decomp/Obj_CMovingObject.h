#ifndef _OBJ_CMOVINGOBJECT_H_
#define _OBJ_CMOVINGOBJECT_H_

#include <stdint.h>

typedef void Obj_CMovingObject;

uint32_t Obj_CMovingObject_FlagException(Obj_CMovingObject *this, char *name, uint8_t unk);
void Obj_CMovingObject_ProcessExceptions(Obj_CMovingObject *this);

#endif
