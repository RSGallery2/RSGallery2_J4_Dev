@ECHO OFF
REM buildDevelop.bat
REM 
CLS

REM Path for calling
set ExePath=C:\Program Files\php82\
REM ECHO ExePath: "%ExePath%"

if exist "%ExePath%php.exe" (
    REM path known (WT)
    ECHO ExePath: "%ExePath%"
) else (
    REM Direct call
    ECHO PHP in path variable
    set ExePath=
)

REM "C:\Program Files\php82\php.exe" --version
"%ExePath%php.exe" --version
ECHO.

REM echo.
echo --- "%ExePath%php.exe" ./buildRelease.php /t buildDevelop.tsk %1
REM "C:\Program Files\php82\php.exe" f:\Entwickl\rsgallery2\RSGallery2_J4_Dev\.buildPHP\buildRelease.php /t buildDevelop.tsk %1
REM "C:\Program Files\php82\php.exe" ./buildRelease.php /t buildDevelop.tsk %1
REM "%ExePath%php.exe" -f "./buildReleaseCmd.php" -- /t=buildDevelop.tsk %1
"%ExePath%php.exe" increaseVersionIdCmd.php

goto :EOF



ECHO.
ECHO ------------------------------------------------------------------------------
ECHO Start cmd:
ECHO.
ECHO php.exe -f "./FileNamesList.php" --  %CmdArgs% %*
php.exe -f "./FileNamesList.php" --  %CmdArgs% %*

GOTO :EOF

REM ------------------------------------------
REM Adds given argument to the already known command arguments
:AddNextArg
	Set NextArg=%*
	Set CmdArgs=%CmdArgs% %NextArg%
	ECHO  '%NextArg%'
GOTO :EOF
