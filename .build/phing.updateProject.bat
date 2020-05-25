@ECHO off
REM Update actual project 

CLS

REM phing -verbose -debug -logfile .\updateProject.log .\updateProject.xml
REM phing -verbose -logfile .\updateProject.log .\updateProject.xml
REM phing -logfile .\updateProject.log .\updateProject.xml
ECHO phing -logfile .\updateProject.log -f .\updateProject.xml
phing -logfile .\updateProject.log -f .\updateProject.xml

ECHO ------------------------------------
REM TYPE .\updateProject.log
REM ECHO ------------------------------------
