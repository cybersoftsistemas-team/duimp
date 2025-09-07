unit pucomex.dom.Contracts.Http.Response.LoteValidacaoVersao;

interface

uses
{IDE}
  System.Generics.Collections,
{PROJECT}
  pucomex.dom.Contracts.Http.Response,
  pucomex.dom.Http.Model.Response.LoteValidacaoVersaoDTO;

type
  ILVVResponse = interface(IResponse)
    ['{7BB35CE0-9EB3-44AB-A3F8-52D59910A703}']
    function GetContent: TEnumerable<TLoteValidacaoVersaoDTO>;
    property Content: TEnumerable<TLoteValidacaoVersaoDTO> read GetContent;
  end;

  TLVVResponseEvent = reference to procedure(const AResponse: ILVVResponse);

implementation

end.
