unit _2025_05_28_00000011_create_duimp_resultados_analises_riscos_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateResultadosAnalisesRiscosTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateResultadosAnalisesRiscosTable }

procedure CreateResultadosAnalisesRiscosTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('resultados_analises_riscos')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,StringColumn('CanalConsolidado').HasMaxLength(8).IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,ForeignKey('CanalConsolidado', 'canais_consolidados', 'Id')
    ,ForeignKey('versoes', 'Id').HasOnDelete(ReferentialAction.Cascade)
   ])
   .Indexes([
     CreateIndex('CanalConsolidado')
   ]);
end;

procedure CreateResultadosAnalisesRiscosTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('resultados_analises_riscos')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateResultadosAnalisesRiscosTable);
end;

end.


