@ECHO OFF
REM assign usergroup '' to user   
REM call jg_assignUser2Group.bat <username> <usergroup>
REM needs to be startet in CLI folder. or use cli\joomla.php below

CLS

REM if A%password%==A 
if  "%~1"=="" (
	ECHO The user name is needed as first argument
	ECHO Please add the user name as first argument 
	GOTO :EOF
)
set username=%1


set usergroup=JG_user_upload

REM if NOT "%~2"=="" (
if "%~2"=="" (
	ECHO The user group may be the second argument
	ECHO Using standard user group "JG_user_upload"
)

if NOT "%~2"=="" (
	set usergroup=%2
)

ECHO php joomla.php user:addtogroup --username="%username%" --group="%usergroup%"
php joomla.php user:addtogroup --username="%username%" --group="%usergroup%"


php joomla.php user:list
pause


