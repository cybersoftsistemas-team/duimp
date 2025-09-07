unit pucomex.dom.Duimps.Model.ResultadoAnaliseRiscoAnuenteCover;

interface

type
  TResultadoAnaliseRiscoAnuenteCover = class
  private
    FOrgao: string;
    FResultado: string;
  public
    property Orgao: string read FOrgao write FOrgao;
    property Resultado: string read FResultado write FResultado;
  end;

implementation

end.
