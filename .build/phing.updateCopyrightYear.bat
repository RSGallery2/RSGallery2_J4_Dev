@ECHO off
REM Starts Target "Improve php file "since" doc parts: add version * @since  x.y.z"

CLS

REM phing -verbose -debug -logfile .\UpdateCopyrightYear.log .\updateProject.xml
REM phing -verbose -logfile .\since.log .\updateProject.xml
REM phing -logfile .\UpdateCopyrightYear.log .\updateProject.xml

REM -longtargets
REM -
phing -logfile .\UpdateCopyrightYear.log -f .\updateProject.xml UpdateCopyrightYear

ECHO ------------------------------------
REM TYPE .\UpdateCopyrightYear.log
REM ECHO ------------------------------------



