unit _2026_11_12_00000002_alter_duimp_versoes_version_text;

interface

uses
  cbsMigrations.Support.Migration;

type
  AlterDuimpVersoesVersionText = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
  duimp.inf.Database.MigrationContext;

procedure AlterDuimpVersoesVersionText.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM [duimp].[versoes] WHERE [Versao] IS NOT NULL AND ' +
    'DATALENGTH(CONVERT(nvarchar(max), [Versao])) NOT BETWEEN 2 AND 19998) THROW 50002, ''Versao fora do ' +
    'limite de 1 a 9999 caracteres: versoes.Versao.'', 1;');
  // Remove dependent keys before changing the column to a MAX type.
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE parent_object_id = OBJECT_ID(N''duimp.versoes'') ' +
    'AND name = N''IX_duimp_versoes_DuimpId_Versao'') ALTER TABLE [duimp].[versoes] DROP CONSTRAINT ' +
    '[IX_duimp_versoes_DuimpId_Versao];');
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE parent_object_id = OBJECT_ID(N''duimp.versoes'') ' +
    'AND name = N''IX_duimp_versoes_DuimpId_ProcessoNumero_Versao'') ALTER TABLE [duimp].[versoes] DROP ' +
    'CONSTRAINT [IX_duimp_versoes_DuimpId_ProcessoNumero_Versao];');
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N''duimp.versoes'') AND name = ' +
    'N''IX_duimp_versoes_ProcessoNumero_Versao'') DROP INDEX [IX_duimp_versoes_ProcessoNumero_Versao] ON ' +
    '[duimp].[versoes];');
  ASchema.AlterColumn('Versao')
   .HasSchema('duimp')
   .HasTable('versoes')
   .HasColumnType('NVARCHAR(MAX)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS')
   .IsRequired;
  ASchema.Sql(
    'ALTER TABLE [duimp].[versoes] WITH CHECK ADD CONSTRAINT [CK_versoes_Versao_Length] CHECK ' +
    '(DATALENGTH([Versao]) BETWEEN 2 AND 19998);');
  ASchema.Sql(
    'CREATE INDEX [IX_duimp_versoes_ProcessoNumero_Versao] ON [duimp].[versoes] (ProcessoNumero) INCLUDE ' +
    '(Versao);');
  // MAX columns cannot be unique index keys; compare complete versions under locks.
  ASchema.Sql(
    'CREATE TRIGGER [duimp].[TR_versoes_VersaoUnica] ON [duimp].[versoes] AFTER INSERT, UPDATE AS BEGIN ' +
    'SET NOCOUNT ON; IF EXISTS (SELECT 1 FROM [duimp].[versoes] A WITH (UPDLOCK, HOLDLOCK) JOIN ' +
    '[duimp].[versoes] B WITH (UPDLOCK, HOLDLOCK) ON A.DuimpId = B.DuimpId AND A.Versao = B.Versao AND ' +
    'A.Id <> B.Id WHERE EXISTS (SELECT 1 FROM inserted I WHERE I.DuimpId = A.DuimpId)) THROW 50004, ' +
    '''Versao duplicada em duimp.versoes.'', 1; END;');
end;

procedure AlterDuimpVersoesVersionText.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM [duimp].[versoes] WHERE [Versao] IS NOT NULL AND (TRY_CONVERT(int, ' +
    '[Versao]) IS NULL)) THROW 50003, ''Rollback impediria preservar os valores de versoes.Versao.'', 1;');
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N''duimp.versoes'') AND name = ' +
    'N''IX_duimp_versoes_ProcessoNumero_Versao'') DROP INDEX [IX_duimp_versoes_ProcessoNumero_Versao] ON ' +
    '[duimp].[versoes];');
  ASchema.Sql(
    'IF OBJECT_ID(N''duimp.TR_versoes_VersaoUnica'', N''TR'') IS NOT NULL DROP TRIGGER ' +
    '[duimp].[TR_versoes_VersaoUnica];');
  ASchema.Sql(
    'ALTER TABLE [duimp].[versoes] DROP CONSTRAINT [CK_versoes_Versao_Length];');
  ASchema.AlterColumn('Versao')
   .HasSchema('duimp')
   .HasTable('versoes')
   .HasColumnType('int')
   .IsRequired;
  ASchema.Sql(
    'ALTER TABLE [duimp].[versoes] ADD CONSTRAINT [IX_duimp_versoes_DuimpId_Versao] UNIQUE (DuimpId, ' +
    'Versao);');
  ASchema.Sql(
    'ALTER TABLE [duimp].[versoes] ADD CONSTRAINT [IX_duimp_versoes_DuimpId_ProcessoNumero_Versao] UNIQUE ' +
    '(DuimpId, ProcessoNumero, Versao);');
  ASchema.Sql(
    'CREATE INDEX [IX_duimp_versoes_ProcessoNumero_Versao] ON [duimp].[versoes] (ProcessoNumero, Versao);');
end;

initialization
begin
  RegisterMigration(TClientMigration, AlterDuimpVersoesVersionText);
end;

end.
