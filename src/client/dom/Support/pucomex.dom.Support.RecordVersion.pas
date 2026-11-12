unit pucomex.dom.Support.RecordVersion;

interface

const
  MaxRecordVersionLength = 9999;

procedure ValidateRecordVersion(const AValue: string; const AFieldName: string = 'Versao');

implementation

uses
  System.SysUtils;

procedure ValidateRecordVersion(const AValue, AFieldName: string);
begin
  if (Length(AValue) < 1) or (Length(AValue) > MaxRecordVersionLength) then
    raise Exception.CreateFmt('O campo %s deve conter de 1 a %d caracteres.',
      [AFieldName, MaxRecordVersionLength]);
end;

end.