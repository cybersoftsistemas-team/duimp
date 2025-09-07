unit _2025_05_28_00000028_create_duimp_Itens_tributos_aplicados_atributos_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateItensTributosAplicadosAtributosTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateItensTributosAplicadosAtributosTable }

procedure CreateItensTributosAplicadosAtributosTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('itens_tributos_aplicados_atributos')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,StringColumn('Codigo').HasMaxLength(14).IsRequired
    ,StringColumn('Valor').HasMaxLength(8000).IsRequired
    ,GuidColumn('ItemTributoAplicadoId').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,ForeignKey('ItemTributoAplicadoId', 'itens_tributos_aplicados', 'Id').HasOnDelete(ReferentialAction.Cascade)
   ])
   .Indexes([
     CreateIndex('ItemTributoAplicadoId')
   ]);
end;

procedure CreateItensTributosAplicadosAtributosTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('itens_tributos_aplicados_atributos')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateItensTributosAplicadosAtributosTable);
end;

end.


