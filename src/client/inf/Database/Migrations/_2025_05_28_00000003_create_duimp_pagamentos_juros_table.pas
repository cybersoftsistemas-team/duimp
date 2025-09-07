unit _2025_05_28_00000003_create_duimp_pagamentos_juros_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreatePagamentosJurosTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreatePagamentosJurosTable }

procedure CreatePagamentosJurosTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('pagamentos_juros')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,StringColumn('AgenciaJuros').HasMaxLength(4).IsRequired
    ,StringColumn('BancoJuros').HasMaxLength(3).IsRequired
    ,StringColumn('CodigoReceita').HasMaxLength(4).IsRequired
    ,StringColumn('ContaJuros').HasMaxLength(5).IsRequired
    ,DateTimeColumn('DataPagamentoJuros').IsRequired
    ,FloatColumn('Valor').HasDefaultValueSql('0').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,ForeignKey('pagamentos', 'Id')
   ]);
end;

procedure CreatePagamentosJurosTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('pagamentos_juros')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreatePagamentosJurosTable);
end;

end.


