@echo off

if "%OS%"=="Windows_NT" goto nt

echo This is not NT, so please edit this script and set _APP_HOME manually
set _APP_HOME=..
goto uninstall

:nt
rem %~dp0 is name of current script under NT
set _APP_HOME=%~dp0
set _APP_HOME=%_APP_HOME:\bin\=%

:uninstall
ant -f "%_APP_HOME%\conf\dorado-install.xml" uninstall
goto exit

:exit