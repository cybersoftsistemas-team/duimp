unit pucomex.dom.Attributes.NcmAttributesResponse;

interface

uses
{IDE}
  System.JSON,
{PROJECT}
  pucomex.dom.Attributes.Ncm.Model.NcmAtributos,
  pucomex.dom.Contracts.Attributes.Ncm,
  pucomex.dom.Http.Response;

type
  TNcmAttributesResponse = class(TResponse, INcmAttributesResponse)
  strict private
    FContent: TNcmAtributos;
    FData: TJSONObject;
    function GetContent: TNcmAtributos;
  protected
    procedure SetContent(const ADataString: string); override;
  public
    destructor Destroy; override;
    function ToJSONObject: TJSONObject;
    property Content: TNcmAtributos read GetContent;
  end;

implementation

uses
{IDE}
  REST.JSON,
  System.SysUtils;

{ TNcmAttributesResponse }

destructor TNcmAttributesResponse.Destroy;
begin
  FreeAndNil(FData);
  FreeAndNil(FContent);
  inherited;
end;

function TNcmAttributesResponse.GetContent: TNcmAtributos;
begin
  Result := FContent;
end;

procedure TNcmAttributesResponse.SetContent(const ADataString: string);
begin
  inherited;
  FData := TJSONObject.ParseJSONValue(ADataString) as TJSONObject;
  if Assigned(FData) then
  begin
    FContent := TJson.JsonToObject<TNcmAtributos>(FData);
  end;
end;

function TNcmAttributesResponse.ToJSONObject: TJSONObject;
begin
  Result := FData;
end;

end.
