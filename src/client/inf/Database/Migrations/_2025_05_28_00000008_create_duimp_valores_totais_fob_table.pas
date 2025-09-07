unit _2025_05_28_00000008_create_duimp_valores_totais_fob_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateValoresTotaisFobTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateValoresTotaisFobTable }

procedure CreateValoresTotaisFobTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('valores_totais_fob')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,StringColumn('Moeda').HasMaxLength(3).IsRequired
    ,StringColumn('Tipo').HasMaxLength(13).IsRequired
    ,FloatColumn('ValorTotal').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('Cotacao').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('ValorTotalBRL').HasDefaultValueSql('0').IsRequired
   ])
   .Constraints([
     PrimaryKey(['Id', 'Moeda', 'Tipo'])
    ,ForeignKey('Tipo', 'fob_tipos', 'Id')
    ,ForeignKey('versoes', 'Id').HasOnDelete(ReferentialAction.Cascade)
   ])
   .Indexes([
     CreateIndex('Tipo')
   ]);
end;

procedure CreateValoresTotaisFobTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('valores_totais_fob')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateValoresTotaisFobTable);
end;

end.


