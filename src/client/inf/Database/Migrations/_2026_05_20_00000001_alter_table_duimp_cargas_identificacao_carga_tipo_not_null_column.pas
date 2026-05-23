unit _2026_05_20_00000001_alter_table_duimp_cargas_identificacao_carga_tipo_not_null_column;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  AlterTableDuimpCargasIdentificacaoCargaTipoNotNullColumn = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ AlterTableDuimpCargasIdentificacaoCargaTipoNotNullColumn }

procedure AlterTableDuimpCargasIdentificacaoCargaTipoNotNullColumn.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.AlterColumn('IdentificacaoCargaTipo')
   .HasTable('cargas')
   .HasSchema('duimp')
   .HasColumnType('VARCHAR(3)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS')
   .IsOptional;
end;

procedure AlterTableDuimpCargasIdentificacaoCargaTipoNotNullColumn.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.AlterColumn('IdentificacaoCargaTipo')
   .HasTable('cargas')
   .HasSchema('duimp')
   .HasColumnType('VARCHAR(3)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS')
   .IsRequired;
end;

initialization
begin
  RegisterMigration(TClientMigration, AlterTableDuimpCargasIdentificacaoCargaTipoNotNullColumn);
end;

end.
