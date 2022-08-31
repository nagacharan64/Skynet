@ECHO OFF

rem Set desired installer type:"msi" "exe".
set INSTALLER_TYPE=msi

set MAIN_JAR=%PROJECT_Name%.jar

rem Remove previously generated installers.
IF EXIST target\installer rmdir /S /Q target\installer

rem In the end we will find the package inside the target/installer directory.
call "%JAVA_HOME%\bin\jpackage" ^
  --type %INSTALLER_TYPE% ^
  --dest target/installer ^
  --input target/ ^
  --name FlightBookingApp ^
  --main-class %MAIN_CLASS% ^
  --main-jar %MAIN_JAR% ^
  --java-options -Xmx2048m ^
  --icon src/main/resources/images/duke.ico ^
  --app-version %APP_VERSION% ^
  --vendor "ESTS" ^
  --copyright "Copyright © 2022-23 ESTS Inc." ^
  --win-dir-chooser ^
  --win-shortcut ^
  --win-per-user-install ^
  --win-menu