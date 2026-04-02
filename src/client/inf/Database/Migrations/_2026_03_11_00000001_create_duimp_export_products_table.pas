unit _2026_03_11_00000001_create_duimp_export_products_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateDuimpExportProductsTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateDuimpExportProductsTable }

procedure CreateDuimpExportProductsTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('export_products')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,IntColumn('ProductId').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,Unique('ProductId')
   ]);
end;

procedure CreateDuimpExportProductsTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('export_products');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateDuimpExportProductsTable);
end;

end.
