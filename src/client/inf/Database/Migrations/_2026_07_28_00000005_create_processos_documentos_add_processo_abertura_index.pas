unit _2026_07_28_00000005_create_processos_documentos_add_processo_abertura_index;

interface

uses
{PROJECT}
  cbsMigrations.Support.Migration;

type
  CreateProcessosDocumentosAddProcessoAberturaIndex = class(TMigration)
  protected
    procedure Up(const ASchema: IMigrationBuilder); override;
    procedure Down(const ASchema: IMigrationBuilder); override;
  end;

implementation

uses
{PROJECT}
  duimp.inf.Database.MigrationContext;

{ CreateProcessosDocumentosAddProcessoAberturaIndex }

procedure CreateProcessosDocumentosAddProcessoAberturaIndex.Up(const ASchema: IMigrationBuilder);
begin
  ASchema.CreateIndex('ProcessosDocumentos', ['Processo_Abertura']);
end;

procedure CreateProcessosDocumentosAddProcessoAberturaIndex.Down(const ASchema: IMigrationBuilder);
begin
  ASchema.DropIndex('IX_ProcessosDocumentos_Processo_Abertura');
end;

initialization
begin
  RegisterMigration(TClientMigration, CreateProcessosDocumentosAddProcessoAberturaIndex);
end;

end.
