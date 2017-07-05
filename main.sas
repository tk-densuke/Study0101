/* DEMANDのデータから有害事象情報を出力するプログラム */
%let rootdir=C:\Users\kawakami\Documents\SouceTree\Study0101;
libname local 'C:\Densuke\Users\電助\Demand6\Client\Printout';
filename tmplt "&rootdir.\template\template.xlsx" recfm=n;
filename rslt "&rootdir.\output\result.xlsx" recfm=n;



%include "&rootdir.\sub01.sas" /source2;
%MEntry2Work(V:\Demand6\Server
            ,0101
            ,C:\Temp
            ,clearcut
            ,pass01xx
            ,pass02zz);


%include "&rootdir.\sub03.sas" /source2;
    
