#include "debug/draw.h"

#include "decomp/Mdl_Skate.h"
#include "decomp/Obj_CCompositeObject.h"
#include "decomp/Obj_CSkater.h"

#include "log.h"

#include "partymod-thps4/src/patch.h"

#include <math.h>
#include <string.h>

// Gfx::DebugGfx_Draw.
#define THPS4_DEBUG_GFX_DRAW 0x0045ee90

// NxXbox::EngineGlobals.p_Device.
#define THPS4_D3D_DEVICE (*(void **)0x00aab478)

typedef void(__cdecl *NxXbox_set_texture_t)(uint32_t stage, void *texture, void *palette);
typedef void(__cdecl *NxXbox_set_blend_mode_t)(uint32_t mode, int fixed_alpha);
typedef void(__cdecl *NxXbox_set_vertex_shader_t)(uint32_t fvf);

static NxXbox_set_texture_t NxXbox_set_texture = (NxXbox_set_texture_t)0x00440d70;
static NxXbox_set_blend_mode_t NxXbox_set_blend_mode = (NxXbox_set_blend_mode_t)0x00440de0;
static NxXbox_set_vertex_shader_t NxXbox_set_vertex_shader = (NxXbox_set_vertex_shader_t)0x00441390;

#define NXXBOX_BLEND_MODE_DIFFUSE 0

// IDirect3DDevice8 vtable slots.
#define D3D_SLOT_SET_TRANSFORM 37
#define D3D_SLOT_DRAW_PRIMITIVE_UP 72
#define D3D_SLOT_SET_PIXEL_SHADER 88
#define D3D_SLOT_GET_PIXEL_SHADER 89

#define D3DTS_WORLD 256
#define D3DPT_LINELIST 2
#define D3DFVF_XYZ_DIFFUSE 0x042

typedef int(__stdcall *SetTransform_t)(void *self, uint32_t state, const float *matrix);
typedef int(__stdcall *DrawPrimitiveUP_t)(void *self, uint32_t type, uint32_t count,
                                          const void *data, uint32_t stride);
typedef int(__stdcall *SetPixelShader_t)(void *self, uint32_t handle);
typedef int(__stdcall *GetPixelShader_t)(void *self, uint32_t *handle);

static void *device_method(void *device, int slot) {
    return (*(void ***)device)[slot];
}

// What Gfx::DEBUGGERY_LINE_ARRAY_SIZE was on every platform but the PS2.
#define DEBUG_LINE_MAX 2048

typedef struct DebugLine {
    Mth_Vector v0;
    Mth_Vector v1;
    uint32_t rgb0;
    uint32_t rgb1;
    int in_use;
    int frames_left;
} DebugLine;

// D3DFVF_XYZ | D3DFVF_DIFFUSE.
typedef struct DebugVert {
    float x;
    float y;
    float z;
    uint32_t color;
} DebugVert;

static DebugLine debug_lines[DEBUG_LINE_MAX];
static DebugVert debug_verts[DEBUG_LINE_MAX * 2];
static int next_line;

void better4DebugLine(const Mth_Vector *v0, const Mth_Vector *v1,
                      uint32_t rgb0, uint32_t rgb1, int frames) {
    DebugLine *line = &debug_lines[next_line];

    line->v0 = *v0;
    line->v1 = *v1;
    line->rgb0 = rgb0;
    line->rgb1 = rgb1;
    line->in_use = 1;
    line->frames_left = frames;

    next_line = (next_line + 1) % DEBUG_LINE_MAX;
}

void better4DebugDrawClear(void) {
    memset(debug_lines, 0, sizeof(debug_lines));
    next_line = 0;
}

int better4DebugDrawLineCount(void) {
    int count = 0;
    for (int i = 0; i < DEBUG_LINE_MAX; i++) {
        if (debug_lines[i].in_use) {
            count++;
        }
    }
    return count;
}

static Mth_Vector vec(float x, float y, float z) {
    Mth_Vector v = { x, y, z, 1.0f };
    return v;
}

static Mth_Vector vec_add(Mth_Vector a, Mth_Vector b) {
    return vec(a.x + b.x, a.y + b.y, a.z + b.z);
}

static Mth_Vector vec_sub(Mth_Vector a, Mth_Vector b) {
    return vec(a.x - b.x, a.y - b.y, a.z - b.z);
}

static Mth_Vector vec_scale(Mth_Vector a, float s) {
    return vec(a.x * s, a.y * s, a.z * s);
}

static Mth_Vector vec_cross(Mth_Vector a, Mth_Vector b) {
    return vec(a.y * b.z - a.z * b.y,
               a.z * b.x - a.x * b.z,
               a.x * b.y - a.y * b.x);
}

static float vec_length(Mth_Vector a) {
    return sqrtf(a.x * a.x + a.y * a.y + a.z * a.z);
}

static Mth_Vector vec_normalized(Mth_Vector a) {
    float length = vec_length(a);
    return length > 0.0001f ? vec_scale(a, 1.0f / length) : vec(0.0f, 0.0f, 0.0f);
}

