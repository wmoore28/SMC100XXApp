/**
 *  statusDecoder.st
 *
 *  Support for Newport SMC100CC and SMC100PP.
 *  
 *  Parmeter List:
 *    P - the motor prefix.
 *
 *  Authors:
 *    Marie Keesee (1996)
 *    Al Grippo (2008)
 *    Wesley Moore (2010)
 */
program statusDecoder

option +r;

/* Inputs */
int status;
assign status to "{P}status.VAL";

string msg;
assign msg    to "{P}statusMsg";

int mvStat;
assign mvStat to "{P}movingStat";

ss statusDecoder
{
  state init {
    when() {
    } state decode
  }

  state decode {
    when(delay(1.0)) {
        pvGet(status);
        if (status == 0x0A) {
            strcpy(msg, "NOT REFERENCED from reset");
            mvStat = 0;
        } else if (status == 0x0B) {
            strcpy(msg, "NOT REFERENCED from HOMING");
            mvStat = 0;
        } else if (status == 0x0C) {
            strcpy(msg, "NOT REFERENCED from CONFIGURATION");
            mvStat = 0;
        } else if (status == 0x0D) {
            strcpy(msg, "NOT REFERENCED from DISABLE");
            mvStat = 0;
        } else if (status == 0x0E) {
            strcpy(msg, "NOT REFERENCED from READY");
            mvStat = 0;
        } else if (status == 0x0F) {
            strcpy(msg, "NOT REFERENCED from MOVING");
            mvStat = 0;
        } else if (status == 0x10) {
            strcpy(msg, "NOT REFERENCED ESP stage error");
            mvStat = 0;
        } else if (status == 0x11) {
            strcpy(msg, "NOT REFERENCED from JOGGING");
            mvStat = 0;
        } else if (status == 0x14) {
            strcpy(msg, "CONFIGURATION");
            mvStat = 0;
        } else if (status == 0x1E) {
            strcpy(msg, "HOMING commanded from RS-232-C");
            mvStat = 1;
        } else if (status == 0x1F) {
            strcpy(msg, "HOMING commanded by SMC-RC");
            mvStat = 1;
        } else if (status == 0x28) {
            strcpy(msg, "MOVING");
            mvStat = 1;
        } else if (status == 0x32) {
            strcpy(msg, "READY from HOMING");
            mvStat = 0;
        } else if (status == 0x33) {
            strcpy(msg, "READY from MOVING");
            mvStat = 0;
        } else if (status == 0x34) {
            strcpy(msg, "READY from DISABLE");
            mvStat = 0;
        } else if (status == 0x35) {
            strcpy(msg, "READY from JOGGING");
            mvStat = 0;
        } else if (status == 0x3C) {
            strcpy(msg, "DISABLE from READY");
            mvStat = 0;
        } else if (status == 0x3D) {
            strcpy(msg, "DISABLE from MOVING");
            mvStat = 0;
        } else if (status == 0x3E) {
            strcpy(msg, "DISABLE from JOGGING");
            mvStat = 0;
        } else if (status == 0x46) {
            strcpy(msg, "JOGGING from READY");
            mvStat = 0;
        } else if (status == 0x47) {
            strcpy(msg, "JOGGING from DISABLE");
            mvStat = 0;
        } else {
            strcpy(msg, "");
            mvStat = 0;
        }

        pvPut(msg);
        pvPut(mvStat);
    } state decode
  }
}

