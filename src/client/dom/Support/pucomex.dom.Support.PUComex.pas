unit pucomex.dom.Support.PUComex;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Authenticator,
  pucomex.dom.Contracts.Support.PUComex;

  function CreatePUComex(const AAuthenticator: IAuthenticator): IPUComex;

var
  PComex: IPUComex;

implementation

uses
{PROJECT}
  pucomex.dom.PUComex;

function CreatePUComex(const AAuthenticator: IAuthenticator): IPUComex;
begin
  Result := TPUComex.Create(AAuthenticator);
end;

end.
