unit pucomex.dom.Duimps.Model.ItemDuimpCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.AtributoItemCover,
  pucomex.dom.Duimps.Model.CaracterizacaoImportacaoConsultaItemCover,
  pucomex.dom.Duimps.Model.CertificadoMercosulCover,
  pucomex.dom.Duimps.Model.CondicaoVendaConsultaItemCover,
  pucomex.dom.Duimps.Model.DadosCambiaisCover,
  pucomex.dom.Duimps.Model.DeclaracaoVinculadaCoverConsulta,
  pucomex.dom.Duimps.Model.IdentificadorItemDuimpCover,
  pucomex.dom.Duimps.Model.IndicadorCompradorVendedorCover,
  pucomex.dom.Duimps.Model.IndicadorExportadorFabricanteCover,
  pucomex.dom.Duimps.Model.LpcoCover,
  pucomex.dom.Duimps.Model.MercadoriaCover,
  pucomex.dom.Duimps.Model.OperadorEstrangeiroCover,
  pucomex.dom.Duimps.Model.ProdutoConsultaItemCover,
  pucomex.dom.Duimps.Model.TributosConsultaItemCover;

type
  TItemDuimpCover = class
  private
    FAtributosDuimp: TArray<TAtributoItemCover>;
    FCaracterizacaoImportacao: TCaracterizacaoImportacaoConsultaItemCover;
    FCertificadoMercosul: TArray<TCertificadoMercosulCover>;
    FCondicaoVenda: TCondicaoVendaConsultaItemCover;
    FDadosCambiais: TDadosCambiaisCover;
    FDeclaracoesVinculadas: TArray<TDeclaracaoVinculadaCoverConsulta>;
    FExportador: TOperadorEstrangeiroCover;
    FFabricante: TOperadorEstrangeiroCover;
    FIdentificacao: TIdentificadorItemDuimpCover;
    FIndicadorCompradorVendedor: TIndicadorCompradorVendedorCover;
    FIndicadorExportadorFabricante: TIndicadorExportadorFabricanteCover;
    FLpcos: TArray<TLpcoCover>;
    FMercadoria: TMercadoriaCover;
    FProduto: TProdutoConsultaItemCover;
    FTributos: TTributosConsultaItemCover;
    FStatus: string;
  public
    destructor Destroy; override;
    property AtributosDuimp: TArray<TAtributoItemCover> read FAtributosDuimp write FAtributosDuimp;
    property CaracterizacaoImportacao: TCaracterizacaoImportacaoConsultaItemCover read FCaracterizacaoImportacao write FCaracterizacaoImportacao;
    property CertificadoMercosul: TArray<TCertificadoMercosulCover> read FCertificadoMercosul write FCertificadoMercosul;
    property CondicaoVenda: TCondicaoVendaConsultaItemCover read FCondicaoVenda write FCondicaoVenda;
    property DadosCambiais: TDadosCambiaisCover read FDadosCambiais write FDadosCambiais;
    property DeclaracoesVinculadas: TArray<TDeclaracaoVinculadaCoverConsulta> read FDeclaracoesVinculadas write FDeclaracoesVinculadas;
    property Exportador: TOperadorEstrangeiroCover read FExportador write FExportador;
    property Fabricante: TOperadorEstrangeiroCover read FFabricante write FFabricante;
    property Identificacao: TIdentificadorItemDuimpCover read FIdentificacao write FIdentificacao;
    property IndicadorCompradorVendedor: TIndicadorCompradorVendedorCover read FIndicadorCompradorVendedor write FIndicadorCompradorVendedor;
    property IndicadorExportadorFabricante: TIndicadorExportadorFabricanteCover read FIndicadorExportadorFabricante write FIndicadorExportadorFabricante;
    property Lpcos: TArray<TLpcoCover> read FLpcos write FLpcos;
    property Mercadoria: TMercadoriaCover read FMercadoria write FMercadoria;
    property Produto: TProdutoConsultaItemCover read FProduto write FProduto;
    property Tributos: TTributosConsultaItemCover read FTributos write FTributos;
    property Status: string read FStatus write FStatus;
  end;

implementation

uses
{IDE}
  System.SysUtils,
{PROJECT}
  cbsCore.Reflection;

{ TItemDuimpCover }

destructor TItemDuimpCover.Destroy;
begin
  FreeArrayOfObjects<TAtributoItemCover>(FAtributosDuimp);
  FreeAndNil(FCaracterizacaoImportacao);
  FreeArrayOfObjects<TCertificadoMercosulCover>(FCertificadoMercosul);
  FreeAndNil(FCondicaoVenda);
  FreeAndNil(FDadosCambiais);
  FreeArrayOfObjects<TDeclaracaoVinculadaCoverConsulta>(FDeclaracoesVinculadas);
  FreeAndNil(FExportador);
  FreeAndNil(FFabricante);
  FreeAndNil(FIdentificacao);
  FreeAndNil(FIndicadorCompradorVendedor);
  FreeAndNil(FIndicadorExportadorFabricante);
  FreeArrayOfObjects<TLpcoCover>(FLpcos);
  FreeAndNil(FMercadoria);
  FreeAndNil(FProduto);
  FreeAndNil(FTributos);
  inherited;
end;

end.
