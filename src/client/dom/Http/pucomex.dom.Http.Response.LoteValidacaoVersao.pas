unit pucomex.dom.Http.Response.LoteValidacaoVersao;

interface

uses
{IDE}
  System.Generics.Collections,
{PROJECT}
  pucomex.dom.Contracts.Http.Response.LoteValidacaoVersao,
  pucomex.dom.Http.Model.Response.LoteValidacaoVersaoDTO,
  pucomex.dom.Http.Response;

type
  TLVVResponse = class(TResponse, ILVVResponse)
  strict private
    FContent: TObjectList<TLoteValidacaoVersaoDTO>;
    function GetContent: TEnumerable<TLoteValidacaoVersaoDTO>;
  strict protected
    procedure SetContent(const ADataString: string); override;
  public
    destructor Destroy; override;
    property Content: TEnumerable<TLoteValidacaoVersaoDTO> read GetContent;
  end;

implementation

uses
{IDE}
  REST.JSON,
  System.JSON,
  System.SysUtils;

{ TLVVResponse }

destructor TLVVResponse.Destroy;
begin
  FreeAndNil(FContent);
  inherited;
end;

function TLVVResponse.GetContent: TEnumerable<TLoteValidacaoVersaoDTO>;
begin
  Result := FContent;
end;

procedure TLVVResponse.SetContent(const ADataString: string);
var
  I: Integer;
  LData: TJSONArray;
begin
  LData := TJSONObject.ParseJSONValue(ADataString) as TJSONArray;
  try
    if Assigned(LData) then
    begin
      FContent := TObjectList<TLoteValidacaoVersaoDTO>.Create;
      for I := 0 to Pred(LData.Count) do
      begin
        FContent.Add(TJson.JsonToObject<TLoteValidacaoVersaoDTO>(LData.Items[I].ToJSON));
      end;
    end;
  finally
    FreeAndNil(LData);
  end;
end;

end.
