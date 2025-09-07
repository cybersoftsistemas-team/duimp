unit _2025_05_28_00000023_create_duimp_Itens_tributos_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateItensTributosTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateItensTributosTable }

procedure CreateItensTributosTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('itens_tributos')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,FloatColumn('MercadoriaValorLocalEmbarqueBRL').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('MercadoriaValorAduaneiroBRL').HasDefaultValueSql('0').IsRequired
    ,GuidColumn('CapaItemId').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,ForeignKey('CapaItemId', 'capas_itens', 'Id').HasOnDelete(ReferentialAction.Cascade)
   ])
   .Indexes([
     CreateIndex('CapaItemId')
   ]);
end;

procedure CreateItensTributosTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('itens_tributos')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateItensTributosTable);
end;

end.


