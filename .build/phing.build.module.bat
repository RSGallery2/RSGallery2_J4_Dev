@ECHO off
REM starts the standard build process
REM phing.build.module.bat mod_rsg2_images -DisCalledByPackage=0
REM phing.build.module.bat mod_rsg2_images
REM phing.build.module.bat -Dmodule_name=mod_rsg2_images

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

SHIFT

ECHO ModuleName=%ModuleName%
REM phing -verbose -debug -logfile .\build.log
REM phing -verbose -logfile .\build.log 
REM phing -logfile .\build.log .\build.xml

REM  %1 %2 %3
ECHO phing -logfile .\build.module.log  -f .\build.module.xml -Dmodule_name=%ModuleName% %1 %2 %3
phing -logfile .\build.module.log  -f .\build.module.xml -Dmodule_name=%ModuleName% %1 %2 %3

