param(
    [string]$DelphiRoot = 'C:\Program Files (x86)\Embarcadero\Studio\37.0'
)
$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$outputPath = Join-Path $projectRoot 'build\additions-query-check'
New-Item -ItemType Directory -Path $outputPath -Force | Out-Null
$compiler = Join-Path $DelphiRoot 'bin\dcc32.exe'
$libraryPath = Join-Path $DelphiRoot 'lib\win32\release'
& $compiler '-B' '-Q' "-U$libraryPath" '-NSSystem;Xml;Data;Winapi' "-E$outputPath" "-N0$outputPath" (Join-Path $PSScriptRoot 'AdditionsQueryCheck.dpr')
if ($LASTEXITCODE -ne 0) { throw 'Regression test compilation failed.' }
& (Join-Path $outputPath 'AdditionsQueryCheck.exe') (Join-Path $projectRoot 'src\client\dom\DataModules\duimp.dom.DataModules.damDuimp.dfm')
if ($LASTEXITCODE -ne 0) { throw 'Additions regression tests failed.' }
