unit _2026_03_05_00000001_alter_table_produtos_add_naosincpsiscomex_column;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  AlterTableProdutosAddNaoSincPSiscomexColumn = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ AlterTableProdutosAddNaoSincPSiscomexColumn }

procedure AlterTableProdutosAddNaoSincPSiscomexColumn.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
  'IF COL_LENGTH(''dbo.Produtos'', ''NaoSincPSiscomex'') IS NULL ' +
  'BEGIN ' +
  '    ALTER TABLE dbo.Produtos ' +
  '        ADD NaoSincPSiscomex BIT NOT NULL DEFAULT (0); ' +
  'END;');
end;

procedure AlterTableProdutosAddNaoSincPSiscomexColumn.Down(const ASchema: IMigrationBuilder);
begin
  //  ASchema.DropColumn('NaoSincPSiscomex')
end;

initialization
begin
  RegisterMigration(TClientMigration, AlterTableProdutosAddNaoSincPSiscomexColumn);
end;

end.
