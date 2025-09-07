unit pucomex.dom.Duimps.Model.MoedaAcrescimoDeducaoCover;

interface

type
  TMoedaAcrescimoDeducaoCover = class
  private
    FCodigo: string;
    FValor: Currency;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Valor: Currency read FValor write FValor;
  end;

implementation

end.
