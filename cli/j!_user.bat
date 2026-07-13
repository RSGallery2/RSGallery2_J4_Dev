@ECHO OFF
REM  show a joomgla user
REM %1 user id
CLS

REM config id
set usr_id=%1

if "%~1"=="" (
	set usr_id=285
)

ECHO.
ECHO --- php joomla.php user  --id=%usr_id% 
ECHO.

ECHO ON
php joomla.php user  --id=%usr_id% 


ECHO: sorry prepared but not working. May be in a further joomla version


