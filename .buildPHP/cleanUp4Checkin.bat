@ECHO OFF
REM cleanUp4Checkin.bat
REM Task to do before check in like remove space at the end of lines
CLS

Set CmdArgs=
ECHO PHP original.php

REM source file
REM Call :AddNextArg -s "./original.php"

REM destination file
REM Call :AddNextArg -d "./original.php"


REM Source path
Call :AddNextArg -p "..\..\RSGallery2_J4"

REM add command line
REM Call :AddNextArg %*

ECHO.
ECHO ------------------------------------------------------------------------------
ECHO Start cmd:
ECHO.
ECHO php.exe -f "./cleanUp4Checkin.php" --  %CmdArgs% %*
php.exe -f "./cleanUp4Checkin.php" --  %CmdArgs% %*

GOTO :EOF

REM ------------------------------------------
REM Adds given argument to the already known command arguments
:AddNextArg
	Set NextArg=%*
	Set CmdArgs=%CmdArgs% %NextArg%
	ECHO  '%NextArg%'
GOTO :EOF