static Mth_Vector vec_perpendicular(Mth_Vector a) {
    float ax = fabsf(a.x);
    float ay = fabsf(a.y);
    float az = fabsf(a.z);

    Mth_Vector axis = vec(1.0f, 0.0f, 0.0f);
    if (ay <= ax && ay <= az) {
        axis = vec(0.0f, 1.0f, 0.0f);
    } else if (az <= ax && az <= ay) {
        axis = vec(0.0f, 0.0f, 1.0f);
    }

    return vec_normalized(vec_cross(a, axis));
}

#define ARROW_FINS 3
#define PI 3.14159265f

void better4DebugArrow(const Mth_Vector *v0, const Mth_Vector *v1, uint32_t rgb, int frames) {
    better4DebugLine(v0, v1, rgb, rgb, frames);

    Mth_Vector along = vec_sub(*v1, *v0);
    float length = vec_length(along);
    if (length < 0.0001f) {
        return;
    }

    Mth_Vector forward = vec_scale(along, 1.0f / length);
    Mth_Vector right = vec_perpendicular(forward);
    Mth_Vector up = vec_cross(forward, right);

    float head_length = length * 0.25f;
    float head_width = head_length / 3.0f;
    Mth_Vector base = vec_sub(*v1, vec_scale(forward, head_length));

    Mth_Vector fins[ARROW_FINS];
    for (int i = 0; i < ARROW_FINS; i++) {
        float angle = (float)i * (2.0f * PI / (float)ARROW_FINS);
        Mth_Vector out = vec_add(vec_scale(right, cosf(angle)), vec_scale(up, sinf(angle)));
        fins[i] = vec_add(base, vec_scale(out, head_width));
        better4DebugLine(&fins[i], v1, rgb, rgb, frames);
    }
    for (int i = 0; i < ARROW_FINS; i++) {
        better4DebugLine(&fins[i], &fins[(i + 1) % ARROW_FINS], rgb, rgb, frames);
    }
}

void better4DebugStar(const Mth_Vector *at, float radius, uint32_t rgb, int frames) {
    for (int axis = 0; axis < 3; axis++) {
        Mth_Vector offset = vec(axis == 0 ? radius : 0.0f,
                                axis == 1 ? radius : 0.0f,
                                axis == 2 ? radius : 0.0f);
        Mth_Vector a = vec_add(*at, offset);
        Mth_Vector b = vec_sub(*at, offset);
        better4DebugLine(&a, &b, rgb, rgb, frames);
    }
}

void better4DebugCircle(const Mth_Vector *at, int points, float radius, uint32_t rgb, int frames) {
    if (points < 3) {
        points = 3;
    }

    Mth_Vector previous = vec_add(*at, vec(0.0f, 0.0f, radius));
    for (int i = 1; i <= points; i++) {
        float angle = (float)i * (2.0f * PI / (float)points);
        Mth_Vector next = vec_add(*at, vec(sinf(angle) * radius, 0.0f, cosf(angle) * radius));
        better4DebugLine(&previous, &next, rgb, rgb, frames);
        previous = next;
    }
}

void better4DebugBox(const Mth_Vector *min, const Mth_Vector *max, uint32_t rgb, int frames) {
    Mth_Vector corners[8];
    for (int i = 0; i < 8; i++) {
        corners[i] = vec((i & 1) ? max->x : min->x,
                         (i & 2) ? max->y : min->y,
                         (i & 4) ? max->z : min->z);
    }

    for (int i = 0; i < 8; i++) {
        for (int bit = 1; bit <= 4; bit <<= 1) {
            if (!(i & bit)) {
                better4DebugLine(&corners[i], &corners[i | bit], rgb, rgb, frames);
            }
        }
    }
}

void better4DebugAxes(const Mth_Matrix *m, const Mth_Vector *at, float length, int frames) {
    Mth_Vector x = vec_add(*at, vec_scale(vec(m->x.x, m->x.y, m->x.z), length));
    Mth_Vector y = vec_add(*at, vec_scale(vec(m->y.x, m->y.y, m->y.z), length));
    Mth_Vector z = vec_add(*at, vec_scale(vec(m->z.x, m->z.y, m->z.z), length));

    better4DebugLine(at, &x, BETTER4_RGB(255, 48, 48), BETTER4_RGB(255, 48, 48), frames);
    better4DebugLine(at, &y, BETTER4_RGB(48, 255, 48), BETTER4_RGB(48, 255, 48), frames);
    better4DebugLine(at, &z, BETTER4_RGB(48, 128, 255), BETTER4_RGB(48, 128, 255), frames);
}

static Obj_CSkater *local_skater(void) {
    Mdl_Skate *skate = Mdl_Skate_Instance();
    if (!skate) {
        return 0;
    }
    return Mdl_Skate_GetSkater(skate, 0);
}

int better4DebugSkaterPos(Mth_Vector *out) {
    Obj_CSkater *skater = local_skater();
    if (!skater || !skater->object) {
        return 0;
    }

    *out = skater->object->pos;
    return 1;
}

