@ECHO OFF
REM open cypress ?studio ? and show command results

REM project
SET cy_project=rsg2_control_panel

REM tell login name ..
call cypressEnvVars.bat

ECHO cypress open  --e2e %cy_project% --project .\ --browser chrome
cypress open  --e2e %cy_project% --project .\ --browser chrome

prompt
