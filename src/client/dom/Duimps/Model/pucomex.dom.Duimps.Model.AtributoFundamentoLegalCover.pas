unit pucomex.dom.Duimps.Model.AtributoFundamentoLegalCover;

interface

type
  TAtributoFundamentoLegalCover = class
  private
    FCodigo: string;
    FValor: string;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Valor: string read FValor write FValor;
  end;

implementation

end.
