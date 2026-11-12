param([string]$DelphiRoot = 'C:\Program Files (x86)\Embarcadero\Studio\37.0')
$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$outputPath = Join-Path $projectRoot 'build\version-migration-check'
New-Item -ItemType Directory -Path $outputPath -Force | Out-Null
$roots = @('src\client', 'src\foundation\src', 'src\modules\spring4d\Source') | ForEach-Object { Join-Path $projectRoot $_ }
$sourceDirs = Get-ChildItem -LiteralPath $roots -Recurse -File | Where-Object { $_.Extension -in '.pas', '.inc' } | ForEach-Object { $_.DirectoryName } | Sort-Object -Unique
$libraryPath = Join-Path $DelphiRoot 'lib\win32\release'
$searchPath = (@($outputPath, $libraryPath) + $sourceDirs) -join ';'
& (Join-Path $DelphiRoot 'bin\dcc32.exe') '-Q' "-U$searchPath" "-I$searchPath" '-NSSystem;Xml;Data;Winapi' "-E$outputPath" "-N0$outputPath" (Join-Path $PSScriptRoot 'VersionMigrationCheck.dpr')
if ($LASTEXITCODE -ne 0) { throw 'Version test compilation failed.' }
& (Join-Path $outputPath 'VersionMigrationCheck.exe')
if ($LASTEXITCODE -ne 0) { throw 'Version migration tests failed.' }
