#include "decomp/Inp_Manager.h"

uint32_t Inp_Data_ButtonPressed(Inp_Data *this, uint32_t flag) {
    return this->button_flags & flag;
}

uint32_t Inp_Data_ButtonJustPressed(Inp_Data *this, uint32_t flag) {
    return this->makes_flags & flag;
}

Inp_Manager *Inp_Manager_Instance() {
    return *(Inp_Manager **)0x005cd264;
}
