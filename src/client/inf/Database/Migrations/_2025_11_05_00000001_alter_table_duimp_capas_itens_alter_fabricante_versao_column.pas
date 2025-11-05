unit _2025_11_05_00000001_alter_table_duimp_capas_itens_alter_fabricante_versao_column;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  AlterTableDuimpCapasItensAlterFabricanteVersaoColumn = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ AlterTableDuimpCapasItensAlterFabricanteVersaoColumn }

procedure AlterTableDuimpCapasItensAlterFabricanteVersaoColumn.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.AlterColumn('FabricanteVersao')
   .HasSchema('duimp')
   .HasTable('capas_itens')
   .HasColumnType('VARCHAR(8)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS');
end;

procedure AlterTableDuimpCapasItensAlterFabricanteVersaoColumn.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.AlterColumn('FabricanteVersao')
   .HasSchema('duimp')
   .HasTable('capas_itens')
   .HasColumnType('int')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS');
end;

initialization
begin
  RegisterMigration(TClientMigration, AlterTableDuimpCapasItensAlterFabricanteVersaoColumn);
end;

end.
