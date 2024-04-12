

#include <stdio.h>
#include <conio.h>
#include <process.h>
#include "math.h"

#define h       1.0f * powf(10, -6)
#define C1      10.0f * powf(10, -9)
#define C2      100.0f * powf(10, -9)
#define L       19.0f * powf(10, -3)
#define R       1800.0f
#define m0     -0.37f * powf(10, -3)
#define m1     -0.68f * powf(10, -3)
#define Bp      1.1f
#define eq1     1.0f / (10.0f * powf(10, -9))
#define eq2     1.0f / (100.0f * powf(10, -9))
#define eq3    -1.0f / (19.0f * powf(10, -3))
#define yo     -0.2f
#define zo      0.0f

 float K1 = zo;
 float K2 = zo;
 float K3 = zo;
 float K4 = zo;
 float L1 = zo;
 float L2 = zo;
 float L3 = zo;
 float L4 = zo;
 float M1 = zo;
 float M2 = zo;
 float M3 = zo;
 float M4 = zo;

float xd     = zo;
float yd     = zo;
float zd     = zo;
float id     = zo;
float xeqabs = zo;
float xeq    = zo;

float x = zo;
float y = yo;
float z = zo;


float x2 = zo;
float y2 = yo;
float z2 = zo;
//int A[90000];

FILE* stream1;


