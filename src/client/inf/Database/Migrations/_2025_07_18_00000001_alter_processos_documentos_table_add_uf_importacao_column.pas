unit _2025_07_18_00000001_alter_processos_documentos_table_add_uf_importacao_column;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  AlterProcessosDocumentosTableAddUFImportacaoColumn = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ AlterProcessosDocumentosTableAddUFImportacaoColumn }

procedure AlterProcessosDocumentosTableAddUFImportacaoColumn.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.AddStringColumn('UF_Importacao', 'ProcessosDocumentos')
   .HasColumnType('char(2)')
   .HasCollation('SQL_Latin1_General_CP1_CI_AS');
end;

procedure AlterProcessosDocumentosTableAddUFImportacaoColumn.Down(const ASchema: IMigrationBuilder);
begin
//  ASchema.DropColumn('UF_Importacao')
end;

initialization
begin
  RegisterMigration(TClientMigration, AlterProcessosDocumentosTableAddUFImportacaoColumn);
end;

end.
