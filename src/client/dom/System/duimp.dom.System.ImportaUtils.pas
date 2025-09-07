unit duimp.dom.System.ImportaUtils;

interface

uses
{IDE}
  System.Classes;

  function ApenasNumeros(const ATexto: string): string;
  function QuebraString(ABaseString: string; const ABreakString: string): TStringList;
  function PegaParte(ATexto, AInicio, AFim: string): string;
  function ProcessNumberGenValue(AMascara: string; ANumero: Integer; AAno: Integer; AForma: string; ADigitosAno: Integer): string;
  function RemoveCaracter(APesquisarPor, ATrocarPor, ATexto: string): string;

implementation

uses
{IDE}
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

// Função para pegar uma parte da string informando um mcarcador inicial e um final.
function PegaParte(ATexto, AInicio, AFim: string): string;
var
  LPos: Integer;
  LTam: Integer;
  LTexto: string;
begin
  if not ATexto.Trim.IsEmpty then
  begin
     // Remove o codigo do sistema da descricao.
     if Pos('<{', ATexto) > 0 then
     begin
       ATexto := Copy(ATexto, 1, Pos('<{', ATexto) -1);
     end;
     if not AInicio.Trim.IsEmpty and not AFim.Trim.IsEmpty then
     begin
       LPos   := Pos(AInicio, ATexto);
       LTam   := Pos(AFim, ATexto) - LPos;
       LTexto := Copy(ATexto, LPos, LTam);
       LTexto := RemoveCaracter(AInicio, '', LTexto);
       LTexto := RemoveCaracter(AFim, '', LTexto);
     end;
     if AInicio.Trim.IsEmpty and not AFim.Trim.IsEmpty then
     begin
       LPos   := 1;
       LTam   := Pos(AFim, ATexto) - LPos;
       LTexto := Copy(ATexto, LPos, LTam);
       LTexto := RemoveCaracter(AFim, '', LTexto);
     end;
     if not AInicio.Trim.IsEmpty and AFim.Trim.IsEmpty then
     begin
       LPos   := Pos(AInicio, ATexto);
       LTam   := 20;
       LTexto := Copy(ATexto, LPos, LTam);
       LTexto := RemoveCaracter(AInicio, '', LTexto);
     end;
  end;
  Result := LTexto;
end;

{ Gera o número do processo de importação. }
function ProcessNumberGenValue(AMascara: string; ANumero: Integer; AAno: Integer; AForma: string; ADigitosAno: Integer): string;
var
  LAno: string;
begin
  if ADigitosAno = 4 then
  begin
    LAno := AAno.ToString;
    AMascara := Copy(AMascara, 1, 5);
  end
  else
  begin
    LAno := Copy(AAno.ToString, 3, 2);
    AMascara := Copy(AMascara, 1, 7);
  end;
  // Mascara + Número.
  if AForma = 'MN'  then
  begin
    if not AMascara.Trim.IsEmpty then
    begin
      Result := Concat(AMascara.Trim, '-', Format('%4.4d',[ANumero]));
    end
    else
      Result := Concat(AMascara.Trim, '-', InttoStr(ANumero));
  end;
  // Mascara + Número + Ano.
  if AForma = 'MNA' then
  begin
    Result := Concat(Trim(AMascara), '-', Format('%4.4d',[ANumero]), '/', LAno);
  end;
  // Mascara + Ano + Número.
  if AForma = 'MAN' then
  begin
    Result := Concat(Trim(AMascara), '-', LAno, '/', Format('%4.4d',[ANumero]));
  end;
  // Número + Ano + Mascara.
  if AForma = 'NAM' then
  begin
    Result := Concat(Format('%4.4d',[ANumero]), '/', LAno, '-', Trim(AMascara));
  end;
  // Ano + Número + Mascara.
  if AForma = 'ANM' then
  begin
    Result := Concat(LAno, '/', Format('%4.4d',[ANumero]), '-', Trim(AMascara));
  end;
  Result := Result.Trim;
end;

// Substitui texto informado dentro de outro.
function RemoveCaracter(APesquisarPor, ATrocarPor, ATexto: string): string;
var
  LPos: Integer;
  LTam: Integer;
  LTempStr: string;
  LTempOriginal: string;
begin
  LTempStr := '';
  LTempOriginal := ATexto;
  LTam := Length(APesquisarPor);
  repeat
    LPos := Pos(APesquisarPor, LTempOriginal);
    if LPos <> 0 then
    begin
      LTempStr := LTempStr + Copy(LTempOriginal, 1, LPos-1);
      LTempStr := LTempStr + ATrocarPor;
      LTempOriginal := Copy(LTempOriginal, LPos + LTam, Length(LTempOriginal));
    end
    else
    begin
      LTempStr := LTempStr + LTempOriginal;
    end;
  until LPos = 0;
  Result := LTempStr;
end;

end.
