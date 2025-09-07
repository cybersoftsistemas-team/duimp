unit pucomex.dom.Duimps.Model.AdicaoValoresCalculadosDuimpCover;

interface

type
  TAdicaoValoresCalculadosDuimpCover = class
  private
    FItens: TArray<Integer>;
    FNumero: Integer;
  public
    property Itens: TArray<Integer> read FItens write FItens;
    property Numero: Integer read FNumero write FNumero;
  end;

implementation

end.
