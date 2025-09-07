unit _2025_05_28_00000001_create_duimp_versoes_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateVersoesTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateDuimpsVersoesTable }

procedure CreateVersoesTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('versoes')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,StringColumn('ProcessoNumero').HasMaxLength(15).IsOptional
    ,IntColumn('Versao').IsRequired
    ,GuidColumn('DuimpId').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,ForeignKey('DuimpId', 'duimps', 'Id')
    ,Unique(['DuimpId', 'Versao'])
    ,Unique(['DuimpId', 'ProcessoNumero', 'Versao'])
   ])
   .Indexes([
     CreateIndex('DuimpId')
    ,CreateIndex('ProcessoNumero')
    ,CreateIndex(['ProcessoNumero', 'Versao'])
   ]);
end;

procedure CreateVersoesTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('versoes')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateVersoesTable);
end;

end.



