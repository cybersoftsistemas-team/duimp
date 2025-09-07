unit _2025_05_28_00000009_create_duimp_tributos_calculados_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateTributosCalculadosTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateTributosCalculadosTable }

procedure CreateTributosCalculadosTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('tributos_calculados')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,StringColumn('Tipo').HasMaxLength(17).IsRequired
    ,GuidColumn('VersaoId').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,ForeignKey('VersaoId', 'versoes', 'Id').HasOnDelete(ReferentialAction.Cascade)
   ])
   .Indexes([
     CreateIndex('VersaoId')
   ]);
end;

procedure CreateTributosCalculadosTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('tributos_calculados')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateTributosCalculadosTable);
end;

end.


