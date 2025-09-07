unit _2025_07_31_00000005_alter_duimp_capas_add_valaduaneiramoeda_valaduaneiratipo_column;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  AlterDuimpCapasAddValAduaneiraMoedaValAduaneiraTipoColumn = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ AlterDuimpCapasAddValAduaneiraMoedaValAduaneiraTipoColumn }

procedure AlterDuimpCapasAddValAduaneiraMoedaValAduaneiraTipoColumn.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.AddStringColumn('ValAduaneiraMoeda', 'capas')
   .HasSchema('duimp')
   .HasColumnType('varchar(3)')
   .IsOptional;
  ASchema.AddStringColumn('ValAduaneiraTipo', 'capas')
   .HasSchema('duimp')
   .HasColumnType('varchar(13)')
   .IsOptional;
end;

procedure AlterDuimpCapasAddValAduaneiraMoedaValAduaneiraTipoColumn.Down(const ASchema: IMigrationBuilder);
begin
//  ASchema.DropTable('valores_totais_val_aduaneiras')
//   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, AlterDuimpCapasAddValAduaneiraMoedaValAduaneiraTipoColumn);
end;

end.
