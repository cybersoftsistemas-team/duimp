unit pucomex.dom.Duimps.Model.CargaDuimpConsultaCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.CargaDuimpConsultaItemCover,
  pucomex.dom.Duimps.Model.CargaDuimpMotivoSituacaoEspecialCover,
  pucomex.dom.Duimps.Model.CargaDuimpPaisProcedenciaCover,
  pucomex.dom.Duimps.Model.UnidadeDeclaradaCover;

type
  TCargaDuimpConsultaCover = class
  private
    FFrete: TCargaDuimpConsultaItemCover;
    FIdentificacao: string;
    FMotivoSituacaoEspecial: TCargaDuimpMotivoSituacaoEspecialCover;
    FPaisProcedencia: TCargaDuimpPaisProcedenciaCover;
    FSeguro: TCargaDuimpConsultaItemCover;
    FTipoIdentificacaoCarga: string;
    FUnidadeDeclarada: TUnidadeDeclaradaCover;
  public
    destructor Destroy; override;
    property Frete: TCargaDuimpConsultaItemCover read FFrete write FFrete;
    property Identificacao: string read FIdentificacao write FIdentificacao;
    property MotivoSituacaoEspecial: TCargaDuimpMotivoSituacaoEspecialCover read FMotivoSituacaoEspecial write FMotivoSituacaoEspecial;
    property PaisProcedencia: TCargaDuimpPaisProcedenciaCover read FPaisProcedencia write FPaisProcedencia;
    property Seguro: TCargaDuimpConsultaItemCover read FSeguro write FSeguro;
    property TipoIdentificacaoCarga: string read FTipoIdentificacaoCarga write FTipoIdentificacaoCarga;
    property UnidadeDeclarada: TUnidadeDeclaradaCover read FUnidadeDeclarada write FUnidadeDeclarada;
  end;

implementation

uses
{IDE}
  System.SysUtils;

{ TCargaDuimpConsultaCover }

destructor TCargaDuimpConsultaCover.Destroy;
begin
  FreeAndNil(FMotivoSituacaoEspecial);
  FreeAndNil(FPaisProcedencia);
  FreeAndNil(FFrete);
  FreeAndNil(FSeguro);
  FreeAndNil(FUnidadeDeclarada);
  inherited;
end;

end.
