@echo off
setlocal enabledelayedexpansion

echo ====================================
echo Compilando Delphi para ambiente: develop
echo ====================================

REM ============================
REM Caminhos
REM ============================
set PROJECT_PATH=C:\actions-runner\_work\duimp\duimp\src\client\Siscomex.groupproj
set DPROJ_PATH=C:\actions-runner\_work\duimp\duimp\src\client\duimp.dproj
set VERSION_FILE=C:\actions-runner\_work\duimp\version.txt

REM ============================
REM Ler versão atual
REM ============================
for /f "tokens=1-4 delims=." %%a in (%VERSION_FILE%) do (
    set MAJOR=%%a
    set MINOR=%%b
    set RELEASE=%%c
    set BUILD=%%d
)

REM ============================
REM Incrementar build
REM ============================
set /a BUILD=BUILD+1
set NEW_VERSION=!MAJOR!.!MINOR!.!RELEASE!.!BUILD!

echo Atualizando version.txt para !NEW_VERSION!
echo !NEW_VERSION! > %VERSION_FILE%

REM ============================
REM Atualizar duimp.dproj
REM ============================
echo Atualizando duimp.dproj com a nova versão...
powershell -Command "(gc '%DPROJ_PATH%') -replace 'FileVersion=.*?;', 'FileVersion=$(MAJOR).$(MINOR).$(RELEASE).$(BUILD);' | Set-Content '%DPROJ_PATH%'"
powershell -Command "(gc '%DPROJ_PATH%') -replace 'ProductVersion=.*?;', 'ProductVersion=$(MAJOR).$(MINOR).$(RELEASE).$(BUILD);' | Set-Content '%DPROJ_PATH%'"

REM ============================
REM Carregar variáveis do Delphi
REM ============================
call "C:\Program Files (x86)\Embarcadero\Studio\23.0\bin\rsvars.bat"

REM ============================
REM Compilar Delphi
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
    echo ERRO NA COMPILACAO DO DELPHI
    exit /b 1
)

echo ====================================
echo Compilacao concluida com sucesso!
echo Versao final: !NEW_VERSION!
echo ====================================
exit /b 0