static void emit_skater(void) {
    Obj_CSkater *skater = local_skater();
    if (!skater || !skater->object) {
        return;
    }

    Obj_CCompositeObject *object = skater->object;
    Mth_Vector pos = object->pos;

    better4DebugAxes(&object->matrix, &pos, 36.0f, BETTER4_DRAW_ONE_FRAME);

    Mth_Vector velocity = vec(object->velocity.x, object->velocity.y, object->velocity.z);
    if (vec_length(velocity) > 1.0f) {
        Mth_Vector tip = vec_add(pos, vec_scale(velocity, 0.25f));
        better4DebugArrow(&pos, &tip, BETTER4_RGB(255, 255, 0), BETTER4_DRAW_ONE_FRAME);
    }

    Mth_Vector normal = vec(skater->current_normal.x, skater->current_normal.y,
                            skater->current_normal.z);
    if (vec_length(normal) > 0.1f) {
        Mth_Vector tip = vec_add(pos, vec_scale(vec_normalized(normal), 48.0f));
        better4DebugArrow(&pos, &tip, BETTER4_RGB(0, 255, 255), BETTER4_DRAW_ONE_FRAME);
    }

    better4DebugStar(&pos, 6.0f, BETTER4_RGB(255, 255, 255), BETTER4_DRAW_ONE_FRAME);
}

static Better4DebugFeature debug_features[] = {
    { "skater", "skater axes, velocity and contact normal", emit_skater, 0 },
};

int better4DebugFeatureCount(void) {
    return sizeof(debug_features) / sizeof(debug_features[0]);
}

Better4DebugFeature *better4DebugFeatureAt(int index) {
    if (index < 0 || index >= better4DebugFeatureCount()) {
        return 0;
    }
    return &debug_features[index];
}

Better4DebugFeature *better4DebugFeatureFind(const char *name) {
    for (int i = 0; i < better4DebugFeatureCount(); i++) {
        if (!_stricmp(debug_features[i].name, name)) {
            return &debug_features[i];
        }
    }
    return 0;
}

static const float identity_matrix[16] = {
    1.0f, 0.0f, 0.0f, 0.0f,
    0.0f, 1.0f, 0.0f, 0.0f,
    0.0f, 0.0f, 1.0f, 0.0f,
    0.0f, 0.0f, 0.0f, 1.0f,
};

static uint32_t to_d3d_color(uint32_t rgba) {
    return (rgba & 0xff00ff00u) | ((rgba & 0x00ff0000u) >> 16) | ((rgba & 0x000000ffu) << 16);
}

// Fills debug_verts from the live lines and ages them out.
static int build_verts(void) {
    int count = 0;

    for (int i = 0; i < DEBUG_LINE_MAX; i++) {
        DebugLine *line = &debug_lines[i];
        if (!line->in_use) {
            continue;
        }

        debug_verts[count].x = line->v0.x;
        debug_verts[count].y = line->v0.y;
        debug_verts[count].z = line->v0.z;
        debug_verts[count].color = to_d3d_color(line->rgb0);
        count++;

        debug_verts[count].x = line->v1.x;
        debug_verts[count].y = line->v1.y;
        debug_verts[count].z = line->v1.z;
        debug_verts[count].color = to_d3d_color(line->rgb1);
        count++;

        if (line->frames_left && --line->frames_left == 0) {
            line->in_use = 0;
        }
    }

    return count;
}

// Replaces Gfx::DebugGfx_Draw.
static void __cdecl better4DebugGfxDraw(void) {
    for (int i = 0; i < better4DebugFeatureCount(); i++) {
        if (debug_features[i].enabled) {
            debug_features[i].emit();
        }
    }

    int count = build_verts();

    void *device = THPS4_D3D_DEVICE;
    if (count == 0 || !device) {
        return;
    }

    uint32_t pixel_shader = 0;
    ((GetPixelShader_t)device_method(device, D3D_SLOT_GET_PIXEL_SHADER))(device, &pixel_shader);
    ((SetPixelShader_t)device_method(device, D3D_SLOT_SET_PIXEL_SHADER))(device, 0);

    NxXbox_set_texture(0, 0, 0);
    NxXbox_set_blend_mode(NXXBOX_BLEND_MODE_DIFFUSE, 0);
    NxXbox_set_vertex_shader(D3DFVF_XYZ_DIFFUSE);

    ((SetTransform_t)device_method(device, D3D_SLOT_SET_TRANSFORM))(device, D3DTS_WORLD,
                                                                   identity_matrix);

    ((DrawPrimitiveUP_t)device_method(device, D3D_SLOT_DRAW_PRIMITIVE_UP))(
        device, D3DPT_LINELIST, (uint32_t)(count / 2), debug_verts, sizeof(DebugVert));

    ((SetPixelShader_t)device_method(device, D3D_SLOT_SET_PIXEL_SHADER))(device, pixel_shader);
}

void patchDebugDraw(void) {
    patchJmp((void *)THPS4_DEBUG_GFX_DRAW, (void *)better4DebugGfxDraw);
    logInfo("debug draw: took over Gfx::DebugGfx_Draw at %#010x", THPS4_DEBUG_GFX_DRAW);
}
