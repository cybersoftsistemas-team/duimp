unit pucomex.dom.Support.ProductAttributes;

interface

function NormalizeBooleanAttributeValue(const AValue, AAttribute: string): string;

implementation

uses
  System.SysUtils;

function NormalizeBooleanAttributeValue(const AValue, AAttribute: string): string;
var
  LValue: string;
begin
  LValue := AValue.Trim;
  // Empty optional attributes are omitted by the product exporter.
  if LValue.IsEmpty then
    Exit('');
  if SameText(LValue, 'true') or SameText(LValue, 'SIM') or (LValue = '1') then
    Exit('true');
  if SameText(LValue, 'false') or SameText(LValue, 'NAO') or
    SameText(LValue, 'N' + #$00C3 + 'O') or (LValue = '0') then
    Exit('false');
  raise EConvertError.CreateFmt(
    'Atributo %s: valor booleano invalido. Informe true ou false.', [AAttribute]);
end;

end.