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
begin
  var LValue := TJSONObject.ParseJSONValue(ADataString);
  if not Assigned(LValue) then
    Exit;
  try
    if LValue is TJSONObject then
    begin
      var LObject := TJSONObject.ParseJSONValue(LValue.ToJSON) as TJSONObject;
      FContent := TJson.JsonToObject<TProdutoIntegracaoDTO>(LObject.ToJSON);
    end
    else if LValue is TJSONArray then
    begin
      var LArray := LValue as TJSONArray;
      FContent := TJson.JsonToObject<TProdutoIntegracaoDTO>(LArray.Items[0].ToJSON);
    end;
  finally
    LValue.Free;
  end;
end;

end.
