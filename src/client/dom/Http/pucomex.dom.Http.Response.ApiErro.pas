unit pucomex.dom.Http.Response.ApiErro;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Duimp,
  pucomex.dom.Http.Model.Response.RespostaApiErro,
  pucomex.dom.Http.Response;

type
  TApiErroResponse = class(TResponse, IApiErroResponse)
  strict private
    FContent: TRespostaApiErro;
    function GetContent: TRespostaApiErro;
  strict protected
    procedure SetContent(const ADataString: string); override;
  public
    destructor Destroy; override;
    property Content: TRespostaApiErro read GetContent;
  end;

implementation

uses
{IDE}
  REST.JSON,
  System.JSON,
  System.SysUtils;

{ TApiErroResponse }

destructor TApiErroResponse.Destroy;
begin
  FreeAndNil(FContent);
  inherited;
end;

function TApiErroResponse.GetContent: TRespostaApiErro;
begin
  Result := FContent;
end;

procedure TApiErroResponse.SetContent(const ADataString: string);
var
  LData: TJSONObject;
begin
  LData := TJSONObject.ParseJSONValue(ADataString) as TJSONObject;
  try
    if Assigned(LData) then
    begin
      FContent := TJson.JsonToObject<TRespostaApiErro>(LData);
    end;
  finally
    FreeAndNil(LData);
  end;
end;

end.
