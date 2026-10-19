#include "debug/draw.h"

#include "decomp/common.h"
#include "decomp/Mdl_Skate.h"
#include "decomp/Obj_CCompositeObject.h"
#include "decomp/Obj_CSkater.h"

#include "log.h"

#include "partymod-thps4/src/patch.h"

#include <math.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <windows.h>

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

typedef void(__cdecl *NxXbox_set_render_state_t)(uint32_t type, uint32_t state);
static NxXbox_set_render_state_t NxXbox_set_render_state = (NxXbox_set_render_state_t)0x004413c0;

#define NXXBOX_BLEND_MODE_DIFFUSE 0

#define NXXBOX_RS_Z_WRITE 1
#define NXXBOX_RS_Z_TEST 2

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

#define DEBUG_LINE_MAX 2048

typedef struct DebugLine {
    Mth_Vector v0;
    Mth_Vector v1;
    uint32_t rgb0;
    uint32_t rgb1;
    int in_use;
    int frames_left;
    int on_top;
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
static int draw_on_top;

void better4DebugDrawOnTop(int on_top) {
    draw_on_top = on_top;
}

void better4DebugLine(const Mth_Vector *v0, const Mth_Vector *v1,
                      uint32_t rgb0, uint32_t rgb1, int frames) {
    DebugLine *line = &debug_lines[next_line];

    line->v0 = *v0;
    line->v1 = *v1;
    line->rgb0 = rgb0;
    line->rgb1 = rgb1;
    line->in_use = 1;
    line->frames_left = frames;
    line->on_top = draw_on_top;

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

// ---------------------------------------------------------------------------
#define SKATE_RAIL_MANAGER 0x34

#define RAILMANAGER_NODES 0x00
#define RAILMANAGER_NODES_ALLOCATED 0x50
#define RAILMANAGER_NUM_NODES 0x54

#define RAILNODE_SIZE 0x3c
#define RAILNODE_POS 0x20
#define RAILNODE_NEXT_LINK 0x30
#define RAILNODE_PREV_LINK 0x34
#define RAILNODE_TERRAIN 0x3a
#define RAILNODE_FLAGS 0x3b

#define OBJECT_MODEL 0x608
#define MODEL_SKELETON 0x08

#define SKELETON_MATRICES 0x04
#define SKELETON_NUM_BONES 0x10
#define SKELETON_BONES 0x14

#define BONE_SIZE 0x6c
#define BONE_NAME 0x00
#define BONE_PARENT_MATRIX 0x04

typedef uint32_t(__fastcall *GetBonePosition_t)(void *object, unused_t, uint32_t bone,
                                                Mth_Vector *out);
static GetBonePosition_t Obj_GetBonePosition = (GetBonePosition_t)0x004a7ff0;

// Rails and skeletons can both outrun the line buffer, so only draw what is
// near the skater.
#define RAIL_DRAW_RADIUS 1800.0f
#define BONES_MAX 256

// Guards memory reached through an offset we inferred rather than watched the
// game use, so that a wrong guess draws nothing instead of killing the game.
// Per-element checks would mean thousands of VirtualQuery calls a frame, so
// each array is cleared once across its whole extent and walked bare after.
static int readable(const void *p, size_t size) {
    MEMORY_BASIC_INFORMATION info;

    if ((uintptr_t)p < 0x10000 || ((uintptr_t)p & 3) != 0 || size == 0) {
        return 0;
    }
    if (VirtualQuery(p, &info, sizeof(info)) != sizeof(info)) {
        return 0;
    }
    if (info.State != MEM_COMMIT || (info.Protect & (PAGE_NOACCESS | PAGE_GUARD))) {
        return 0;
    }

    return (uintptr_t)p + size <= (uintptr_t)info.BaseAddress + info.RegionSize;
}

static void *skate_rail_manager(void) {
    Mdl_Skate *skate = Mdl_Skate_Instance();
    if (!skate || !readable((char *)skate + SKATE_RAIL_MANAGER, sizeof(void *))) {
        return 0;
    }

    void *manager = *(void **)((char *)skate + SKATE_RAIL_MANAGER);
    return readable(manager, RAILMANAGER_NUM_NODES + sizeof(int)) ? manager : 0;
}

static Mth_Vector rail_node_pos(const char *node) {
    const float *pos = (const float *)(node + RAILNODE_POS);
    return vec(pos[0], pos[1], pos[2]);
}

// The level's rail graph.
static void emit_rails(void) {
    char *manager = (char *)skate_rail_manager();
    if (!manager) {
        return;
    }

    char *nodes = *(char **)(manager + RAILMANAGER_NODES);
    int count = *(int *)(manager + RAILMANAGER_NUM_NODES);
    int allocated = *(int *)(manager + RAILMANAGER_NODES_ALLOCATED);

    if (!nodes || count <= 0 || allocated <= 0 || count > allocated) {
        return;
    }
    if (!readable(nodes, (size_t)count * RAILNODE_SIZE)) {
        return;
    }

    const char *nodes_end = nodes + (size_t)count * RAILNODE_SIZE;

    Mth_Vector eye;
    int have_eye = better4DebugSkaterPos(&eye);

    for (int i = 0; i < count; i++) {
        const char *node = nodes + i * RAILNODE_SIZE;
        Mth_Vector from = rail_node_pos(node);

        if (have_eye && vec_length(vec_sub(from, eye)) > RAIL_DRAW_RADIUS) {
            continue;
        }

        const char *next = *(const char **)(node + RAILNODE_NEXT_LINK);
        if (next && next >= nodes && next < nodes_end &&
            (next - nodes) % RAILNODE_SIZE == 0) {
            Mth_Vector to = rail_node_pos(next);
            better4DebugLine(&from, &to, BETTER4_RGB(64, 128, 255), BETTER4_RGB(64, 128, 255),
                             BETTER4_DRAW_ONE_FRAME);
        } else {
            // Nothing leads on from here, so this is where a rail runs out.
            better4DebugStar(&from, 10.0f, BETTER4_RGB(255, 64, 64), BETTER4_DRAW_ONE_FRAME);
        }

        if (!*(const char **)(node + RAILNODE_PREV_LINK)) {
            better4DebugStar(&from, 10.0f, BETTER4_RGB(64, 255, 64), BETTER4_DRAW_ONE_FRAME);
        }
    }
}

static char *skeleton_of(char *object) {
    if (!object || !readable(object + OBJECT_MODEL, sizeof(void *))) {
        return 0;
    }

    char *model = *(char **)(object + OBJECT_MODEL);
    if (!readable(model + MODEL_SKELETON, sizeof(void *))) {
        return 0;
    }

    char *skeleton = *(char **)(model + MODEL_SKELETON);
    if (!readable(skeleton, SKELETON_BONES + sizeof(void *))) {
        return 0;
    }

    int num_bones = *(int *)(skeleton + SKELETON_NUM_BONES);
    if (num_bones <= 0 || num_bones > BONES_MAX) {
        return 0;
    }
    if (!readable(*(char **)(skeleton + SKELETON_BONES), (size_t)num_bones * BONE_SIZE) ||
        !readable(*(char **)(skeleton + SKELETON_MATRICES),
                  (size_t)num_bones * sizeof(Mth_Matrix))) {
        return 0;
    }

    return skeleton;
}

static char *bones_object(Obj_CSkater *skater, char **skeleton_out) {
    char *candidates[2] = { (char *)skater, (char *)skater->object };
    static int reported;

    for (int i = 0; i < 2; i++) {
        char *skeleton = skeleton_of(candidates[i]);
        if (skeleton) {
            if (!reported) {
                reported = 1;
                logInfo("debug bones: skeleton via %s (object %p, skeleton %p)",
                        i == 0 ? "the skater itself" : "skater->object", candidates[i], skeleton);
            }
            *skeleton_out = skeleton;
            return candidates[i];
        }
    }

    if (!reported) {
        reported = 1;
        logWarning("debug bones: no skeleton off the skater (%p) or its object (%p)",
                   candidates[0], candidates[1]);
    }
    return 0;
}

// The skater's skeleton, a line from each bone to its parent. Positions come
// from the game's own GetBonePosition, so the bones land wherever the model
// actually is without this having to redo the object transform.
static void emit_bones(void) {
    Obj_CSkater *skater = local_skater();
    if (!skater) {
        return;
    }

    char *skeleton = 0;
    char *object = bones_object(skater, &skeleton);
    if (!object) {
        return;
    }

    better4DebugDrawOnTop(1);

    int num_bones = *(int *)(skeleton + SKELETON_NUM_BONES);
    const char *matrices = *(const char **)(skeleton + SKELETON_MATRICES);
    const char *bones = *(const char **)(skeleton + SKELETON_BONES);

    Mth_Vector world[BONES_MAX];
    int parent[BONES_MAX];

    for (int i = 0; i < num_bones; i++) {
        const char *bone = bones + i * BONE_SIZE;

        Mth_Vector pos = { 0.0f, 0.0f, 0.0f, 1.0f };
        Obj_GetBonePosition(object, UNUSED, *(const uint32_t *)(bone + BONE_NAME), &pos);
        world[i] = pos;

        parent[i] = -1;
        const char *parent_matrix = *(const char **)(bone + BONE_PARENT_MATRIX);
        if (parent_matrix >= matrices) {
            ptrdiff_t offset = parent_matrix - matrices;
            if (offset % (ptrdiff_t)sizeof(Mth_Matrix) == 0) {
                ptrdiff_t index = offset / (ptrdiff_t)sizeof(Mth_Matrix);
                if (index >= 0 && index < num_bones && index != i) {
                    parent[i] = (int)index;
                }
            }
        }
    }

    for (int i = 0; i < num_bones; i++) {
        if (parent[i] >= 0) {
            better4DebugLine(&world[parent[i]], &world[i], BETTER4_RGB(128, 128, 255),
                             BETTER4_RGB(255, 128, 128), BETTER4_DRAW_ONE_FRAME);
        } else {
            better4DebugStar(&world[i], 2.0f, BETTER4_RGB(255, 255, 0), BETTER4_DRAW_ONE_FRAME);
        }
    }
}

static Better4DebugFeature debug_features[] = {
    { "skater", "skater axes, velocity and contact normal", emit_skater, 0 },
    { "rails", "the level's rail graph, with the ends of each rail marked", emit_rails, 0 },
    { "bones", "the skater's skeleton", emit_bones, 0 },
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

// Fills debug_verts with the live lines whose depth handling matches `on_top`.
// Returns the vertex count, which is always even.
static int build_verts(int on_top) {
    int count = 0;

    for (int i = 0; i < DEBUG_LINE_MAX; i++) {
        DebugLine *line = &debug_lines[i];
        if (!line->in_use || line->on_top != on_top) {
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
    }

    return count;
}

static void age_lines(void) {
    for (int i = 0; i < DEBUG_LINE_MAX; i++) {
        DebugLine *line = &debug_lines[i];
        if (line->in_use && line->frames_left && --line->frames_left == 0) {
            line->in_use = 0;
        }
    }
}

// Replaces Gfx::DebugGfx_Draw.
static void __cdecl better4DebugGfxDraw(void) {
    for (int i = 0; i < better4DebugFeatureCount(); i++) {
        if (debug_features[i].enabled) {
            draw_on_top = 0;
            debug_features[i].emit();
        }
    }
    draw_on_top = 0;

    void *device = THPS4_D3D_DEVICE;
    if (!device) {
        age_lines();
        return;
    }

    // Depth-tested lines first, then the ones that ignore depth. Both passes
    // share the one vertex buffer, so each has to be drawn before the next is
    // built.
    uint32_t pixel_shader = 0;
    int set_up = 0;

    for (int on_top = 0; on_top < 2; on_top++) {
        int count = build_verts(on_top);
        if (count == 0) {
            continue;
        }

        if (!set_up) {
            set_up = 1;

            ((GetPixelShader_t)device_method(device, D3D_SLOT_GET_PIXEL_SHADER))(device,
                                                                                &pixel_shader);
            ((SetPixelShader_t)device_method(device, D3D_SLOT_SET_PIXEL_SHADER))(device, 0);

            NxXbox_set_texture(0, 0, 0);
            NxXbox_set_blend_mode(NXXBOX_BLEND_MODE_DIFFUSE, 0);
            NxXbox_set_vertex_shader(D3DFVF_XYZ_DIFFUSE);

            NxXbox_set_render_state(NXXBOX_RS_Z_WRITE, 0);

            ((SetTransform_t)device_method(device, D3D_SLOT_SET_TRANSFORM))(device, D3DTS_WORLD,
                                                                           identity_matrix);
        }

        NxXbox_set_render_state(NXXBOX_RS_Z_TEST, on_top ? 0 : 1);

        ((DrawPrimitiveUP_t)device_method(device, D3D_SLOT_DRAW_PRIMITIVE_UP))(
            device, D3DPT_LINELIST, (uint32_t)(count / 2), debug_verts, sizeof(DebugVert));
    }

    if (set_up) {
        // Hand the depth states back the way the world pass had them.
        NxXbox_set_render_state(NXXBOX_RS_Z_TEST, 1);
        NxXbox_set_render_state(NXXBOX_RS_Z_WRITE, 1);
        ((SetPixelShader_t)device_method(device, D3D_SLOT_SET_PIXEL_SHADER))(device, pixel_shader);
    }

    age_lines();
}

void patchDebugDraw(void) {
    patchJmp((void *)THPS4_DEBUG_GFX_DRAW, (void *)better4DebugGfxDraw);
    logInfo("debug draw: took over Gfx::DebugGfx_Draw at %#010x", THPS4_DEBUG_GFX_DRAW);
}
