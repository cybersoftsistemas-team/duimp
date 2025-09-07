unit pucomex.dom.Http;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Authenticator,
  pucomex.dom.Contracts.Http,
{IDE}
  IdHeaderList,
  IdHTTP,
  IdSSLOpenSSL,
  System.Classes,
  System.IniFiles,
  System.SysUtils;

type
  TRequestEvent = reference to procedure(const ARequest: TIdHTTP; const AResponseContent: TStringStream);
  TResponseContentEvent = reference to procedure(const AResponseContent: TStringStream; const AResponseCode: Integer);

  THttp = class(TInterfacedObject, IHttp)
  private
    FAuthenticator: IAuthenticator;
    FBaseURL: string;
    FCertFile: TFileName;
    FHeaders: TIdHeaderList;
    FIniFile: TFileName;
    FKeyFile: string;
    FPassword: string;
    FRootCertFile: string;
    function GetAuthenticator: IAuthenticator;
    function GetBaseURL: string;
    function GetCertFile: TFileName;
    function GetHeaders: TIdHeaderList;
    function GetIniFile: TFileName;
    function GetKeyFile: string;
    function GetPassword: string;
    function GetRootCertFile: string;
    procedure IdSSLGetPassword(var Password: string);
    procedure SetAuthenticator(const AValue: IAuthenticator);
    procedure SetBaseURL(const AValue: string);
    procedure SetCertFile(const AValue: TFileName);
    procedure SetIniFile(const AValue: TFileName);
    procedure SetKeyFile(const AValue: string);
    procedure SetPassword(const AValue: string);
    procedure SetRootCertFile(const AValue: string);
  protected
    function CreateRequest: TIdHTTP; overload;
    function GetSectionConfigName: string; dynamic; abstract;
    procedure CreateIdHTTP(out AIdHTTP: TIdHTTP; const AIdSSLIOHandler: TIdSSLIOHandlerSocketOpenSSL);
    procedure CreateIOHandler(out AIdSSLIOHandler: TIdSSLIOHandlerSocketOpenSSL);
    procedure CreateRequest(const AResponseContentEvent: TResponseContentEvent; const ARequestEvent: TRequestEvent); overload;
    procedure DoLoadConfig(const ASectionConfigName: string; const AConfig: TIniFile); dynamic; abstract;
    procedure DoSaveConfig(const ASectionConfigName: string; const AConfig: TIniFile); dynamic; abstract;
    procedure DoGet(const AResource: string; const AResponseContentEvent: TResponseContentEvent); overload;
    procedure DoGet(const AResource: string; AParams: string; const AResponseContentEvent: TResponseContentEvent); overload;
    procedure DoPost(const AResource: string; const ASource: TStream; const AResponseContentEvent: TResponseContentEvent);
    property Authenticator: IAuthenticator read GetAuthenticator write SetAuthenticator;
    property CertFile: TFileName read GetCertFile write SetCertFile;
    property Headers: TIdHeaderList read GetHeaders;
    property KeyFile: string read GetKeyFile write SetKeyFile;
    property Password: string read GetPassword write SetPassword;
    property RootCertFile: string read GetRootCertFile write SetRootCertFile;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadConfig;
    procedure SaveConfig;
    property BaseURL: string read GetBaseURL write SetBaseURL;
    property IniFile: TFileName read GetIniFile write SetIniFile;
  end;

implementation

uses
{IDE}
  IdGlobalProtocols,
  IdIOHandler,
  System.JSON,
  System.NetEncoding;

{ THttp }

constructor THttp.Create;
begin
  inherited Create;
  FHeaders := TIdHeaderList.Create(QuoteHTTP);
end;

destructor THttp.Destroy;
begin
  FBaseURL := '';
  FCertFile := '';
  FIniFile := '';
  FKeyFile := '';
  FPassword := '';
  FRootCertFile := '';
  FreeAndNil(FHeaders);
  inherited;
end;

function THttp.CreateRequest: TIdHTTP;
var
  LIdSSLIOHandler: TIdSSLIOHandlerSocketOpenSSL;
  LRequest: TIdHTTP;
begin
  FAuthenticator.Execute(
    procedure(const ACSRFToken: string; const AToken: string)
    begin
      Headers.Clear;
      Headers.AddValue('Authorization', AToken);
      Headers.AddValue('X-CSRF-Token', ACSRFToken);
    end);
  CreateIOHandler(LIdSSLIOHandler);
  CreateIdHTTP(LRequest, LIdSSLIOHandler);
  Result := LRequest;
