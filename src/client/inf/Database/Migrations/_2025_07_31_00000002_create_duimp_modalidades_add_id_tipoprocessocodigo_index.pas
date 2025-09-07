unit _2025_07_31_00000002_create_duimp_modalidades_add_id_tipoprocessocodigo_index;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateDuimpModalidadesAddIdTipoProcessoCodigoIndex = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateDuimpModalidadesAddIdTipoProcessoCodigoIndex }

procedure CreateDuimpModalidadesAddIdTipoProcessoCodigoIndex.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateIndex('modalidades', ['Id', 'TipoProcessoCodigo'])
   .HasSchema('duimp');
end;

procedure CreateDuimpModalidadesAddIdTipoProcessoCodigoIndex.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropIndex('IX_duimp_modalidades_Id_TipoProcessoCodigo');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateDuimpModalidadesAddIdTipoProcessoCodigoIndex);
end;

end.
