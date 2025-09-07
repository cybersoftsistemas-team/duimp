unit _2025_08_02_00000001_create_produtos_atributos_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateProdutosAtributosTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateProdutosAtributosTable }

procedure CreateProdutosAtributosTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('ProdutosAtributos')
   .Columns([
     IntColumn('Codigo_Mercadoria').IsRequired
    ,StringColumn('NCM').HasMaxLength(8).IsRequired
    ,StringColumn('Atributo').HasMaxLength(25).IsRequired
    ,StringColumn('Valor').HasMaxLength(100).IsRequired
   ])
   .Constraints([
     PrimaryKey(['Codigo_Mercadoria', 'NCM', 'Atributo'])
   ]);
end;

procedure CreateProdutosAtributosTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('ProdutosAtributos');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateProdutosAtributosTable);
end;

end.
