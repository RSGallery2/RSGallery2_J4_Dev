@ECHO off
REM starts the standard build process

CLS

REM phing -verbose -debug -logfile .\build.log
REM phing -verbose -logfile .\build.log 
REM phing -logfile .\build.log .\build.xml

phing -logfile .\build.plugins.log  -f .\plugins.xml





