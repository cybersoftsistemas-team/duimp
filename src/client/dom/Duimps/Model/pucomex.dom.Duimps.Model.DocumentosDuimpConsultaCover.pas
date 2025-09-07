unit pucomex.dom.Duimps.Model.DocumentosDuimpConsultaCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.DeclaracaoExportacaoEstrangeiraCover,
  pucomex.dom.Duimps.Model.DocumentoInstrucaoCover,
  pucomex.dom.Duimps.Model.DossieCover,
  pucomex.dom.Duimps.Model.ProcessoDocumentoInstrucaoCover;

type
  TDocumentosDuimpConsultaCover = class
  private
    FDeclaracoesExportacaoEstrangeira: TArray<TDeclaracaoExportacaoEstrangeiraCover>;
    FDocumentosInstrucao: TArray<TDocumentoInstrucaoCover>;
    FDossies: TArray<TDossieCover>;
    FProcessos: TArray<TProcessoDocumentoInstrucaoCover>;
  public
    destructor Destroy; override;
    property DeclaracoesExportacaoEstrangeira: TArray<TDeclaracaoExportacaoEstrangeiraCover> read FDeclaracoesExportacaoEstrangeira write FDeclaracoesExportacaoEstrangeira;
    property DocumentosInstrucao: TArray<TDocumentoInstrucaoCover> read FDocumentosInstrucao write FDocumentosInstrucao;
    property Dossies: TArray<TDossieCover> read FDossies write FDossies;
    property Processos: TArray<TProcessoDocumentoInstrucaoCover> read FProcessos write FProcessos;
  end;

implementation

uses
{PROJECT}
  cbsCore.Reflection;

{ TDocumentosDuimpConsultaCover }

destructor TDocumentosDuimpConsultaCover.Destroy;
begin
  FreeArrayOfObjects<TDeclaracaoExportacaoEstrangeiraCover>(FDeclaracoesExportacaoEstrangeira);
  FreeArrayOfObjects<TDocumentoInstrucaoCover>(FDocumentosInstrucao);
  FreeArrayOfObjects<TDossieCover>(FDossies);
  FreeArrayOfObjects<TProcessoDocumentoInstrucaoCover>(FProcessos);
  inherited;
end;

end.
