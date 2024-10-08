@ECHO OFF
REM FileNamesList.batbuildDevelop.bat
REM 
CLS

REM Organise Path for calling
set ExePath=.\
if exist %ExePath%\WdbCommander.exe goto :EndExePath
prompt

set ExePath=..\exe\
if exist %ExePath%\WdbCommander.exe goto :EndExePath
prompt

set ExePath=%WWM500TOOLS%\WdbCommander

:EndExePath




REM "C:\Program Files\php82\php.exe" --version
php.exe --version

REM echo.
echo --- "C:\Program Files\php82\php.exe" ./buildRelease.php /t buildDevelop.tsk %1
REM "C:\Program Files\php82\php.exe" f:\Entwickl\rsgallery2\RSGallery2_J4_Dev\.buildPHP\buildRelease.php /t buildDevelop.tsk %1
REM "C:\Program Files\php82\php.exe" ./buildRelease.php /t buildDevelop.tsk %1
php.exe -f "./buildRelease.php" -- /t=buildDevelop.tsk %1



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
