unit pucomex.dom.Duimps.Model.MercadoriaDuimpConsultaCover;

interface

type
  TMercadoriaDuimpConsultaCover = class
  private
    FValorTotalLocalEmbarqueUSD: Double;
    FValorTotalLocalEmbarqueBRL: Double;
  public
    property ValorTotalLocalEmbarqueBRL: Double read FValorTotalLocalEmbarqueBRL write FValorTotalLocalEmbarqueBRL;
    property ValorTotalLocalEmbarqueUSD: Double read FValorTotalLocalEmbarqueUSD write FValorTotalLocalEmbarqueUSD;
  end;

implementation

end.
