unit pucomex.dom.Duimps.Model.ProdutoCampoCompostoIntegracaoDTO;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.ProdutoCampoSimplesIntegracaoDTO;

type
  TProdutoCampoCompostoIntegracaoDTO = class
  private
    FAtributo: string;
    FValores: TArray<TProdutoCampoSimplesIntegracaoDTO>;
  public
    destructor Destroy; override;
    property Atributo: string read FAtributo write FAtributo;
    property Valores: TArray<TProdutoCampoSimplesIntegracaoDTO> read FValores write FValores;
  end;

implementation

uses
{PROJECT}
  cbsCore.Reflection;

{ TProdutoCampoCompostoIntegracaoDTO }

destructor TProdutoCampoCompostoIntegracaoDTO.Destroy;
begin
  FreeArrayOfObjects<TProdutoCampoSimplesIntegracaoDTO>(FValores);
  inherited;
end;

end.
