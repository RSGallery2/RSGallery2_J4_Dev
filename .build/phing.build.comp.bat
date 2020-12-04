@ECHO off
REM starts the standard build process

CLS

REM phing -f .\build.comp.xml -logfile .\build.comp.log -verbose -debug
REM phing -f .\build.comp.xml -logfile .\build.comp.log -verbose
REM phing -f .\build.comp.xml -logfile .\build.comp.log


ECHO phing -logfile .\build.comp.log  -f .\build.comp.xml %1 %2 %3
phing -logfile .\build.comp.log  -f .\build.comp.xml %1 %2 %3