end;

function THttp.GetAuthenticator: IAuthenticator;
begin
  Result := FAuthenticator;
end;

function THttp.GetBaseURL: string;
begin
  Result := FBaseURL;
end;

function THttp.GetCertFile: TFileName;
begin
  Result := FCertFile;
end;

function THttp.GetHeaders: TIdHeaderList;
begin
  Result := FHeaders;
end;

function THttp.GetIniFile: TFileName;
begin
  Result := FIniFile;
end;

function THttp.GetKeyFile: string;
begin
  Result := FKeyFile;
end;

function THttp.GetPassword: string;
begin
  Result := FPassword;
end;

function THttp.GetRootCertFile: string;
begin
  Result := FRootCertFile;
end;

procedure THttp.CreateIdHTTP(out AIdHTTP: TIdHTTP; const AIdSSLIOHandler: TIdSSLIOHandlerSocketOpenSSL);
begin
  AIdHTTP := TIdHTTP.Create(nil);
  AIdHTTP.AllowCookies := True;
  AIdHTTP.HandleRedirects := True;
  AIdHTTP.HTTPOptions := [hoKeepOrigProtocol];
  AIdHTTP.IOHandler := AIdSSLIOHandler;
  AIdHTTP.Request.Accept := 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';
  AIdHTTP.Request.AcceptCharSet := 'utf-8,pt-BR,pt;q=0.8,en-US;q=0.5,en;q=0.3';
  AIdHTTP.Request.AcceptLanguage := 'pt-BR';
  AIdHTTP.Request.CharSet := 'UTF-8';
  AIdHTTP.Request.ContentType := 'application/json';
  AIdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618);';
  AIdHTTP.Request.CustomHeaders.Clear;
  AIdHTTP.Request.CustomHeaders.Assign(FHeaders);
  AIdHTTP.Response.Clear;
  AIdHTTP.Response.ContentType := 'application/json; charset=utf-8';
  AIdHTTP.Response.CharSet := 'UTF-8';
  AIdHTTP.Response.KeepAlive := True;
end;

procedure THttp.CreateIOHandler(out AIdSSLIOHandler: TIdSSLIOHandlerSocketOpenSSL);
begin
  AIdSSLIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  AIdSSLIOHandler.SSLOptions.RootCertFile := FRootCertFile;
  AIdSSLIOHandler.SSLOptions.CertFile := FCertFile;
  AIdSSLIOHandler.SSLOptions.KeyFile := FKeyFile;
  AIdSSLIOHandler.SSLOptions.Mode := sslmClient;
  AIdSSLIOHandler.SSLOptions.Method := sslvTLSv1;
  AIdSSLIOHandler.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
  AIdSSLIOHandler.OnGetPassword := IdSSLGetPassword;
end;

procedure THttp.CreateRequest(const AResponseContentEvent: TResponseContentEvent; const ARequestEvent: TRequestEvent);
var
  LErrorMessage: string;
  LIdIOHandler: TIdIOHandler;
  LJSONErrors: TJSONArray;
  LJSONErrorMessage: TJSONObject;
  LJSONMessage: TJSONObject;
  LRequest: TIdHTTP;
  LResponseContent: TStringStream;
begin
  LRequest := CreateRequest;
  try
    LResponseContent := TStringStream.Create('', TEncoding.UTF8);
    try
      try
        ARequestEvent(LRequest, LResponseContent);
        AResponseContentEvent(LResponseContent, LRequest.ResponseCode);
      except
        on E: EIdHTTPProtocolException do
        begin
          LErrorMessage := E.Message;
          try
            LJSONMessage := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetString(BytesOf(E.ErrorMessage))) as TJSONObject;
            if Assigned(LJSONMessage) then
            begin
              try
                LErrorMessage := LJSONMessage.GetValue<string>('message');
                LJSONErrors := LJSONMessage.GetValue('errors') as TJSONArray;
                if Assigned(LJSONErrors) then
                begin
                  LJSONErrorMessage := LJSONErrors.Items[0] as TJSONObject;
                  LErrorMessage := Concat(LErrorMessage, ' ', LJSONErrorMessage.GetValue<string>('message'));
                end;
              finally
                FreeAndNil(LJSONMessage);
              end;
            end;
          finally
            raise Exception.Create(LErrorMessage);
          end;
        end;
        on E: Exception do
        begin
          raise Exception.Create(E.Message);
        end;
      end;
    finally
      FreeAndNil(LResponseContent);
    end;
  finally
    LIdIOHandler := LRequest.IOHandler;
    FreeAndNil(LIdIOHandler);
    LRequest.IOHandler := nil;
    FreeAndNil(LRequest);
  end;
