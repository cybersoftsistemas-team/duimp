unit pucomex.dom.Duimps.Model.MercadoriaValoresCalculadosItemCover;

interface

type
  TMercadoriaValoresCalculadosItemCover = class
  private
    FValorAduaneiroBRL: Currency;
    FValorLocalEmbarqueBRL: Currency;
  public
    property ValorAduaneiroBRL: Currency read FValorAduaneiroBRL write FValorAduaneiroBRL;
    property ValorLocalEmbarqueBRL: Currency read FValorLocalEmbarqueBRL write FValorLocalEmbarqueBRL;
  end;

implementation

end.
