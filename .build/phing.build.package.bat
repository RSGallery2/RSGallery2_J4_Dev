@ECHO off
REM starts the package build process

CLS

REM phing -f .\build.package.xml -logfile .\build.package.log -verbose -debug
REM phing -f .\build.package.xml -logfile .\build.package.log -verbose
REM phing -f .\build.package.xml -logfile .\build.package.log

ECHO phing -logfile .\build.package.log  -f .\build.package.xml %*
phing -logfile .\build.package.log  -f .\build.package.xml %*





