#ifndef _OBJ_CSKATERCAREER_H_
#define _OBJ_CSKATERCAREER_H_

#define NUM_LEVELS 0x40
#define NUM_GLOBAL_FLAGS 0x10

typedef struct Obj_CSkaterCareer {
    // offsets assume NUM_LEVELS=0x10 (default)
    int unk; // 0x0
    uint32_t goal_flags[NUM_LEVELS][8]; // 0x4
    uint32_t level_flags[NUM_LEVELS][8]; // 0x204
    uint32_t start_goal_flags[8]; // 0x404
    uint32_t start_level_flags[8]; // 0x424
    uint32_t global_flags[NUM_GLOBAL_FLAGS]; // 0x444
    int current_level; // 0x484
    void *gap_checklist[NUM_LEVELS]; // 0x488
    uint8_t level_visited[NUM_LEVELS]; // 0x4c8
} Obj_CSkaterCareer;

#endif
