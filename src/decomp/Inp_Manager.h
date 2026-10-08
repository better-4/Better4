#ifndef _INP_MANAGER_H_
#define _INP_MANAGER_H_

#include <stdint.h>

// TODO (ellie): need to verify a lot of this against ghidra / x32dbg; only need this
// code for sticks atm.

enum DigitalButtonIndex {
    D_L2,
    D_R2,
    D_L1,
    D_R1,
    D_TRIANGLE,
    D_CIRCLE,
    D_X,
    D_SQUARE,
    D_SELECT,
    D_L3,
    D_R3,
    D_START,
    D_UP,
    D_RIGHT,
    D_DOWN,
    D_LEFT,
    D_BLACK,
    D_WHITE,
    D_Z,
    MAX_DIGITAL_EVENTS
};

enum AnalogButtonIndex {
    A_RIGHT_X,
    A_RIGHT_Y,
    A_LEFT_X,
    A_LEFT_Y,
    A_RIGHT,
    A_LEFT,
    A_UP,
    A_DOWN,
    A_TRIANGLE,
    A_CIRCLE,
    A_X,
    A_SQUARE,
    A_L1,
    A_R1,
    A_L2,
    A_R2,
    A_L3,
    A_R3,
    A_RIGHT_X_UNCLAMPED,
    A_RIGHT_Y_UNCLAMPED,
    A_LEFT_X_UNCLAMPED,
    A_LEFT_Y_UNCLAMPED,
    A_BLACK,
    A_WHITE,
    A_Z,
    MAX_ANALOG_EVENTS
};

enum DigitalButtonFlags
{
    FLAG_D_L2 = 1 << D_L2,
    FLAG_D_R2 = 1 << D_R2,
    FLAG_D_L1 = 1 << D_L1,
    FLAG_D_R1 = 1 << D_R1,
    FLAG_D_TRIANGLE = 1 << D_TRIANGLE,
    FLAG_D_CIRCLE = 1 << D_CIRCLE,
    FLAG_D_X = 1 << D_X,
    FLAG_D_SQUARE = 1 << D_SQUARE,
    FLAG_D_SELECT = 1 << D_SELECT,
    FLAG_D_L3 = 1 << D_L3,
    FLAG_D_R3 = 1 << D_R3,
    FLAG_D_START = 1 << D_START,
    FLAG_D_UP = 1 << D_UP,
    FLAG_D_RIGHT = 1 << D_RIGHT,
    FLAG_D_DOWN = 1 << D_DOWN,
    FLAG_D_LEFT = 1 << D_LEFT,
    FLAG_D_BLACK = 1 << D_BLACK,
    FLAG_D_WHITE = 1 << D_WHITE,
    FLAG_D_Z = 1 << D_Z,
};

enum AnalogButtonFlags
{
    FLAG_A_RIGHT_X = 1 << A_RIGHT_X,
    FLAG_A_RIGHT_Y = 1 << A_RIGHT_Y,
    FLAG_A_LEFT_X = 1 << A_LEFT_X,
    FLAG_A_LEFT_Y = 1 << A_LEFT_Y,
    FLAG_A_RIGHT = 1 << A_RIGHT,
    FLAG_A_LEFT = 1 << A_LEFT,
    FLAG_A_UP = 1 << A_UP,
    FLAG_A_DOWN = 1 << A_DOWN,
    FLAG_A_TRIANGLE = 1 << A_TRIANGLE,
    FLAG_A_CIRCLE = 1 << A_CIRCLE,
    FLAG_A_X = 1 << A_X,
    FLAG_A_SQUARE = 1 << A_SQUARE,
    FLAG_A_L1 = 1 << A_L1,
    FLAG_A_R1 = 1 << A_R1,
    FLAG_A_L2 = 1 << A_L2,
    FLAG_A_R2 = 1 << A_R2,
    FLAG_A_L3 = 1 << A_L3,
    FLAG_A_R3 = 1 << A_R3,
    FLAG_A_BLACK = 1 << A_BLACK,
    FLAG_A_WHITE = 1 << A_WHITE,
    FLAG_A_Z = 1 << A_Z,
};

typedef struct Inp_Data_Analog {
    // sticks, centered at 0x80 each axis
    uint8_t right_x;
    uint8_t right_y;
    uint8_t left_x;
    uint8_t left_y;
    // dpad
    uint8_t right;
    uint8_t left;
    uint8_t up;
    uint8_t down;
    uint8_t triangle;
    uint8_t circle;
    uint8_t x;
    uint8_t square;
    uint8_t l1;
    uint8_t r1;
    uint8_t l2;
    uint8_t r2;
} Inp_Data_Analog;

typedef struct Inp_Data {
    Inp_Data_Analog analog; // 0x0, size 0x10
    uint32_t button_flags; // 0x14, digital, button is currently pressed
    uint32_t makes_flags; // 0x1d, digital, button was just pressed (only 1 for one frame)
    uint32_t breaks_flags; // 0x21
    uint32_t new;
    uint32_t cur;
} Inp_Data;

uint32_t Inp_Data_ButtonPressed(Inp_Data *this, uint32_t flag);
uint32_t Inp_Data_ButtonJustPressed(Inp_Data *this, uint32_t flag);

typedef struct Inp_Server {
    uint8_t unk[0x44];
    Inp_Data data; // 0x44, size 0x24
    uint8_t unk2[0x10];
    // sizeof: 0x78
} Inp_Server;

typedef struct Inp_Manager {
    Inp_Server servers[2]; // 0x0, size 0x78*2
} Inp_Manager;

Inp_Manager *Inp_Manager_Instance();

#endif
