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

SET PluginType=content
if NOT %1A==A (
	SET PluginType=%1
)
ECHO PluginType=%PluginType%

SHIFT

REM phing -f .\build.plugin.xml -logfile .\build.plugin.log -verbose -debug
REM phing -f .\build.plugin.xml -logfile .\build.plugin.log -verbose
REM phing -f .\build.plugin.xml -logfile .\build.plugin.log

REM  %1 %2 %3
ECHO phing -logfile .\build.plugin.log  -f .\build.plugin.xml -Dplugin_name=%PluginName% -Dplugin_type=%PluginType% -DisCalledByPackage=1 %1 %2 %3
phing -logfile .\build.plugin.log  -f .\build.plugin.xml -Dplugin_name=%PluginName% -Dplugin_type=%PluginType% -DisCalledByPackage=1 %1 %2 %3




