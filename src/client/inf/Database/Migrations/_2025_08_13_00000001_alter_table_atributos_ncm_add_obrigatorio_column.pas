unit _2025_08_13_00000001_alter_table_atributos_ncm_add_obrigatorio_column;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  AlterTableAtributosNcmAddObrigatorioColumn = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ AlterTableAtributosNcmAddObrigatorioColumn }

procedure AlterTableAtributosNcmAddObrigatorioColumn.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.AddBooleanColumn('Obrigatorio', 'AtributosNCM')
   .HasColumnType('bit');
end;

procedure AlterTableAtributosNcmAddObrigatorioColumn.Down(const ASchema: IMigrationBuilder);
begin
//  ASchema.DropColumn('Obrigatorio', 'AtributosNCM');
end;

initialization
begin
  RegisterMigration(TRegisterMigration, AlterTableAtributosNcmAddObrigatorioColumn);
end;

end.
