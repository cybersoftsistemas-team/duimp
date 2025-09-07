unit _2025_05_28_00000008_create_duimp_valores_totais_val_aduaneiras_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateDuimpValoresTotaisValAduaneirasTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateDuimpValoresTotaisValAduaneirasTable }

procedure CreateDuimpValoresTotaisValAduaneirasTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('valores_totais_val_aduaneiras')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,StringColumn('Moeda').HasMaxLength(3).IsRequired
    ,FloatColumn('ValorTotal').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('Cotacao').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('ValorTotalBRL').HasDefaultValueSql('0').IsRequired
   ])
   .Constraints([
     PrimaryKey(['Id', 'Moeda'])
    ,ForeignKey('versoes', 'Id').HasOnDelete(ReferentialAction.Cascade)
   ]);
end;

procedure CreateDuimpValoresTotaisValAduaneirasTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('valores_totais_val_aduaneiras')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateDuimpValoresTotaisValAduaneirasTable);
end;

end.
