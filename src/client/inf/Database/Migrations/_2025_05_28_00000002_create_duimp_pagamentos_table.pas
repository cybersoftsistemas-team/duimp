unit _2025_05_28_00000002_create_duimp_pagamentos_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreatePagamentosTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreatePagamentosTable }

procedure CreatePagamentosTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('pagamentos')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,StringColumn('Agencia').HasMaxLength(4).IsRequired
    ,StringColumn('Banco').HasMaxLength(3).IsRequired
    ,StringColumn('CodigoReceita').HasMaxLength(4).IsRequired
    ,StringColumn('Conta').HasMaxLength(5).IsRequired
    ,DateTimeColumn('DataPagamento').IsRequired
    ,StringColumn('Tributo').HasMaxLength(17).IsRequired
    ,FloatColumn('Valor').HasDefaultValueSql('0').IsRequired
    ,IntColumn('VersaoOrigem').IsRequired
    ,GuidColumn('DuimpId').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,ForeignKey('DuimpId', 'duimps', 'Id')
    ,Unique(['DuimpId', 'VersaoOrigem', 'Tributo'])
   ])
   .Indexes([
     CreateIndex('DuimpId')
   ]);
end;

procedure CreatePagamentosTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('pagamentos')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreatePagamentosTable);
end;

end.


