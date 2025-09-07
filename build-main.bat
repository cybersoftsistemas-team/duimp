@echo off
setlocal

echo ====================================
echo Compilando Delphi para ambiente: main
echo ====================================

REM ============================
REM Caminhos (ajuste conforme sua máquina runner)
REM ============================
set DELPHI_PATH=C:\Program Files (x86)\Embarcadero\Studio\23.0\bin
set PROJECT_PATH=C:\actions-runner\_work\duimp\duimp\src\client\Siscomex.groupproj

REM ============================
REM Compilar Delphi
REM ============================
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\msbuild.exe "%PROJECT_PATH%" /t:Build /p:Config=Release /p:Platform=Win32
if errorlevel 1 (
    echo ERRO NA COMPILACAO DO DELPHI
    exit /b 1
)

echo ====================================
echo Compilacao concluida com sucesso!
echo ====================================

exit /b 0
