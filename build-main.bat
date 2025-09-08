@echo off
setlocal enabledelayedexpansion

echo ====================================
echo Compiling Delphi 12.3 for environment: main
echo ====================================

REM ============================
REM Paths
REM ============================
set PROJECT_PATH=C:\actions-runner\_work\duimp\duimp\src\client\Siscomex.groupproj
set DPROJ_PATH=C:\actions-runner\_work\duimp\duimp\src\client\duimp.dproj
set VERSION_FILE=C:\actions-runner\_work\duimp\version.txt

REM ============================
REM Read current version
REM ============================
for /f "tokens=1-4 delims=." %%a in (%VERSION_FILE%) do (
    set MAJOR=%%a
    set MINOR=%%b
    set RELEASE=%%c
    set BUILD=%%d
)

REM ============================
REM Current version
REM ============================
set NEW_VERSION=!MAJOR!.!MINOR!.!RELEASE!.!BUILD!
echo Version: !NEW_VERSION!

REM ============================
REM Updating duimp.dproj
REM ============================
echo Updating duimp.dproj to the new version...
powershell -Command "(gc '%DPROJ_PATH%') -replace 'FileVersion=.*?;', 'FileVersion=$(MAJOR).$(MINOR).$(RELEASE).$(BUILD);' | Set-Content '%DPROJ_PATH%'"
powershell -Command "(gc '%DPROJ_PATH%') -replace 'ProductVersion=.*?;', 'ProductVersion=$(MAJOR).$(MINOR).$(RELEASE).$(BUILD);' | Set-Content '%DPROJ_PATH%'"

REM ============================
REM Loading variables from Delphi 12.3
REM ============================
call "C:\Program Files (x86)\Embarcadero\Studio\23.0\bin\rsvars.bat"

REM ============================
REM Compile the executable
REM ============================
msbuild.exe "%PROJECT_PATH%" ^
  /t:Build ^
  /p:Config=VCL ^
  /p:Platform=Win32 ^
  /p:VerInfo_MajorVer=!MAJOR! ^
  /p:VerInfo_MinorVer=!MINOR! ^
  /p:VerInfo_Release=!RELEASE! ^
  /p:VerInfo_Build=!BUILD!

if errorlevel 1 (
    echo DELPHI COMPILATION ERROR
    exit /b 1
)

echo ====================================
echo Compilation completed successfully!
echo Final version: !NEW_VERSION!
echo ====================================
exit /b 0