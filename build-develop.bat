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
set PROJECT_PATH=C:\actions-runner\_work\duimp\duimp\src\client\Siscomex.groupproj

REM ============================
REM Compilar Delphi
REM ============================
msbuild.exe "%PROJECT_PATH%" /t:Build /p:Config=Release /p:Platform=Win32
if errorlevel 1 (
    echo ERRO NA COMPILACAO DO DELPHI
    exit /b 1
)

echo ====================================
echo Compilacao concluida com sucesso!
echo ====================================
exit /b 0