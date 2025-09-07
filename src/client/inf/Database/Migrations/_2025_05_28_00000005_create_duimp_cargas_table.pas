unit _2025_05_28_00000005_create_duimp_cargas_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateCargasTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateCargasTable }

procedure CreateCargasTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('cargas')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,StringColumn('FreteMoedaNegociadaSimbolo').HasMaxLength(3).IsOptional
    ,FloatColumn('FreteMoedaNegociadaValor').HasDefaultValueSql('0').IsRequired
    ,StringColumn('Identificacao').HasMaxLength(32).IsRequired
    ,StringColumn('IdentificacaoCargaTipo').HasMaxLength(3).IsRequired
    ,StringColumn('MotivoSituacaoEspecialCodigo').HasMaxLength(5).IsOptional
    ,StringColumn('PaisProcedenciaCodigo').HasMaxLength(2).IsOptional
    ,StringColumn('SeguroMoedaNegociadaSimbolo').HasMaxLength(3).IsOptional
    ,FloatColumn('SeguroMoedaNegociadaValor').HasDefaultValueSql('0').IsRequired
    ,IntColumn('UnidadeDespachoCodigo').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,ForeignKey('versoes', 'Id').HasOnDelete(ReferentialAction.Cascade)
    ,ForeignKey('IdentificacaoCargaTipo', 'cargas_tipos', 'Id')
   ])
   .Indexes([
     CreateIndex('IdentificacaoCargaTipo')
   ]);
end;

procedure CreateCargasTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('cargas')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateCargasTable);
end;

end.


