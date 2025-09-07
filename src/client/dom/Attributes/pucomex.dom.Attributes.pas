unit pucomex.dom.Attributes;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Authenticator,
  pucomex.dom.Contracts.Attributes,
  pucomex.dom.Contracts.Attributes.Ncm,
  pucomex.dom.Http;

type
  TAttributes = class(THttp, IAttributes)
  strict private
    FNcm: INcmAttributes;
    function GetNcm: INcmAttributes;
  public
    constructor Create(const AAuthenticator: IAuthenticator);
    destructor Destroy; override;
    property Ncm: INcmAttributes read GetNcm;
  end;

implementation

uses
{PROJECT}
  pucomex.dom.Attributes.Ncm;

{ TAttributes }

constructor TAttributes.Create(const AAuthenticator: IAuthenticator);
begin
  inherited Create;
  Authenticator := AAuthenticator;
  FNcm := TNcmAttributes.Create(AAuthenticator);
  BaseURL := AAuthenticator.BaseURL;
end;

destructor TAttributes.Destroy;
begin
  FNcm := nil;
  inherited Destroy;
end;

function TAttributes.GetNcm: INcmAttributes;
begin
  Result := FNcm;
end;

end.
