unit _2026_07_28_00000001_create_processos_documentos_add_numero_declaracao_index;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateProcessosDocumentosAddNumeroDeclaracaoIndex = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateProcessosDocumentosAddNumeroDeclaracaoIndex }

procedure CreateProcessosDocumentosAddNumeroDeclaracaoIndex.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateIndex('ProcessosDocumentos', ['Numero_Declaracao']);
end;

procedure CreateProcessosDocumentosAddNumeroDeclaracaoIndex.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropIndex('IX_ProcessosDocumentos_Numero_Declaracao');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateProcessosDocumentosAddNumeroDeclaracaoIndex);
end;

end.
