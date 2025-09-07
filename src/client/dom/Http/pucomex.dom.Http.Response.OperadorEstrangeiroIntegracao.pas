unit pucomex.dom.Http.Response.OperadorEstrangeiroIntegracao;

interface

uses
{IDE}
  System.Generics.Collections,
{PROJECT}
  pucomex.dom.Contracts.Http.Response.OperadorEstrangeiroIntegracao,
  pucomex.dom.Duimps.Model.OperadorEstrangeiroIntegracaoDTO,
  pucomex.dom.Http.Response;

type
  TOEIResponse = class(TResponse, IOEIResponse)
  strict private
    FContent: TObjectList<TOperadorEstrangeiroIntegracaoDTO>;
    function GetContent: TEnumerable<TOperadorEstrangeiroIntegracaoDTO>;
  strict protected
    procedure SetContent(const ADataString: string); override;
  public
    destructor Destroy; override;
    function Extract(const AValue: TOperadorEstrangeiroIntegracaoDTO): TOperadorEstrangeiroIntegracaoDTO;
    property Content: TEnumerable<TOperadorEstrangeiroIntegracaoDTO> read GetContent;
  end;

implementation

uses
{IDE}
  REST.JSON,
  System.JSON,
  System.SysUtils;

{ TOEIResponse }

destructor TOEIResponse.Destroy;
begin
  FreeAndNil(FContent);
  inherited;
end;

function TOEIResponse.Extract(const AValue: TOperadorEstrangeiroIntegracaoDTO): TOperadorEstrangeiroIntegracaoDTO;
begin
  Result := FContent.Extract(AValue);
end;

function TOEIResponse.GetContent: TEnumerable<TOperadorEstrangeiroIntegracaoDTO>;
begin
  Result := FContent;
end;

procedure TOEIResponse.SetContent(const ADataString: string);
var
  I: Integer;
  LData: TJSONArray;
begin
  LData := TJSONObject.ParseJSONValue(ADataString) as TJSONArray;
  try
    if Assigned(LData) then
    begin
      FContent := TObjectList<TOperadorEstrangeiroIntegracaoDTO>.Create;
      for I := 0 to Pred(LData.Count) do
      begin
        FContent.Add(TJson.JsonToObject<TOperadorEstrangeiroIntegracaoDTO>(LData.Items[I].ToJSON));
      end;
    end;
  finally
    FreeAndNil(LData);
  end;
end;

end.
