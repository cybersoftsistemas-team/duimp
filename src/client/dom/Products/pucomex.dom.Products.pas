unit pucomex.dom.Products;

interface

uses
{IDE}
  System.Classes,
{PROJECT}
  pucomex.dom.Contracts.Authenticator,
  pucomex.dom.Contracts.Http.Response.LoteValidacaoVersao,
  pucomex.dom.Contracts.ManufacturerProducer,
  pucomex.dom.Contracts.Products,
  pucomex.dom.Contracts.Products.ForeignOperators,
  pucomex.dom.Http;

type
  IProductResponse = pucomex.dom.Contracts.Products.IProductResponse;

  TProducts = class(THttp, IProducts)
  strict private
    FForeignOperators: IForeignOperators;
    FManufacturerProducer: IManufacturerProducer;
    function GetForeignOperators: IForeignOperators;
    function GetManufacturerProducer: IManufacturerProducer;
  public
    constructor Create(const AAuthenticator: IAuthenticator);
    destructor Destroy; override;
    procedure GetByID(const ACodigo: Integer; const AVersao: Integer; const ACpfCnpjRaiz: string;
      const AResponseEvent: TProductResponseEvent);
    procedure Post(const ABody: TStream; const AResponseEvent: TLVVResponseEvent);
    property ForeignOperators: IForeignOperators read GetForeignOperators;
    property ManufacturerProducer: IManufacturerProducer read GetManufacturerProducer;
  end;

implementation

uses
{IDE}
  System.SysUtils,
{PROJECT}
  pucomex.dom.Http.Response.LoteValidacaoVersao,
  pucomex.dom.ManufacturerProducer,
  pucomex.dom.Products.ForeignOperators,
  pucomex.dom.Products.ProductResponse;

{ TProducts }

constructor TProducts.Create(const AAuthenticator: IAuthenticator);
begin
  inherited Create;
  Authenticator := AAuthenticator;
  FForeignOperators := TForeignOperators.Create(AAuthenticator);
  FManufacturerProducer := TManufacturerProducer.Create(AAuthenticator);
  BaseURL := AAuthenticator.BaseURL;
end;

destructor TProducts.Destroy;
begin
  FForeignOperators := nil;
  FManufacturerProducer := nil;
  inherited;
end;

procedure TProducts.GetByID(const ACodigo: Integer; const AVersao: Integer; const ACpfCnpjRaiz: string; const AResponseEvent: TProductResponseEvent);
var
  LParams: string;
begin
  LParams := Concat(ACpfCnpjRaiz, '/', ACodigo.ToString, '/', AVersao.ToString);
  DoGet(Concat('catp/api/ext/produto/', LParams),
    procedure(const AResponseContent: TStringStream; const AResponseCode: Integer)
    var
      LResponse: TProductResponse;
    begin
      if AResponseCode = 200 then
      begin
        LResponse := TProductResponse.Create(AResponseContent.DataString, AResponseCode);
        try
          AResponseEvent(LResponse);
        finally
          FreeAndNil(LResponse);
        end;
      end;
    end);
end;

function TProducts.GetForeignOperators: IForeignOperators;
begin
  Result := FForeignOperators;
end;

function TProducts.GetManufacturerProducer: IManufacturerProducer;
begin
  Result := FManufacturerProducer;
end;

procedure TProducts.Post(const ABody: TStream; const AResponseEvent: TLVVResponseEvent);
begin
  DoPost('catp/api/ext/produto', ABody,
    procedure(const AResponseContent: TStringStream; const AResponseCode: Integer)
    var
      LResponse: TLVVResponse;
    begin
      LResponse := TLVVResponse.Create(AResponseContent.DataString, AResponseCode);
      try
        AResponseEvent(LResponse);
      finally
        FreeAndNil(LResponse);
      end;
    end);
end;

end.
