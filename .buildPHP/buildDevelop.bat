@ECHO OFF
REM Compiles given *.php file 

"C:\Program Files\php82\php.exe" --version

REM echo.
echo --- "C:\Program Files\php82\php.exe" ./buildRelease.php /t buildDevelop.tsk %1
"C:\Program Files\php82\php.exe" f:\Entwickl\rsgallery2\RSGallery2_J4_Dev\.buildPHP\buildRelease.php /t buildDevelop.tsk %1
"C:\Program Files\php82\php.exe" ./buildRelease.php /t buildDevelop.tsk %1

