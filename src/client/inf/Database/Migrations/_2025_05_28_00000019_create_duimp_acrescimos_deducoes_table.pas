unit _2025_05_28_00000019_create_duimp_acrescimos_deducoes_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateAcrescimosDeducoesTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateAcrescimosDeducoesTable }

procedure CreateAcrescimosDeducoesTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('acrescimos_deducoes')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,IntColumn('DenominacaoCodigo').IsRequired
    ,StringColumn('MoedaNegociadaSimbolo').HasMaxLength(3).IsRequired
    ,FloatColumn('MoedaNegociadaValor').HasDefaultValueSql('0').IsRequired
    ,StringColumn('Tipo').HasMaxLength(9).IsRequired
    ,FloatColumn('ValorBRL').HasDefaultValueSql('0').IsRequired
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

procedure CreateAcrescimosDeducoesTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('acrescimos_deducoes')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateAcrescimosDeducoesTable);
end;

end.


