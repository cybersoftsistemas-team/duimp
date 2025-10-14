unit pucomex.dom.Duimp;

interface

uses
{IDE}
  System.IniFiles,
{PROJECT}
  pucomex.dom.Contracts.Authenticator,
  pucomex.dom.Contracts.Duimp,
  pucomex.dom.Duimps.Model.DuimpConsultaCover,
  pucomex.dom.Duimps.Model.ItemConsultaDuimpCover,
  pucomex.dom.Duimps.Model.ItemDuimpCover,
  pucomex.dom.Http;

type
  TDuimp = class(THttp, IDuimp)
  strict private
    FNI_ESTADO: string;
    FNI_IMPORTADOR: string;
    function GetCpfCnpjRaiz: string;
    function GetItemLink(const AItems: TArray<TItemConsultaDuimpCover>; const ANumeroItem: Integer): string;
    function GetNI_ESTADO: string;
    function GetNI_IMPORTADOR: string;
    procedure SetNI_ESTADO(const AValue: string);
    procedure SetNI_IMPORTADOR(const AValue: string);
  strict protected
    function GetSectionConfigName: string; override;
    procedure DoLoadConfig(const ASectionConfigName: string; const AConfig: TIniFile); override;
    procedure DoSaveConfig(const ASectionConfigName: string; const AConfig: TIniFile); override;
  public
    constructor Create(const AAuthenticator: IAuthenticator);
    function GetItemCover(const AItems: TArray<TItemConsultaDuimpCover>; const ANumeroItem: Integer): TItemDuimpCover;
    procedure Get(const ANumber: string; const AVersao: Integer; const AResponseEvent: TDuimpResponseEvent;
      const AErroResponseEvent: TApiErroResponseEvent = nil);
    procedure GetCurrentVersion(const ANumber: string; const AResponseEvent: TDuimpVersaoResponseEvent);
    property CpfCnpjRaiz: string read GetCpfCnpjRaiz;
    property NI_ESTADO: string read GetNI_ESTADO write SetNI_ESTADO;
    property NI_IMPORTADOR: string read GetNI_IMPORTADOR write SetNI_IMPORTADOR;
  end;

implementation

uses
{IDE}
  REST.Json,
  System.Classes,
  System.Generics.Collections,
  System.Generics.Defaults,
  System.JSON,
  System.SysUtils,
{PROJECT}
  pucomex.dom.Duimp.DuimpResponse,
  pucomex.dom.Duimp.DuimpVersaoResponse;

{ TDuimp }

constructor TDuimp.Create(const AAuthenticator: IAuthenticator);
begin
  inherited Create;
  Authenticator := AAuthenticator;
  BaseURL := AAuthenticator.BaseURL;
end;

function TDuimp.GetCpfCnpjRaiz: string;
begin
  Result := FNI_IMPORTADOR.Substring(0, 8);
end;

function TDuimp.GetItemCover(const AItems: TArray<TItemConsultaDuimpCover>; const ANumeroItem: Integer): TItemDuimpCover;
begin
  var LItem: TItemDuimpCover := nil;
  try
    DoGet(Concat('duimp-api/api/', GetItemLink(AItems, ANumeroItem)),
      procedure(const AResponseContent: TStringStream; const AResponseCode: Integer)
      begin
        if AResponseCode = 200 then
        begin
          var LData := TJSONObject.ParseJSONValue(AResponseContent.DataString) as TJSONObject;
          try
            LItem := TJson.JsonToObject<TItemDuimpCover>(LData.ToJSON);
          finally
            FreeAndNil(LData);
          end;
        end;
      end);
  finally
    Result := LItem;
  end;
end;

function TDuimp.GetItemLink(const AItems: TArray<TItemConsultaDuimpCover>; const ANumeroItem: Integer): string;
var
  LFoundIndex: Integer;
begin
  var LItem := TItemConsultaDuimpCover.Create;
  try
    LItem.Indice := ANumeroItem;
    if TArray.BinarySearch<TItemConsultaDuimpCover>(AItems, LItem, LFoundIndex,
      TComparer<TItemConsultaDuimpCover>.Construct(
        function(const ALeft, ARight: TItemConsultaDuimpCover): Integer
        begin
          Result := ALeft.Indice - ARight.Indice;
        end)) then
    begin
      Exit(AItems[LFoundIndex].Link);
    end;
  finally
    FreeAndNil(LItem);
  end;
  Result := '';
end;

function TDuimp.GetNI_ESTADO: string;
begin
  Result := FNI_ESTADO;
end;

function TDuimp.GetNI_IMPORTADOR: string;
begin
  Result := FNI_IMPORTADOR;
end;

function TDuimp.GetSectionConfigName: string;
begin
  Result := 'DuimpKeyCovers';
end;

procedure TDuimp.DoLoadConfig(const ASectionConfigName: string; const AConfig: TIniFile);
begin
  FNI_IMPORTADOR := AConfig.ReadString(ASectionConfigName, 'NI_IMPORTADOR', '');
end;

procedure TDuimp.DoSaveConfig(const ASectionConfigName: string; const AConfig: TIniFile);
begin
  AConfig.WriteString(ASectionConfigName, 'NI_IMPORTADOR', FNI_IMPORTADOR);
end;

procedure TDuimp.Get(const ANumber: string; const AVersao: Integer; const AResponseEvent: TDuimpResponseEvent;
  const AErroResponseEvent: TApiErroResponseEvent);
var
  LParams: string;
begin
  if ANumber.Trim.IsEmpty then
  begin
    raise Exception.Create('É nescessário informar um número de Duimp para realizar a consulta.');
  end;
  LParams := Concat(ANumber, '/', AVersao.ToString);
  DoGet(Concat('duimp-api/api/ext/duimp/', LParams),
    procedure(const AResponseContent: TStringStream; const AResponseCode: Integer)
    var
      LDuimpResponse: IDuimpResponse;
    begin
      if AResponseCode = 200 then
      begin
        LDuimpResponse := TDuimpResponse.Create(AResponseContent.DataString, AResponseCode);
        AResponseEvent(LDuimpResponse);
      end;
    end);
end;

procedure TDuimp.GetCurrentVersion(const ANumber: string; const AResponseEvent: TDuimpVersaoResponseEvent);
var
  LParams: string;
begin
  if ANumber.Trim.IsEmpty then
  begin
    raise Exception.Create('É nescessário informar um número de Duimp para realizar a consulta.');
  end;
  LParams := Concat(ANumber, '/versoes');
  DoGet(Concat('duimp-api/api/ext/duimp/', LParams),
    procedure(const AResponseContent: TStringStream; const AResponseCode: Integer)
    var
      LDuimpVersaoResponse: IDuimpVersaoResponse;
    begin
      if AResponseCode = 200 then
      begin
        LDuimpVersaoResponse := TDuimpVersaoResponse.Create(AResponseContent.DataString, AResponseCode);
        AResponseEvent(LDuimpVersaoResponse);
      end;
    end);
end;

procedure TDuimp.SetNI_ESTADO(const AValue: string);
begin
  FNI_ESTADO := AValue;
end;

procedure TDuimp.SetNI_IMPORTADOR(const AValue: string);
begin
  FNI_IMPORTADOR := AValue;
end;

end.
