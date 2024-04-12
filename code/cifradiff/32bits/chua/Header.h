#include <math.h>

//typedef float data_t;
//void RK4_LBE();
const float h = ((float)1.0) * powf(10, -6);
const float C1 = (float)10.0 * powf(10, -9);
const float C2 = (float)100.0 * powf(10, -9);
const float L = (float)19.0 * powf(10, -3);
const float R = (float)1800.00;
const float m0 = (float)-0.37 * powf(10, -3);
const float m1 = (float)-0.68 * powf(10, -3);
const float Bp = (float)1.1;
const float eq1 = ((float)1.0 / ((float)10.0 * powf(10, -9)));
const float eq2 = ((float)1.0 / ((float)100.0 * powf(10, -9)));
const float eq3 = -((float)1.0 / ((float)19.0 * powf(10, -3)));
float yo = ((float)-0.2);
float zo = ((float)0.0);

