unit cybsCore.Config;

interface

uses
{IDE}
  System.IniFiles;

type
  TcybsConfig = class abstract
  strict private
    FConfigFile: string;
  strict protected
    procedure DoLoadConfig(const AConfig: TIniFile); virtual; abstract;
    procedure DoSaveConfig(const AConfig: TIniFile); virtual; abstract;
    procedure LoadConfig;
    procedure SaveConfig;
  public
    constructor Create(const AConfigFile: string; const AAutoLoad: Boolean = True);
  end;

implementation

{ TcybsConfig }

constructor TcybsConfig.Create(const AConfigFile: string;
  const AAutoLoad: Boolean = True);
begin
  inherited Create;
  FConfigFile := AConfigFile;
  if AAutoLoad then
  begin
    LoadConfig;
  end;
end;

procedure TcybsConfig.LoadConfig;
var
  LConfig: TIniFile;
begin
  LConfig := TIniFile.Create(FConfigFile);
  try
    DoLoadConfig(LConfig);
  finally
    LConfig.Free;
  end;
end;

procedure TcybsConfig.SaveConfig;
var
  LConfig: TIniFile;
begin
  LConfig := TIniFile.Create(FConfigFile);
  try
    DoSaveConfig(LConfig);
  finally
    LConfig.Free;
  end;
end;

end.
