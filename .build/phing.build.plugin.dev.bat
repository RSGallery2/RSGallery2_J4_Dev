@ECHO off
REM starts the single plugin build process

CLS

REM setlocal ENABLEDELAYEDEXPANSION
REM   set "_args=%*"
REM   set "_args=!_args:*%1 =!"
REM
REM   echo/%_args%
REM endlocal

SET PluginName=plg_rsg2_images
if NOT %1A==A (
	SET PluginName=%1
)
ECHO PluginName=%PluginName%

SHIFT

REM phing -f .\build.plugin.xml -logfile .\build.plugin.log -verbose -debug

REM Plugin name
Call :AddNextArg -Dplugin_name=%PluginName%

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
ECHO phing -logfile .\build.plugin.log  -f .\build.plugin.xml %CmdArgs% %*
     phing -logfile .\build.plugin.log  -f .\build.plugin.xml %CmdArgs% %*

GOTO :EOF

REM -------------------------------------------------------------
REM -------------------------------------------------------------
REM Adds given argument to the already known command arguments
:AddNextArg
	Set NextArg=%*
	Set CmdArgs=%CmdArgs% %NextArg%
	ECHO  '%NextArg%'
GOTO :EOF




