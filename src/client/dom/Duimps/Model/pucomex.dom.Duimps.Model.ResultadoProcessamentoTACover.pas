unit pucomex.dom.Duimps.Model.ResultadoProcessamentoTACover;

interface

type
  TResultadoProcessamentoTACover = class
  private
    FDataProcessamento: string;
    FResultadoConsolidadoTA: string;
  public
    property DataProcessamento: string read FDataProcessamento write FDataProcessamento;
    property ResultadoConsolidadoTA: string read FResultadoConsolidadoTA write FResultadoConsolidadoTA;
  end;

implementation

end.
