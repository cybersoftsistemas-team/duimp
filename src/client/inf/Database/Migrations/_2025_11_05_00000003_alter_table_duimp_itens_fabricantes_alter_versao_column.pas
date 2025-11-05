unit _2025_11_05_00000003_alter_table_duimp_itens_fabricantes_alter_versao_column;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  AlterTableDuimpItensFabricantesAlterVersaoColumn = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ AlterTableDuimpItensFabricantesAlterVersaoColumn }

procedure AlterTableDuimpItensFabricantesAlterVersaoColumn.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.AlterColumn('Versao')
   .HasSchema('duimp')
   .HasTable('itens_fabricantes')
   .HasColumnType('VARCHAR(8)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS');
end;

procedure AlterTableDuimpItensFabricantesAlterVersaoColumn.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.AlterColumn('Versao')
   .HasSchema('duimp')
   .HasTable('itens_fabricantes')
   .HasColumnType('int')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS');
end;

initialization
begin
  RegisterMigration(TClientMigration, AlterTableDuimpItensFabricantesAlterVersaoColumn);
end;

end.
