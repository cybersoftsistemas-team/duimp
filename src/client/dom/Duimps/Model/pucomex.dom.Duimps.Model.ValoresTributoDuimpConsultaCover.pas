unit pucomex.dom.Duimps.Model.ValoresTributoDuimpConsultaCover;

interface

type
  TValoresTributoDuimpConsultaCover = class
  private
    FAReduzir: Double;
    FARecolher: Double;
    FCalculado: Double;
    FDevido: Double;
    FRecolhido: Double;
    FSuspenso: Double;
  public
    property ARecolher: Double read FARecolher write FARecolher;
    property AReduzir: Double read FAReduzir write FAReduzir;
    property Calculado: Double read FCalculado write FCalculado;
    property Devido: Double read FDevido write FDevido;
    property Recolhido: Double read FRecolhido write FRecolhido;
    property Suspenso: Double read FSuspenso write FSuspenso;
  end;

implementation

end.
