@echo off
setlocal enabledelayedexpansion

echo ====================================
echo Compilando Delphi para ambiente: main
echo ====================================

REM ============================
REM Carregar variáveis do Delphi
REM ============================
call "C:\Program Files (x86)\Embarcadero\Studio\23.0\bin\rsvars.bat"

REM ============================
REM Caminhos
REM ============================
set PROJECT_PATH=C:\actions-runner\_work\duimp\duimp\src\client\Siscomex.groupproj
set VERSION_TRACK=C:\actions-runner\_work\duimp\version.txt

REM ============================
REM Ler versão atual
REM ============================
if exist "%VERSION_TRACK%" (
    set /p VERSION=<"%VERSION_TRACK%"
) else (
    set VERSION=1.0.0.0
)

REM ============================
REM Separar componentes da versão
REM ============================
for /f "tokens=1-4 delims=." %%a in ("%VERSION%") do (
    set MAJOR=%%a
    set MINOR=%%b
    set RELEASE=%%c
    set BUILD=%%d
)

REM ============================
REM Incrementar Build
REM ============================
set /a BUILD=BUILD+1

echo Versao: %MAJOR%.%MINOR%.%RELEASE%.%BUILD%

REM ============================
REM Salvar nova versão
REM ============================
echo %MAJOR%.%MINOR%.%RELEASE%.%BUILD% > "%VERSION_TRACK%"

REM ============================
REM Compilar Delphi
REM ============================
msbuild.exe "%PROJECT_PATH%" ^
  /t:Build ^
  /p:Config=VCL ^
  /p:Platform=Win32 ^
  /p:VerInfo_MajorVer=%MAJOR% ^
  /p:VerInfo_MinorVer=%MINOR% ^
  /p:VerInfo_Release=%RELEASE% ^
  /p:VerInfo_Build=%BUILD%

if errorlevel 1 (
    echo ERRO NA COMPILACAO DO DELPHI
    exit /b 1
)

echo ====================================
echo Compilacao concluida com sucesso!
echo ====================================
exit /b 0