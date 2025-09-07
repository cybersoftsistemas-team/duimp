unit pucomex.dom.Duimps.Model.InformacoesVersaoVigenteCover;

interface

type
  TInformacoesVersaoVigenteCover = class
  private
    FDataRegistro: string;
    FNumero: string;
    FVersao: string;
  public
    property DataRegistro: string read FDataRegistro write FDataRegistro;
    property Numero: string read FNumero write FNumero;
    property Versao: string read FVersao write FVersao;
  end;

implementation

end.
