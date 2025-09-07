unit pucomex.dom.Attributes.Ncm.Model.Dominio;

interface

type
  TDominio = class
  private
    FCodigo: string;
    FDescricao: string;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

end.
