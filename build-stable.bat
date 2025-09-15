@echo off
setlocal enabledelayedexpansion

echo ====================================
echo Compiling Delphi 12.3 for environment: stable
echo ====================================

set PROJECT_PATH=C:\actions-runner\_work\duimp\duimp\src\client\Siscomex.groupproj
set DPROJ_PATH=C:\actions-runner\_work\duimp\duimp\src\client\duimp.dproj
set VERSION_FILE=C:\actions-runner\_work\duimp\version.txt

REM ============================
REM Read current version
REM ============================
set MAJOR=0
set MINOR=0
set RELEASE=0
set BUILD=0

for /f "tokens=1-4 delims=." %%a in (%VERSION_FILE%) do (
    set MAJOR=%%a
    set MINOR=%%b
    set RELEASE=%%c
    set BUILD=%%d
)

set /a BUILD+=1
set NEW_VERSION=!MAJOR!.!MINOR!.!RELEASE!.!BUILD!

echo Updating duimp project to version !NEW_VERSION!

REM ============================
REM Update duimp project (.dproj) safely
REM ============================
powershell -Command ^
  "$content = Get-Content '%DPROJ_PATH%'; " ^
  "$content = $content -replace 'FileVersion=\"\d+\.\d+\.\d+\.\d+\"', 'FileVersion=\"!NEW_VERSION!\"'; " ^
  "$content = $content -replace 'ProductVersion=\"\d+\.\d+\.\d+\.\d+\"', 'ProductVersion=\"!NEW_VERSION!\"'; " ^
  "Set-Content '%DPROJ_PATH%' $content"

REM ============================
REM Load Delphi environment
REM ============================
call "C:\Program Files (x86)\Embarcadero\Studio\23.0\bin\rsvars.bat"

REM ============================
REM Compile project
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
    echo ❌ DELPHI COMPILATION ERROR
    exit /b 1
)

echo ====================================
echo ✅ Compilation completed successfully!
echo Release version: !NEW_VERSION!
echo ====================================
exit /b 0