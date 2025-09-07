unit pucomex.dom.Contracts.Products;

interface

uses
{IDE}
  System.Classes,
{PROJECT}
  pucomex.dom.Contracts.Http.Response.LoteValidacaoVersao,
  pucomex.dom.Contracts.ManufacturerProducer,
  pucomex.dom.Contracts.Http.Response,
  pucomex.dom.Contracts.Products.ForeignOperators,
  pucomex.dom.Duimps.Model.ProdutoIntegracaoDTO;

type
  IProductResponse = interface(IResponse)
    ['{D7994ABA-1444-4BBA-BEAB-BCD643CAEA5A}']
    function GetContent: TProdutoIntegracaoDTO;
    property Content: TProdutoIntegracaoDTO read GetContent;
  end;

  TProductResponseEvent = reference to procedure(const AResponse: IProductResponse);

  IProducts = interface
    ['{4D0BDF99-41AC-4079-AB8F-4203316895FE}']
    function GetForeignOperators: IForeignOperators;
    function GetManufacturerProducer: IManufacturerProducer;
    procedure GetByID(const ACodigo: Integer; const AVersao: Integer; const ACpfCnpjRaiz: string;
      const AResponseEvent: TProductResponseEvent);
    procedure Post(const ABody: TStream; const AResponseEvent: TLVVResponseEvent);
    property ForeignOperators: IForeignOperators read GetForeignOperators;
    property ManufacturerProducer: IManufacturerProducer read GetManufacturerProducer;
  end;

implementation

end.
