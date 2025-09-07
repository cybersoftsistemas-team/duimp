unit pucomex.dom.Duimps.Model.DeclaracaoExportacaoEstrangeiraCover;

interface

type
  TDeclaracaoExportacaoEstrangeiraCover = class
  private
    FFaixaFim: string;
    FFaixaInicio: string;
    FNumero: string;
  public
    property FaixaFim: string read FFaixaFim write FFaixaFim;
    property FaixaInicio: string read FFaixaInicio write FFaixaInicio;
    property Numero: string read FNumero write FNumero;
  end;

implementation

end.
