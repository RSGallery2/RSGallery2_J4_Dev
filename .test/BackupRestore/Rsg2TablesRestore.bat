@ECHO OFF
REM Imports dump of RSG2 tables from given database
REM Configuration and pathes will be taken from configuration.php of referenced joomla installation
CLS

Set CmdArgs=
ECHO python Rsg2TablesRestore.py

REM JoomlaPath
CALL :AddNextArg -p "d:\xampp\htdocs"
REM CALL :AddNextArg -p "e:\xampp_J2xJ3x\htdocs"

REM JoomlaName
CALL :AddNextArg -n "joomla4x"
REM CALL :AddNextArg -n "joomla4x_Sim3x"
REM CALL :AddNextArg -n "joomla3x"
REM CALL :AddNextArg -n "joomla25"

REM dumpFileName
REM CALL :AddNextArg -f "..\..\..\RSG2_Backup\joomla3x.20200430_171320\Rsg2_TablesDump.j3x.sql"
REM CALL :AddNextArg -f "..\..\..\RSG2_Backup\Tables\j3_rsgallery2_galleries.sql"
REM CALL :AddNextArg -f "..\..\..\RSG2_Backup\Tables\j3x_Tables.2020.05.16.sql
REM CALL :AddNextArg -f "..\..\..\RSG2_Backup\Tables\j3x_tables.2020.04.30.sql
CALL :AddNextArg -f "..\..\..\RSG2_Backup\Tables\j3x_tables.2020.06.14.sql

REM
REM CALL :AddNextArg -p ""

REM add command line
REM CALL :AddNextArg %*

ECHO.
ECHO ------------------------------------------------------------------------------
ECHO Start cmd:
ECHO.
ECHO python Rsg2TablesRestore.py %CmdArgs% %*
     python Rsg2TablesRestore.py %CmdArgs% %*

GOTO :EOF

REM ------------------------------------------
REM Adds given argument to the already known command arguments
:AddNextArg 
Set NextArg=%*
Set CmdArgs=%CmdArgs% %NextArg%
ECHO  '%NextArg%'
GOTO :EOF

