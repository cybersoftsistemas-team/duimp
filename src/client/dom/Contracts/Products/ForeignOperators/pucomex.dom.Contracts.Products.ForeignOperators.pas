unit pucomex.dom.Contracts.Products.ForeignOperators;

interface

uses
{IDE}
  System.Classes,
{PROJECT}
  pucomex.dom.Contracts.Http.Response.LoteValidacaoVersao,
  pucomex.dom.Contracts.Http.Response.OperadorEstrangeiroIntegracao;

type
  IForeignOperators = interface
    ['{46AF9642-88D0-4900-A8B1-91CB4E0BF4F1}']
    procedure Get(const ANome: string; const ACpfCnpjRaiz: string; const ACodigoPais: string; const AResponseEvent: TOEIResponseEvent);
    procedure Post(const ABody: TStream; const AResponseEvent: TLVVResponseEvent);
  end;

implementation

end.
