unit pucomex.dom.Duimps.Model.MercadoriaCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.AtributoFundamentoLegalCover,
  pucomex.dom.Duimps.Model.CondicaoVendaConsultaItemCover,
  pucomex.dom.Duimps.Model.MoedaNegociadaCover,
  pucomex.dom.Duimps.Model.TipoAplicacaoCover;

type
  TMercadoriaCover = class
  private
    FAtributosFundamentoLegalDuimp: TArray<TAtributoFundamentoLegalCover>;
    FCondicao: string;
    FCondicaoVenda: TCondicaoVendaConsultaItemCover;
    FDescricao: string;
    FMoedaNegociada: TMoedaNegociadaCover;
    FPesoLiquido: Currency;
    FQuantidadeComercial: Currency;
    FQuantidadeMedidaEstatistica: string;
    FTipoAplicacao: TTipoAplicacaoCover;
    FUnidadeComercial: string;
    FValorUnitarioMoedaNegociada: Currency;
  public
    destructor Destroy; override;
    property AtributosFundamentoLegalDuimp: TArray<TAtributoFundamentoLegalCover> read FAtributosFundamentoLegalDuimp write
      FAtributosFundamentoLegalDuimp;
    property Condicao: string read FCondicao write FCondicao;
    property Descricao: string read FDescricao write FDescricao;
    property MoedaNegociada: TMoedaNegociadaCover read FMoedaNegociada write FMoedaNegociada;
    property PesoLiquido: Currency read FPesoLiquido write FPesoLiquido;
    property QuantidadeComercial: Currency read FQuantidadeComercial write FQuantidadeComercial;
    property QuantidadeMedidaEstatistica: string read FQuantidadeMedidaEstatistica write FQuantidadeMedidaEstatistica;
    property TipoAplicacao: TTipoAplicacaoCover read FTipoAplicacao write FTipoAplicacao;
    property UnidadeComercial: string read FUnidadeComercial write FUnidadeComercial;
    property ValorUnitarioMoedaNegociada: Currency read FValorUnitarioMoedaNegociada write FValorUnitarioMoedaNegociada;
  end;

implementation

uses
{IDE}
  System.SysUtils,
{PROJECT}
  cbsCore.Reflection;

{ TMercadoriaCover }

destructor TMercadoriaCover.Destroy;
begin
  FreeArrayOfObjects<TAtributoFundamentoLegalCover>(FAtributosFundamentoLegalDuimp);
  FreeAndNil(FMoedaNegociada);
  FreeAndNil(FTipoAplicacao);
  FreeAndNil(FCondicaoVenda);
  inherited;
end;

end.
