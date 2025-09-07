unit pucomex.dom.Contracts.Support.PUComex;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Attributes,
  pucomex.dom.Contracts.Duimp,
  pucomex.dom.Contracts.Products;

type
  IPUComex = interface
    ['{56D1C581-1C89-41DC-B279-7FB73B77B83C}']
    function Attributes: IAttributes;
    function Duimp: IDuimp;
    function Products: IProducts;
  end;

implementation

end.
