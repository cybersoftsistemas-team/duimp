unit _2025_05_24_00000001_alter_table_dominios_att_alter_descricao_column;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  AlterTableDominiosAttAlterDescricaoColumn = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ AlterTableDominiosAttAlterDescricaoColumn }

procedure AlterTableDominiosAttAlterDescricaoColumn.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.AlterColumn('Descricao')
   .HasTable('DominiosAtt')
   .HasColumnType('VARCHAR(255)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS');
end;

procedure AlterTableDominiosAttAlterDescricaoColumn.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.AlterColumn('Descricao')
   .HasTable('DominiosAtt')
   .HasColumnType('VARCHAR(100)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS');
end;

initialization
begin
  RegisterMigration(TRegisterMigration, AlterTableDominiosAttAlterDescricaoColumn);
end;

end.
