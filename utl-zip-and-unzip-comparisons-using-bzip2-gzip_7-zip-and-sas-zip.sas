zip and unzip comparisons using bzip2 gzip 7-zip and sas zip                                                              
                                                                                                                          
I really like 7-zip.                                                                                                      
                                                                                                                          
May not be exacly fair but I could not find switches for SAS, gzip or bzip2.                                              
I always use thwe ulta compression option with 7-zip (it is muti-threaded)                                                
                                                                                                                          
github                                                                                                                    
https://tinyurl.com/yxoh2psg                                                                                              
https://github.com/rogerjdeangelis/utl-zip-and-unzip-comparisons-using-bzip2-gzip_7-zip-and-sas-zip                       
                                                                                                                          
 Three methods                                                                                                            
                                                                                                                          
  ZIP                                        Seconds            Size(mb)                                                  
                                                                                                                          
    a. SAS zip engine                          51                  12mb                                                   
       Bartosz Jablonski                                                                                                  
       yabwon@gmail.com                                                                                                   
                                                                                                                          
    b. 7-zip zipping (ultra compression)       52                   2mb ** BEST                                           
                                                                                                                          
    c. R gzip zip                               8                  12mb                                                   
                                                                                                                          
    d. R bzip2 zip                            102                   4mb                                                   
                                                                                                                          
  UNZIP                                                                                                                   
                                                                                                                          
    e. SAS unzip                               20                                                                         
                                                                                                                          
    f  7-zip unzip                              1                                                                         
                                                                                                                          
    g. R gunzip (unzip)                         9                                                                         
                                                                                                                          
    h. R bunzip (unzip)                        16                                                                         
                                                                                                                          
Python has several zip modules?                                                                                           
                                                                                                                          
The command line does not come woth the 7-zip install.                                                                    
You only need to add 7za.exe to the location you installed 7-zip.                                                         
7za.exe is part of the '7-Zip Extra: standalone console version'                                                          
                                                                                                                          
Go to                                                                                                                     
https://www.7-zip.org/download.html                                                                                       
                                                                                                                          
dowload(extras)   7-Zip Extra: standalone console version, 7z DLL, Plugin for Far Manager                                 
                                                                                                                          
and just copy 7za.exe to                                                                                                  
                                                                                                                          
