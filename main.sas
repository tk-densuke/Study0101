/* DEMAND�̃f�[�^����L�Q���ۏ����o�͂���v���O���� */
%let rootdir=X:\SUGI\2017\SPITS\code;
libname local 'C:\Densuke\Users\�d��\Demand6\Client\Printout';
filename tmplt "&rootdir.\root\template\template.xlsx" recfm=n;
filename rslt "&rootdir.\root\output\result.xlsx" recfm=n;



%include "&rootdir.\root\sub01.sas";
%MEntry2Work(V:\Demand6\Server
            ,0101
            ,C:\Densuke\Users\�d��\Demand6\Client\Printout
            ,clearcut
            ,pass01xx
            ,pass02zz);


%include "&rootdir.\root\sub02.sas";
%include "&rootdir.\root\sub03.sas";
