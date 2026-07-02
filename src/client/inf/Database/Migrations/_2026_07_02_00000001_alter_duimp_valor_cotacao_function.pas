unit _2026_07_02_00000001_alter_duimp_valor_cotacao_function;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  AlterDuimpValorCotacaoFunction = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ AlterDuimpValorCotacaoFunction }

procedure AlterDuimpValorCotacaoFunction.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
  'IF OBJECT_ID(''duimp.ValorCotacao'', ''FN'') IS NOT NULL ' +
  'BEGIN ' +
  '    EXEC('' ' +
  '    ALTER FUNCTION duimp.ValorCotacao ' +
  '    ( ' +
  '        @Valor1 float, ' +
  '        @Valor2 float ' +
  '    ) ' +
  '    RETURNS float ' +
  '    AS ' +
  '    BEGIN ' +
  '        RETURN @Valor1 / NULLIF (@Valor2, 0); ' +
  '    END'') ' +
  'END');
end;

procedure AlterDuimpValorCotacaoFunction.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
  'IF OBJECT_ID(''duimp.ValorCotacao'', ''FN'') IS NOT NULL ' +
  'BEGIN ' +
  '    EXEC(''' +
  '    ALTER FUNCTION duimp.ValorCotacao ' +
  '    ( ' +
  '        @Valor1 float, ' +
  '        @Valor2 float ' +
  '    ) ' +
  '    RETURNS float ' +
  '    AS ' +
  '    BEGIN ' +
  '        RETURN CASE ' +
  '            WHEN @Valor1 > @Valor2 THEN ' +
  '                @Valor1 / NULLIF(@Valor2, 0) ' +
  '            ELSE ' +
  '                @Valor2 / NULLIF(@Valor1, 0) ' +
  '        END ' +
  '    END ' +
  '    '') ' +
  'END');
end;

initialization
begin
  RegisterMigration(TClientMigration, AlterDuimpValorCotacaoFunction);
end;

end.
