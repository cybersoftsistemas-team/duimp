unit pucomex.dom.Duimps.Model.ProdutoCampoCompostoMultivaloradoIntegracaoDTO;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.ProdutoCampoSimplesIntegracaoDTO;

type
  TProdutoCampoCompostoMultivaloradoIntegracaoDTO = class
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

{ TProdutoCampoCompostoMultivaloradoIntegracaoDTO }

destructor TProdutoCampoCompostoMultivaloradoIntegracaoDTO.Destroy;
begin
  FreeArrayOfObjects<TProdutoCampoSimplesIntegracaoDTO>(FValores);
  inherited;
end;

end.
