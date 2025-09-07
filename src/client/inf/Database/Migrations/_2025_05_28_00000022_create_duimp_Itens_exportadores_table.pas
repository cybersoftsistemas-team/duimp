unit _2025_05_28_00000022_create_duimp_Itens_exportadores_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateItensExportadoresTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateItensExportadoresTable }

procedure CreateItensExportadoresTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('itens_exportadores')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,StringColumn('Codigo').HasMaxLength(35).IsRequired
    ,StringColumn('NIOperador').HasMaxLength(11).IsRequired
    ,StringColumn('PaisCodigo').HasMaxLength(2).IsRequired
    ,IntColumn('Versao').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,ForeignKey('capas_itens', 'Id').HasOnDelete(ReferentialAction.Cascade)
   ]);
end;

procedure CreateItensExportadoresTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('itens_exportadores')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateItensExportadoresTable);
end;

end.


