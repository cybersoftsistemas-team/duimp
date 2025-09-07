unit _2025_05_28_00000015_create_duimp_resultados_anuentes_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateResultadosAnuentesTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateResultadosAnuentesTable }

procedure CreateResultadosAnuentesTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('resultados_anuentes')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,StringColumn('Orgao').HasMaxLength(30).IsRequired
    ,StringColumn('Resultado').HasMaxLength(60).IsRequired
    ,GuidColumn('ResultadoAnaliseRiscoId').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,ForeignKey('ResultadoAnaliseRiscoId', 'resultados_analises_riscos', 'Id').HasOnDelete(ReferentialAction.Cascade)
   ])
   .Indexes([
     CreateIndex('ResultadoAnaliseRiscoId')
   ]);
end;

procedure CreateResultadosAnuentesTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('resultados_anuentes')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateResultadosAnuentesTable);
end;

end.


