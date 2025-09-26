@ECHO OFF
REM Curl_StartHttpFile.bat
REM Given http file is read and a curl command is created from it
CLS

REM ToDo: cmdArgs

set httpFile=imagesGet.http
if NOT %1A==A (
	set httpFile=%1
)


ECHO ----------------------------------------------
echo php -q ./Curl_StartHttpFile.php -f %httpFile% %responseFile% -r
php -q ./Curl_StartHttpFile.php -f %httpFile% %responseFile% -r

REM ECHO Press any key
REM pause
