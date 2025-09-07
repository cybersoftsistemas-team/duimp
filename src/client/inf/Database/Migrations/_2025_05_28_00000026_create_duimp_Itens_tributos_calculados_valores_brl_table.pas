unit _2025_05_28_00000026_create_duimp_Itens_tributos_calculados_valores_brl_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateItensTributosCalculadosValoresBRLTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateItensTributosCalculadosValoresBRLTable }

procedure CreateItensTributosCalculadosValoresBRLTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('itens_tributos_calculados_valores_brl')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,FloatColumn('Calculado').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('AReduzir').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('Devido').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('Suspenso').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('ARecolher').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('OriginalDevido').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('CalculadoPagProporcional').HasDefaultValueSql('0').IsRequired
    ,GuidColumn('ItemTributoCalculadoId').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,ForeignKey('ItemTributoCalculadoId', 'itens_tributos_calculados', 'Id').HasOnDelete(ReferentialAction.Cascade)
   ])
   .Indexes([
     CreateIndex('ItemTributoCalculadoId')
   ]);
end;

procedure CreateItensTributosCalculadosValoresBRLTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('itens_tributos_calculados_valores_brl')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateItensTributosCalculadosValoresBRLTable);
end;

end.


