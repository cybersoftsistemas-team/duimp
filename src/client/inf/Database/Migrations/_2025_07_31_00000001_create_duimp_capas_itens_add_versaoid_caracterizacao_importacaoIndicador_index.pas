unit _2025_07_31_00000001_create_duimp_capas_itens_add_versaoid_caracterizacao_importacaoIndicador_index;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateDuimpCapasItensAddVersaoIdCaracterizacaoImportacaoIndicadorIndex = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateDuimpCapasItensAddVersaoIdCaracterizacaoImportacaoIndicadorIndex }

procedure CreateDuimpCapasItensAddVersaoIdCaracterizacaoImportacaoIndicadorIndex.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateIndex('capas_itens', ['VersaoId', 'CaracterizacaoImportacaoIndicador'])
   .HasSchema('duimp');
end;

procedure CreateDuimpCapasItensAddVersaoIdCaracterizacaoImportacaoIndicadorIndex.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropIndex('IX_duimp_capas_itens_VersaoId_CaracterizacaoImportacaoIndicador');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateDuimpCapasItensAddVersaoIdCaracterizacaoImportacaoIndicadorIndex);
end;

end.
