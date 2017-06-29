/* ���O���� */


/* DEMAND�̃f�[�^���ꊇ�Ń��[�J���Ɏ����Ă���}�N�� */
%Macro MEntry2Work(S_DIR,dmndid,out_dir,read,write,alter);
  options compress=yes;

  libname DMND_DEF "&S_DIR.\Database\Study\&dmndid.\Definition" access=readonly;
  libname DMND_EN1 "&S_DIR.\Database\Study\&dmndid.\Entry1" access=readonly;
  libname _OUT "&out_dir.";
  data _null_;
    set DMND_DEF.C&DMNDID.CTL;
    call symput('DSID'||strip(put(_n_,best.)),DSID);
  run;
  data _null_;
    call symputx('CTLOBS',&sysnobs);
  run;
  
  %do i=1 %to &CTLOBS.;
    %if %sysfunc(exist(DMND_EN1.C&DMNDID.&&DSID&i.)) %then %do;
      proc sort data=DMND_EN1.C&DMNDID.&&DSID&i.(read=&read)
                out=work.C&DMNDID.&&DSID&i.;
        by dsys_caseid dsys_repno1 dsys_repno2;
      run;
      data _OUT.C&DMNDID.&&DSID&i.(write=&write alter=&alter);
        set work.C&DMNDID.&&DSID&i.;
        by dsys_caseid dsys_repno1 dsys_repno2;
      run;
    %end;
  %end;
%Mend;

/* �t�H�[�}�b�g */

proc format;
  value sevf
    1 = �y�x
    2 = �����x
    3 = �d�x
  ;
  value $detf
    '1' = ���S
    '2' = ����
    '3' = ���̑�
    '4' = �s��
;
run;
