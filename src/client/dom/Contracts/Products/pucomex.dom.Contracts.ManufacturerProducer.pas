unit pucomex.dom.Contracts.ManufacturerProducer;

interface

uses
{IDE}
  System.Classes,
{PROJECT}
  pucomex.dom.Contracts.Http.Response.LoteValidacao;

type
  IManufacturerProducer = interface
    ['{4B188E58-D56D-4CA5-84D7-E69D737A4484}']
    procedure Post(const ABody: TStream; const AResponseEvent: TLVResponseEvent = nil);
  end;

implementation

end.
