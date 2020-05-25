@ECHO off
REM Starts Target "Improve php file "since" doc parts: add version * @since  x.y.z"

CLS 

REM phing -verbose -debug -logfile .\since.target.log .\updateProject.xml AddVersion2PhpSinceDoc
REM phing -verbose -logfile .\since.log .\updateProject.xml AddVersion2PhpSinceDoc
REM phing -logfile .\since.target.log .\updateProject.xml AddVersion2PhpSinceDoc

REM - longtargets
REM -
phing -logfile .\since.target.log -f .\updateProject.xml AddVersion2PhpSinceDoc


ECHO ------------------------------------
REM TYPE .\since.target.log
REM ECHO ------------------------------------



