unit _2025_09_02_00000001_alter_table_regime_tributacao_alter_descricao_column;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  AlterTableRegimeTributacaoAlterDescricaoColumn = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ AlterTableRegimeTributacaoAlterDescricaoColumn }

procedure AlterTableRegimeTributacaoAlterDescricaoColumn.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.AlterColumn('Descricao')
   .HasTable('RegimeTributacao')
   .HasColumnType('VARCHAR(255)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS');
end;

procedure AlterTableRegimeTributacaoAlterDescricaoColumn.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.AlterColumn('Descricao')
   .HasTable('RegimeTributacao')
   .HasColumnType('VARCHAR(35)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS');
end;

initialization
begin
  RegisterMigration(TRegisterMigration, AlterTableRegimeTributacaoAlterDescricaoColumn);
end;

end.
