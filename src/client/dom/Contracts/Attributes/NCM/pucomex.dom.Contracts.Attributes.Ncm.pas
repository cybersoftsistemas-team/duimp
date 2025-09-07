unit pucomex.dom.Contracts.Attributes.Ncm;

interface

uses
{IDE}
  System.JSON,
{PROJECT}
  pucomex.dom.Attributes.Ncm.Model.NcmAtributos,
  pucomex.dom.Contracts.Http.Response;

type
  INcmAttributesResponse = interface(IResponse)
    ['{D7994ABA-1444-4BBA-BEAB-BCD643CAEA5A}']
    function GetContent: TNcmAtributos;
    function ToJSONObject: TJSONObject;
    property Content: TNcmAtributos read GetContent;
  end;

  TNcmResponseEvent = reference to procedure(const AResponse: INcmAttributesResponse);

  INcmAttributes = interface
  ['{422A60E7-C8BC-4321-A2A9-08693D5834F3}']
    procedure Get(const ANcm: string; const AResponseEvent: TNcmResponseEvent);
  end;

implementation

end.
