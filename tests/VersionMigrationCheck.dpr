program VersionMigrationCheck;
{$APPTYPE CONSOLE}
uses
  System.SysUtils, System.Classes, System.Variants, System.RegularExpressions, Data.DB, REST.Json,
  FireDAC.Comp.Client, FireDAC.Stan.Intf, pucomex.dom.Support.RecordVersion,
  cbsMigrations.Support.Migration,
  cbsMigrations.Contracts.Migrations.MigrationCommand,
  cbsMigrations.Contracts.Schema.MigrationsSqlGenerators.SqlServerMigrationsSqlGenerator,
  cbsMigrations.Schema.MigrationsSqlGenerators.SqlServerMigrationsSqlGenerator,
  pucomex.dom.Duimps.Model.ProdutoConsultaItemCover,
  pucomex.dom.Duimps.Model.PagamentoDuimpConsultaCover,
  _2025_05_28_00000001_create_duimp_versoes_table,
  _2025_05_28_00000002_create_duimp_pagamentos_table,
  _2025_05_28_00000018_create_duimp_capas_itens_table,
  _2026_11_12_00000001_create_duimp_comparar_versoes_function,
  _2026_11_12_00000002_alter_duimp_versoes_version_text,
  _2026_11_12_00000003_alter_duimp_pagamentos_version_text,
  _2026_11_12_00000004_alter_duimp_capas_itens_version_text,
  _2026_11_12_00000005_alter_duimp_itens_fabricantes_version_text,
  _2026_11_12_00000006_alter_duimp_itens_exportadores_version_text;
var
  Generator: ISqlServerMigrationsSqlGenerator;
  UpSql: TStringList;
procedure Check(Condition: Boolean; const Message: string);
begin
  if not Condition then raise Exception.Create(Message);
end;
procedure CheckMigration(MigrationClass: MigrationType; ExpectedColumns: Integer);
var
  Migration: TMigration;
  Command: IMigrationCommand;
  UpText, DownText: string;
  ColumnCount, PosStart, Found: Integer;
begin
  Migration := MigrationClass.Create(DriverID.MSSQL);
  try
    UpText := ''; DownText := '';
    for Command in Generator.Generate(Migration.UpOperations) do
    begin
      UpSql.Add(Command.CommandText);
      UpSql.Add('GO');
      UpText := UpText + Command.CommandText;
    end;
    for Command in Generator.Generate(Migration.DownOperations) do
    begin
      DownText := DownText + Command.CommandText;
    end;
    ColumnCount := 0; PosStart := 1;
    repeat
      Found := Pos('NVARCHAR(MAX)', UpText, PosStart);
      if Found = 0 then Break;
      Inc(ColumnCount); PosStart := Found + 1;
    until False;
    Check(ColumnCount = ExpectedColumns, 'Incorrect altered columns for ' + MigrationClass.ClassName);
    if ExpectedColumns > 0 then
    begin
      Check(Pos('BETWEEN 2 AND 19998', UpText) > 0, 'Length constraint missing');
      Check(Pos('THROW 50003', DownText) > 0, 'Unsafe rollback');
    end;
    Writeln('PASS: ', MigrationClass.ClassName, ' generates Up and Down SQL');
  finally
    Migration.Free;
  end;
end;
function MigrationUpText(MigrationClass: MigrationType): string;
var
  Migration: TMigration;
  Command: IMigrationCommand;
begin
  Result := '';
  Migration := MigrationClass.Create(DriverID.MSSQL);
  try
    for Command in Generator.Generate(Migration.UpOperations) do
      Result := Result + Command.CommandText + sLineBreak;
  finally
    Migration.Free;
  end;
end;
procedure CheckDependencies(OldClass, NewClass: MigrationType; const ColumnName: string;
  ExpectedDependencies: Integer);
var
  OldText, NewText, DropToken, Name, Pattern: string;
  Match: TMatch;
  AlterPosition, DropPosition, Count, Kind: Integer;
begin
  OldText := MigrationUpText(OldClass);
  NewText := MigrationUpText(NewClass);
  AlterPosition := Pos('ALTER COLUMN "' + ColumnName + '"', NewText);
  Check(AlterPosition > 0, 'Missing ALTER COLUMN for ' + ColumnName);
  Count := 0;
  for Kind := 0 to 1 do
  begin
    if Kind = 0 then
      Pattern := 'CONSTRAINT\s+"(?<name>[^"]+)"\s+UNIQUE\s*\((?<columns>[^)]*)\)'
    else
      Pattern := 'CREATE\s+INDEX\s+"(?<name>[^"]+)"\s+ON\s+[^\(]+\((?<columns>[^)]*)\)';
    for Match in TRegEx.Matches(OldText, Pattern) do
    begin
      if not TRegEx.IsMatch(Match.Groups['columns'].Value.Replace('"', ''),
        '(^|,)\s*' + ColumnName + '\s*(,|$)') then Continue;
      Name := Match.Groups['name'].Value;
      if Kind = 0 then DropToken := 'DROP CONSTRAINT [' + Name + ']'
      else DropToken := 'DROP INDEX [' + Name + ']';
      DropPosition := Pos(DropToken, NewText);
      Check((DropPosition > 0) and (DropPosition < AlterPosition),
        'Dependency not removed before ALTER COLUMN: ' + Name);
      Inc(Count);
    end;
  end;
  Check(Count = ExpectedDependencies, 'Unexpected legacy dependency count for ' + ColumnName);
  Writeln('PASS: all ', Count, ' legacy dependencies removed before altering ', ColumnName);
