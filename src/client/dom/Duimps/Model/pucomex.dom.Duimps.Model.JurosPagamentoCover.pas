unit pucomex.dom.Duimps.Model.JurosPagamentoCover;

interface

type
  TJurosPagamentoCover = class
  private
    FAgenciaJuros: string;
    FBancoJuros: string;
    FCodigoReceita: string;
    FContaJuros: string;
    FDataPagamentoJuros: string;
    FValor: Double;
  public
    property AgenciaJuros: string read FAgenciaJuros write FAgenciaJuros;
    property BancoJuros: string read FBancoJuros write FBancoJuros;
    property CodigoReceita: string read FCodigoReceita write FCodigoReceita;
    property ContaJuros: string read FContaJuros write FContaJuros;
    property DataPagamentoJuros: string read FDataPagamentoJuros write FDataPagamentoJuros;
    property Valor: Double read FValor write FValor;
  end;

implementation

end.
