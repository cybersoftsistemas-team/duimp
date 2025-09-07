unit pucomex.dom.Duimps.Model.DocumentoInstrucaoCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.PalavraChaveDocumentoInstrucaoCover,
  pucomex.dom.Duimps.Model.TipoDocumentoInstrucaoCover;

type
  TDocumentoInstrucaoCover = class
  private
    FPalavrasChave: TArray<TPalavraChaveDocumentoInstrucaoCover>;
    FTipo: TTipoDocumentoInstrucaoCover;
  public
    destructor Destroy; override;
    property PalavrasChave: TArray<TPalavraChaveDocumentoInstrucaoCover> read FPalavrasChave write FPalavrasChave;
    property Tipo: TTipoDocumentoInstrucaoCover read FTipo write FTipo;
  end;

implementation

uses
{IDE}
  System.SysUtils,
{PROJECT}
  cbsCore.Reflection;

{ TDocumentoInstrucaoCover }

destructor TDocumentoInstrucaoCover.Destroy;
begin
  FreeArrayOfObjects<TPalavraChaveDocumentoInstrucaoCover>(FPalavrasChave);
  FreeAndNil(FTipo);
  inherited;
end;

end.
