unit _2025_11_05_00000002_alter_table_duimp_capas_itens_alter_exportador_versao_column;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  AlterTableDuimpCapasItensAlterExportadorVersaoColumn = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ AlterTableDuimpCapasItensAlterExportadorVersaoColumn }

procedure AlterTableDuimpCapasItensAlterExportadorVersaoColumn.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.AlterColumn('ExportadorVersao')
   .HasSchema('duimp')
   .HasTable('capas_itens')
   .HasColumnType('VARCHAR(8)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS');
end;

procedure AlterTableDuimpCapasItensAlterExportadorVersaoColumn.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.AlterColumn('ExportadorVersao')
   .HasSchema('duimp')
   .HasTable('capas_itens')
   .HasColumnType('int')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS');
end;

initialization
begin
  RegisterMigration(TClientMigration, AlterTableDuimpCapasItensAlterExportadorVersaoColumn);
end;

end.
