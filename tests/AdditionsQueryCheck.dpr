program AdditionsQueryCheck;
{$APPTYPE CONSOLE}
uses
  System.SysUtils, System.Classes, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Async, FireDAC.Stan.Param,
  FireDAC.DApt, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.SQLiteWrapper.Stat;
var
  Connection: TFDConnection;
  Query: TFDQuery;
  Dfm: TStringList;
  Joins, Component: string;
  InComponent, InJoins: Boolean;
  I, J: Integer;
procedure Check(const Condition: Boolean; const Message: string);
begin
  if not Condition then
    raise Exception.Create(Message);
end;
function ExtractJoins(const ComponentName: string): string;
var
  K: Integer;
  Text: string;
begin
  Result := '';
  InComponent := False;
  InJoins := False;
  for K := 0 to Dfm.Count - 1 do
  begin
    Text := Trim(Dfm[K]);
    if Text = 'object ' + ComponentName + ': TFDQuery' then
      InComponent := True;
    if not InComponent then
      Continue;
    if Text = '''    FROM duimp.capas_itens DCI''' then
      InJoins := True;
    if InJoins then
    begin
      if Text = '''    JOIN CapasItensValores CIV''' then
        Exit;
      Check((Text[1] = #39) and (Text[Length(Text)] = #39), 'Unexpected DFM SQL fragment');
      Result := Result + Copy(Text, 2, Length(Text) - 2) + sLineBreak;
    end;
  end;
  raise Exception.Create('Tax joins not found for ' + ComponentName);
end;
function ExtractValidationSql: string;
var
  Source: TStringList;
  K, FirstQuote, LastQuote: Integer;
  Found: Boolean;
  Text: string;
begin
  Result := '';
  Found := False;
  Source := TStringList.Create;
  try
    Source.LoadFromFile(ChangeFileExt(ParamStr(1), '.pas'));
    for K := 0 to Source.Count - 1 do
    begin
      Text := Trim(Source[K]);
      if Text = 'procedure TdamDuimp.ValidateAdditions;' then
        Found := True;
      if not Found then Continue;
      FirstQuote := Pos(#39, Text);
      if FirstQuote = 0 then Continue;
      LastQuote := Length(Text);
      while (LastQuote > FirstQuote) and (Text[LastQuote] <> #39) do Dec(LastQuote);
      Result := Result + Copy(Text, FirstQuote + 1, LastQuote - FirstQuote - 1);
      if Text[Length(Text)] = ';' then Exit;
    end;
    raise Exception.Create('Missing-item validation SQL not found');
  finally
    Source.Free;
  end;
end;
procedure VerifyMissing(const Expected: Integer);
begin
  Query.Close;
  Query.SQL.Text := StringReplace(ExtractValidationSql, 'duimp.', '', [rfReplaceAll]);
  Query.ParamByName('VersaoId').AsInteger := 1;
  Query.ParamByName('Numero_Declaracao').AsString := 'DUIMP-TEST';
  Query.Open;
  Check(Query.FieldByName('Faltantes').AsInteger = Expected,
    'Incorrect missing-item count: ' + Query.FieldByName('Faltantes').AsString);
  Query.Close;
end;
procedure VerifyItems(const LabelText: string);
begin
  Query.Close;
  Query.SQL.Text := 'SELECT DCI.Id, MAX(CASE WHEN DIC.Tipo = ''II'' THEN VB.Devido END) AS Devido ' +
    Joins + ' GROUP BY DCI.Id ORDER BY DCI.Id';
  Query.Open;
  Query.FetchAll;
  Check(Query.RecordCount = 194, LabelText + ': expected 194 items, got ' + IntToStr(Query.RecordCount));
  Writeln('PASS: ', Component, ' / ', LabelText, ' preserves 194 items');
end;
begin
  Connection := nil;
  Query := nil;
  Dfm := TStringList.Create;
  try
    try
      Check(ParamCount = 1, 'Usage: AdditionsQueryCheck <damDuimp.dfm>');
      Dfm.LoadFromFile(ParamStr(1));
      Connection := TFDConnection.Create(nil);
      Connection.Params.Values['DriverID'] := 'SQLite';
      Connection.Params.Values['Database'] := ':memory:';
      Connection.LoginPrompt := False;
      Connection.Connected := True;
      Query := TFDQuery.Create(nil);
      Query.Connection := Connection;
      Connection.ExecSQL('CREATE TABLE capas_itens (Id INT PRIMARY KEY, CaracterizacaoImportacaoIndicador INT, VersaoId INT, NumeroItem INT)');
      Connection.ExecSQL('CREATE TABLE modalidades (Id INT)');
      Connection.ExecSQL('CREATE TABLE versoes (Id INT, DuimpId INT)');
      Connection.ExecSQL('CREATE TABLE duimps (Id INT)');
      Connection.ExecSQL('INSERT INTO modalidades VALUES (1)');
      Connection.ExecSQL('INSERT INTO versoes VALUES (1, 1)');
      Connection.ExecSQL('INSERT INTO duimps VALUES (1)');
      Connection.ExecSQL('CREATE TABLE itens_tributos (Id INT, CapaItemId INT)');
      Connection.ExecSQL('CREATE TABLE itens_tributos_calculados (Id INT, ItemTributoId INT, Tipo TEXT)');
      Connection.ExecSQL('CREATE TABLE itens_notas_fiscais (CapaItemId INT, Tipo TEXT, PercentualEntrada REAL)');
      Connection.ExecSQL('CREATE TABLE itens_tributos_calculados_memorias_calculos (ItemTributoCalculadoId INT)');
      Connection.ExecSQL('CREATE TABLE itens_tributos_calculados_valores_brl (ItemTributoCalculadoId INT, Devido REAL)');
      Connection.StartTransaction;
      for I := 1 to 194 do
      begin
        Connection.ExecSQL('INSERT INTO capas_itens VALUES (?, 1, 1, ?)', [I, I]);
        Connection.ExecSQL('INSERT INTO itens_tributos VALUES (?, ?)', [I, I]);
        Connection.ExecSQL('INSERT INTO itens_tributos_calculados VALUES (?, ?, ''II'')', [I, I]);
        Connection.ExecSQL('INSERT INTO itens_tributos_calculados_valores_brl VALUES (?, 10)', [I]);
        if I <= 103 then
        begin
          Connection.ExecSQL('INSERT INTO itens_notas_fiscais VALUES (?, ''II'', 2)', [I]);
          Connection.ExecSQL('INSERT INTO itens_tributos_calculados_memorias_calculos VALUES (?)', [I]);
        end;
      end;
      Connection.Commit;
      for J := 1 to 2 do
      begin
        if J = 1 then Component := 'qryDPR' else Component := 'qryITR';
        Joins := StringReplace(ExtractJoins(Component), 'duimp.', '', [rfReplaceAll]);
        Query.SQL.Text := 'SELECT COUNT(DISTINCT DCI.Id) AS Total ' +
          StringReplace(Joins, 'LEFT JOIN', 'JOIN', [rfReplaceAll]);
        Query.Open;
        Check(Query.Fields[0].AsInteger = 103, 'Could not reproduce mandatory-join item loss');
        Query.Close;
        Writeln('PASS: mandatory tax joins reproduce 194 -> 103 items');
        VerifyItems('missing notes and calculation memories');
        Query.Last;
        Check(Query.FieldByName('Devido').AsInteger = 10, 'Missing notes must not hide calculated tax');
      end;
      Connection.ExecSQL('DELETE FROM itens_notas_fiscais');
      Connection.ExecSQL('DELETE FROM itens_tributos_calculados_memorias_calculos');
      Connection.ExecSQL('DELETE FROM itens_tributos_calculados_valores_brl');
      Connection.ExecSQL('DELETE FROM itens_tributos_calculados');
      Connection.ExecSQL('DELETE FROM itens_tributos');
      for J := 1 to 2 do
      begin
        if J = 1 then Component := 'qryDPR' else Component := 'qryITR';
        Joins := StringReplace(ExtractJoins(Component), 'duimp.', '', [rfReplaceAll]);
        VerifyItems('no complementary tax records');
      end;
      Connection.ExecSQL('CREATE TABLE Adicoes (DI TEXT, Sequencia INT)');
      Connection.ExecSQL('INSERT INTO Adicoes SELECT ''DUIMP-TEST'', Id FROM capas_itens WHERE Id <= 103');
      Connection.ExecSQL('INSERT INTO Adicoes SELECT ''OTHER-DUIMP'', Id FROM capas_itens WHERE Id > 103');
      VerifyMissing(91);
      Writeln('PASS: validation detects 91 missing items and ignores another declaration');
      Connection.ExecSQL('INSERT INTO Adicoes SELECT ''DUIMP-TEST'', Id FROM capas_itens WHERE Id > 103');
      Connection.ExecSQL('INSERT INTO capas_itens VALUES (999, 1, 2, 999)');
      VerifyMissing(0);
      Writeln('PASS: validation accepts all 194 items and ignores another version');
    except
      on E: Exception do
      begin
        Writeln('FAIL: ', E.Message);
        ExitCode := 1;
      end;
    end;
  finally
    Query.Free;
    Connection.Free;
    Dfm.Free;
  end;
end.



