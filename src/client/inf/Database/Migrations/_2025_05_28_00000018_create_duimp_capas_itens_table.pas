unit _2025_05_28_00000018_create_duimp_capas_itens_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateCapasItensTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateCapasItensTable }

procedure CreateCapasItensTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('capas_itens')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,IntColumn('Adicao').IsRequired
    ,BooleanColumn('Camex').HasDefaultValueSql('0').IsRequired
    ,StringColumn('CaracterizacaoImportacaoIndicador').HasMaxLength(28).IsRequired
    ,StringColumn('CaracterizacaoImportacaoNI').HasMaxLength(14).IsOptional
    ,StringColumn('CodigoFabricante').HasMaxLength(20).IsOptional
    ,FloatColumn('CondicaoVendaValorBRL').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('CondicaoVendaValorVlcBRL').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('CondicaoVendaValorFreteBRL').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('CondicaoVendaValorMoedaNegociada').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('CondicaoVendaValorMoedaNegociadaVlc').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('CondicaoVendaValorSeguroBRL').HasDefaultValueSql('0').IsRequired
    ,BooleanColumn('Dumping').HasDefaultValueSql('0').IsRequired
    ,StringColumn('FabricanteCodigo').HasMaxLength(35).IsOptional
    ,StringColumn('FabricanteCodigoPais').HasMaxLength(2).IsOptional
    ,StringColumn('FabricanteNIOperador').HasMaxLength(11).IsOptional
    ,IntColumn('FabricanteVersao').IsOptional
    ,StringColumn('ExportadorCodigo').HasMaxLength(35).IsRequired
    ,StringColumn('ExportadorCodigoPais').HasMaxLength(2).IsRequired
    ,StringColumn('ExportadorNIOperador').HasMaxLength(11).IsRequired
    ,IntColumn('ExportadorVersao').IsRequired
    ,StringColumn('IncotermCodigo').HasMaxLength(10).IsRequired
    ,FloatColumn('IncotermValorBRL').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('IncotermValorVlcBRL').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('IncotermValorMoedaNegociada').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('IncotermValorMoedaNegociadaVlc').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('IncotermValorUnitario').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('IncotermValorUnitarioVlc').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('IncotermValorUnitarioBRL').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('IncotermValorUnitarioVlcBRL').HasDefaultValueSql('0').IsRequired
    ,StringColumn('MoedaNegociadaSimbolo').HasMaxLength(3).IsRequired
    ,IntColumn('NumeroItem').IsRequired
    ,FloatColumn('PesoLiquido').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('PesoLiquidoUnitario').HasDefaultValueSql('0').IsRequired
    ,IntColumn('ProdutoCodigo').IsRequired
    ,StringColumn('ProdutoDescricao').HasMaxLength(4000).IsOptional
    ,IntColumn('ProdutoVersao').IsRequired
    ,StringColumn('ProdutoNIResponsavel').HasMaxLength(11).IsRequired
    ,FloatColumn('QuantidadeComercial').HasDefaultValueSql('0').IsRequired
    ,StringColumn('TipoAplicacao').HasMaxLength(23).IsRequired
    ,StringColumn('UnidadeComercial').HasMaxLength(20).IsRequired
    ,FloatColumn('ValorUnitario').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('ValorUnitarioBRL').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('ValorUnitarioVlc').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('ValorUnitarioVlcBRL').HasDefaultValueSql('0').IsRequired
    ,GuidColumn('VersaoId').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,ForeignKey('VersaoId', 'versoes', 'Id').HasOnDelete(ReferentialAction.Cascade)
    ,ForeignKey('CaracterizacaoImportacaoIndicador', 'modalidades', 'Id')
    ,ForeignKey('TipoAplicacao', 'tipos_aplicacoes', 'Id')
    ,Unique(['VersaoId', 'Adicao', 'NumeroItem', 'ProdutoCodigo', 'ProdutoVersao'])
    ,Unique(['VersaoId', 'Adicao', 'NumeroItem'])
    ,CheckConstraint(
     'CK_capas_itens_CaracterizacaoNI_Requerida',
     '(CaracterizacaoImportacaoIndicador IN (''IMPORTACAO_POR_CONTA_E_ORDEM'', ''IMPORTACAO_POR_ENCOMENDA'') ' +
     ' AND CaracterizacaoImportacaoNI IS NOT NULL AND LTRIM(RTRIM(CaracterizacaoImportacaoNI)) <> '''') OR ' +
     '(CaracterizacaoImportacaoIndicador = ''IMPORTACAO_DIRETA'' ' +
     ' AND CaracterizacaoImportacaoNI IS NULL)'
     )
   ])
   .Indexes([
     CreateIndex('CaracterizacaoImportacaoIndicador')
    ,CreateIndex('ProdutoCodigo')
    ,CreateIndex('TipoAplicacao')
    ,CreateIndex('VersaoId')
   ]);
end;

procedure CreateCapasItensTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('capas_itens')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateCapasItensTable);
end;

end.


