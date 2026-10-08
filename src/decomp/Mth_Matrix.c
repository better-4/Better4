#include "decomp/common.h"
#include "decomp/Mth_Matrix.h"
#include "decomp/Mth_Vector.h"

#include <math.h>

void Mth_Matrix_Assign(Mth_Matrix *out, Mth_Matrix *this) {
    Mth_Vector_Assign(&out->x, &this->x);
    Mth_Vector_Assign(&out->y, &this->y);
    Mth_Vector_Assign(&out->z, &this->z);
    Mth_Vector_Assign(&out->w, &this->w);
}

void Mth_Matrix_Mult(Mth_Matrix *out, Mth_Matrix *this, Mth_Matrix *other) {
    Mth_Vector vec;
    vec.x = this->x.x * other->x.x + this->x.y * other->y.x + this->x.z * other->z.x + this->x.w * other->w.x;
    vec.y = this->x.x * other->x.y + this->x.y * other->y.y + this->x.z * other->z.y + this->x.w * other->w.y;
    vec.z = this->x.x * other->x.z + this->x.y * other->y.z + this->x.z * other->z.z + this->x.w * other->w.z;
    vec.w = this->x.x * other->x.w + this->x.y * other->y.w + this->x.z * other->z.w + this->x.w * other->w.w;
    Mth_Vector_Assign(&out->x, &vec);
    vec.x = this->y.x * other->x.x + this->y.y * other->y.x + this->y.z * other->z.x + this->y.w * other->w.x;
    vec.y = this->y.x * other->x.y + this->y.y * other->y.y + this->y.z * other->z.y + this->y.w * other->w.y;
    vec.z = this->y.x * other->x.z + this->y.y * other->y.z + this->y.z * other->z.z + this->y.w * other->w.z;
    vec.w = this->y.x * other->x.w + this->y.y * other->y.w + this->y.z * other->z.w + this->y.w * other->w.w;
    Mth_Vector_Assign(&out->y, &vec);
    vec.x = this->z.x * other->x.x + this->z.y * other->y.x + this->z.z * other->z.x + this->z.w * other->w.x;
    vec.y = this->z.x * other->x.y + this->z.y * other->y.y + this->z.z * other->z.y + this->z.w * other->w.y;
    vec.z = this->z.x * other->x.z + this->z.y * other->y.z + this->z.z * other->z.z + this->z.w * other->w.z;
    vec.w = this->z.x * other->x.w + this->z.y * other->y.w + this->z.z * other->z.w + this->z.w * other->w.w;
    Mth_Vector_Assign(&out->z, &vec);
    vec.x = this->w.x * other->x.x + this->w.y * other->y.x + this->w.z * other->z.x + this->w.w * other->w.x;
    vec.y = this->w.x * other->x.y + this->w.y * other->y.y + this->w.z * other->z.y + this->w.w * other->w.y;
    vec.z = this->w.x * other->x.z + this->w.y * other->y.z + this->w.z * other->z.z + this->w.w * other->w.z;
    vec.w = this->w.x * other->x.w + this->w.y * other->y.w + this->w.z * other->z.w + this->w.w * other->w.w;
    Mth_Vector_Assign(&out->w, &vec);
}

void Mth_Matrix_MultVec(Mth_Vector *out, Mth_Matrix *mat, Mth_Vector *vec) {
    out->x = vec->x * mat->x.x + vec->y * mat->y.x + vec->z * mat->z.x + vec->w * mat->w.x;
    out->y = vec->x * mat->x.y + vec->y * mat->y.y + vec->z * mat->z.y + vec->w * mat->w.y;
    out->z = vec->x * mat->x.z + vec->y * mat->y.z + vec->z * mat->z.z + vec->w * mat->w.z;
    out->w = vec->x * mat->x.w + vec->y * mat->y.w + vec->z * mat->z.w + vec->w * mat->w.w;
}

