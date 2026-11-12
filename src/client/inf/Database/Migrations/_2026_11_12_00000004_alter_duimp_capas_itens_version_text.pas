unit _2026_11_12_00000004_alter_duimp_capas_itens_version_text;

interface

uses
  cbsMigrations.Support.Migration;

type
  AlterDuimpCapasItensVersionText = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
  duimp.inf.Database.MigrationContext;

procedure AlterDuimpCapasItensVersionText.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM [duimp].[capas_itens] WHERE [FabricanteVersao] IS NOT NULL AND ' +
    'DATALENGTH(CONVERT(nvarchar(max), [FabricanteVersao])) NOT BETWEEN 2 AND 19998) THROW 50002, ''Versao ' +
    'fora do limite de 1 a 9999 caracteres: capas_itens.FabricanteVersao.'', 1;');
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM [duimp].[capas_itens] WHERE [ExportadorVersao] IS NOT NULL AND ' +
    'DATALENGTH(CONVERT(nvarchar(max), [ExportadorVersao])) NOT BETWEEN 2 AND 19998) THROW 50002, ''Versao ' +
    'fora do limite de 1 a 9999 caracteres: capas_itens.ExportadorVersao.'', 1;');
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM [duimp].[capas_itens] WHERE [ProdutoVersao] IS NOT NULL AND ' +
    'DATALENGTH(CONVERT(nvarchar(max), [ProdutoVersao])) NOT BETWEEN 2 AND 19998) THROW 50002, ''Versao ' +
    'fora do limite de 1 a 9999 caracteres: capas_itens.ProdutoVersao.'', 1;');
  // Remove dependent keys before changing the column to a MAX type.
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE parent_object_id = ' +
    'OBJECT_ID(N''duimp.capas_itens'') AND name = ' +
    'N''IX_duimp_capas_itens_VersaoId_Adicao_NumeroItem_ProdutoCodigo_ProdutoVersao'') ALTER TABLE ' +
    '[duimp].[capas_itens] DROP CONSTRAINT ' +
    '[IX_duimp_capas_itens_VersaoId_Adicao_NumeroItem_ProdutoCodigo_ProdutoVersao];');
  ASchema.AlterColumn('FabricanteVersao')
   .HasSchema('duimp')
   .HasTable('capas_itens')
   .HasColumnType('NVARCHAR(MAX)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS')
   .IsOptional;
  ASchema.Sql(
    'ALTER TABLE [duimp].[capas_itens] WITH CHECK ADD CONSTRAINT [CK_capas_itens_FabricanteVersao_Length] ' +
    'CHECK (DATALENGTH([FabricanteVersao]) BETWEEN 2 AND 19998);');
  ASchema.AlterColumn('ExportadorVersao')
   .HasSchema('duimp')
   .HasTable('capas_itens')
   .HasColumnType('NVARCHAR(MAX)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS')
   .IsRequired;
  ASchema.Sql(
    'ALTER TABLE [duimp].[capas_itens] WITH CHECK ADD CONSTRAINT [CK_capas_itens_ExportadorVersao_Length] ' +
    'CHECK (DATALENGTH([ExportadorVersao]) BETWEEN 2 AND 19998);');
  ASchema.AlterColumn('ProdutoVersao')
   .HasSchema('duimp')
   .HasTable('capas_itens')
   .HasColumnType('NVARCHAR(MAX)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS')
   .IsRequired;
  ASchema.Sql(
    'ALTER TABLE [duimp].[capas_itens] WITH CHECK ADD CONSTRAINT [CK_capas_itens_ProdutoVersao_Length] ' +
    'CHECK (DATALENGTH([ProdutoVersao]) BETWEEN 2 AND 19998);');
  // The remaining unique key (VersaoId, Adicao, NumeroItem) protects each item.
end;

procedure AlterDuimpCapasItensVersionText.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM [duimp].[capas_itens] WHERE [FabricanteVersao] IS NOT NULL AND ' +
    '(DATALENGTH([FabricanteVersao]) > 16 OR CONVERT(nvarchar(max), CONVERT(varchar(max), ' +
    '[FabricanteVersao])) COLLATE Latin1_General_100_BIN2 <> [FabricanteVersao] COLLATE ' +
    'Latin1_General_100_BIN2)) THROW 50003, ''Rollback impediria preservar os valores de ' +
    'capas_itens.FabricanteVersao.'', 1;');
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM [duimp].[capas_itens] WHERE [ExportadorVersao] IS NOT NULL AND ' +
    '(DATALENGTH([ExportadorVersao]) > 16 OR CONVERT(nvarchar(max), CONVERT(varchar(max), ' +
    '[ExportadorVersao])) COLLATE Latin1_General_100_BIN2 <> [ExportadorVersao] COLLATE ' +
    'Latin1_General_100_BIN2)) THROW 50003, ''Rollback impediria preservar os valores de ' +
    'capas_itens.ExportadorVersao.'', 1;');
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM [duimp].[capas_itens] WHERE [ProdutoVersao] IS NOT NULL AND ' +
    '(TRY_CONVERT(int, [ProdutoVersao]) IS NULL)) THROW 50003, ''Rollback impediria preservar os valores ' +
    'de capas_itens.ProdutoVersao.'', 1;');
  ASchema.Sql(
    'ALTER TABLE [duimp].[capas_itens] DROP CONSTRAINT [CK_capas_itens_FabricanteVersao_Length];');
  ASchema.AlterColumn('FabricanteVersao')
   .HasSchema('duimp')
   .HasTable('capas_itens')
   .HasColumnType('VARCHAR(8)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS')
   .IsOptional;
  ASchema.Sql(
    'ALTER TABLE [duimp].[capas_itens] DROP CONSTRAINT [CK_capas_itens_ExportadorVersao_Length];');
  ASchema.AlterColumn('ExportadorVersao')
   .HasSchema('duimp')
   .HasTable('capas_itens')
   .HasColumnType('VARCHAR(8)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS')
   .IsRequired;
  ASchema.Sql(
    'ALTER TABLE [duimp].[capas_itens] DROP CONSTRAINT [CK_capas_itens_ProdutoVersao_Length];');
  ASchema.AlterColumn('ProdutoVersao')
   .HasSchema('duimp')
   .HasTable('capas_itens')
   .HasColumnType('int')
   .IsRequired;
  ASchema.Sql(
    'ALTER TABLE [duimp].[capas_itens] ADD CONSTRAINT ' +
    '[IX_duimp_capas_itens_VersaoId_Adicao_NumeroItem_ProdutoCodigo_ProdutoVersao] UNIQUE (VersaoId, ' +
    'Adicao, NumeroItem, ProdutoCodigo, ProdutoVersao);');
end;

initialization
begin
  RegisterMigration(TClientMigration, AlterDuimpCapasItensVersionText);
end;

end.
