#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#ifdef USE_FLOAT
    #define REAL float
    #define POW powf
    #define FABS fabsf
    #define LOG logf
    #define REAL_CONST(x) (x ## f)
    #define FILE_EXT ".fsmod"
#else
    #define REAL double
    #define POW pow
    #define FABS fabs
    #define LOG log
    #define REAL_CONST(x) (x)
    #define FILE_EXT ".fdmod"
#endif

#define Sh       REAL_CONST(1.0) * POW(REAL_CONST(10.0), REAL_CONST(-6.0))
#define SC1      REAL_CONST(10.0) * POW(REAL_CONST(10.0), REAL_CONST(-9.0))
#define SC2      REAL_CONST(100.0) * POW(REAL_CONST(10.0), REAL_CONST(-9.0))
#define SL       REAL_CONST(19.0) * POW(REAL_CONST(10.0), REAL_CONST(-3.0))
#define SR       REAL_CONST(1800.0)
#define Sm0      REAL_CONST(-0.37) * POW(REAL_CONST(10.0), REAL_CONST(-3.0))
#define Sm1      REAL_CONST(-0.68) * POW(REAL_CONST(10.0), REAL_CONST(-3.0))
#define SBp      REAL_CONST(1.1)
#define Seq1     REAL_CONST(1.0) / (REAL_CONST(10.0) * POW(REAL_CONST(10.0), REAL_CONST(-9.0)))
#define Seq2     REAL_CONST(1.0) / (REAL_CONST(100.0) * POW(REAL_CONST(10.0), REAL_CONST(-9.0)))
#define Seq3     REAL_CONST(-1.0) / (REAL_CONST(19.0) * POW(REAL_CONST(10.0), REAL_CONST(-3.0)))
#define Syo      REAL_CONST(-0.2)
#define Szo      REAL_CONST(0.0)
#define cinco    REAL_CONST(0.5)
#define um       REAL_CONST(1.0)
#define dois     REAL_CONST(2.0)
#define seis     REAL_CONST(6.0)

FILE* stream1;

FILE* openFileStream(const char* baseName) {
    char filename[256];
    snprintf(filename, sizeof(filename), "%s%s", baseName, FILE_EXT);
    return fopen(filename, "w");
}

