unit pucomex.dom.Http.Response;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Http.Response;

type
  TResponse = class abstract(TInterfacedObject, IResponse)
  strict private
    FDataString: string;
    FResponseCode: Integer;
    function GetDataString: string;
    function GetResponseCode: Integer;
  protected
    procedure SetContent(const ADataString: string); dynamic; abstract;
  public
    constructor Create(const ADataString: string; const AResponseCode: Integer);
    property DataString: string read GetDataString;
    property ResponseCode: Integer read GetResponseCode;
  end;

implementation

{ TResponse }

constructor TResponse.Create(const ADataString: string; const AResponseCode: Integer);
begin
  inherited Create;
  FDataString := ADataString;
  FResponseCode := AResponseCode;
  SetContent(FDataString);
end;

function TResponse.GetDataString: string;
begin
  Result := FDataString;
end;

function TResponse.GetResponseCode: Integer;
begin
  Result := FResponseCode;
end;

end.
