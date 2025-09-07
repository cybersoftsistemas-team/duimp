unit cbsCore.SysUtils;

interface

uses
{IDE}
  System.Classes;

type
  TCertificateInfo = class
  private
    FValidFrom: TDateTime;
    FThumb: string;
    FSubject: string;
    FIssuer: string;
    FValidTo: TDateTime;
  public
    property Subject: string read FSubject write FSubject;
    property Issuer: string read FIssuer write FIssuer;
    property ValidFrom: TDateTime read FValidFrom write FValidFrom;
    property ValidTo: TDateTime read FValidTo write FValidTo;
    property Thumb: string read FThumb write FThumb;
  end;

  function ApenasNumeros(const ATexto: string): string;
  function GetCpfOrCnpfMask(const AValue: string): string;
  function GerarHashSHA256(const AText: string): string;
  function GetOnlyNumbers(const AValue: string): string;
  function NormalizeAdvancedText(const AText: string): string;
  function QuebraString(ABaseString: string; const ABreakString: string): TStringList;
  function StringTimeStampToDateTime(const ADate: string): TDateTime;
  function VarToBool(const V: Variant): Boolean;
  function VarToCurr(const V: Variant): Currency;
  function VarToInt(const V: Variant): Integer;

implementation

uses
{IDE}
  System.Character,
  System.DateUtils,
  System.Hash,
  System.RegularExpressions,
  System.SysUtils;

// Remove caracteres de uma string deixando apenas numeros.
function ApenasNumeros(const ATexto: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 To Length(ATexto) do if
    CharInSet(ATexto[i], ['0'..'9']) then
  begin
    Result := Result + Copy(ATexto, I, 1);
  end;
end;

function GetOnlyNumbers(const AValue: string): string;
var
  I: Integer;
begin
  for I := 1 to Length(AValue) do
  begin
    if AValue[I].IsDigit then
      Result := Result + AValue[i];
  end;
end;

function NormalizeAdvancedText(const AText: string): string;
var
  I: Integer;
  LCleanText: string;
  LLine: string;
  SL: TStringList;
begin
  // Remove comentários de bloco /* ... */
  LCleanText := TRegEx.Replace(AText, '/\*.*?\*/', '', [roSingleLine, roIgnoreCase]);
  // Remove comentários de LLine --
  LCleanText := TRegEx.Replace(LCleanText, '--.*$', '', [roMultiline]);
  // Divide em linhas
  SL := TStringList.Create;
  try
    SL.Text := LCleanText;
    for I := SL.Count - 1 downto 0 do
    begin
      LLine := Trim(SL[I]);
      if LLine = '' then
        SL.Delete(I)
      else
      begin
        LLine := StringReplace(LLine, #9, ' ', [rfReplaceAll]); // Remove TAB
        SL[I] := LLine;
      end;
    end;
    // Junta tudo em uma LLine
    Result := SL.Text.Replace(sLineBreak, ' ', [rfReplaceAll]);
    // Remove múltiplos espaços
    while Pos('  ', Result) > 0 do
    begin
      Result := StringReplace(Result, '  ', ' ', [rfReplaceAll]);
    end;
    // Normaliza case e espaços
    Result := LowerCase(Trim(Result));
  finally
    SL.Free;
  end;
end;


// Função para quebra string em partes.
function QuebraString(ABaseString: string; const ABreakString: string): TStringList;
var
  LEndOfCurrentString: Integer;
begin
  Result := TStringList.create;
  repeat
    LEndOfCurrentString := Pos(ABreakString, ABaseString);
    if LEndOfCurrentString = 0 then
    begin
      Result.Add(ABaseString);
    end
    else
      Result.Add(Copy(ABaseString, 1, LEndOfCurrentString - 1));
    ABaseString := Copy(ABaseString, LEndOfCurrentString + Length(ABreakString), Length(ABaseString) + 100);
  until LEndOfCurrentString = 0;
end;

function GetCpfOrCnpfMask(const AValue: string): string;
var
  LValue: string;
begin
  // Remove qualquer caractere não numérico (mantém só os números)
  LValue := GetOnlyNumbers(AValue);

  // Aplica a máscara dinamicamente
  case Length(LValue) of
    4..6:
      begin
        // Formato CPF: xxx.XXX
        Result := Format('%s.%s', [Copy(LValue, 1, 3), Copy(LValue, 4, 3)]);
      end;
    7..9:
      begin
        // Formato CPF: xxx.xxx.XXX
        Result := Format('%s.%s.%s', [Copy(LValue, 1, 3), Copy(LValue, 4, 3), Copy(LValue, 7, 3)]);
      end;
    10..11:
      begin
        // Formato CPF: xxx.xxx.xxx-XX
        Result := Format('%s.%s.%s-%s', [Copy(LValue, 1, 3), Copy(LValue, 4, 3), Copy(LValue, 7, 3), Copy(LValue, 10, 2)]);
      end;
    12:
      begin
        // Formato CNPJ: xx.xxx.xxx/XXXX
        Result := Format('%s.%s.%s/%s', [Copy(LValue, 1, 2), Copy(LValue, 3, 3), Copy(LValue, 6, 3), Copy(LValue, 9, 4)]);
      end;
    13..14:
      begin
        // Formato CNPJ: xx.xxx.xxx/xxxx-XX
        Result := Format('%s.%s.%s/%s-%s', [Copy(LValue, 1, 2), Copy(LValue, 3, 3), Copy(LValue, 6, 3), Copy(LValue, 9, 4), Copy(LValue, 13, 2)]);
      end;
    else
      begin
        // Nenhuma formatação especial, apenas números
        Result := LValue;
      end;
  end;
end;

function GerarHashSHA256(const AText: string): string;
begin
  Result := THashSHA2.GetHashString(AText, THashSHA2.TSHA2Version.SHA256);
end;

function StringTimeStampToDateTime(const ADate: string): TDateTime;
var
  LDateTimeStr: string;
  LYear, LMonth, LDay, LHour, LMinute, LSecond: Word;
begin
  if ADate.Trim.IsEmpty then
  begin
    Exit(0);
  end;
  LDateTimeStr := ADate;
  if LDateTimeStr[Length(LDateTimeStr)] = 'Z' then
  begin
    Delete(LDateTimeStr, Length(LDateTimeStr), 1);
  end;
  LYear   := LDateTimeStr.Substring( 0, 4).ToInteger;
  LMonth  := LDateTimeStr.Substring( 5, 2).ToInteger;
  LDay    := LDateTimeStr.Substring( 8, 2).ToInteger;
  LHour   := LDateTimeStr.Substring(11, 2).ToInteger;
  LMinute := LDateTimeStr.Substring(14, 2).ToInteger;
  LSecond := LDateTimeStr.Substring(17, 2).ToInteger;
  Result  := EncodeDateTime(LYear, LMonth, LDay, LHour, LMinute, LSecond, 0);
end;

function VarToBool(const V: Variant): Boolean;
begin
  if TVarData(V).VType <> varNull then
    Result := V
  else
    Result := False;
end;

function VarToCurr(const V: Variant): Currency;
begin
  if TVarData(V).VType <> varNull then
    Result := V
  else
    Result := 0.0;
end;

function VarToInt(const V: Variant): Integer;
begin
  if TVarData(V).VType <> varNull then
    Result := V
  else
    Result := 0;
end;

end.
