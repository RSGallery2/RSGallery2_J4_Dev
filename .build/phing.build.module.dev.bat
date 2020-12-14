@ECHO off
REM starts the single module build process

CLS

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
REM phing -f .\build.module.xml -logfile .\build.module.log -verbose
REM phing -f .\build.module.xml -logfile .\build.module.log

REM  %1 %2 %3
ECHO phing -logfile .\build.module.log  -f .\build.module.xml -DisUpdateManifest=1 -Dmodule_name=%ModuleName% %1 %2 %3
phing -logfile .\build.module.log -f .\build.module.xml -DisUpdateManifest=1 -Dmodule_name=%ModuleName% %1 %2 %3

