unit pucomex.dom.Authenticator;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Authenticator,
  pucomex.dom.Http,
{IDE}
  IdHTTP,
  IdSSLOpenSSL,
  System.IniFiles;

type
  TAuthenticator = class(THttp, IAuthenticator)
  private
    FResource: string;
    function GetAppLocalTempPath: string;
    function GetCSRFToken: string;
    function GetExpiresAt: string;
    function GetPucomexConfig: string;
    function GetResource: string;
    function GetToken: string;
    function IsTokenValid: Boolean;
    procedure SetCSRFToken(const AValue: string);
    procedure SetExpiresAt(const AValue: string);
    procedure SetResource(const AValue: string);
    procedure SetToken(const AValue: string);
  protected
    function GetSectionConfigName: string; override;
    procedure AfterExecute(const AIdHTTP: TIdHTTP);
    procedure BeforeExecute(out AIdHTTP: TIdHTTP; out AIdSSLIOHandler: TIdSSLIOHandlerSocketOpenSSL);
    procedure DoExecute(const AIdHTTP: TIdHTTP);
    procedure DoLoadConfig(const ASectionConfigName: string; const AConfig: TIniFile); override;
    procedure DoSaveConfig(const ASectionConfigName: string; const AConfig: TIniFile); override;
    procedure SetExpiredToken;
    property CSRFToken: string read GetCSRFToken write SetCSRFToken;
    property ExpiresAt: string read GetExpiresAt write SetExpiresAt;
    property Token: string read GetToken write SetToken;
  public
    procedure Execute; overload;
    procedure Execute(const AExecute: TAuthExecute); overload;
    property Resource: string read GetResource write SetResource;
    property CertFile;
    property Headers;
    property KeyFile;
    property Password;
    property RootCertFile;
  end;

implementation

uses
{IDE}
  System.Classes,
  System.DateUtils,
  System.SysUtils;

function DateTimeToISO8601(const ADate: TDateTime): string;
begin
  Result := FormatDateTime('yyyy"-"mm"-"dd"T"hh":"nn":"ss', ADate);
end;

function UnixMilliToDateTime(const AMilli: Int64): TDateTime;
begin
  Result := UnixToDateTime(AMilli div 1000) + ((AMilli mod 1000) / MSecsPerDay);
end;

{ TAuthenticator }

function TAuthenticator.GetAppLocalTempPath: string;
begin
  Result := IncludeTrailingPathDelimiter(GetEnvironmentVariable('TEMP'));
end;

function TAuthenticator.GetCSRFToken: string;
begin
  var LConfig := TIniFile.Create(GetPucomexConfig);
  try
    Result := LConfig.ReadString(GetSectionConfigName, 'x-csrf-token', '');
  finally
    FreeAndNil(LConfig);
  end;
end;

function TAuthenticator.GetExpiresAt: string;
begin
  var LConfig := TIniFile.Create(GetPucomexConfig);
  try
    Result := LConfig.ReadString(GetSectionConfigName, 'ExpiresAt', '');
  finally
    FreeAndNil(LConfig);
  end;
end;

function TAuthenticator.GetPucomexConfig: string;
begin
  Result := Concat(GetAppLocalTempPath, 'pucomex.ini');
end;

function TAuthenticator.GetResource: string;
begin
  Result := FResource;
end;

function TAuthenticator.GetSectionConfigName: string;
begin
  Result := 'Authenticator';
end;

function TAuthenticator.GetToken: string;
begin
  var LConfig := TIniFile.Create(GetPucomexConfig);
  try
    Result := LConfig.ReadString(GetSectionConfigName, 'set-token', '');
  finally
    FreeAndNil(LConfig);
  end;
end;

function TAuthenticator.IsTokenValid: Boolean;
begin
  var LExpiresAtStr := ExpiresAt;
  if LExpiresAtStr.Trim.IsEmpty then
  begin
    Exit(False);
  end;
  Result := Now < ISO8601ToDate(LExpiresAtStr);
end;

