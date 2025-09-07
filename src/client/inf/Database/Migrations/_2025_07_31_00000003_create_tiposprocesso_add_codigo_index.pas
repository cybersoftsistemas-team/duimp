unit _2025_07_31_00000003_create_tiposprocesso_add_codigo_index;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateTiposProcessoAddCodigoIndex = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateTiposProcessoAddCodigoIndex }

procedure CreateTiposProcessoAddCodigoIndex.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateIndex('TiposProcesso', 'Codigo');
end;

procedure CreateTiposProcessoAddCodigoIndex.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropIndex('IX_TiposProcesso_Codigo');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateTiposProcessoAddCodigoIndex);
end;

end.
