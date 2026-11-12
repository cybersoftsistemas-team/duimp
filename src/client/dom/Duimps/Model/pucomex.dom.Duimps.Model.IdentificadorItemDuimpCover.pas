unit pucomex.dom.Duimps.Model.IdentificadorItemDuimpCover;

interface

type
  TIdentificadorItemDuimpCover = class
  private
    FNumero: string;
    FNumeroItem: Integer;
    FVersao: string;
  public
    property Numero: string read FNumero write FNumero;
    property NumeroItem: Integer read FNumeroItem write FNumeroItem;
    property Versao: string read FVersao write FVersao;
  end;

implementation

end.
