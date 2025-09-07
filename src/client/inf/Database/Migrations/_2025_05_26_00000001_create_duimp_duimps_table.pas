unit _2025_05_26_00000001_create_duimp_duimps_table;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateDuimpsTable = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateDuimpsTable }

procedure CreateDuimpsTable.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateTable('duimps')
   .HasSchema('duimp')
   .Columns([
     GuidColumn('Id').IsRequired
    ,BooleanColumn('AdmissaoTemporaria').HasDefaultValueSql('0').IsRequired
    ,StringColumn('ChaveAcesso').HasMaxLength(14).IsOptional
    ,BooleanColumn('DesembaracoAduaneiro').HasDefaultValueSql('0').IsRequired
    ,BooleanColumn('EntrepostoAduaneiro').HasDefaultValueSql('0').IsRequired
    ,StringColumn('Numero').HasMaxLength(15).IsRequired
    ,StringColumn('ProcessoNumeroVinculado').HasMaxLength(15).IsOptional
    ,BooleanColumn('RemoverFreteTerrirtorioNacionalBCImpostos').HasDefaultValueSql('0').IsRequired
    ,BooleanColumn('RemoverValoracaoNoValorFob').HasDefaultValueSql('0').IsRequired
    ,BooleanColumn('SuspensaoImpostos').HasDefaultValueSql('0').IsRequired
   ])
   .Constraints([
     PrimaryKey('Id')
    ,Unique('ChaveAcesso')
    ,Unique('Numero')
   ]);
end;

procedure CreateDuimpsTable.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropTable('duimps')
   .HasSchema('duimp');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateDuimpsTable);
end;

end.




