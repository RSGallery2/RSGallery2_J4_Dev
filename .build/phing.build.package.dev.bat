@ECHO off
REM starts the package build process

CLS

Set CmdArgs=
ECHO ....

REM phing -f .\build.package.xml -logfile .\build.package.log -verbose -debug

REM do increase manifest version number
Call :AddNextArg -DisUpdateManifest=1

REM do show reminder of "update changelog"  and minor/major version numbers
Call :AddNextArg -DisShowReminder=1

REM
REM Call :AddNextArg ???


ECHO.
ECHO ------------------------------------------------------------------------------
ECHO Start cmd:
ECHO.
ECHO phing -logfile .\build.package.log  -f .\build.package.xml %CmdArgs% %*
     phing -logfile .\build.package.log  -f .\build.package.xml %CmdArgs% %*

GOTO :EOF

REM -------------------------------------------------------------
REM -------------------------------------------------------------
REM Adds given argument to the already known command arguments
:AddNextArg
	Set NextArg=%*
	Set CmdArgs=%CmdArgs% %NextArg%
	ECHO  '%NextArg%'
GOTO :EOF





