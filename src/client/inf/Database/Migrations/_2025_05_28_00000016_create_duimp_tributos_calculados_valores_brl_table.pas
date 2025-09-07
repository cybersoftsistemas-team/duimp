unit _2025_05_28_00000016_create_duimp_tributos_calculados_valores_brl_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateTributosCalculadosValoresBRLTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateTributosCalculadosValoresBRLTable }

procedure CreateTributosCalculadosValoresBRLTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('tributos_calculados_valores_brl')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,FloatColumn('Calculado').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('AReduzir').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('Devido').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('Suspenso').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('ARecolher').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('Recolhido').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('Majorado').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('NotaFiscal').HasDefaultValueSql('0').IsRequired
    ,GuidColumn('TributoCalculadoId').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,ForeignKey('TributoCalculadoId', 'tributos_calculados', 'Id').HasOnDelete(ReferentialAction.Cascade)
   ])
   .Indexes([
     CreateIndex('TributoCalculadoId')
   ]);
end;

procedure CreateTributosCalculadosValoresBRLTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('tributos_calculados_valores_brl')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateTributosCalculadosValoresBRLTable);
end;

end.


