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
begin
  var LValue := TJSONObject.ParseJSONValue(ADataString);
  try
    if not Assigned(LValue) then
      Exit;
    FContent := TObjectList<TOperadorEstrangeiroIntegracaoDTO>.Create;
    // Quando vier como objeto único
    if LValue is TJSONObject then
    begin
      var LArray := TJSONArray.Create;
      try
        // Clona o objeto para o array
        var LObject := TJSONObject.ParseJSONValue(LValue.ToJSON) as TJSONObject;
        LArray.AddElement(LObject);
        for var I := 0 to Pred(LArray.Count) do
        begin
          FContent.Add(
            TJson.JsonToObject<TOperadorEstrangeiroIntegracaoDTO>(
              LArray.Items[I].ToJSON
            )
          );
        end;
      finally
        LArray.Free;
      end;
    end
    // Quando vier como array
    else if LValue is TJSONArray then
    begin
      var LArray := LValue as TJSONArray;
      for var I := 0 to Pred(LArray.Count) do
      begin
        FContent.Add(
          TJson.JsonToObject<TOperadorEstrangeiroIntegracaoDTO>(
            LArray.Items[I].ToJSON
          )
        );
      end;
    end;
  finally
    LValue.Free;
  end;
end;

end.
