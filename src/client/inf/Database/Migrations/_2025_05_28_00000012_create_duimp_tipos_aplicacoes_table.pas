unit _2025_05_28_00000012_create_duimp_tipos_aplicacoes_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateTiposAplicacoesTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateTiposAplicacoesTable }

procedure CreateTiposAplicacoesTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('tipos_aplicacoes')
   .HasSchema('duimp')
   .Columns([
     StringColumn('Id').HasMaxLength(23).IsRequired
    ,IntColumn('TipoItemCodigo').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
   ]);
end;

procedure CreateTiposAplicacoesTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('tipos_aplicacoes')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateTiposAplicacoesTable);
end;

end.


