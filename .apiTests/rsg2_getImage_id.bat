@ECHO OFF
REM rsg2_getImage_id.bat
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

ECHO ----------------------------------------------
ECHO.

SET IMAGE_ID=""
IF NOT A%1==A (
	SET IMAGE_ID=-a "/urlRouterParam=%1"   
	ECHO IMAGE_ID=%IMAGE_ID%     
)


ECHO ----------------------------------------------
ECHO.

echo --- "%ExePath%php.exe" ..\..\apiByCurlHtml\src\curlApiTasksCmd.php -f .\rsg2_getImage_id.tsk %IMAGE_ID%
"%ExePath%php.exe" ..\..\apiByCurlHtml\src\curlApiTasksCmd.php -f .\rsg2_getImage_id.tsk %IMAGE_ID%

GOTO :EOF

REM ------------------------------------------
REM Adds given argument to the already known command arguments
:AddNextArg
    Set NextArg=%*
    Set CmdArgs=%CmdArgs% %NextArg%
    ECHO  '%NextArg%'
GOTO :EOF