procedure TAuthenticator.AfterExecute(const AIdHTTP: TIdHTTP);
begin
  Token := AIdHTTP.Response.RawHeaders.Values['Set-Token'];
  CSRFToken := AIdHTTP.Response.RawHeaders.Values['X-CSRF-Token'];
  ExpiresAt := AIdHTTP.Response.RawHeaders.Values['X-CSRF-Expiration'];
  if Token.Trim.IsEmpty or CSRFToken.Trim.IsEmpty then
  begin
    SetExpiredToken;
    raise Exception.Create('Falha no processo de logon. Usuário não habilitado na aplicação solicitada.');
  end;
end;

procedure TAuthenticator.BeforeExecute(out AIdHTTP: TIdHTTP; out AIdSSLIOHandler: TIdSSLIOHandlerSocketOpenSSL);
begin
  CreateIOHandler(AIdSSLIOHandler);
  CreateIdHTTP(AIdHTTP, AIdSSLIOHandler);
end;

procedure TAuthenticator.DoExecute(const AIdHTTP: TIdHTTP);
var
  LRequest: TStringList;
begin
  LRequest := TStringList.Create;
  try
    try
      AIdHTTP.Post(BaseURL + '/' + FResource.TrimLeft(['/']), LRequest);
    except
      on E: EIdHTTPProtocolException do
      begin
        raise Exception.Create(E.ErrorMessage);
      end;
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(LRequest);
  end;
end;

procedure TAuthenticator.DoLoadConfig(const ASectionConfigName: string; const AConfig: TIniFile);
begin
  SetExpiredToken;
  FResource := AConfig.ReadString(ASectionConfigName, 'Resource', '');
  CertFile := AConfig.ReadString(ASectionConfigName, 'CertFile', '');
  KeyFile := AConfig.ReadString(ASectionConfigName, 'KeyFile', '');
  Password := AConfig.ReadString(ASectionConfigName, 'Password', '');
  RootCertFile := AConfig.ReadString(ASectionConfigName, 'RootCertFile', '');
end;

procedure TAuthenticator.DoSaveConfig(const ASectionConfigName: string; const AConfig: TIniFile);
begin
  SetExpiredToken;
  AConfig.WriteString(ASectionConfigName, 'Resource', FResource);
  AConfig.WriteString(ASectionConfigName, 'CertFile', CertFile);
  AConfig.WriteString(ASectionConfigName, 'KeyFile', KeyFile);
  AConfig.WriteString(ASectionConfigName, 'Password', Password);
  AConfig.WriteString(ASectionConfigName, 'RootCertFile', RootCertFile);
end;

procedure TAuthenticator.Execute;
begin
  Execute(nil);
end;

procedure TAuthenticator.Execute(const AExecute: TAuthExecute);
var
  LIdHTTP: TIdHTTP;
  LIdSSLIOHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  LIdHTTP := nil;
  LIdSSLIOHandler := nil;
  try
    if not IsTokenValid then
    begin
      BeforeExecute(LIdHTTP, LIdSSLIOHandler);
      DoExecute(LIdHTTP);
      AfterExecute(LIdHTTP);
    end;
    if Assigned(AExecute) then
    begin
      AExecute(CSRFToken, Token);
    end;
  finally
    FreeAndNil(LIdSSLIOHandler);
    FreeAndNil(LIdHTTP);
  end;
end;

procedure TAuthenticator.SetCSRFToken(const AValue: string);
begin
  var LConfig := TIniFile.Create(GetPucomexConfig);
  try
    LConfig.WriteString(GetSectionConfigName, 'x-csrf-token', AValue);
  finally
    FreeAndNil(LConfig);
  end;
end;

procedure TAuthenticator.SetExpiredToken;
begin
  ExpiresAt := '0';
end;

procedure TAuthenticator.SetExpiresAt(const AValue: string);
begin
  var LConfig := TIniFile.Create(GetPucomexConfig);
  try
    LConfig.WriteString(GetSectionConfigName, 'ExpiresAt', DateTimeToISO8601(UnixMilliToDateTime(AValue.ToInt64 - 10800000)));
  finally
    FreeAndNil(LConfig);
  end;
end;

procedure TAuthenticator.SetResource(const AValue: string);
begin
  FResource := AValue;
end;

procedure TAuthenticator.SetToken(const AValue: string);
begin
  var LConfig := TIniFile.Create(GetPucomexConfig);
  try
    LConfig.WriteString(GetSectionConfigName, 'set-token', AValue);
  finally
    FreeAndNil(LConfig);
  end;
end;

end.

