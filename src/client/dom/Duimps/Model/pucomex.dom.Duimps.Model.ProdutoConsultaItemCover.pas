unit pucomex.dom.Duimps.Model.ProdutoConsultaItemCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.ProdutoIntegracaoDTO;

type
  TProdutoConsultaItemCover = class
  private
    FCodigo: Integer;
    FDetalhes: TProdutoIntegracaoDTO;
    FNiResponsavel: string;
    FVersao: string;
  public
    destructor Destroy; override;
    property Codigo: Integer read FCodigo write FCodigo;
    property Detalhes: TProdutoIntegracaoDTO read FDetalhes write FDetalhes;
    property NiResponsavel: string read FNiResponsavel write FNiResponsavel;
    property Versao: string read FVersao write FVersao;
  end;

implementation

uses
{IDE}
  System.SysUtils;

{ TProdutoConsultaItemCover }

destructor TProdutoConsultaItemCover.Destroy;
begin
  FreeAndNil(FDetalhes);
  inherited;
end;

end.
