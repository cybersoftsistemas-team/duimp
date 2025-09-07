unit pucomex.dom.Duimps.Model.ValoresTributoItemCover;

interface

type
  TValoresTributoItemCover = class
  private
    FARecolher: Currency;
    FAReduzir: Currency;
    FCalculado: Currency;
    FCalculadoPagProporcional: Currency;
    FDevido: Currency;
    FOriginalDevido: Currency;
    FRecolhido: Currency;
    FSuspenso: Currency;
  public
    property ARecolher: Currency read FARecolher write FARecolher;
    property AReduzir: Currency read FAReduzir write FAReduzir;
    property Calculado: Currency read FCalculado write FCalculado;
    property CalculadoPagProporcional: Currency read FCalculadoPagProporcional write FCalculadoPagProporcional;
    property Devido: Currency read FDevido write FDevido;
    property OriginalDevido: Currency read FOriginalDevido write FOriginalDevido;
    property Recolhido: Currency read FRecolhido write FRecolhido;
    property Suspenso: Currency read FSuspenso write FSuspenso;
  end;

implementation

end.
