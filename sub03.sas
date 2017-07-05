/* Excelに出力するプログラム */

data _null_;
  rc=fcopy('tmplt','rslt');
  put rc=;
run;
options noxwait noxsync;
x "&rootdir.\output\result.xlsx";
data _NULL_;
  rc = sleep(1);
run;

filename xlsout DDE "EXCEL|[result.xlsx]Sheet1!R4C2:R100C6" notab;
data _null_;
  set sevdeath;
  file xlsout; /*データ書き込み*/
  tab='09'x;
  put AESEVN tab AESDTH  tab COUNT tab PERCENT;
run;

filename xlsout clear;
