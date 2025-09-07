unit pucomex.dom.Duimps.Model.DeclaracaoVinculadaCoverConsulta;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.ItemDeclaracaoVinculadaCover;

type
  TDeclaracaoVinculadaCoverConsulta = class
  private
    FDataRegistro: string;
    FNumeroDeclaracaoOriginal: string;
    FNumeroDeclaracaoVinculada: string;
    FNumeroItemDeclaracaoOriginal: Integer;
    FItem: TItemDeclaracaoVinculadaCover;
    FTipo: string;
    FVersaoDeclaracaoOriginal: string;
    FVersaoDeclaracaoVinculada: string;
  public
    destructor Destroy; override;
    property DataRegistro: string read FDataRegistro write FDataRegistro;
    property NumeroDeclaracaoOriginal: string read FNumeroDeclaracaoOriginal write FNumeroDeclaracaoOriginal;
    property NumeroDeclaracaoVinculada: string read FNumeroDeclaracaoVinculada write FNumeroDeclaracaoVinculada;
    property NumeroItemDeclaracaoOriginal: Integer read FNumeroItemDeclaracaoOriginal write FNumeroItemDeclaracaoOriginal;
    property Item: TItemDeclaracaoVinculadaCover read FItem write FItem;
    property Tipo: string read FTipo write FTipo;
    property VersaoDeclaracaoOriginal: string read FVersaoDeclaracaoOriginal write FVersaoDeclaracaoOriginal;
    property VersaoDeclaracaoVinculada: string read FVersaoDeclaracaoVinculada write FVersaoDeclaracaoVinculada;
  end;

implementation

uses
{IDE}
  System.SysUtils;

{ TDeclaracaoVinculadaCoverConsulta }

destructor TDeclaracaoVinculadaCoverConsulta.Destroy;
begin
  FreeAndNil(FItem);
  inherited;
end;

end.
