#ifndef _DEBUG_DRAW_H_
#define _DEBUG_DRAW_H_

#include "decomp/Mth_Matrix.h"
#include "decomp/Mth_Vector.h"

#include <stdint.h>

#define BETTER4_RGBA(r, g, b, a) \
    (((uint32_t)(a) << 24) | ((uint32_t)(b) << 16) | ((uint32_t)(g) << 8) | (uint32_t)(r))
#define BETTER4_RGB(r, g, b) BETTER4_RGBA(r, g, b, 255)

#define BETTER4_DRAW_ONE_FRAME 1
#define BETTER4_DRAW_UNTIL_WRAP 0

void better4DebugLine(const Mth_Vector *v0, const Mth_Vector *v1,
                      uint32_t rgb0, uint32_t rgb1, int frames);

// A line with a three-fin head at v1, sized off the line's own length.
void better4DebugArrow(const Mth_Vector *v0, const Mth_Vector *v1, uint32_t rgb, int frames);

// Three axis-aligned lines crossing at `at`, marks a point from any angle.
void better4DebugStar(const Mth_Vector *at, float radius, uint32_t rgb, int frames);

// A horizontal ring, `points` segments around.
void better4DebugCircle(const Mth_Vector *at, int points, float radius, uint32_t rgb, int frames);

// Wireframe of the axis-aligned box spanned by `min` and `max`.
void better4DebugBox(const Mth_Vector *min, const Mth_Vector *max, uint32_t rgb, int frames);

// `m`'s three axes drawn at `at` in red/green/blue.
void better4DebugAxes(const Mth_Matrix *m, const Mth_Vector *at, float length, int frames);

// Draw subsequently added lines with the depth test off, so they show through.
void better4DebugDrawOnTop(int on_top);

void better4DebugDrawClear(void);
int better4DebugDrawLineCount(void);

// Writes the local skater's position to `out`. Returns 0 if there is no skater
// yet, which is the case in the front end.
int better4DebugSkaterPos(Mth_Vector *out);

// One toggleable overlay. `emit` runs once a frame while `enabled`, just before
// the buffer is rendered, and should push its lines with ONE_FRAME lifetimes.
typedef struct Better4DebugFeature {
    const char *name;
    const char *help;
    void (*emit)(void);
    int enabled;
} Better4DebugFeature;

int better4DebugFeatureCount(void);
Better4DebugFeature *better4DebugFeatureAt(int index);
Better4DebugFeature *better4DebugFeatureFind(const char *name);

// Installs the per-frame draw hook.
void patchDebugDraw(void);

#endif
