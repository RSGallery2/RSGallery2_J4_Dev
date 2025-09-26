@ECHO OFF
REM Curl_StartHttpFile.bat
REM Given http file is read and a curl command is created from it
CLS

REM ToDo: cmdArgs

set httpFile=
if NOT %1A==A (
	set httpFile=%1
)

REM use "" for auto file name
set responseFile=
if NOT %2A==A (
	set responseFile=-r %2
)


ECHO ----------------------------------------------
echo php -q ./Curl_StartHttpFile.php -f %httpFile% %responseFile%
php -q ./Curl_StartHttpFile.php -f %httpFile% %responseFile%

REM ECHO Press any key
REM pause
