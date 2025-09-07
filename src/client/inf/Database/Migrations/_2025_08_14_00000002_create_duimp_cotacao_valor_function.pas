unit _2025_08_14_00000002_create_duimp_cotacao_valor_function;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateDuimpCotacaoValorFunction = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateDuimpCotacaoValorFunction }

procedure CreateDuimpCotacaoValorFunction.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
  'IF OBJECT_ID(''duimp.CotacaoValor'', ''FN'') IS NULL ' +
  'BEGIN ' +
  '    EXEC('' ' +
  '    CREATE FUNCTION duimp.CotacaoValor ' +
  '    ( ' +
  '        @Valor1 float, ' +
  '        @Valor2 float ' +
  '    ) ' +
  '    RETURNS float ' +
  '    AS ' +
  '    BEGIN ' +
  '        RETURN CASE ' +
  '            WHEN @Valor1 = @Valor2 THEN ' +
  '                1 ' +
  '            ELSE ' +
  '                @Valor2 / NULLIF(@Valor1, 0) ' +
  '        END ' +
  '    END ' +
  '    '') ' +
  'END');
end;

procedure CreateDuimpCotacaoValorFunction.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
  'IF OBJECT_ID(''duimp.CotacaoValor'', ''FN'') IS NOT NULL ' +
  'BEGIN ' +
  '    DROP FUNCTION duimp.CotacaoValor; ' +
  'END;');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateDuimpCotacaoValorFunction);
end;

end.
