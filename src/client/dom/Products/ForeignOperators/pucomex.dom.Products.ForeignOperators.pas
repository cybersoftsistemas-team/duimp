unit pucomex.dom.Products.ForeignOperators;

interface

uses
{IDE}
  System.Classes,
{PROJECT}
  pucomex.dom.Contracts.Authenticator,
  pucomex.dom.Contracts.Http.Response.LoteValidacaoVersao,
  pucomex.dom.Contracts.Http.Response.OperadorEstrangeiroIntegracao,
  pucomex.dom.Contracts.Products.ForeignOperators,
  pucomex.dom.Http;

type
  TForeignOperators = class(THttp, IForeignOperators)
  public
    constructor Create(const AAuthenticator: IAuthenticator);
    procedure GetByID(const ACodigo: string; const ACpfCnpjRaiz: string; const ACodigoPais: string; const AResponseEvent: TOEIResponseEvent);
    procedure Get(const ANome: string; const ACpfCnpjRaiz: string; const ACodigoPais: string; const AResponseEvent: TOEIResponseEvent);
    procedure Post(const ABody: TStream; const AResponseEvent: TLVVResponseEvent);
  end;

implementation

uses
{IDE}
  System.SysUtils,
{PROJECT}
  pucomex.dom.Http.Response.LoteValidacaoVersao,
  pucomex.dom.Http.Response.OperadorEstrangeiroIntegracao;

{ TForeignOperators }

constructor TForeignOperators.Create(const AAuthenticator: IAuthenticator);
begin
  inherited Create;
  Authenticator := AAuthenticator;
end;

procedure TForeignOperators.Get(const ANome: string; const ACpfCnpjRaiz: string; const ACodigoPais: string; const AResponseEvent: TOEIResponseEvent);
var
  LParams: string;
begin
  LParams := 'nome=' + ANome + '&cpfCnpjRaiz=' + ACpfCnpjRaiz + '&paisOrigem=' + ACodigoPais;
  DoGet('catp/api/ext/operador-estrangeiro', LParams,
    procedure(const AResponseContent: TStringStream; const AResponseCode: Integer)
    begin
      AResponseEvent(TOEIResponse.Create(AResponseContent.DataString, AResponseCode));
    end);
end;

procedure TForeignOperators.GetByID(const ACodigo, ACpfCnpjRaiz, ACodigoPais: string;
  const AResponseEvent: TOEIResponseEvent);
var
  LParams: string;
begin
  LParams := 'codigo=' + ACodigo + '&cpfCnpjRaiz=' + ACpfCnpjRaiz + '&paisOrigem=' + ACodigoPais;
  DoGet('catp/api/ext/operador-estrangeiro', LParams,
    procedure(const AResponseContent: TStringStream; const AResponseCode: Integer)
    var
      LOEI: TOEIResponse;
    begin
      LOEI := TOEIResponse.Create(AResponseContent.DataString, AResponseCode);
      try
        AResponseEvent(LOEI);
      finally
        FreeAndNil(LOEI);
      end;
    end);
end;

procedure TForeignOperators.Post(const ABody: TStream; const AResponseEvent: TLVVResponseEvent);
begin
  DoPost('catp/api/ext/operador-estrangeiro', ABody,
    procedure(const AResponseContent: TStringStream; const AResponseCode: Integer)
    begin
      AResponseEvent(TLVVResponse.Create(AResponseContent.DataString, AResponseCode));
    end);
end;

end.
