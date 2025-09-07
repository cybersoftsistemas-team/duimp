unit pucomex.dom.Attributes.Ncm.Model.Atributos;

interface

type
  TListaAtributos = class
  private
    FCodigo: string;
    FDataInicioVigencia: string;
    FDataFimVigencia: string;
    FModalidade: string;
    FMultivalorado: Boolean;
    FObrigatorio: Boolean;
  public
    property Codigo: string read FCodigo write FCodigo;
    property DataInicioVigencia: string read FDataInicioVigencia write FDataInicioVigencia;
    property DataFimVigencia: string read FDataFimVigencia write FDataFimVigencia;
    property Modalidade: string read FModalidade write FModalidade;
    property Multivalorado: Boolean read FMultivalorado write FMultivalorado;
    property Obrigatorio: Boolean read FObrigatorio write FObrigatorio;
  end;

implementation

end.
