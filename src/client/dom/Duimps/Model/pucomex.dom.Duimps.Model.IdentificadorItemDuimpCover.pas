unit pucomex.dom.Duimps.Model.IdentificadorItemDuimpCover;

interface

type
  TIdentificadorItemDuimpCover = class
  private
    FNumero: string;
    FNumeroItem: Integer;
    FVersao: Integer;
  public
    property Numero: string read FNumero write FNumero;
    property NumeroItem: Integer read FNumeroItem write FNumeroItem;
    property Versao: Integer read FVersao write FVersao;
  end;

implementation

end.
