unit _2025_07_14_00000001_create_produtos_add_codigo_duimp_index;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateProdutosAddCodigoDuimpIndex = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateProdutosAddCodigoDuimpIndex }

procedure CreateProdutosAddCodigoDuimpIndex.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateIndex('Produtos', 'Codigo_DUIMP');
end;

procedure CreateProdutosAddCodigoDuimpIndex.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropIndex('IX_Produtos_Codigo_DUIMP');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateProdutosAddCodigoDuimpIndex);
end;

end.
