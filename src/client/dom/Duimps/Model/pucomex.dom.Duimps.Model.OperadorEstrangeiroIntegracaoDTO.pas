unit pucomex.dom.Duimps.Model.OperadorEstrangeiroIntegracaoDTO;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.IdentificacaoAdicionalIntegracaoDTO;

type
  TOperadorEstrangeiroIntegracaoDTO = class
  private
    FCep: string;
    FCodigo: string;
    FCodigoInterno: string;
    FCodigoPais: string;
    FCodigoSubdivisaoPais: string;
    FCpfCnpjRaiz: string;
    FDataReferencia: string;
    FEmail: string;
    FIdentificacoesAdicionais: TArray<TIdentificacaoAdicionalIntegracaoDTO>;
    FLogradouro: string;
    FNome: string;
    FNomeCidade: string;
    FSeq: Integer;
    FSituacao: string;
    FTin: string;
    FVersao: string;
  public
    destructor Destroy; override;
    property Cep: string read FCep write FCep;
    property Codigo: string read FCodigo write FCodigo;
    property CodigoInterno: string read FCodigoInterno write FCodigoInterno;
    property CodigoPais: string read FCodigoPais write FCodigoPais;
    property CodigoSubdivisaoPais: string read FCodigoSubdivisaoPais write FCodigoSubdivisaoPais;
    property CpfCnpjRaiz: string read FCpfCnpjRaiz write FCpfCnpjRaiz;
    property DataReferencia: string read FDataReferencia write FDataReferencia;
    property Email: string read FEmail write FEmail;
    property IdentificacoesAdicionais: TArray<TIdentificacaoAdicionalIntegracaoDTO> read FIdentificacoesAdicionais write FIdentificacoesAdicionais;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Nome: string read FNome write FNome;
    property NomeCidade: string read FNomeCidade write FNomeCidade;
    property Seq: Integer read FSeq write FSeq;
    property Situacao: string read FSituacao write FSituacao;
    property Tin: string read FTin write FTin;
    property Versao: string read FVersao write FVersao;
  end;

implementation

uses
{PROJECT}
  cbsCore.Reflection;

{ TOperadorEstrangeiroIntegracaoDTO }

destructor TOperadorEstrangeiroIntegracaoDTO.Destroy;
begin
  FreeArrayOfObjects<TIdentificacaoAdicionalIntegracaoDTO>(FIdentificacoesAdicionais);
  inherited;
end;

end.
