@echo off
setlocal enabledelayedexpansion

echo ====================================
echo Compilando Delphi para ambiente: develop
echo ====================================

REM ============================
REM Carregar variáveis do Delphi
REM ============================
call "C:\Program Files (x86)\Embarcadero\Studio\23.0\bin\rsvars.bat"

REM ============================
REM Caminhos
REM ============================
set PROJECT_PATH=C:\actions-runner\_work\duimp\duimp\src\client\Siscomex.groupproj
set DPROJ_PATH=C:\actions-runner\_work\duimp\duimp\src\client\duimp.dproj
set VERSION_TRACK=C:\actions-runner\_work\duimp\version.txt

REM ============================
REM Ler FileVersion atual
REM ============================
for /f "tokens=2 delims==;" %%a in ('findstr /i "FileVersion=" "%DPROJ_PATH%"') do (
    set FILEVERSION=%%a
)

echo FileVersion atual: %FILEVERSION%

REM ============================
REM Separar Major.Minor.Release.Build
REM ============================
for /f "tokens=1-4 delims=." %%a in ("%FILEVERSION%") do (
    set MAJOR=%%a
    set MINOR=%%b
    set RELEASE=%%c
    set BUILD=%%d
)

echo Major=%MAJOR% Minor=%MINOR% Release=%RELEASE% Build=%BUILD%

REM ============================
REM Verificar release anterior
REM ============================
if exist "%VERSION_TRACK%" (
    set /p LAST_RELEASE=<"%VERSION_TRACK%"
) else (
    set LAST_RELEASE=%RELEASE%
)

REM ============================
REM Incrementar ou resetar build
REM ============================
if "%LAST_RELEASE%"=="%RELEASE%" (
    set /a NEW_BUILD=%BUILD%+1
) else (
    set NEW_BUILD=1
)

echo Novo Build: %NEW_BUILD%

REM ============================
REM Atualizar FileVersion no .dproj
REM ============================
set NEW_FILEVERSION=%MAJOR%.%MINOR%.%RELEASE%.%NEW_BUILD%
powershell -Command "(Get-Content '%DPROJ_PATH%') -replace 'FileVersion=%FILEVERSION%', 'FileVersion=%NEW_FILEVERSION%' | Set-Content '%DPROJ_PATH%'"

REM ============================
REM Salvar release atual
REM ============================
echo %RELEASE% > "%VERSION_TRACK%"

REM ============================
REM Compilar Delphi
REM ============================
msbuild.exe "%PROJECT_PATH%" /t:Build /p:Config=VCL /p:Platform=Win32
if errorlevel 1 (
    echo ERRO NA COMPILACAO DO DELPHI
    exit /b 1
)

echo ====================================
echo Compilacao concluida com sucesso!
echo ====================================
exit /b 0