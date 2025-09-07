unit pucomex.dom.Duimps.Model.ProdutoIntegracaoDTO;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.ProdutoCampoCompostoIntegracaoDTO,
  pucomex.dom.Duimps.Model.ProdutoCampoCompostoMultivaloradoIntegracaoDTO,
  pucomex.dom.Duimps.Model.ProdutoCampoMultivaloradoIntegracaoDTO,
  pucomex.dom.Duimps.Model.ProdutoCampoSimplesIntegracaoDTO;

type
  TProdutoIntegracaoDTO = class
  private
    FAtributos: TArray<TProdutoCampoSimplesIntegracaoDTO>;
    FAtributosCompostos: TArray<TProdutoCampoCompostoIntegracaoDTO>;
    FAtributosCompostosMultivalorados: TArray<TProdutoCampoCompostoMultivaloradoIntegracaoDTO>;
    FAtributosMultivalorados: TArray<TProdutoCampoMultivaloradoIntegracaoDTO>;
    FCodigo: Integer;
    FCodigosInterno: TArray<string>;
    FCpfCnpjRaiz: string;
    FDataReferencia: string;
    FDescricao: string;
    FDenominacao: string;
    FModalidade: string;
    FNcm: string;
    FSeq: Integer;
    FSituacao: string;
    FVersao: string;
  public
    destructor Destroy; override;
    property Atributos: TArray<TProdutoCampoSimplesIntegracaoDTO> read FAtributos write FAtributos;
    property AtributosCompostos: TArray<TProdutoCampoCompostoIntegracaoDTO> read FAtributosCompostos write FAtributosCompostos;
    property AtributosCompostosMultivalorados: TArray<TProdutoCampoCompostoMultivaloradoIntegracaoDTO> read FAtributosCompostosMultivalorados write FAtributosCompostosMultivalorados;
    property AtributosMultivalorados: TArray<TProdutoCampoMultivaloradoIntegracaoDTO> read FAtributosMultivalorados write FAtributosMultivalorados;
    property Codigo: Integer read FCodigo write FCodigo;
    property CodigosInterno: TArray<string> read FCodigosInterno write FCodigosInterno;
    property CpfCnpjRaiz: string read FCpfCnpjRaiz write FCpfCnpjRaiz;
    property DataReferencia: string read FDataReferencia write FDataReferencia;
    property Descricao: string read FDescricao write FDescricao;
    property Denominacao: string read FDenominacao write FDenominacao;
    property Modalidade: string read FModalidade write FModalidade;
    property Ncm: string read FNcm write FNcm;
    property Seq: Integer read FSeq write FSeq;
    property Situacao: string read FSituacao write FSituacao;
    property Versao: string read FVersao write FVersao;
  end;

implementation

uses
{PROJECT}
  cbsCore.Reflection;

{ TProdutoIntegracaoDTO }

destructor TProdutoIntegracaoDTO.Destroy;
begin
  FreeArrayOfObjects<TProdutoCampoCompostoIntegracaoDTO>(FAtributosCompostos);
  FreeArrayOfObjects<TProdutoCampoCompostoMultivaloradoIntegracaoDTO>(FAtributosCompostosMultivalorados);
  FreeArrayOfObjects<TProdutoCampoMultivaloradoIntegracaoDTO>(FAtributosMultivalorados);
  FreeArrayOfObjects<TProdutoCampoSimplesIntegracaoDTO>(FAtributos);
  inherited;
end;

end.
