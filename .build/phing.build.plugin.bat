@ECHO off
REM starts the standard build process

CLS

REM phing -verbose -debug -logfile .\build.log
REM phing -verbose -logfile .\build.log 
REM phing -logfile .\build.log .\build.xml

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

SHIFT

ECHO PluginName=%PluginName%
REM phing -verbose -debug -logfile .\build.log
REM phing -verbose -logfile .\build.log 
REM phing -logfile .\build.log .\build.xml

REM  %1 %2 %3
ECHO phing -logfile .\build.plugin.log  -f .\build.plugin.xml -Dplugin_name=%PluginName% %1 %2 %3
phing -logfile .\build.plugin.log  -f .\build.plugin.xml -Dplugin_name=%PluginName% %1 %2 %3




