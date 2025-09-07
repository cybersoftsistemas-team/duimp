unit _2025_05_28_00000021_create_duimp_Itens_notas_fiscais_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateItensNotasFiscaisTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateItensNotasFiscaisTable }

procedure CreateItensNotasFiscaisTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('itens_notas_fiscais')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,FloatColumn('PercentualEntrada').HasDefaultValueSql('0').IsRequired
    ,FloatColumn('PercentualSaida').HasDefaultValueSql('0').IsRequired
    ,StringColumn('Tipo').HasMaxLength(17).IsRequired
    ,FloatColumn('Valor').HasDefaultValueSql('0').IsRequired
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

procedure CreateItensNotasFiscaisTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('itens_notas_fiscais')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateItensNotasFiscaisTable);
end;

end.


