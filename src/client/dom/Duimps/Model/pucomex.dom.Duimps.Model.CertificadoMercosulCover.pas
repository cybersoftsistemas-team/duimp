unit pucomex.dom.Duimps.Model.CertificadoMercosulCover;

interface

type
  TCertificadoMercosulCover = class
  private
    FQuantidade: string;
    FNumero: string;
    FTipo: string;
  public
    property Tipo: string read FTipo write FTipo;
    property Quantidade: string read FQuantidade write FQuantidade;
    property Numero: string read FNumero write FNumero;
  end;

implementation

end.
