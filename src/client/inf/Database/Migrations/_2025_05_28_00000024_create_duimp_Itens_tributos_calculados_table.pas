unit _2025_05_28_00000024_create_duimp_Itens_tributos_calculados_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateItensTributosCalculadosTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateItensTributosCalculadosTable }

procedure CreateItensTributosCalculadosTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('itens_tributos_calculados')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,StringColumn('Tipo').HasMaxLength(17).IsRequired
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

procedure CreateItensTributosCalculadosTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('itens_tributos_calculados')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateItensTributosCalculadosTable);
end;

end.


