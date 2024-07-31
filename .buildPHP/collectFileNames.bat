@ECHO OFF
REM collectFileNames.bat.bat
REM 
CLS

Set CmdArgs=
ECHO PHP original.php

REM include file types
Call :AddNextArg -i "*.php *.xmp *.ini"

REM rekursiv
Call :AddNextArg -r

REM Source path
Call :AddNextArg -p "..\..\RSGallery2_J4"

REM add command line
REM Call :AddNextArg %*

ECHO.
ECHO ------------------------------------------------------------------------------
ECHO Start cmd:
ECHO.
ECHO php.exe -f "./collectFileNames.bat.php" --  %CmdArgs% %*
php.exe -f "./collectFileNames.bat.php" --  %CmdArgs% %*

GOTO :EOF

REM ------------------------------------------
REM Adds given argument to the already known command arguments
:AddNextArg
	Set NextArg=%*
	Set CmdArgs=%CmdArgs% %NextArg%
	ECHO  '%NextArg%'
GOTO :EOF

