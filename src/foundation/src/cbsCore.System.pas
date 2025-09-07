unit cbsCore.System;

interface

  function GetParamValue(const ASwitch: string; const ADefault: string = ''): string;

implementation

uses
{IDE}
  System.SysUtils;

function GetParamValue(const ASwitch, ADefault: string): string;
var
  I: Integer;
begin
  Result := ADefault;
  for I := 1 to ParamCount do
  begin
    if SameText(ParamStr(I), ASwitch) and (I < ParamCount) then
    begin
      Exit(ParamStr(I + 1));
    end;
  end;
end;

end.