C:\Progra~1\7-Zip   (where i installed 7-zip(witout 7za.exe)                                                              
                                                                                                                          
                                                                                                                          
related (without 7-zip)                                                                                                   
                                                                                                                          
github                                                                                                                    
https://tinyurl.com/yycmtpks                                                                                              
https://github.com/rogerjdeangelis/utl-using-SAS-R-unix-commands-to-zip-and-unzip-files-on-windows-and-unix               
                                                                                                                          
related github                                                                                                            
https://github.com/rogerjdeangelis/utl-gzip-windows-and-unix                                                              
                                                                                                                          
related                                                                                                                   
SAS Forum gzip                                                                                                            
https://communities.sas.com/t5/New-SAS-User/Gzip-large-dataset/m-p/509812                                                 
                                                                                                                          
github SAS zip and unzip                                                                                                  
https://github.com/rogerjdeangelis/utl_using_sas_zip_and_unzip_engines                                                    
                                                                                                                          
macros                                                                                                                    
https://tinyurl.com/y9nfugth                                                                                              
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories                                
                                                                                                                          
                                                                                                                          
/*                   _                                                                                                    
(_)_ __  _ __  _   _| |_                                                                                                  
| | `_ \| `_ \| | | | __|                                                                                                 
| | | | | |_) | |_| | |_                                                                                                  
|_|_| |_| .__/ \__,_|\__|                                                                                                 
        |_|                                                                                                               
*/                                                                                                                        
                                                                                                                          
* 686mb;                                                                                                                  
options validvarname=upcase;                                                                                              
libname sd1 "d:/sd1";                                                                                                     
data sd1.have70mb;                                                                                                        
                                                                                                                          
  set sashelp.cars;                                                                                                       
                                                                                                                          
  do i=1 to 10000;                                                                                                        
     output;                                                                                                              
  end;                                                                                                                    
                                                                                                                          
run;quit;                                                                                                                 
                                                                                                                          
/*                                                                                                                        
 _ __  _ __ ___   ___ ___  ___ ___  ___  ___                                                                              
| `_ \| `__/ _ \ / __/ _ \/ __/ __|/ _ \/ __|                                                                             
| |_) | | | (_) | (_|  __/\__ \__ \  __/\__ \                                                                             
| .__/|_|  \___/ \___\___||___/___/\___||___/                                                                             
|_|                                                                                                                       
 ________ ____  ____                                                                                                      
|__  /_ _|  _ \/ ___|                                                                                                     
  / / | || |_) \___ \                                                                                                     
 / /_ | ||  __/ ___) |                                                                                                    
/____|___|_|   |____/                                                                                                     
                                                                                                                          
*/                                                                                                                        
                                                                                                                          
/*                             _                                                                                          
  __ _     ___  __ _ ___   ___(_)_ __                                                                                     
 / _` |   / __|/ _` / __| |_  / | `_ \                                                                                    
| (_| |_  \__ \ (_| \__ \  / /| | |_) |                                                                                   
 \__,_(_) |___/\__,_|___/ /___|_| .__/                                                                                    
                                |_|                                                                                       
*/                                                                                                                        
                                                                                                                          
%utlfkil(d:/zip/have70mb.zip);                                                                                            
                                                                                                                          
filename cmprss ZIP "d:/zip/have70mb.zip" member="have70mb.sas7bdat" lrecl = 1 recfm = f;                                 
filename in "d:/sd1/have70mb.sas7bdat" lrecl = 1 recfm = f;                                                               
                                                                                                                          
data _null_;                                                                                                              
  rc = fcopy("in", "cmprss");                                                                                             
  put rc = ;                                                                                                              
run;                                                                                                                      
                                                                                                                          
RC=0                                                                                                                      
NOTE: DATA statement used (Total process time):                                                                           
      real time           50.77 seconds                                                                                   
      user cpu time       50.25 seconds                                                                                   
                                                                                                                          
seconds 51                                                                                                                
size    11,844kb                                                                                                          
                                                                                                                          
/*        _____        _         _____                                                                                    
| |__    |___  |   ___(_)_ __   |___  |___                                                                                
| `_ \      / /___|_  / | `_ \     / /_  /                                                                                
| |_) |    / /_____/ /| | |_) |   / / / /                                                                                 
|_.__(_)  /_/     /___|_| .__/   /_/ /___|                                                                                
                        |_|                                                                                               
*/                                                                                                                        
                                                                                                                          
%let tym=%sysfunc(datetime());                                                                                            
                                                                                                                          
x "C:\Progra~1\7-Zip\7za a -mx9 -mmt -t7z d:/zip/have70mb.7z d:/sd1/have70mb.sas7bdat";                                   
                                                                                                                          
%put %sysevalf(%sysfunc(datetime()) - &tym);                                                                              
                                                                                                                          
seconds 52                                                                                                                
size    2,185kb                                                                                                           
                                                                                                                          
/*                         _                                                                                              
  ___     _ __    __ _ ___(_)_ __                                                                                         
 / __|   | `__|  / _` |_  / | `_ \                                                                                        
| (__ _  | |    | (_| |/ /| | |_) |                                                                                       
 \___(_) |_|     \__, /___|_| .__/                                                                                        
                 |___/      |_|                                                                                           
*/                                                                                                                        
                                                                                                                          
%utlfkil(d:/zip/have70mb.sas7bdat.gz);                                                                                    
                                                                                                                          
%let tym=%sysfunc(datetime());                                                                                            
%utl_submit_r64('                                                                                                         
  library(R.utils);                                                                                                       
  library(R.oo);                                                                                                          
  library(R.methodsS3);                                                                                                   
  gzip("d:/sd1/have70mb.sas7bdat",destname="d:/zip/have70mb.sas7bdat.gz",remove=FALSE);                                   
');                                                                                                                       
%put %sysevalf(%sysfunc(datetime()) - &tym);                                                                              
                                                                                                                          
seconds  8                                                                                                                
size     11.836                                                                                                           
                                                                                                                          
/*   _            _        _      ____                                                                                    
  __| |    _ __  | |__ ___(_)_ __|___ \                                                                                   
 / _` |   | `__| | `_ \_  / | `_ \ __) |                                                                                  
| (_| |_  | |    | |_) / /| | |_) / __/                                                                                   
 \__,_(_) |_|    |_.__/___|_| .__/_____|                                                                                  
                            |_|                                                                                           
*/                                                                                                                        
                                                                                                                          
%utlfkil(d:/zip/have70mb.sas7bdat.gz);                                                                                    
                                                                                                                          
%let tym=%sysfunc(datetime());                                                                                            
%utl_submit_r64('                                                                                                         
  library(R.utils);                                                                                                       
  library(R.oo);                                                                                                          
  library(R.methodsS3);                                                                                                   
  bzip2("d:/sd1/have70mb.sas7bdat",destname="d:/zip/have70mb.sas7bdat.gz",remove=FALSE);                                  
');                                                                                                                       
%put %sysevalf(%sysfunc(datetime()) - &tym);                                                                              
                                                                                                                          
102 seconds  4mb                                                                                                          
                                                                                                                          
                                                                                                                          
/*                                                                                                                        
 _   _ _   _ ________ ____  ____                                                                                          
| | | | \ | |__  /_ _|  _ \/ ___|                                                                                         
| | | |  \| | / / | || |_) \___ \                                                                                         
| |_| | |\  |/ /_ | ||  __/ ___) |                                                                                        
 \___/|_| \_/____|___|_|   |____/                                                                                         
                                          _                                                                               
  ___     ___  __ _ ___   _   _ _ __  ___(_)_ __                                                                          
 / _ \   / __|/ _` / __| | | | | `_ \|_  / | `_ \                                                                         
|  __/_  \__ \ (_| \__ \ | |_| | | | |/ /| | |_) |                                                                        
 \___(_) |___/\__,_|___/  \__,_|_| |_/___|_| .__/                                                                         
                                           |_|                                                                            
*/                                                                                                                        
                                                                                                                          
                                                                                                                          
%utlfkil(d:/sd1/have70mb.sas7bdat);                                                                                       
                                                                                                                          
filename cmprss ZIP "d:/zip/have70mb.zip" member="have70mb.sas7bdat" lrecl = 1 recfm = f;                                 
filename in "d:/sd1/have70mb.sas7bdat" lrecl = 1 recfm = f;                                                               
                                                                                                                          
data _null_;                                                                                                              
  rc = fcopy("cmprss","in");                                                                                              
  put rc = ;                                                                                                              
run;                                                                                                                      
                                                                                                                          
seconds 20                                                                                                                
                                                                                                                          
libname sd1 "d:/sd1";                                                                                                     
proc contents data=sd1.have70mb;                                                                                          
run;quit;                                                                                                                 
                                                                                                                          
Data Set Name        SD1.HAVE70MB                  Observations          4280000                                          
Member Type          DATA                          Variables             16                                               
Engine               V9                            Indexes               0                                                
Created              08/05/2020 18:15:55           Observation Length    160                                              
                                                                                                                          
/*__    _____    _                         _                                                                              
 / _|  |___  |__(_)_ __    _   _ _ __  ___(_)_ __                                                                         
| |_      / /_  / | `_ \  | | | | `_ \|_  / | `_ \                                                                        
|  _|    / / / /| | |_) | | |_| | | | |/ /| | |_) |                                                                       
|_|(_)  /_/ /___|_| .__/   \__,_|_| |_/___|_| .__/                                                                        
                  |_|                       |_|                                                                           
*/                                                                                                                        
                                                                                                                          
%utlfkil(d:/sd1/have70mb.sas7bdat);                                                                                       
                                                                                                                          
%let tym=%sysfunc(datetime());                                                                                            
                                                                                                                          
x "C:\Progra~1\7-Zip\7z e d:/zip/have70mb.7z -od:/sd1";                                                                   
                                                                                                                          
%put %sysevalf(%sysfunc(datetime()) - &tym);                                                                              
                                                                                                                          
libname sd1 "d:/sd1";                                                                                                     
proc contents data=sd1.have70mb;                                                                                          
run;quit;                                                                                                                 
                                                                                                                          
Data Set Name        SD1.HAVE70MB                  Observations          4280000                                          
Member Type          DATA                          Variables             16                                               
Engine               V9                            Indexes               0                                                
Created              08/05/2020 19:07:00           Observation Length    160                                              
                                                                                                                          
                                                                                                                          
seconds 1                                                                                                                 
                                                                                                                          
/*                                      _                                                                                 
  __ _     _ __    __ _ _   _ _ __  ___(_)_ __                                                                            
 / _` |   | `__|  / _` | | | | `_ \|_  / | `_ \                                                                           
| (_| |_  | |    | (_| | |_| | | | |/ /| | |_) |                                                                          
 \__, (_) |_|     \__, |\__,_|_| |_/___|_| .__/                                                                           
 |___/            |___/                  |_|                                                                              
*/                                                                                                                        
                                                                                                                          
%utlfkil(d:/sd1/have70mb.sas7bdat);                                                                                       
                                                                                                                          
%let tym=%sysfunc(datetime());                                                                                            
%utl_submit_r64('                                                                                                         
  library(R.utils);                                                                                                       
  library(R.oo);                                                                                                          
  library(R.methodsS3);                                                                                                   
  gunzip("d:/zip/have70mb.sas7bdat.gz",destname="d:/sd1/have70mb.sas7bdat",overwrite=TRUE,remove=FALSE);                  
');                                                                                                                       
%put %sysevalf(%sysfunc(datetime()) - &tym);                                                                              
                                                                                                                          
9 seconds                                                                                                                 
                                                                                                                          
/*         _                     _                                                                                        
| |__     | |__  _   _ _ __  ___(_)_ __                                                                                   
| `_ \    | `_ \| | | | `_ \|_  / | `_ \                                                                                  
| | | |_  | |_) | |_| | | | |/ /| | |_) |                                                                                 
|_| |_(_) |_.__/ \__,_|_| |_/___|_| .__/                                                                                  
                                  |_|                                                                                     
*/                                                                                                                        
                                                                                                                          
%utlfkil(d:/sd1/have70mb.sas7bdat);                                                                                       
                                                                                                                          
%let tym=%sysfunc(datetime());                                                                                            
%utl_submit_r64('                                                                                                         
  library(R.utils);                                                                                                       
  library(R.oo);                                                                                                          
  library(R.methodsS3);                                                                                                   
  bunzip2("d:/zip/have70mb.sas7bdat.gz",destname="d:/sd1/have70mb.sas7bdat",overwrite=TRUE,remove=FALSE);                 
');                                                                                                                       
%put %sysevalf(%sysfunc(datetime()) - &tym);                                                                              
                                                                                                                          
16 seconds                                                                                                                
                                                                                                                          
                                                                                                                          
                                                                                                                          
