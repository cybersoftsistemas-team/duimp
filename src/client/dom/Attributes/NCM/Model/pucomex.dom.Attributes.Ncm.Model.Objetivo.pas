unit pucomex.dom.Attributes.Ncm.Model.Objetivo;

interface

type
  TObjetivo = class
  strict private
    FCodigo: Integer;
    FDescricao: string;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

end.