end;

procedure THttp.DoGet(const AResource: string; const AResponseContentEvent: TResponseContentEvent);
begin
  DoGet(AResource, '', AResponseContentEvent);
end;

procedure THttp.DoGet(const AResource: string; AParams: string; const AResponseContentEvent: TResponseContentEvent);
begin
  if not AParams.Trim.IsEmpty then
  begin
    AParams := '?' + AParams;
  end;
  CreateRequest(AResponseContentEvent,
    procedure(const ARequest: TIdHTTP; const AResponseContent: TStringStream)
    begin
      ARequest.Get(BaseURL.TrimLeft(['/']) + '/' + AResource.TrimLeft(['/']) + TNetEncoding.URL.EncodeQuery(AParams), AResponseContent);
    end);
end;

procedure THttp.DoPost(const AResource: string; const ASource: TStream; const AResponseContentEvent: TResponseContentEvent);
begin
  CreateRequest(AResponseContentEvent,
    procedure(const ARequest: TIdHTTP; const AResponseContent: TStringStream)
    begin
      ARequest.Post(BaseURL.TrimLeft(['/']) + '/' + AResource.TrimLeft(['/']), ASource, AResponseContent);
    end);
end;

procedure THttp.IdSSLGetPassword(var Password: string);
begin
  Password := FPassword;
end;

procedure THttp.LoadConfig;
var
  LConfig: TIniFile;
  LSectionConfigName: string;
begin
  LConfig := TIniFile.Create(FIniFile);
  LSectionConfigName := GetSectionConfigName;
  try
    FBaseURL := LConfig.ReadString(LSectionConfigName, 'BaseURL', '');
    DoLoadConfig(LSectionConfigName, LConfig);
  finally
    FreeAndNil(LConfig);
  end;
end;

procedure THttp.SaveConfig;
var
  LConfig: TIniFile;
  LSectionConfigName: string;
begin
  LConfig := TIniFile.Create(FIniFile);
  LSectionConfigName := GetSectionConfigName;
  try
    LConfig.WriteString(LSectionConfigName, 'BaseURL', FBaseURL);
    DoSaveConfig(LSectionConfigName, LConfig);
  finally
    FreeAndNil(LConfig);
  end;
end;

procedure THttp.SetAuthenticator(const AValue: IAuthenticator);
begin
  FAuthenticator := AValue;
  if Assigned(FAuthenticator) then
  begin
    CertFile := FAuthenticator.CertFile;
    KeyFile := FAuthenticator.KeyFile;
    Password := FAuthenticator.Password;
    RootCertFile := FAuthenticator.RootCertFile;
    if string(FIniFile).IsEmpty then
    begin
      FIniFile := FAuthenticator.IniFile;
    end;
    if string(BaseURL).IsEmpty then
    begin
      BaseURL := FAuthenticator.BaseURL;
    end;
  end
  else
  begin
    CertFile := '';
    KeyFile := '';
    Password := '';
    RootCertFile := '';
  end;
end;

procedure THttp.SetBaseURL(const AValue: string);
begin
  FBaseURL := AValue;
end;

procedure THttp.SetCertFile(const AValue: TFileName);
begin
  FCertFile := AValue;
  FKeyFile := FCertFile;
  if FKeyFile.Trim.IsEmpty then
  begin
    FKeyFile := FCertFile;
  end;
end;

procedure THttp.SetIniFile(const AValue: TFileName);
begin
  FIniFile := AValue;
end;

procedure THttp.SetKeyFile(const AValue: string);
begin
  FKeyFile := AValue;
end;

procedure THttp.SetPassword(const AValue: string);
begin
  FPassword := AValue;
end;

procedure THttp.SetRootCertFile(const AValue: string);
begin
  FRootCertFile := AValue;
end;

end.
