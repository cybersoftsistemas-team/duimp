unit _2025_05_28_00000010_create_duimp_canais_consolidados_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateCanaisConsolidadosTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateCanaisConsolidadosTable }

procedure CreateCanaisConsolidadosTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('canais_consolidados')
   .HasSchema('duimp')
   .Columns([
     StringColumn('Id').HasMaxLength(8).IsRequired
    ,StringColumn('Exibicao').HasMaxLength(30).IsRequired
    ,StringColumn('Valor').HasMaxLength(8).IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
   ]);
end;

procedure CreateCanaisConsolidadosTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('canais_consolidados')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateCanaisConsolidadosTable);
end;

end.


