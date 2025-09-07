unit _2025_05_28_00000017_create_duimp_capas_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateCapasTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateCapasTable }

procedure CreateCapasTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('capas')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,StringColumn('CaracterizacaoImportacaoNI').HasMaxLength(14).IsOptional
    ,DateTimeColumn('DataRegistro').IsRequired
    ,StringColumn('FobAdicaoMoeda').HasMaxLength(3).IsOptional
    ,StringColumn('FobAdicaoTipo').HasMaxLength(13).IsOptional
    ,StringColumn('FobMoeda').HasMaxLength(3).IsOptional
    ,StringColumn('FobTipo').HasMaxLength(13).IsOptional
    ,StringColumn('ValAduaneiraMoeda').HasMaxLength(3).IsOptional
    ,StringColumn('ImportadorNI').HasMaxLength(14).IsRequired
    ,StringColumn('ImportadorTipo').HasMaxLength(4).IsRequired
    ,IntColumn('IncentivoFiscalCodigo').IsOptional
    ,StringColumn('InformacaoComplementar').HasMaxLength(7800).IsOptional
    ,StringColumn('SituacaoDuimp').HasMaxLength(60).IsRequired
    ,StringColumn('TipoAplicacao').HasMaxLength(23).IsOptional
    ,StringColumn('UFDesembaraco').HasMaxLength(2).IsOptional
    ,StringColumn('UFImportacao').HasMaxLength(2).IsOptional
    ,FloatColumn('ValorTotalLocalEmbarqueBRL').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('ValorTotalLocalEmbarqueUSD').HasDefaultValueSql('0').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,ForeignKey('Versoes', 'Id')
    ,ForeignKey('TipoAplicacao', 'tipos_aplicacoes', 'Id')
    ,ForeignKey(['Id', 'FobAdicaoMoeda', 'FobAdicaoTipo'], 'valores_totais_fob_adicoes', ['Id', 'Moeda', 'Tipo']).HasOnDelete(ReferentialAction.Cascade)
    ,ForeignKey(['Id', 'FobMoeda', 'FobTipo'], 'valores_totais_fob', ['Id', 'Moeda', 'Tipo'])
    ,ForeignKey(['Id', 'ValAduaneiraMoeda'], 'valores_totais_val_aduaneiras', ['Id', 'Moeda'])
   ])
   .Indexes([
     CreateIndex('TipoAplicacao')
    ,CreateIndex(['Id', 'FobAdicaoMoeda', 'FobAdicaoTipo'])
    ,CreateIndex(['Id', 'FobMoeda', 'FobTipo'])
    ,CreateIndex(['Id', 'ValAduaneiraMoeda'])
   ]);
end;

procedure CreateCapasTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('capas')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateCapasTable);
end;

end.


