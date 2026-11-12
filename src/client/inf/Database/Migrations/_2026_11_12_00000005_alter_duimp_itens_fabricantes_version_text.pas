unit _2026_11_12_00000005_alter_duimp_itens_fabricantes_version_text;

interface

uses
  cbsMigrations.Support.Migration;

type
  AlterDuimpItensFabricantesVersionText = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
  duimp.inf.Database.MigrationContext;

procedure AlterDuimpItensFabricantesVersionText.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM [duimp].[itens_fabricantes] WHERE [Versao] IS NOT NULL AND ' +
    'DATALENGTH(CONVERT(nvarchar(max), [Versao])) NOT BETWEEN 2 AND 19998) THROW 50002, ''Versao fora do ' +
    'limite de 1 a 9999 caracteres: itens_fabricantes.Versao.'', 1;');
  ASchema.AlterColumn('Versao')
   .HasSchema('duimp')
   .HasTable('itens_fabricantes')
   .HasColumnType('NVARCHAR(MAX)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS')
   .IsRequired;
  ASchema.Sql(
    'ALTER TABLE [duimp].[itens_fabricantes] WITH CHECK ADD CONSTRAINT ' +
    '[CK_itens_fabricantes_Versao_Length] CHECK (DATALENGTH([Versao]) BETWEEN 2 AND 19998);');
end;

procedure AlterDuimpItensFabricantesVersionText.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM [duimp].[itens_fabricantes] WHERE [Versao] IS NOT NULL AND ' +
    '(DATALENGTH([Versao]) > 16 OR CONVERT(nvarchar(max), CONVERT(varchar(max), [Versao])) COLLATE ' +
    'Latin1_General_100_BIN2 <> [Versao] COLLATE Latin1_General_100_BIN2)) THROW 50003, ''Rollback ' +
    'impediria preservar os valores de itens_fabricantes.Versao.'', 1;');
  ASchema.Sql(
    'ALTER TABLE [duimp].[itens_fabricantes] DROP CONSTRAINT [CK_itens_fabricantes_Versao_Length];');
  ASchema.AlterColumn('Versao')
   .HasSchema('duimp')
   .HasTable('itens_fabricantes')
   .HasColumnType('VARCHAR(8)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS')
   .IsRequired;
end;

initialization
begin
  RegisterMigration(TClientMigration, AlterDuimpItensFabricantesVersionText);
end;

end.
