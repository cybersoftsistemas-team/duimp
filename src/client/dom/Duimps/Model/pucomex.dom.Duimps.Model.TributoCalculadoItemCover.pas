unit pucomex.dom.Duimps.Model.TributoCalculadoItemCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.MemoriaCalculoItemCover,
  pucomex.dom.Duimps.Model.ValoresTributoItemCover;

type
  TTributoCalculadoItemCover = class
  private
    FMemoriaCalculo: TMemoriaCalculoItemCover;
    FTipo: string;
    FValoresBRL: TValoresTributoItemCover;
  public
    destructor Destroy; override;
    property MemoriaCalculo: TMemoriaCalculoItemCover read FMemoriaCalculo write FMemoriaCalculo;
    property Tipo: string read FTipo write FTipo;
    property ValoresBRL: TValoresTributoItemCover read FValoresBRL write FValoresBRL;
  end;

implementation

uses
{IDE}
  System.SysUtils;

{ TTributoCalculadoItemCover }

destructor TTributoCalculadoItemCover.Destroy;
begin
  FreeAndNil(FMemoriaCalculo);
  FreeAndNil(FValoresBRL);
  inherited;
end;

end.
