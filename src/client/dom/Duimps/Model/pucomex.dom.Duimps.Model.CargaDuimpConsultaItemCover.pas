unit pucomex.dom.Duimps.Model.CargaDuimpConsultaItemCover;

interface

type
  TCargaDuimpConsultaItemCover = class
  private
    FCodigoMoedaNegociada: string;
    FValorMoedaNegociada: Currency;
  public
    property CodigoMoedaNegociada: string read FCodigoMoedaNegociada write FCodigoMoedaNegociada;
    property ValorMoedaNegociada: Currency read FValorMoedaNegociada write FValorMoedaNegociada;
  end;

implementation

end.
