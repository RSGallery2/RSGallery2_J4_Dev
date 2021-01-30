@ECHO off
REM starts the single module build process

CLS

Set CmdArgs=
ECHO ....

REM setlocal ENABLEDELAYEDEXPANSION
REM   set "_args=%*"
REM   set "_args=!_args:*%1 =!"
REM
REM   echo/%_args%
REM endlocal

SET ModuleName=mod_rsg2_images
if NOT %1A==A (
	SET ModuleName=%1
)
ECHO ModuleName=%ModuleName%

SHIFT

REM phing -f .\build.module.xml -logfile .\build.module.log -verbose -debug

REM Module name
Call :AddNextArg -Dmodule_name=%ModuleName%

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
ECHO phing -logfile .\build.module.log -f .\build.module.xml %CmdArgs% %*
     phing -logfile .\build.module.log -f .\build.module.xml %CmdArgs% %*

GOTO :EOF

REM -------------------------------------------------------------
REM -------------------------------------------------------------
REM Adds given argument to the already known command arguments
:AddNextArg
	Set NextArg=%*
	Set CmdArgs=%CmdArgs% %NextArg%
	ECHO  '%NextArg%'
GOTO :EOF

