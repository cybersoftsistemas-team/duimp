unit _2025_05_24_00000003_alter_table_dominios_att_alter_codigo_column;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  AlterTableDominiosAttAlterCodigoColumn = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ AlterTableDominiosAttAlterCodigoColumn }

procedure AlterTableDominiosAttAlterCodigoColumn.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.AlterColumn('Codigo')
   .HasTable('DominiosAtt')
   .HasColumnType('VARCHAR(20)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS');
end;

procedure AlterTableDominiosAttAlterCodigoColumn.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.AlterColumn('Codigo')
   .HasTable('DominiosAtt')
   .HasColumnType('int')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS');
end;

initialization
begin
  RegisterMigration(TRegisterMigration, AlterTableDominiosAttAlterCodigoColumn);
end;

end.
