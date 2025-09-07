unit pucomex.dom.Products.ProductResponse;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Products,
  pucomex.dom.Duimps.Model.ProdutoIntegracaoDTO,
  pucomex.dom.Http.Response;

type
  TProductResponse = class(TResponse, IProductResponse)
  strict private
    FContent: TProdutoIntegracaoDTO;
    function GetContent: TProdutoIntegracaoDTO;
  protected
    procedure SetContent(const ADataString: string); override;
  public
    destructor Destroy; override;
    property Content: TProdutoIntegracaoDTO read GetContent;
  end;

implementation

uses
{IDE}
  REST.JSON,
  System.JSON,
  System.SysUtils;

{ TProductResponse }

destructor TProductResponse.Destroy;
begin
  FreeAndNil(FContent);
  inherited;
end;

function TProductResponse.GetContent: TProdutoIntegracaoDTO;
begin
  Result := FContent;
end;

procedure TProductResponse.SetContent(const ADataString: string);
var
  LData: TJSONObject;
begin
  inherited;
  LData := TJSONObject.ParseJSONValue(ADataString) as TJSONObject;
  try
    if Assigned(LData) then
    begin
      FContent := TJson.JsonToObject<TProdutoIntegracaoDTO>(LData);
    end;
  finally
    FreeAndNil(LData);
  end;
end;

end.
