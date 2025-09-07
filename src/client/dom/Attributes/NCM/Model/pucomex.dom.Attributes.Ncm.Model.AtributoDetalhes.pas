unit pucomex.dom.Attributes.Ncm.Model.AtributoDetalhes;

interface

uses
{PROJECT}
  pucomex.dom.Attributes.Ncm.Model.Atributos,
  pucomex.dom.Attributes.Ncm.Model.Dominio,
  pucomex.dom.Attributes.Ncm.Model.Objetivo;

type
  TDetalhesAtributos = class(TListaAtributos)
  private
    FAtributoCondicionante: Boolean;
    FCasasDecimais: Integer;
    FObjetivos: TArray<TObjetivo>;
    FOrgaos: TArray<string>;
    FDominio: TArray<TDominio>;
    FFormaPreenchimento: string;
    FNomeApresentacao: string;
    FTamanhoMaximo: Integer;
    FModalidade: string;
    FNome: string;
    FOrientacaoPreenchimento: string;
  public
    destructor Destroy; override;
    property AtributoCondicionante: Boolean read FAtributoCondicionante write FAtributoCondicionante;
    property CasasDecimais: Integer read FCasasDecimais write FCasasDecimais;
    property Dominio: TArray<TDominio> read FDominio write FDominio;
    property FormaPreenchimento: string read FFormaPreenchimento write FFormaPreenchimento;
    property Modalidade: string read FModalidade write FModalidade;
    property Nome: string read FNome write FNome;
    property NomeApresentacao: string read FNomeApresentacao write FNomeApresentacao;
    property Objetivos: TArray<TObjetivo> read FObjetivos write FObjetivos;
    property Orgaos: TArray<string> read FOrgaos write FOrgaos;
    property OrientacaoPreenchimento: string read FOrientacaoPreenchimento write FOrientacaoPreenchimento;
    property TamanhoMaximo: Integer read FTamanhoMaximo write FTamanhoMaximo;
  end;

implementation

uses
{PROJECT}
  cbsCore.Reflection;

{ TDetalhesAtributos }

destructor TDetalhesAtributos.Destroy;
begin
  FreeArrayOfObjects<TObjetivo>(FObjetivos);
  FreeArrayOfObjects<TDominio>(FDominio);
  inherited;
end;

end.