end;
procedure CheckLengthValidation;
var
  Rejected: Boolean;
begin
  ValidateRecordVersion('1');
  ValidateRecordVersion('1.1');
  ValidateRecordVersion(StringOfChar('a', 9999));
  Rejected := False;
  try ValidateRecordVersion(''); except on E: Exception do Rejected := True; end;
  Check(Rejected, 'Empty versions must be rejected');
  Rejected := False;
  try ValidateRecordVersion(StringOfChar('a', 10000)); except on E: Exception do Rejected := True; end;
  Check(Rejected, '10000-character versions must be rejected');
  Writeln('PASS: version validation accepts 1..9999 characters and rejects empty/10000');
end;
procedure CheckMemoVersions;
var
  Data: TFDMemTable;
  LongVersion: string;
begin
  Data := TFDMemTable.Create(nil);
  try
    Data.FieldDefs.Add('VersaoOrigem', ftWideMemo);
    Data.FieldDefs.Add('Tributo', ftString, 20);
    Data.CreateDataSet;
    Data.AppendRecord(['1.1', 'PIS']);
    LongVersion := StringOfChar('2', 9999);
    Data.AppendRecord([LongVersion, 'COFINS']);
    Check(Data.LocateEx('VersaoOrigem;Tributo', VarArrayOf(['1.1', 'PIS'])),
      'Cannot locate a payment by textual version');
    Check(Data.LocateEx('VersaoOrigem;Tributo', VarArrayOf([LongVersion, 'COFINS'])),
      'Cannot locate a payment by a long version');
    Check(Data.FieldByName('VersaoOrigem').AsString = LongVersion, 'Memo version truncated');
    Writeln('PASS: FireDAC stores and locates dotted/9999-character memo versions');
  finally
    Data.Free;
  end;
end;
procedure CheckJson;
var
  Product: TProdutoConsultaItemCover;
  Payment: TPagamentoDuimpConsultaCover;
  Version: string;
begin
  Product := TJson.JsonToObject<TProdutoConsultaItemCover>('{"versao":"1.1"}');
  try Check(Product.Versao = '1.1', 'Dotted product version changed'); finally Product.Free; end;
  Product := TJson.JsonToObject<TProdutoConsultaItemCover>('{"versao":12}');
  try Check(Product.Versao = '12', 'Existing numeric API versions are incompatible'); finally Product.Free; end;
  Payment := TJson.JsonToObject<TPagamentoDuimpConsultaCover>('{"versaoOrigem":"1.10"}');
  try Check(Payment.VersaoOrigem = '1.10', 'Payment version changed'); finally Payment.Free; end;
  Version := StringOfChar('1', 9999);
  Product := TJson.JsonToObject<TProdutoConsultaItemCover>('{"versao":"' + Version + '"}');
  try Check(Product.Versao = Version, 'Long product version truncated'); finally Product.Free; end;
  Writeln('PASS: JSON preserves dotted, numeric and 9999-character versions');
end;
begin
  UpSql := TStringList.Create;
  try
    try
      Generator := TSqlServerMigrationsSqlGenerator.Create;
      CheckMigration(CreateDuimpCompararVersoesFunction, 0);
      CheckMigration(AlterDuimpVersoesVersionText, 1);
      CheckMigration(AlterDuimpPagamentosVersionText, 1);
      CheckMigration(AlterDuimpCapasItensVersionText, 3);
      CheckMigration(AlterDuimpItensFabricantesVersionText, 1);
      CheckMigration(AlterDuimpItensExportadoresVersionText, 1);
      CheckDependencies(CreateVersoesTable, AlterDuimpVersoesVersionText, 'Versao', 3);
      CheckDependencies(CreatePagamentosTable, AlterDuimpPagamentosVersionText, 'VersaoOrigem', 1);
      CheckDependencies(CreateCapasItensTable, AlterDuimpCapasItensVersionText, 'ProdutoVersao', 1);
      CheckJson;
      CheckLengthValidation;
      CheckMemoVersions;
      UpSql.SaveToFile(ExtractFilePath(ParamStr(0)) + 'versions-up.sql', TEncoding.UTF8);
    except
      on E: Exception do begin Writeln('FAIL: ', E.Message); ExitCode := 1; end;
    end;
  finally
    UpSql.Free;
  end;
end.
