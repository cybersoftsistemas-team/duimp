unit pucomex.dom.Duimps.Model.ProdutoCampoMultivaloradoIntegracaoDTO;

interface

type
  TProdutoCampoMultivaloradoIntegracaoDTO =  class
  private
    FAtributo: string;
    FValor: TArray<string>;
  public
    property Atributo: string read FAtributo write FAtributo;
    property Valor: TArray<string> read FValor write FValor;
  end;

implementation

end.
