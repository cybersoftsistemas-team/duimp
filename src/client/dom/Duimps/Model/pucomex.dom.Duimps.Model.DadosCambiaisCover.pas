unit pucomex.dom.Duimps.Model.DadosCambiaisCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.CoberturaCambialCover,
  pucomex.dom.Duimps.Model.InstituicaoFinanciadoraCover,
  pucomex.dom.Duimps.Model.MotivoSemCoberturaCambialCover;

type
  TDadosCambiaisCover = class
  private
    FCoberturaCambial: TCoberturaCambialCover;
    FInstituicaoFinanciadora: TInstituicaoFinanciadoraCover;
    FMotivoSemCobertura: TMotivoSemCoberturaCambialCover;
    FNumeroROF: string;
    FValorCoberturaCambial: string;
  public
    destructor Destroy; override;
    property CoberturaCambial: TCoberturaCambialCover read FCoberturaCambial write FCoberturaCambial;
    property InstituicaoFinanciadora: TInstituicaoFinanciadoraCover read FInstituicaoFinanciadora write FInstituicaoFinanciadora;
    property MotivoSemCobertura: TMotivoSemCoberturaCambialCover read FMotivoSemCobertura write FMotivoSemCobertura;
    property NumeroROF: string read FNumeroROF write FNumeroROF;
    property ValorCoberturaCambial: string read FValorCoberturaCambial write FValorCoberturaCambial;
  end;

implementation

uses
{IDE}
  System.SysUtils;

{ TDadosCambiaisCover }

destructor TDadosCambiaisCover.Destroy;
begin
  FreeAndNil(FCoberturaCambial);
  FreeAndNil(FInstituicaoFinanciadora);
  FreeAndNil(FMotivoSemCobertura);
  inherited;
end;

end.
