unit pucomex.dom.Duimp.DuimpVersaoResponse;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Duimp,
  pucomex.dom.Duimps.Model.InformacoesVersaoVigenteCover,
  pucomex.dom.Http.Response;

type
  TDuimpVersaoResponse = class(TResponse, IDuimpVersaoResponse)
  strict private
    FContent: TInformacoesVersaoVigenteCover;
    function GetContent: TInformacoesVersaoVigenteCover;
  protected
    procedure SetContent(const ADataString: string); override;
  public
    destructor Destroy; override;
    property Content: TInformacoesVersaoVigenteCover read GetContent;
  end;

implementation

uses
{IDE}
  REST.JSON,
  System.JSON,
  System.SysUtils;

{ TDuimpVersaoResponse }

destructor TDuimpVersaoResponse.Destroy;
begin
  FreeAndNil(FContent);
  inherited;
end;

function TDuimpVersaoResponse.GetContent: TInformacoesVersaoVigenteCover;
begin
  Result := FContent;
end;

procedure TDuimpVersaoResponse.SetContent(const ADataString: string);
var
  LData: TJSONObject;
begin
  inherited;
  LData := TJSONObject.ParseJSONValue(ADataString) as TJSONObject;
  try
    if Assigned(LData) then
    begin
      FContent := TJson.JsonToObject<TInformacoesVersaoVigenteCover>(LData);
    end;
  finally
    FreeAndNil(LData);
  end;
end;

end.
