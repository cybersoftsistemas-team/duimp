@echo off
setlocal

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
set DELPHI_BIN="C:\Program Files (x86)\Embarcadero\Studio\23.0\bin"
set PROJECT_PATH=C:\actions-runner\_work\duimp\duimp\src\client\Siscomex.groupproj

rem ============================
rem Variáveis de ambiente Delphi
rem ============================
set BDS=C:\Users\Administrator\AppData\Roaming\Embarcadero\BDS\23.0
set PATH=%PATH%;%DELPHI_BIN%

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