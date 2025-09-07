unit pucomex.dom.Http.Response.LoteValidacao;

interface

uses
{IDE}
  System.Generics.Collections,
{PROJECT}
  pucomex.dom.Contracts.Http.Response.LoteValidacao,
  pucomex.dom.Http.Model.Response.LoteValidacaoDTO,
  pucomex.dom.Http.Response;

type
  TLVResponse = class(TResponse, ILVResponse)
  strict private
    FContent: TObjectList<TLoteValidacaoDTO>;
    function GetContent: TEnumerable<TLoteValidacaoDTO>;
  strict protected
    procedure SetContent(const ADataString: string); override;
  public
    destructor Destroy; override;
    property Content: TEnumerable<TLoteValidacaoDTO> read GetContent;
  end;

implementation

uses
{IDE}
  REST.JSON,
  System.JSON,
  System.SysUtils;

{ TLVResponse }

destructor TLVResponse.Destroy;
begin
  FreeAndNil(FContent);
  inherited;
end;

function TLVResponse.GetContent: TEnumerable<TLoteValidacaoDTO>;
begin
  Result := FContent;
end;

procedure TLVResponse.SetContent(const ADataString: string);
var
  I: Integer;
  LData: TJSONArray;
begin
  LData := TJSONObject.ParseJSONValue(ADataString) as TJSONArray;
  try
    if Assigned(LData) then
    begin
      FContent := TObjectList<TLoteValidacaoDTO>.Create;
      for I := 0 to Pred(LData.Count) do
      begin
        FContent.Add(TJson.JsonToObject<TLoteValidacaoDTO>(LData.Items[I].ToJSON));
      end;
    end;
  finally
    FreeAndNil(LData);
  end;
end;

end.
