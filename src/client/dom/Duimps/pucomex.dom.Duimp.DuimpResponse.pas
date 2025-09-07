unit pucomex.dom.Duimp.DuimpResponse;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Duimp,
  pucomex.dom.Duimps.Model.DuimpConsultaCover,
  pucomex.dom.Http.Response;

type
  TDuimpResponse = class(TResponse, IDuimpResponse)
  strict private
    FContent: TDuimpConsultaCover;
    function GetContent: TDuimpConsultaCover;
  protected
    procedure SetContent(const ADataString: string); override;
  public
    destructor Destroy; override;
    property Content: TDuimpConsultaCover read GetContent;
  end;

implementation

uses
{IDE}
  REST.JSON,
  System.JSON,
  System.SysUtils;

{ TDuimpResponse }

destructor TDuimpResponse.Destroy;
begin
  FreeAndNil(FContent);
  inherited;
end;

function TDuimpResponse.GetContent: TDuimpConsultaCover;
begin
  Result := FContent;
end;

procedure TDuimpResponse.SetContent(const ADataString: string);
var
  LData: TJSONObject;
begin
  inherited;
  LData := TJSONObject.ParseJSONValue(ADataString) as TJSONObject;
  try
    if Assigned(LData) then
    begin
      FContent := TJson.JsonToObject<TDuimpConsultaCover>(LData);
    end;
  finally
    FreeAndNil(LData);
  end;
end;

end.
