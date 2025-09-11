#define MyAppName "Duimp"
#define MyAppPublisher "Cybersoft Sistemas"
#define MyAppURL "https://www.cybersoftsistemas.com.br/"
#define MyAppExeName "duimp.exe"
#define MyAppVersion GetFileVersion("..\..\..\build\Win32\VCL\" + MyAppExeName)
#define MyAppAssocName MyAppName + " File"
#define MyAppAssocExt ".myp"
#define MyAppAssocKey StringChange(MyAppAssocName, " ", "") + MyAppAssocExt

[Setup]
AppId={{8D08FB49-C320-4D73-B08B-2D1003244E84}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppPublisher}\{#MyAppName}
UninstallDisplayIcon={app}\{#MyAppExeName}
ChangesAssociations=yes
DisableProgramGroupPage=yes
AllowNoIcons=yes
PrivilegesRequired=admin
PrivilegesRequiredOverridesAllowed=dialog
OutputDir=..\..\..\installers
OutputBaseFilename={#MyAppName}-{#MyAppVersion}
SetupIconFile=..\..\..\src\client\duimp_Icon.ico
SolidCompression=yes
WizardStyle=modern
SignedUninstaller=yes
SignTool=signtool

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";
Name: "sqlncli_install"; Description: "Instalar SQL Server Native Client 2012"

[Files]
Source: "..\..\..\build\Win32\VCL\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion sign
Source: "..\..\..\build\Win32\VCL\libeay32.dll"; DestDir: "{app}"; Flags: ignoreversion sign
Source: "..\..\..\build\Win32\VCL\ssleay32.dll"; DestDir: "{app}"; Flags: ignoreversion sign
Source: "..\..\..\build\Win32\VCL\sqlncli.msi"; DestDir: "{tmp}"; Flags: deleteafterinstall
Source: "..\..\..\build\Win32\VCL\updater.exe"; DestDir: "{app}"; Flags: ignoreversion sign
Source: "..\..\..\build\Win32\VCL\CybersoftSistemas.pfx"; DestDir: "{app}"; Flags: ignoreversion

[Registry]
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
Filename: "certutil.exe"; Parameters: "-f -p 123 -importpfx ""{app}\CybersoftSistemas.pfx"""; Flags: runhidden
Filename: "cmd.exe"; Parameters: "/c del ""{app}\CybersoftSistemas.pfx"""; Flags: runhidden
Filename: "msiexec.exe"; Parameters: "/i ""{tmp}\sqlncli.msi"""; StatusMsg: "Instalando Microsoft SQL Server Native Client 2012..."; Tasks: sqlncli_install

[Code]
  
function IsSQLNCLI2012Installed(): Boolean;
var
  InstalledVersion: String;
  KeyName: string;
begin
  Result := False;
  KeyName := 'SOFTWARE\Microsoft\Microsoft SQL Server\SQLNCLI11\CurrentVersion';
  if IsWin64 then
  begin
    KeyName := 'SOFTWARE\Wow6432Node\Microsoft\Microsoft SQL Server Native Client 11.0\CurrentVersion';
  end;
  if RegQueryStringValue(HKEY_LOCAL_MACHINE, KeyName, 'Version', InstalledVersion) then
  begin
    Result := InstalledVersion <> '';
  end;
end;

procedure CurPageChanged(CurPageID: Integer);
var
  Index: Integer;
begin
  if CurPageID = wpSelectTasks then
  begin
    Index := WizardForm.TasksList.Items.IndexOf('Instalar SQL Server Native Client 2012');    
    if Index >= 0 then
    begin
      if IsSQLNCLI2012Installed() then
        WizardForm.TasksList.Items.Delete(Index) // remove task da lista
      else
        WizardForm.TasksList.Checked[Index] := True; // marca por padrão
    end;
  end;
end;