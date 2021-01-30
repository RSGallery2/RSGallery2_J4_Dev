@ECHO off
REM starts the standard build process

CLS

REM phing -f .\build.plugins.xml -logfile .\build.plugins.log -verbose -debug
REM phing -f .\build.plugins.xml -logfile .\build.plugins.log -verbose
REM phing -f .\build.plugins.xml -logfile .\build.plugins.log

ECHO phing -logfile .\build.plugins.log  -f .\plugins.xml
phing -logfile .\build.plugins.log  -f .\plugins.xml -DisUpdateManifest=1





