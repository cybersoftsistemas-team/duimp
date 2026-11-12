unit _2026_11_12_00000003_alter_duimp_pagamentos_version_text;

interface

uses
  cbsMigrations.Support.Migration;

type
  AlterDuimpPagamentosVersionText = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
  duimp.inf.Database.MigrationContext;

procedure AlterDuimpPagamentosVersionText.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM [duimp].[pagamentos] WHERE [VersaoOrigem] IS NOT NULL AND ' +
    'DATALENGTH(CONVERT(nvarchar(max), [VersaoOrigem])) NOT BETWEEN 2 AND 19998) THROW 50002, ''Versao ' +
    'fora do limite de 1 a 9999 caracteres: pagamentos.VersaoOrigem.'', 1;');
  // Remove dependent keys before changing the column to a MAX type.
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE parent_object_id = OBJECT_ID(N''duimp.pagamentos'') ' +
    'AND name = N''IX_duimp_pagamentos_DuimpId_VersaoOrigem_Tributo'') ALTER TABLE [duimp].[pagamentos] ' +
    'DROP CONSTRAINT [IX_duimp_pagamentos_DuimpId_VersaoOrigem_Tributo];');
  ASchema.AlterColumn('VersaoOrigem')
   .HasSchema('duimp')
   .HasTable('pagamentos')
   .HasColumnType('NVARCHAR(MAX)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS')
   .IsRequired;
  ASchema.Sql(
    'ALTER TABLE [duimp].[pagamentos] WITH CHECK ADD CONSTRAINT [CK_pagamentos_VersaoOrigem_Length] CHECK ' +
    '(DATALENGTH([VersaoOrigem]) BETWEEN 2 AND 19998);');
  // MAX columns cannot be unique index keys; compare complete versions under locks.
  ASchema.Sql(
    'CREATE TRIGGER [duimp].[TR_pagamentos_VersaoUnica] ON [duimp].[pagamentos] AFTER INSERT, UPDATE AS ' +
    'BEGIN SET NOCOUNT ON; IF EXISTS (SELECT 1 FROM [duimp].[pagamentos] A WITH (UPDLOCK, HOLDLOCK) JOIN ' +
    '[duimp].[pagamentos] B WITH (UPDLOCK, HOLDLOCK) ON A.DuimpId = B.DuimpId AND A.VersaoOrigem = ' +
    'B.VersaoOrigem AND A.Tributo = B.Tributo AND A.Id <> B.Id WHERE EXISTS (SELECT 1 FROM inserted I ' +
    'WHERE I.DuimpId = A.DuimpId)) THROW 50004, ''Versao duplicada em duimp.pagamentos.'', 1; END;');
end;

procedure AlterDuimpPagamentosVersionText.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.Sql(
    'IF EXISTS (SELECT 1 FROM [duimp].[pagamentos] WHERE [VersaoOrigem] IS NOT NULL AND (TRY_CONVERT(int, ' +
    '[VersaoOrigem]) IS NULL)) THROW 50003, ''Rollback impediria preservar os valores de ' +
    'pagamentos.VersaoOrigem.'', 1;');
  ASchema.Sql(
    'IF OBJECT_ID(N''duimp.TR_pagamentos_VersaoUnica'', N''TR'') IS NOT NULL DROP TRIGGER ' +
    '[duimp].[TR_pagamentos_VersaoUnica];');
  ASchema.Sql(
    'ALTER TABLE [duimp].[pagamentos] DROP CONSTRAINT [CK_pagamentos_VersaoOrigem_Length];');
  ASchema.AlterColumn('VersaoOrigem')
   .HasSchema('duimp')
   .HasTable('pagamentos')
   .HasColumnType('int')
   .IsRequired;
  ASchema.Sql(
    'ALTER TABLE [duimp].[pagamentos] ADD CONSTRAINT [IX_duimp_pagamentos_DuimpId_VersaoOrigem_Tributo] ' +
    'UNIQUE (DuimpId, VersaoOrigem, Tributo);');
end;

initialization
begin
  RegisterMigration(TClientMigration, AlterDuimpPagamentosVersionText);
end;

end.
