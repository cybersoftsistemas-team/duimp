unit _2025_05_28_00000027_create_duimp_Itens_tributos_calculados_memorias_calculos_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateItensTributosCalculadosMemoriasCalculosTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateItensTributosCalculadosMemoriasCalculosTable }

procedure CreateItensTributosCalculadosMemoriasCalculosTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('itens_tributos_calculados_memorias_calculos')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,IntColumn('CodigoFundamentoLegalNormal').IsRequired
    ,FloatColumn('BaseCalculoBRL').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('BaseCalculoEspecificaBRL').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('BaseCalculoReduzidaBRL').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('PercentualReducaoBaseCalculo').HasDefaultValueSql('0').IsRequired
    ,StringColumn('TipoAliquota').HasMaxLength(10).IsRequired
    ,FloatColumn('PercentualReducaoAliquotaReduzida').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('ValorAliquota').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('ValorAliquotaEspecifica').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('ValorAliquotaReduzida').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('Normal').HasDefaultValueSql('0').IsRequired
    ,BooleanColumn('Tributado').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('PercentualPagamento').HasDefaultValueSql('0').IsRequired
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

procedure CreateItensTributosCalculadosMemoriasCalculosTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('itens_tributos_calculados_memoriasCalculos')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateItensTributosCalculadosMemoriasCalculosTable);
end;

end.


