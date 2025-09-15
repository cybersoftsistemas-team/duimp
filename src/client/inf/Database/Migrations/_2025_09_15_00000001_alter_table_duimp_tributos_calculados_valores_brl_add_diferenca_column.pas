unit _2025_09_15_00000001_alter_table_duimp_tributos_calculados_valores_brl_add_diferenca_column;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  AlterTableDuimpTributosCalculadosValoresBrlAddDiferencaColumn = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ AlterTableDuimpTributosCalculadosValoresBrlAddDiferencaColumn }

procedure AlterTableDuimpTributosCalculadosValoresBrlAddDiferencaColumn.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.AddFloatColumn('Diferenca', 'tributos_calculados_valores_brl')
   .HasSchema('duimp')
   .HasColumnType('float')
   .HasDefaultValueSql('0')
   .IsRequired;
end;

procedure AlterTableDuimpTributosCalculadosValoresBrlAddDiferencaColumn.Down(const ASchema: IMigrationBuilder);
begin
//  ASchema.DropColumn('Diferenca')
end;

initialization
begin
  RegisterMigration(TClientMigration, AlterTableDuimpTributosCalculadosValoresBrlAddDiferencaColumn);
end;

end.
