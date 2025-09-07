unit _2025_07_31_00000006_table_duimp_capas_add_id_valaduaneiramoeda_valaduaneiratipo_foreignkey;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  TableDuimpCapasAddIdValAduaneiraMoedaValAduaneiraTipoForeignkey = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ TableDuimpCapasAddIdValAduaneiraMoedaValAduaneiraTipoForeignkey }

procedure TableDuimpCapasAddIdValAduaneiraMoedaValAduaneiraTipoForeignkey.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.AddForeignKey('capas', ['Id', 'ValAduaneiraMoeda', 'ValAduaneiraTipo'], 'valores_totais_val_aduaneiras', ['Id', 'Moeda', 'Tipo'])
   .HasSchema('duimp')
   .HasPrincipalSchema('duimp');
end;

procedure TableDuimpCapasAddIdValAduaneiraMoedaValAduaneiraTipoForeignkey.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('FK_duimp_capas_duimp_valores_totais_val_aduaneiras_Id_ValAduaneiraMoeda_ValAduaneiraTipo')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, TableDuimpCapasAddIdValAduaneiraMoedaValAduaneiraTipoForeignkey);
end;

end.
