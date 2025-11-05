unit _2025_11_05_00000003_alter_table_duimp_itens_exportadores_alter_versao_column;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  AlterTableDuimpItensExportadoresAlterVersaoColumn = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ AlterTableDuimpItensExportadoresAlterVersaoColumn }

procedure AlterTableDuimpItensExportadoresAlterVersaoColumn.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.AlterColumn('Versao')
   .HasSchema('duimp')
   .HasTable('itens_exportadores')
   .HasColumnType('VARCHAR(8)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS');
end;

procedure AlterTableDuimpItensExportadoresAlterVersaoColumn.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.AlterColumn('Versao')
   .HasSchema('duimp')
   .HasTable('itens_exportadores')
   .HasColumnType('int')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS');
end;

initialization
begin
  RegisterMigration(TClientMigration, AlterTableDuimpItensExportadoresAlterVersaoColumn);
end;

end.
