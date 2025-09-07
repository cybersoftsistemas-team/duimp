unit _2025_05_28_00000006_create_duimp_fob_tipos_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateFobTiposTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateFobTiposTable }

procedure CreateFobTiposTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('fob_tipos')
   .HasSchema('duimp')
   .Columns([
     StringColumn('Id').HasMaxLength(13).IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
   ]);
end;

procedure CreateFobTiposTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('fob_tipos')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateFobTiposTable);
end;

end.


