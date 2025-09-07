unit pucomex.dom.Duimps.Model.ProcessoDocumentoInstrucaoCover;

interface

type
  TProcessoDocumentoInstrucaoCover = class
  private
    FIdentificacao: string;
    FTipo: string;
  public
    property Identificacao: string read FIdentificacao write FIdentificacao;
    property Tipo: string read FTipo write FTipo;
  end;

implementation

end.
