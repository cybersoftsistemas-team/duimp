unit _2025_05_28_00000025_create_duimp_Itens_tributos_aplicados_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateItensTributosAplicadosTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateItensTributosAplicadosTable }

procedure CreateItensTributosAplicadosTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('itens_tributos_aplicados')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,StringColumn('TributoCodigo').HasMaxLength(11).IsRequired
    ,IntColumn('RegimeCodigo').IsRequired
    ,IntColumn('FundamentoCodigo').IsRequired
    ,GuidColumn('ItemTributoId').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,ForeignKey('ItemTributoId', 'itens_tributos', 'Id').HasOnDelete(ReferentialAction.Cascade)
   ])
   .Indexes([
     CreateIndex('ItemTributoId')
   ]);
end;

procedure CreateItensTributosAplicadosTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('itens_tributos_aplicados')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateItensTributosAplicadosTable);
end;

end.


