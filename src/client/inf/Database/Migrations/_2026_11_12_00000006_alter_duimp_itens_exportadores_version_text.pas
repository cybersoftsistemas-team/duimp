unit _2026_11_12_00000006_alter_duimp_itens_exportadores_version_text;

interface

uses
  cbsMigrations.Support.Migration;

type
  AlterDuimpItensExportadoresVersionText = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
  duimp.inf.Database.MigrationContext;

procedure AlterDuimpItensExportadoresVersionText.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM [duimp].[itens_exportadores] WHERE [Versao] IS NOT NULL AND ' +
    'DATALENGTH(CONVERT(nvarchar(max), [Versao])) NOT BETWEEN 2 AND 19998) THROW 50002, ''Versao fora do ' +
    'limite de 1 a 9999 caracteres: itens_exportadores.Versao.'', 1;');
  ASchema.AlterColumn('Versao')
   .HasSchema('duimp')
   .HasTable('itens_exportadores')
   .HasColumnType('NVARCHAR(MAX)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS')
   .IsRequired;
  ASchema.Sql(
    'ALTER TABLE [duimp].[itens_exportadores] WITH CHECK ADD CONSTRAINT ' +
    '[CK_itens_exportadores_Versao_Length] CHECK (DATALENGTH([Versao]) BETWEEN 2 AND 19998);');
end;

procedure AlterDuimpItensExportadoresVersionText.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM [duimp].[itens_exportadores] WHERE [Versao] IS NOT NULL AND ' +
    '(DATALENGTH([Versao]) > 16 OR CONVERT(nvarchar(max), CONVERT(varchar(max), [Versao])) COLLATE ' +
    'Latin1_General_100_BIN2 <> [Versao] COLLATE Latin1_General_100_BIN2)) THROW 50003, ''Rollback ' +
    'impediria preservar os valores de itens_exportadores.Versao.'', 1;');
  ASchema.Sql(
    'ALTER TABLE [duimp].[itens_exportadores] DROP CONSTRAINT [CK_itens_exportadores_Versao_Length];');
  ASchema.AlterColumn('Versao')
   .HasSchema('duimp')
   .HasTable('itens_exportadores')
   .HasColumnType('VARCHAR(8)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS')
   .IsRequired;
end;

initialization
begin
  RegisterMigration(TClientMigration, AlterDuimpItensExportadoresVersionText);
end;

end.
