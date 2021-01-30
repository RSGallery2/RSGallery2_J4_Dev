@ECHO off
REM starts the standard build process

CLS

Set CmdArgs=
ECHO ....

REM phing -f .\build.comp.xml -logfile .\build.comp.log -verbose -debug

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
ECHO phing -logfile .\build.comp.log  -f .\build.comp.xml  %CmdArgs% %*
     phing -logfile .\build.comp.log  -f .\build.comp.xml  %CmdArgs% %*

GOTO :EOF

REM -------------------------------------------------------------
REM -------------------------------------------------------------
REM Adds given argument to the already known command arguments
:AddNextArg
	Set NextArg=%*
	Set CmdArgs=%CmdArgs% %NextArg%
	ECHO  '%NextArg%'
GOTO :EOF

