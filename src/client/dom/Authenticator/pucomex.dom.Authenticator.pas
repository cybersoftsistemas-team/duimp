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
    FCSRFToken: WideString;
    FExpiresAt: string;
    FToken: WideString;
    function GetCSRFToken: WideString;
    function GetExpiresAt: string;
    function GetResource: string;
    function GetToken: WideString;
    function IsTokenValid: Boolean;
    procedure SetCSRFToken(const AValue: WideString);
    procedure SetExpiresAt(const AValue: string);
    procedure SetResource(const AValue: string);
    procedure SetToken(const AValue: WideString);
  protected
    function GetSectionConfigName: string; override;
    procedure AfterExecute(const AIdHTTP: TIdHTTP);
    procedure BeforeExecute(out AIdHTTP: TIdHTTP; out AIdSSLIOHandler: TIdSSLIOHandlerSocketOpenSSL);
    procedure DoExecute(const AIdHTTP: TIdHTTP);
    procedure DoLoadConfig(const ASectionConfigName: string; const AConfig: TIniFile); override;
    procedure DoSaveConfig(const ASectionConfigName: string; const AConfig: TIniFile); override;
    procedure SetExpiredToken;
    property CSRFToken: WideString read GetCSRFToken write SetCSRFToken;
    property ExpiresAt: string read GetExpiresAt write SetExpiresAt;
    property Token: WideString read GetToken write SetToken;
  public
    constructor Create;
    procedure UpdateSession(const AToken, ACSRFToken, AExpiresAt: string);
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

{ TAuthenticator }

constructor TAuthenticator.Create;
begin
  inherited Create;
  SetExpiredToken;
end;

function TAuthenticator.GetCSRFToken: WideString;
begin
  Result := FCSRFToken;
end;

function TAuthenticator.GetExpiresAt: string;
begin
  Result := FExpiresAt;
end;

function TAuthenticator.GetResource: string;
begin
  Result := FResource;
end;

function TAuthenticator.GetSectionConfigName: string;
begin
  Result := 'Authenticator';
end;

function TAuthenticator.GetToken: WideString;
begin
  Result := FToken;
end;

function TAuthenticator.IsTokenValid: Boolean;
var
  LExpiresAt: Int64;
  LCurrentTime: Int64;
begin
  Result := False;

  if Trim(Token).IsEmpty or Trim(CSRFToken).IsEmpty then
    Exit;

  if not TryStrToInt64(ExpiresAt, LExpiresAt) then
    Exit;

  LCurrentTime := DateTimeToUnix(
    TTimeZone.Local.ToUniversalTime(Now)
  ) * 1000;

  // Margem de segurança de 60 segundos.
  Result := LCurrentTime < (LExpiresAt - 60000);
end;

procedure TAuthenticator.AfterExecute(const AIdHTTP: TIdHTTP);
var
  LToken: string;
  LCSRFToken: string;
  LExpiresAt: string;
begin
  LToken := AIdHTTP.Response.RawHeaders.Values['Set-Token'];
  LCSRFToken := AIdHTTP.Response.RawHeaders.Values['X-CSRF-Token'];
  LExpiresAt := AIdHTTP.Response.RawHeaders.Values['X-CSRF-Expiration'];

  if LToken.Trim.IsEmpty or
     LCSRFToken.Trim.IsEmpty or
     LExpiresAt.Trim.IsEmpty then
  begin
    SetExpiredToken;

    raise Exception.Create(
      'Falha na autenticação do Portal Único Siscomex. ' +
      'A resposta não contém todos os headers necessários.'
    );
  end;

  UpdateSession(LToken, LCSRFToken, LExpiresAt);
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

procedure TAuthenticator.UpdateSession(const AToken, ACSRFToken, AExpiresAt: string);
begin
  // Preserve the complete values returned by the portal, without INI size limits.
  if not AToken.IsEmpty then
    Token := AToken;
  if not ACSRFToken.IsEmpty then
    CSRFToken := ACSRFToken;
  if not AExpiresAt.IsEmpty then
    ExpiresAt := AExpiresAt;
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

procedure TAuthenticator.SetCSRFToken(const AValue: WideString);
begin
  FCSRFToken := AValue;
end;

procedure TAuthenticator.SetExpiredToken;
begin
  ExpiresAt := '';
  Token := '';
  CSRFToken := '';
end;

procedure TAuthenticator.SetExpiresAt(const AValue: string);
var
  LExpiresAt: Int64;
begin
  if TryStrToInt64(AValue, LExpiresAt) then
    FExpiresAt := IntToStr(LExpiresAt)
  else
    FExpiresAt := '';
end;

procedure TAuthenticator.SetResource(const AValue: string);
begin
  FResource := AValue;
end;

procedure TAuthenticator.SetToken(const AValue: WideString);
begin
  FToken := AValue;
end;

end.