void DCC(REAL x0, int loop, const char* namepath) {
    stream1 = openFileStream(namepath);

if (stream1 == 0) {

	printf("deuruimglr");

}

    REAL K1 = Szo;
    REAL K2 = Szo;
    REAL K3 = Szo;
    REAL K4 = Szo;
    REAL L1 = Szo;
    REAL L2 = Szo;
    REAL L3 = Szo;
    REAL L4 = Szo;
    REAL M1 = Szo;
    REAL M2 = Szo;
    REAL M3 = Szo;
    REAL M4 = Szo;
    REAL xd = Szo;
    REAL yd = Syo;
    REAL zd = Szo;
    REAL id = Szo;
    REAL xeqabs = Szo;
    REAL xeq = Szo;

    REAL x = x0;
    REAL y = Syo;
    REAL z = Szo;

    REAL x2 = x0;
    REAL y2 = Syo;
    REAL z2 = Szo;

    // Create an array to store the values of xeq.

    // For demonstration purposes, the rest of your complex simulation logic is omitted.
    // This includes the writing of data to stream1.
    for (int i = 0; i < loop; i++) {
       // A32[i] =FABS(POW(REAL_CONST(10.0),REAL_CONST(5.0)) * LOG(FABS((x - x2) / REAL_CONST(2.0) ))) ; // Use LOG2 macro
        //printf("%.32f - %.32f ------- %f\n ",x,x2, LOG2(FABS((x - x2) / 2)));//,LOG2(FABS((x - x2) / 2)));
        fprintf(stream1, "%lld \n", ((long long int)FABS(POW(REAL_CONST(10.0),REAL_CONST(5.0)) * LOG(FABS((x - x2) / REAL_CONST(2.0) )))) % 256);


	//xeq = fabsf(xeq * powf(10, 5));

	K1 = Szo;
	K2 = Szo;
	K3 = Szo;
	K4 = Szo;
	L1 = Szo;
	L2 = Szo;
	L3 = Szo;
	L4 = Szo;
	M1 = Szo;
	M2 = Szo;
	M3 = Szo;
	M4 = Szo;

	xd = Szo;
	xd = Szo;
	zd = Szo;


	if (x > SBp) {

		id = (Sm0 * x + SBp * (Sm1 - Sm0));
	}

	else if (x < -SBp) {

		id = (Sm0 * x + SBp * (Sm0 - Sm1));
	}

	else {

		id = (Sm1 * x);
	}


	K1 = Seq1 * ((y - x) / SR - id);
	L1 = Seq2 * ((x - y) / SR + z);
	M1 = Seq3 * y;

	xd = x + Sh * cinco * K1;
	yd = y + Sh * cinco * L1;
	zd = z + cinco * Sh * M1;


	if (xd > SBp) {

		id = Sm0 * xd + SBp * (Sm1 - Sm0);
	}

	else if (xd < (-SBp)) {

		id = Sm0 * xd + SBp * (Sm0 - Sm1);
	}

	else {

		id = Sm1 * xd;
	}

	K2 = Seq1 * ((yd - xd) / SR - id);
	L2 = Seq2 * ((xd - yd) / SR + zd);
	M2 = Seq3 * yd;

	xd = x + Sh * cinco * K2;
	yd = y + Sh * cinco * L2;
	zd = z + cinco * Sh * M2;



	if (xd > SBp) {

		id = Sm0 * xd + SBp * (Sm1 - Sm0);
	}

	else if (xd < (-SBp)) {

		id = Sm0 * xd + SBp * (Sm0 - Sm1);
	}

	else {

		id = Sm1 * xd;
	}

	K3 = Seq1 * ((yd - xd) / SR - id);
	L3 = Seq2 * ((xd - yd) / SR + zd);
	M3 = Seq3 * yd;

	xd = x + Sh * K3;
	yd = y + Sh * L3;
	zd = z + Sh * M3;

	if (xd > SBp) {
		id = Sm0 * xd + SBp * (Sm1 - Sm0);
	}

	else if (xd < (-SBp)) {
		id = Sm0 * xd + SBp * (Sm0 - Sm1);
	}

	else {
		id = Sm1 * xd;
	}

	K4 = Seq1 * ((yd - xd) / SR - id);
	L4 = Seq2 * ((xd - yd) / SR + zd);
	M4 = Seq3 * yd;

	x = x + Sh * um / seis * (K1 + dois * K2 + dois * K3 + K4);
	y = y + Sh * um / seis * (L1 + dois * L2 + dois * L3 + L4);
	z = z + Sh * um / seis * (M1 + dois * M2 + dois * M3 + M4);

	K1 = Szo;
	K2 = Szo;
	K3 = Szo;
	K4 = Szo;
	L1 = Szo;
	L2 = Szo;
	L3 = Szo;
	L4 = Szo;
	M1 = Szo;
	M2 = Szo;
	M3 = Szo;
	M4 = Szo;
	xd = Szo;
	yd = Szo;
	zd = Szo;

	if (x2 > SBp) {
		id = (Sm0 * x2 + SBp * (Sm1 - Sm0));
	}

	else if (x2 < -SBp) {
		id = (Sm0 * x2 + SBp * (Sm0 - Sm1));

	}

	else {

		id = (Sm1 * x2);
	}

	K1 = Seq1 * (y2 / SR - x2 / SR - id);
	L1 = Seq2 * ((x2 - y2) / SR + z2);
	M1 = Seq3 * y2;

	xd = x2 + Sh * cinco * K1;
	yd = y2 + Sh * cinco * L1;
	zd = z2 + cinco * Sh * M1;


	if (xd > SBp) {
		id = Sm0 * xd + SBp * (Sm1 - Sm0);
	}

	else if (xd < (-SBp)) {
		id = Sm0 * xd + SBp * (Sm0 - Sm1);
	}

	else {
		id = Sm1 * xd;
	}


	K2 = Seq1 * (yd / SR - xd / SR - id);
	L2 = Seq2 * ((xd - yd) / SR + zd);
	M2 = Seq3 * yd;

	xd = x2 + Sh * cinco * K2;
	yd = y2 + Sh * cinco * L2;
	zd = z2 + cinco * Sh * M2;

	if (xd > SBp) {
		id = Sm0 * xd + SBp * (Sm1 - Sm0);
	}
	else if (xd < (-SBp)) {
		id = Sm0 * xd + SBp * (Sm0 - Sm1);
	}
	else {
		id = Sm1 * xd;
	}

	K3 = Seq1 * (yd / SR - xd / SR - id);
	L3 = Seq2 * ((xd - yd) / SR + zd);
	M3 = Seq3 * yd;

	xd = x2 + Sh * K3;
	yd = y2 + Sh * L3;
	zd = z2 + Sh * M3;



	if (xd > SBp) {
		id = Sm0 * xd + SBp * (Sm1 - Sm0);
	}
	else if (xd < (-SBp)) {
		id = Sm0 * xd + SBp * (Sm0 - Sm1);
	}
	else {
		id = Sm1 * xd;
	}

	K4 = Seq1 * (yd / SR - xd / SR - id);
	L4 = Seq2 * ((xd - yd) / SR + zd);
	M4 = Seq3 * yd;


	x2 = x2 + Sh * um / seis * (K1 + dois * K2 + dois * K3 + K4);
	y2 = y2 + Sh * um / seis * (L1 + dois * L2 + dois * L3 + L4);
	z2 = z2 + Sh * um / seis * (M1 + dois * M2 + dois * M3 + M4);
}
    fclose(stream1);
}

