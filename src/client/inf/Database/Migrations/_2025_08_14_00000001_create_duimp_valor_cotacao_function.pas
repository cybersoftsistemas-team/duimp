unit _2025_08_14_00000001_create_duimp_valor_cotacao_function;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateDuimpValorCotacaoFunction = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateDuimpValorCotacaoFunction }

procedure CreateDuimpValorCotacaoFunction.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
  'IF OBJECT_ID(''duimp.ValorCotacao'', ''FN'') IS NULL ' +
  'BEGIN ' +
  '    EXEC('' ' +
  '    CREATE FUNCTION duimp.ValorCotacao ' +
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

procedure CreateDuimpValorCotacaoFunction.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
  'IF OBJECT_ID(''duimp.ValorCotacao'', ''FN'') IS NOT NULL ' +
  'BEGIN ' +
  '    DROP FUNCTION duimp.ValorCotacao; ' +
  'END;');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateDuimpValorCotacaoFunction);
end;

end.
