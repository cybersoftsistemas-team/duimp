unit pucomex.dom.Contracts.Attributes;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Attributes.Ncm,
  pucomex.dom.Contracts.Authentication;

type
  IAttributes = interface(IAuthentication)
    ['{6B8C6E02-280C-457A-B5EF-557ED03AFBAC}']
    function GetNcm: INcmAttributes;
    property Ncm: INcmAttributes read GetNcm;
  end;

implementation

end.
