unit _2025_05_25_00000001_create_duimp_schema;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateDuimpSchema = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateDuimpSchema }

procedure CreateDuimpSchema.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.EnsureSchema('duimp');
end;

procedure CreateDuimpSchema.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropSchema('duimp')
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateDuimpSchema);
end;

end.


