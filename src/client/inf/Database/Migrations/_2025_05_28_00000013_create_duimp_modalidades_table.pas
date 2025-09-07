unit _2025_05_28_00000013_create_duimp_modalidades_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateModalidadesTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateModalidadesTable }

procedure CreateModalidadesTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('modalidades')
   .HasSchema('duimp')
   .Columns([
     StringColumn('Id').HasMaxLength(28).IsRequired
    ,IntColumn('TipoProcessoCodigo').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,Unique('TipoProcessoCodigo')
   ]);
end;

procedure CreateModalidadesTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('modalidades')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateModalidadesTable);
end;

end.


