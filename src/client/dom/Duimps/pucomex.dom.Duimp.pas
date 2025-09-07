unit pucomex.dom.Duimp;

interface

uses
{IDE}
  System.IniFiles,
{PROJECT}
  pucomex.dom.Contracts.Authenticator,
  pucomex.dom.Contracts.Duimp,
  pucomex.dom.Duimps.Model.DuimpConsultaCover,
  pucomex.dom.Duimps.Model.ItemDuimpCover,
  pucomex.dom.Http;

type
  TDuimp = class(THttp, IDuimp)
  strict private
    FNI_ESTADO: string;
    FNI_IMPORTADOR: string;
    function GetCpfCnpjRaiz: string;
    function GetNI_ESTADO: string;
    function GetNI_IMPORTADOR: string;
//    procedure SetFabricante(const AItem: TItemDuimpCover);
    procedure SetItems(const ADuimp: TDuimpConsultaCover);
    procedure SetNI_ESTADO(const AValue: string);
    procedure SetNI_IMPORTADOR(const AValue: string);
  strict protected
    function GetSectionConfigName: string; override;
    procedure DoLoadConfig(const ASectionConfigName: string; const AConfig: TIniFile); override;
    procedure DoSaveConfig(const ASectionConfigName: string; const AConfig: TIniFile); override;
  public
    constructor Create(const AAuthenticator: IAuthenticator);
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
        SetItems(LDuimpResponse.Content);
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

//procedure TDuimp.SetFabricante(const AItem: TItemDuimpCover);
//var
//  LForeignOperators: TForeignOperators;
//begin
//  if AItem.Fabricante.Codigo.Trim.IsEmpty then
//  begin
//    Exit;
//  end;
//  LForeignOperators := TForeignOperators.Create(Authenticator);
//  try
//    LForeignOperators.GetByID(AItem.Fabricante.Codigo, CpfCnpjRaiz, AItem.Fabricante.Pais.Codigo,
//      procedure(const AResponse: IOEIResponse)
//      begin
//        if AResponse.ResponseCode = 200 then
//        begin
//          AItem.Fabricante.Detalhes := AResponse.Extract(AResponse.Content.ToArray[0]);
//        end;
//      end);
//  finally
//    FreeAndNil(LForeignOperators);
//  end;
//end;

procedure TDuimp.SetItems(const ADuimp: TDuimpConsultaCover);
var
  LParams: string;
begin
  LParams := Concat(ADuimp.Identificacao.Numero, '/', ADuimp.Identificacao.Versao.ToString, '/itens');
  DoGet(Concat('duimp-api/api/ext/duimp/', LParams),
    procedure(const AResponseContent: TStringStream; const AResponseCode: Integer)
    begin
      if AResponseCode = 200 then
      begin
        var LItemList := TObjectList<TItemDuimpCover>.Create;
        try
          var LJSONArray := TJSONObject.ParseJSONValue(AResponseContent.DataString) as TJSONArray;
          if Assigned(LJSONArray) then
          try
            for var LJSONValue in LJSONArray do
            begin
              LItemList.Add(TJson.JsonToObject<TItemDuimpCover>(LJSONValue as TJSONObject));
            end;
          finally
            FreeAndNil(LJSONArray);
          end;
          ADuimp.ItensDuimpCover := LItemList.ToArray;
        finally
          LItemList.OwnsObjects := False;
          FreeAndNil(LItemList);
        end;
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
