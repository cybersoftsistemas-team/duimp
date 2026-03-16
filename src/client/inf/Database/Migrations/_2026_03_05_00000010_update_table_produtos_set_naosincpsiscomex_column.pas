unit _2026_03_05_00000010_update_table_produtos_set_naosincpsiscomex_column;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  UpdateTableProdutosSetNaoSincPSiscomexColumn = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ UpdateTableProdutosSetNaoSincPSiscomexColumn }

procedure UpdateTableProdutosSetNaoSincPSiscomexColumn.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
  'UPDATE dbo.Produtos '  +
  'SET NaoSincPSiscomex = 1 '  +
  'WHERE Codigo_DUIMP IS NOT NULL '  +
  'AND (NaoSincPSiscomex = 0 OR NaoSincPSiscomex IS NULL);');
end;

procedure UpdateTableProdutosSetNaoSincPSiscomexColumn.Down(const ASchema: IMigrationBuilder);
begin
end;

initialization
begin
  RegisterMigration(TClientMigration, UpdateTableProdutosSetNaoSincPSiscomexColumn);
end;

end.
