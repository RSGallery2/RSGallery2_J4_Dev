@ECHO OFF
REM updateAll_fileHeaders_direct.bat 
REM direct call of updateAll_fileHeadersCmd.php in subdirectory 
REM not calling over doFileTasksCmd.php
REM
CLS

REM Path for calling
set ExePath=e:\wamp64\bin\php\php8.4.5\
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

ECHO ----------------------------------------------
ECHO.

REM more otions 

set OptionFile=

REM if %1A==-dA (
REM 	set OptionFile=-o options_version_tsk\build_develop.opt
REM )


ECHO ----------------------------------------------
ECHO.

pushd  ..\..\buildExtension\src\fileHeaderLib
ECHO Path: %cd% 


REM echo.
echo --- "%ExePath%php.exe" updateAll_fileHeadersCmd.php -f ../../../RSGallery2_J4_Dev\.buildPHP_extern\updateAll_fileHeaders_direct.tsk %OptionFile%
"%ExePath%php.exe" updateAll_fileHeadersCmd.php -f ../../../RSGallery2_J4_Dev\.buildPHP_extern\updateAll_fileHeaders_direct.tsk %OptionFile%
popd

goto :EOF

REM ------------------------------------------
REM Adds given argument to the already known command arguments
:AddNextArg
    Set NextArg=%*
    Set CmdArgs=%CmdArgs% %NextArg%
    ECHO  '%NextArg%'
GOTO :EOF
