unit pucomex.dom.Contracts.Http.Response.LoteValidacao;

interface

uses
{IDE}
  System.Generics.Collections,
{PROJECT}
  pucomex.dom.Contracts.Http.Response,
  pucomex.dom.Http.Model.Response.LoteValidacaoDTO;

type
  ILVResponse = interface(IResponse)
    ['{7BB35CE0-9EB3-44AB-A3F8-52D59910A703}']
    function GetContent: TEnumerable<TLoteValidacaoDTO>;
    property Content: TEnumerable<TLoteValidacaoDTO> read GetContent;
  end;

  TLVResponseEvent = reference to procedure(const AResponse: ILVResponse);

implementation

end.
