/* —LŠQ–Ûî•ñ‚ğ’Šo‚·‚é */

data ae;
  set local.C0101m01(keep=dsys_: AELOC AESEVN AESER AERELN AEOUTN AESDTH);
run;


proc freq data=ae noprint;
  tables AESEVN*AESDTH / out=SEVDEATH;
  format aesevn sevf.
         AESDTH $detf.;
run;