void ccs(float x0,const int loop, const char namepath[])
{

fopen_s(&stream1, namepath, "w");
if (stream1 == 0) {
	printf("deuruimglr");
}
else { ; }

x = x0;

x2 =x0;

for (int i = 0; i < loop; i++) {

	xeqabs = fabsf((x - x2) / 2);
	xeq = logf(xeqabs);

	xeq = fabsf(xeq * powf(10, 5));

	fprintf(stream1, "%lld \n", ((long long int)xeq) % 256);



	K1 = zo;
	K2 = zo;
	K3 = zo;
	K4 = zo;
	L1 = zo;
	L2 = zo;
	L3 = zo;
	L4 = zo;
	M1 = zo;
	M2 = zo;
	M3 = zo;
	M4 = zo;
	xd = zo;
	yd = zo;
	zd = zo;



	if (x > Bp) {
		id = (m0 * x + Bp * (m1 - m0));
	}
	else if (x < -Bp) {
		id = (m0 * x + Bp * (m0 - m1));
	}
	else {
		id = (m1 * x);
	}


	K1 = eq1 * ((y - x) / R - id);
	L1 = eq2 * ((x - y) / R + z);
	M1 = eq3 * y;


	xd = x + h * 0.5f * K1;
	yd = y + h * 0.5f * L1;
	zd = z + 0.5f * h * M1;



	if (xd > Bp) {
		id = m0 * xd + Bp * (m1 - m0);
	}
	else if (xd < (-Bp)) {
		id = m0 * xd + Bp * (m0 - m1);
	}
	else {
		id = m1 * xd;
	}

	K2 = eq1 * ((yd - xd) / R - id);
	L2 = eq2 * ((xd - yd) / R + zd);
	M2 = eq3 * yd;


	xd = x + h * 0.5f * K2;
	yd = y + h * 0.5f * L2;
	zd = z + 0.5f * h * M2;

	if (xd > Bp) {
		id = m0 * xd + Bp * (m1 - m0);
	}
	else if (xd < (-Bp)) {
		id = m0 * xd + Bp * (m0 - m1);
	}
	else {
		id = m1 * xd;
	}
	K3 = eq1 * ((yd - xd) / R - id);
	L3 = eq2 * ((xd - yd) / R + zd);
	M3 = eq3 * yd;


	xd = x + h * K3;
	yd = y + h * L3;
	zd = z + h * M3;



	if (xd > Bp) {
		id = m0 * xd + Bp * (m1 - m0);
	}
	else if (xd < (-Bp)) {
		id = m0 * xd + Bp * (m0 - m1);
	}
	else {
		id = m1 * xd;
	}

	K4 = eq1 * ((yd - xd) / R - id);
	L4 = eq2 * ((xd - yd) / R + zd);
	M4 = eq3 * yd;





	x = x + h * 1.0f / 6.0f * (K1 + 2.0f * K2 + 2.0f * K3 + K4);
	y = y + h * 1.0f / 6.0f * (L1 + 2.0f * L2 + 2.0f * L3 + L4);
	z = z + h * 1.0f / 6.0f * (M1 + 2.0f * M2 + 2.0f * M3 + M4);


	K1 = zo;
	K2 = zo;
	K3 = zo;
	K4 = zo;
	L1 = zo;
	L2 = zo;
	L3 = zo;
	L4 = zo;
	M1 = zo;
	M2 = zo;
	M3 = zo;
	M4 = zo;
	xd = zo;
	yd = zo;
	zd = zo;


	if (x2 > Bp) {
		id = (m0 * x2 + Bp * (m1 - m0));
	}
	else if (x2 < -Bp) {
		id = (m0 * x2 + Bp * (m0 - m1));
	}
	else {
		id = (m1 * x2);
	}


	K1 = eq1 * (y2 / R - x2 / R - id);
	L1 = eq2 * ((x2 - y2) / R + z2);
	M1 = eq3 * y2;


	xd = x2 + h * 0.5f * K1;
	yd = y2 + h * 0.5f * L1;
	zd = z2 + 0.5f * h * M1;



	if (xd > Bp) {
		id = m0 * xd + Bp * (m1 - m0);
	}
	else if (xd < (-Bp)) {
		id = m0 * xd + Bp * (m0 - m1);
	}
	else {
		id = m1 * xd;
	}

	K2 = eq1 * (yd / R - xd / R - id);
	L2 = eq2 * ((xd - yd) / R + zd);
	M2 = eq3 * yd;

	xd = x2 + h * 0.5f * K2;
	yd = y2 + h * 0.5f * L2;
	zd = z2 + 0.5f * h * M2;

	if (xd > Bp) {
		id = m0 * xd + Bp * (m1 - m0);
	}
	else if (xd < (-Bp)) {
		id = m0 * xd + Bp * (m0 - m1);
	}
	else {
		id = m1 * xd;
	}
	K3 = eq1 * (yd / R - xd / R - id);
	L3 = eq2 * ((xd - yd) / R + zd);
	M3 = eq3 * yd;



	xd = x2 + h * K3;
	yd = y2 + h * L3;
	zd = z2 + h * M3;



	if (xd > Bp) {
		id = m0 * xd + Bp * (m1 - m0);
	}
	else if (xd < (-Bp)) {
		id = m0 * xd + Bp * (m0 - m1);
	}
	else {
		id = m1 * xd;
	}

	K4 = eq1 * (yd / R - xd / R - id);
	L4 = eq2 * ((xd - yd) / R + zd);
	M4 = eq3 * yd;





	x2 = x2 + h * 1.0f / 6.0f * (K1 + 2.0f * K2 + 2.0f * K3 + K4);
	y2 = y2 + h * 1.0f / 6.0f * (L1 + 2.0f * L2 + 2.0f * L3 + L4);
	z2 = z2 + h * 1.0f / 6.0f * (M1 + 2.0f * M2 + 2.0f * M3 + M4);
}
fclose(stream1);
y = yo;
z = zo;
y2 = yo;
z2 = zo;
}

