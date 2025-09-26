@echo Off
REM ----------------------------------------
REM Transform *.tsk files to *.http file format
REM %1 : path and name to source file
REM %2 : path to target file or path and name to target file
REM ----------------------------------------

Set CmdArgs=

ECHO ----------------------------------------------
@echo Transform *.tsk file to *.http file format
ECHO ----------------------------------------------
@echo.

REM task command http to tsk conversion
Call :AddNextArg -t "task:tsk2httpFile"

REM task command http to tsk conversion
Call :AddNextArg -e "http"


REM --- source file and folder ---------------------------------

if "%1" NEQ "" (
	SET srcFile=%1
) else (
	set srcFile=rsg2_getGalleries.tsk
)

REM source path
Call :AddNextArg -s %srcFile%

REM --- destination file and folder ---------------------------------

if "%2" NEQ "" (
	SET dstFileOrPath=%2
) else (
    REM set dstFileOrPath=""
    set dstFileOrPath=%~dp0curl_http_files\
)

REM source path
Call :AddNextArg -d %dstFileOrPath%

ECHO srcFile: %srcFile%
ECHO dstFileOrPath: %dstFileOrPath%

REM --- Php exe path -------------------------------------------------

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

ECHO.
ECHO ----------------------------------------------
"%ExePath%php.exe" --version

ECHO ----------------------------------------------
ECHO.

REM ECHO --- "%ExePath%php.exe" ..\..\apiByCurlHtml\src\task_http_file\tsk2httpFileCmd.php %CmdArgs%
REM "%ExePath%php.exe" ..\..\apiByCurlHtml\src\task_http_file\tsk2httpFileCmd.php %CmdArgs%

pushd ..\..\apiByCurlHtml\src\task_http_file
REM dir

ECHO CmdArgs: %CmdArgs%

ECHO --- "%ExePath%php.exe" tsk2httpFileCmd.php %CmdArgs%
"%ExePath%php.exe" tsk2httpFileCmd.php %CmdArgs%

popd

ECHO ----------------------------------------------
@echo Transform of %srcFile% done
@echo.

REM ECHO \%NO_PAUSE\%: "%NO_PAUSE%"
if "%NO_PAUSE%" EQU "" (
	pause
)

GOTO :EOF

REM ------------------------------------------
REM Adds given argument to the already known command arguments
:AddNextArg
	Set NextArg=%*
	Set CmdArgs=%CmdArgs% %NextArg%
	ECHO  '%NextArg%'
GOTO :EOF


