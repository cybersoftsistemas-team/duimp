unit pucomex.dom.Contracts.Authenticator;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Http;

type
  TAuthExecute = reference to procedure(const ACSRFToken: string; const AToken: string);

  IAuthenticator = interface(IHttp)
    ['{FBCD40E1-468D-40FF-89B3-F39B1445E425}']
    function GetBaseURL: string;
    function GetResource: string;
    procedure Execute; overload;
    procedure Execute(const AExecute: TAuthExecute); overload;
    procedure SetBaseURL(const AValue: string);
    procedure SetResource(const AValue: string);
    property BaseURL: string read GetBaseURL write SetBaseURL;
    property Resource: string read GetResource write SetResource;
  end;

implementation

end.
