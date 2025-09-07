unit _2025_05_28_00000004_create_duimp_cargas_tipos_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateCargasTiposTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateCargasTiposTable }

procedure CreateCargasTiposTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('cargas_tipos')
   .HasSchema('duimp')
   .Columns([
     StringColumn('Id').HasMaxLength(3).IsRequired
    ,IntColumn('ViaTransporteCodigo').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,Unique('ViaTransporteCodigo')
   ]);
end;

procedure CreateCargasTiposTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('cargas_tipos')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateCargasTiposTable);
end;

end.


