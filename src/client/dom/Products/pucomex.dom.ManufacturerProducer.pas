unit pucomex.dom.ManufacturerProducer;

interface

uses
{IDE}
  System.Classes,
{PROJECT}
  pucomex.dom.Contracts.Authenticator,
  pucomex.dom.Contracts.Http.Response.LoteValidacao,
  pucomex.dom.Contracts.ManufacturerProducer,
  pucomex.dom.Http;

type
  TManufacturerProducer = class(THttp, IManufacturerProducer)
  public
    constructor Create(const AAuthenticator: IAuthenticator);
    procedure Post(const ABody: TStream; const AResponseEvent: TLVResponseEvent = nil);
  end;

implementation

uses
{PROJECT}
  pucomex.dom.Http.Response.LoteValidacao;

{ TManufacturerProducer }

constructor TManufacturerProducer.Create(const AAuthenticator: IAuthenticator);
begin
  inherited Create;
  Authenticator := AAuthenticator;
end;

procedure TManufacturerProducer.Post(const ABody: TStream; const AResponseEvent: TLVResponseEvent);
begin
  DoPost('catp/api/ext/fabricante', ABody,
    procedure(const AResponseContent: TStringStream; const AResponseCode: Integer)
    begin
      if Assigned(AResponseEvent) then
      begin
        AResponseEvent(TLVResponse.Create(AResponseContent.DataString, AResponseCode));
      end;
    end);
end;

end.
