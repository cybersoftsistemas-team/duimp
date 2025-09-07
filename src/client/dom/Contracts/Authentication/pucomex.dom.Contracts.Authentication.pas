unit pucomex.dom.Contracts.Authentication;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Authenticator;

type
  IAuthentication = interface
    ['{F8B18DDD-85FC-4789-B706-12D5F1727734}']
    function GetAuthenticator: IAuthenticator;
    procedure SetAuthenticator(const AValue: IAuthenticator);
    property Authenticator: IAuthenticator read GetAuthenticator write SetAuthenticator;
  end;

implementation

end.
