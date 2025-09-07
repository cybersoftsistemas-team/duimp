unit pucomex.dom.Contracts.Http.Response.OperadorEstrangeiroIntegracao;

interface

uses
{IDE}
  System.Generics.Collections,
{PROJECT}
  pucomex.dom.Contracts.Http.Response,
  pucomex.dom.Duimps.Model.OperadorEstrangeiroIntegracaoDTO;

type
  IOEIResponse = interface(IResponse)
    ['{03793D5B-8074-4DD9-A6E8-145B236E7243}']
    function Extract(const AValue: TOperadorEstrangeiroIntegracaoDTO): TOperadorEstrangeiroIntegracaoDTO;
    function GetContent: TEnumerable<TOperadorEstrangeiroIntegracaoDTO>;
    property Content: TEnumerable<TOperadorEstrangeiroIntegracaoDTO> read GetContent;
  end;

  TOEIResponseEvent = reference to procedure(const AResponse: IOEIResponse);

implementation

end.