void Mth_CreateRotateXMatrix(Mth_Matrix *out, float angle) {
    float s = sinf(angle);
    float c = cosf(angle);

    out->x.x = 1.0;
    out->x.y = 0.0;
    out->x.z = 0.0;
    out->x.w = 0.0;

    out->y.x = 0.0;
    out->y.y = c;
    out->y.z = s;
    out->y.w = 0.0;

    out->z.x = 0.0;
    out->z.y = -s;
    out->z.z = c;
    out->z.w = 0.0;

    out->w.x = 0.0;
    out->w.y = 0.0;
    out->w.z = 0.0;
    out->w.w = 1.0;
}

void Mth_CreateRotateYMatrix(Mth_Matrix *out, float angle) {
    float s = sinf(angle);
    float c = cosf(angle);

    out->x.x = c;
    out->x.y = 0.0;
    out->x.z = -s;
    out->x.w = 0.0;

    out->y.x = 0.0;
    out->y.y = 1.0;
    out->y.z = 0.0;
    out->y.w = 0.0;

    out->z.x = s;
    out->z.y = 0.0;
    out->z.z = c;
    out->z.w = 0.0;

    out->w.x = 0.0;
    out->w.y = 0.0;
    out->w.z = 0.0;
    out->w.w = 1.0;
}

void Mth_CreateRotateZMatrix(Mth_Matrix *out, float angle) {
    float s = sinf(angle);
    float c = cosf(angle);

    out->x.x = c;
    out->x.y = s;
    out->x.z = 0.0;
    out->x.w = 0.0;

    out->y.x = -s;
    out->y.y = c;
    out->y.z = 0.0;
    out->y.w = 0.0;

    out->z.x = 0.0;
    out->z.y = 0.0;
    out->z.z = 1.0;
    out->z.w = 0.0;

    out->w.x = 0.0;
    out->w.y = 0.0;
    out->w.z = 0.0;
    out->w.w = 1.0;
}

void Mth_Matrix_RotateX(Mth_Matrix *out, Mth_Matrix *this, float angle) {
    Mth_Matrix rotation;
    Mth_CreateRotateXMatrix(&rotation, angle);
    Mth_Matrix_Mult(out, this, &rotation);
}

void Mth_Matrix_RotateY(Mth_Matrix *out, Mth_Matrix *this, float angle) {
    Mth_Matrix rotation;
    Mth_CreateRotateYMatrix(&rotation, angle);
    Mth_Matrix_Mult(out, this, &rotation);
}

void Mth_Matrix_RotateZ(Mth_Matrix *out, Mth_Matrix *this, float angle) {
    Mth_Matrix rotation;
    Mth_CreateRotateZMatrix(&rotation, angle);
    Mth_Matrix_Mult(out, this, &rotation);
}

void Mth_Matrix_CreateRotateMatrix(Mth_Matrix *out, Mth_Vector *axis, float angle) {
    Mth_Vector unit_axis;
    Mth_Vector_Assign(&unit_axis, axis);
    Mth_Vector_Normalize(&unit_axis);

    float omc = 1.0 - cosf(angle);

    Mth_Vector leading;
    leading.x = 1.0 - (unit_axis.x * unit_axis.x);
    leading.y = 1.0 - (unit_axis.y * unit_axis.y);
    leading.z = 1.0 - (unit_axis.z * unit_axis.z);
    Mth_Vector_Mult(&leading, &leading, omc);

    Mth_Vector crossed;
    crossed.x = unit_axis.y * unit_axis.z;
    crossed.y = unit_axis.z * unit_axis.x;
    crossed.z = unit_axis.x * unit_axis.y;
    Mth_Vector_Mult(&crossed, &crossed, omc);

    Mth_Vector_Mult(&unit_axis, &unit_axis, sinf(angle));

    out->x.x = 1.0 - leading.x;
    out->x.y = crossed.z + unit_axis.z;
    out->x.z = crossed.y - unit_axis.y;
    out->x.w = 0.0;

    out->y.x = crossed.z - unit_axis.z;
    out->y.y = 1.0 - leading.y;
    out->y.z = crossed.x + unit_axis.x;
    out->y.w = 0.0;

    out->z.x = crossed.y + unit_axis.y;
    out->z.y = crossed.x - unit_axis.x;
    out->z.z = 1.0 - leading.z;
    out->z.w = 0.0;

    out->w.x = 0.0;
    out->w.y = 0.0;
    out->w.z = 0.0;
    out->w.w = 1.0;
}
