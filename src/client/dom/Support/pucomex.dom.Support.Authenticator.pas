unit pucomex.dom.Support.Authenticator;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Authenticator;

  function Authenticator: IAuthenticator;

implementation

uses
{PROJECT}
  pucomex.dom.Authenticator;

var
  InternalAuthenticator: IAuthenticator;

function Authenticator: IAuthenticator;
begin
  Result := InternalAuthenticator;
end;

initialization
begin
  InternalAuthenticator := TAuthenticator.Create;
end;

finalization
begin
  InternalAuthenticator := nil;
end;

end.
