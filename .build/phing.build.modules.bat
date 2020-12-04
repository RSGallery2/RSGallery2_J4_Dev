@ECHO off
REM starts the standard build process

CLS

REM phing -f .\build.modules.xml -logfile .\build.modules.log -verbose -debug
REM phing -f .\build.modules.xml -logfile .\build.modules.log -verbose
REM phing -f .\build.modules.xml -logfile .\build.modules.log

ECHO phing -logfile .\build.modules.log  -f .\build.modules.xml
phing -logfile .\build.modules.log  -f .\build.modules.xml





