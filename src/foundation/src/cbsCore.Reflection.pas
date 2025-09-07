unit cbsCore.Reflection;

interface

type
  TObjectExtensions = class Helper for TObject
  public
    class function JsonStringToObject<T: class, constructor>(const AValue: string): T; static;
    class procedure FreeArrayOfObjects<T: class>(const AItems: TArray<T>); static;
    function IIF<T>(const AValue: Boolean; const ATrue: T; AFalse: T): T;
  end;

implementation

uses
{IDE}
  REST.Json,
  System.JSON;

{ TObjectExtensions }

class procedure TObjectExtensions.FreeArrayOfObjects<T>(const AItems: TArray<T>);
var
  LItem: T;
begin
  for LItem in AItems do
  begin
    LItem.Free;
  end;
end;

function TObjectExtensions.IIF<T>(const AValue: Boolean; const ATrue: T; AFalse: T): T;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

class function TObjectExtensions.JsonStringToObject<T>(const AValue: string): T;
begin
  Result := TJson.JsonToObject<T>(TJSONObject.ParseJSONValue(AValue) as TJSONObject);
end;

end.

