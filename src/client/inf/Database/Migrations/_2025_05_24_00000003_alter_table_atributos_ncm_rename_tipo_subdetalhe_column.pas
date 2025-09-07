unit _2025_05_24_00000003_alter_table_atributos_ncm_rename_tipo_subdetalhe_column;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  AlterTableAtributosNcmRenameTipoSubdetalheColumn = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ AlterTableAtributosNcmRenameTipoSubdetalheColumn }

procedure AlterTableAtributosNcmRenameTipoSubdetalheColumn.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.RenameColumn('Tipo_SubDetalhe', 'Forma_Preenchimento')
   .HasTable('AtributosNCM');
end;

procedure AlterTableAtributosNcmRenameTipoSubdetalheColumn.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.RenameColumn('Forma_Preenchimento', 'Tipo_SubDetalhe')
   .HasTable('AtributosNCM');
end;

initialization
begin
  RegisterMigration(TRegisterMigration, AlterTableAtributosNcmRenameTipoSubdetalheColumn);
end;

end.
