unit pucomex.dom.Attributes.Ncm;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Attributes.Ncm,
  pucomex.dom.Contracts.Authenticator,
  pucomex.dom.Http;

type
  TNcmAttributes = class(THttp, INcmAttributes)
  public
    constructor Create(const AAuthenticator: IAuthenticator);
    procedure Get(const ANcm: string; const AResponseEvent: TNcmResponseEvent);
  end;

implementation

uses
{IDE}
  System.Classes,
  System.SysUtils,
{PROJECT}
  pucomex.dom.Attributes.NcmAttributesResponse;

{ TNcmAttributes }

constructor TNcmAttributes.Create(const AAuthenticator: IAuthenticator);
begin
  inherited Create;
  Authenticator := AAuthenticator;
end;

procedure TNcmAttributes.Get(const ANcm: string; const AResponseEvent: TNcmResponseEvent);
begin
  if ANcm.Trim.IsEmpty then
  begin
    raise Exception.Create('É nescessário informar um número de N.C.M. para realizar a consulta.');
  end;
  DoGet(Concat('cadatributos/api/ext/atributo-ncm/', ANcm),
    procedure(const AResponseContent: TStringStream; const AResponseCode: Integer)
    var
      LResponse: TNcmAttributesResponse;
    begin
      LResponse := TNcmAttributesResponse.Create(AResponseContent.DataString, AResponseCode);
      try
        AResponseEvent(LResponse);
      finally
        FreeAndNil(LResponse);
      end;
    end);
end;

end.
