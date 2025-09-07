unit pucomex.dom.PUComex;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Attributes,
  pucomex.dom.Contracts.Authenticator,
  pucomex.dom.Contracts.Duimp,
  pucomex.dom.Contracts.Products,
  pucomex.dom.Contracts.Support.PUComex;

type
  TPUComex = class(TInterfacedObject, IPUComex)
  private
    FAttributes: IAttributes;
    FDuimp: IDuimp;
    FProducts: IProducts;
  public
    constructor Create(const AAuthenticator: IAuthenticator);
    destructor Destroy; override;
    function Attributes: IAttributes;
    function Duimp: IDuimp;
    function Products: IProducts;
  end;

implementation

uses
{PROJECT}
  pucomex.dom.Attributes,
  pucomex.dom.Duimp,
  pucomex.dom.Products;

{ TPUComex }

constructor TPUComex.Create(const AAuthenticator: IAuthenticator);
begin
  inherited Create;
  FAttributes := TAttributes.Create(AAuthenticator);
  FDuimp := TDuimp.Create(AAuthenticator);
  FProducts := TProducts.Create(AAuthenticator);
end;

destructor TPUComex.Destroy;
begin
  FDuimp := nil;
  FProducts := nil;
  FAttributes := nil;
  inherited;
end;

function TPUComex.Attributes: IAttributes;
begin
  Result := FAttributes;
end;

function TPUComex.Duimp: IDuimp;
begin
  Result := FDuimp;
end;

function TPUComex.Products: IProducts;
begin
  Result := FProducts;
end;

end.
