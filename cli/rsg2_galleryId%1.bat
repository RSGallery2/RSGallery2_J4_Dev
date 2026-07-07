@ECHO OFF
REM rsg2_galleryGet%1.bat
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

"%ExePath%php.exe" --version

REM --------------------------------------------------
REM %1 variable name must exist

if "%1" == "" (
	ECHO.
	ECHO !!! ERROR: "Variable name" as first parameter must be given !!!
	ECHO     Example: j!_galleryGet%1.bat variable_name
	goto :EOF 
)

ECHO ----------------------------------------------
ECHO.

echo --- "%ExePath%php.exe" joomla.php rsgallery2:gallery --id=%1
"%ExePath%php.exe" joomla.php rsgallery2:gallery --id=%1

GOTO :EOF

REM ------------------------------------------
REM Adds given argument to the already known command arguments
:AddNextArg
    Set NextArg=%*
    Set CmdArgs=%CmdArgs% %NextArg%
    ECHO  '%NextArg%'
GOTO :EOF