int main(){

ccs(0.802296938300132822519117326010f,90536,"../../../../../mod/4.1.01.fsmod");
ccs(0.801303749084472660690892098501f,90536,"../../../../../mod/4.1.02.fsmod");
ccs(-0.805457883477211034062293038005f,90536,"../../../../../mod/4.1.03.fsmod");
ccs(0.804342848658561759833673932008f,90536,"../../../../../mod/4.1.04.fsmod");
ccs(-0.805393688082695069496708129009f,90536,"../../../../../mod/4.1.05.fsmod");
ccs(-0.805045871138572732839122636506f,90536,"../../../../../mod/4.1.06.fsmod");
ccs(-0.806869137287139936987045985006f,90536,"../../../../../mod/4.1.07.fsmod");
ccs(-0.806532230377197345561057773011f,90536,"../../../../../mod/4.1.08.fsmod");
ccs(0.804030898511409852780218443513f,287144,"../../../../../mod/4.2.01.fsmod");
ccs(-0.805063066929578852182203263510f,287144,"../../../../../mod/4.2.03.fsmod");
ccs(-0.806999176144599927873457545502f,287144,"../../../../../mod/4.2.05.fsmod");
ccs(0.804891989231109716840251167014f,287144,"../../../../../mod/4.2.06.fsmod");
ccs(0.804695954024791770820002057008f,287144,"../../../../../mod/4.2.07.fsmod");
ccs(0.804990625977516249811571924511f,90536,"../../../../../mod/5.1.09.fsmod");
ccs(-0.805488557219505407758219917014f,90536,"../../../../../mod/5.1.10.fsmod");
ccs(-0.807560696601867689103926295502f,90536,"../../../../../mod/5.1.11.fsmod");
ccs(-0.807264854311943058640110848501f,90536,"../../../../../mod/5.1.12.fsmod");
ccs(-0.808824803829193195170432773011f,90536,"../../../../../mod/5.1.13.fsmod");
ccs(0.804080856442451530341486432008f,90536,"../../../../../mod/5.1.14.fsmod");
ccs(0.804811609238386238551754559012f,287144,"../../../../../mod/5.2.08.fsmod");
ccs(-0.807053584158420656002874693513f,287144,"../../../../../mod/5.2.09.fsmod");
ccs(0.804445371329784442160359958507f,287144,"../../../../../mod/5.2.10.fsmod");
ccs(0.803476856537163275362445347128f,1073576,"../../../../../mod/5.3.01.fsmod");
ccs(0.803241974078118814439619654877f,1073576,"../../../../../mod/5.3.02.fsmod");
ccs(0.804184141308069255771329153504f,287144,"../../../../../mod/7.1.01.fsmod");
ccs(-0.806849021017551515377874693513f,287144,"../../../../../mod/7.1.02.fsmod");
ccs(-0.805171278417110447556126473501f,287144,"../../../../../mod/7.1.03.fsmod");
ccs(0.804535877257585574362508396007f,287144,"../../../../../mod/7.1.04.fsmod");
ccs(0.804155990630388339823753085511f,287144,"../../../../../mod/7.1.05.fsmod");
ccs(0.803534472882747707878081655508f,287144,"../../../../../mod/7.1.06.fsmod");
ccs(0.804228071421384860251180271007f,287144,"../../../../../mod/7.1.07.fsmod");
ccs(0.804968284815549939281709157513f,287144,"../../../../../mod/7.1.08.fsmod");
ccs(0.804906392246484747587942365499f,287144,"../../../../../mod/7.1.09.fsmod");
ccs(0.804659099429845814377415536001f,287144,"../../../../../mod/7.1.10.fsmod");
ccs(0.801270077936351299285888671875f,1073576,"../../../../../mod/7.2.01.fsmod");
ccs(-0.805313914418220533342207545502f,90536,"../../../../../mod/Boat.fsmod");
ccs(0.804637603759765673849813083507f,90536,"../../../../../mod/Cman.fsmod");
ccs(-0.805390023589134251835730538005f,90536,"../../../../../mod/House.fsmod");
ccs(0.803854550123214717238795401499f,90536,"../../../../../mod/Lena.fsmod");
ccs(0.804810326695442279643089023011f,90536,"../../../../../mod/Pepper.fsmod");
ccs(-0.805066717416048072131218305003f,287144,"../../../../../mod/boat.512.fsmod");
ccs(0.804962434470653631635173042014f,287144,"../../../../../mod/gray21.512.fsmod");
ccs(-0.808864848315715811999382367503f,287144,"../../../../../mod/ruler.512.fsmod");
 }