int main() {
DCC(0.802296938300132822519117326010f,90536,"mod/4.1.01");
DCC(0.801303749084472660690892098501f,90536,"mod/4.1.02");
DCC(-0.805457883477211034062293038005f,90536,"mod/4.1.03");
DCC(0.804342848658561759833673932008f,90536,"mod/4.1.04");
DCC(-0.805393688082695069496708129009f,90536,"mod/4.1.05");
DCC(-0.805045871138572732839122636506f,90536,"mod/4.1.06");
DCC(-0.806869137287139936987045985006f,90536,"mod/4.1.07");
DCC(-0.806532230377197345561057773011f,90536,"mod/4.1.08");
DCC(0.804030898511409852780218443513f,287144,"mod/4.2.01");
DCC(-0.805063066929578852182203263510f,287144,"mod/4.2.03");
DCC(-0.806999176144599927873457545502f,287144,"mod/4.2.05");
DCC(0.804891989231109716840251167014f,287144,"mod/4.2.06");
DCC(0.804695954024791770820002057008f,287144,"mod/4.2.07");
DCC(0.804990625977516249811571924511f,90536,"mod/5.1.09");
DCC(-0.805488557219505407758219917014f,90536,"mod/5.1.10");
DCC(-0.807560696601867689103926295502f,90536,"mod/5.1.11");
DCC(-0.807264854311943058640110848501f,90536,"mod/5.1.12");
DCC(-0.808824803829193195170432773011f,90536,"mod/5.1.13");
DCC(0.804080856442451530341486432008f,90536,"mod/5.1.14");
DCC(0.804811609238386238551754559012f,287144,"mod/5.2.08");
DCC(-0.807053584158420656002874693513f,287144,"mod/5.2.09");
DCC(0.804445371329784442160359958507f,287144,"mod/5.2.10");
DCC(0.803476856537163275362445347128f,1073576,"mod/5.3.01");
DCC(0.803241974078118814439619654877f,1073576,"mod/5.3.02");
DCC(0.804184141308069255771329153504f,287144,"mod/7.1.01");
DCC(-0.806849021017551515377874693513f,287144,"mod/7.1.02");
DCC(-0.805171278417110447556126473501f,287144,"mod/7.1.03");
DCC(0.804535877257585574362508396007f,287144,"mod/7.1.04");
DCC(0.804155990630388339823753085511f,287144,"mod/7.1.05");
DCC(0.803534472882747707878081655508f,287144,"mod/7.1.06");
DCC(0.804228071421384860251180271007f,287144,"mod/7.1.07");
DCC(0.804968284815549939281709157513f,287144,"mod/7.1.08");
DCC(0.804906392246484747587942365499f,287144,"mod/7.1.09");
DCC(0.804659099429845814377415536001f,287144,"mod/7.1.10");
DCC(0.801270077936351299285888671875f,1073576,"mod/7.2.01");
DCC(-0.805313914418220533342207545502f,90536,"mod/Boat");
DCC(0.804637603759765673849813083507f,90536,"mod/Cman");
DCC(-0.805390023589134251835730538005f,90536,"mod/House");
DCC(0.803854550123214717238795401499f,90536,"mod/Lena");
DCC(0.804810326695442279643089023011f,90536,"mod/Pepper");
DCC(-0.805066717416048072131218305003f,287144,"mod/boat.512");
DCC(0.804962434470653631635173042014f,287144,"mod/gray21.512");
DCC(-0.808864848315715811999382367503f,287144,"mod/ruler.512");
return 0;
}