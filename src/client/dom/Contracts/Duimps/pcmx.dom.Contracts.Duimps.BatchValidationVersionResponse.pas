unit pcmx.dom.Contracts.Duimps.BatchValidationVersionResponse;

interface

uses
{IDE}
  System.Generics.Collections,
{PROJECT}
  pucomex.dom.Contracts.Http.Response,
  pcmx.Support.Response.LoteValidacaoVersao;

type
  IBVVResponse = interface(IResponse)
    ['{7BB35CE0-9EB3-44AB-A3F8-52D59910A703}']
    function GetContent: TEnumerable<TLoteValidacaoVersao>;
    property Content: TEnumerable<TLoteValidacaoVersao> read GetContent;
  end;

  TBVVResponseEvent = reference to procedure(const AResponse: IBVVResponse);

implementation

end.
