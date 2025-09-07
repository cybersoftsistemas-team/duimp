unit _2025_05_24_00000002_create_acrescimo_valoracao_aduaneira_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateAcrescimoValoracaoAduaneiraTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateAcrescimoValoracaoAduaneiraTable }

procedure CreateAcrescimoValoracaoAduaneiraTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('AcrescimoValoracaoAduaneira')
   .Columns([
     IntColumn('Codigo').IsRequired
    ,StringColumn('Descricao').HasMaxLength(255).IsRequired
    ,DateTimeColumn('InicioVigencia').IsRequired
    ,DateTimeColumn('FimVigencia').IsOptional
   ])
   .Constraints([
     PrimaryKey('Codigo')
   ]);
end;

procedure CreateAcrescimoValoracaoAduaneiraTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('AcrescimoValoracaoAduaneira');
end;

initialization
begin
  RegisterMigration(TRegisterMigration, CreateAcrescimoValoracaoAduaneiraTable);
end;

end.
