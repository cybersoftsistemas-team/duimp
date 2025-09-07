unit pucomex.dom.Duimps.Model.IncotermCover;

interface

type
  TIncotermCover = class
  private
    FCodigo: string;
    FComplemento: string;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Complemento: string read FComplemento write FComplemento;
  end;

implementation

end.
