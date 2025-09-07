unit pucomex.dom.Duimps.Model.AcrescimoDeducaoConsultaItemCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.DenominacaoAcrescimoDeducaoCover,
  pucomex.dom.Duimps.Model.MoedaAcrescimoDeducaoCover;

type
  TAcrescimoDeducaoConsultaItemCover = class
  private
    FDenominacao: TDenominacaoAcrescimoDeducaoCover;
    FMoeda: TMoedaAcrescimoDeducaoCover;
    FTipo: string;
    FValorBRL: Currency;
  public
    destructor Destroy; override;
    property Denominacao: TDenominacaoAcrescimoDeducaoCover read FDenominacao write FDenominacao;
    property Moeda: TMoedaAcrescimoDeducaoCover read FMoeda write FMoeda;
    property Tipo: string read FTipo write FTipo;
    property ValorBRL: Currency read FValorBRL write FValorBRL;
  end;

implementation

uses
{IDE}
  System.SysUtils;

{ TAcrescimoDeducaoConsultaItemCover }

destructor TAcrescimoDeducaoConsultaItemCover.Destroy;
begin
  FreeAndNil(FDenominacao);
  FreeAndNil(FMoeda);
  inherited;
end;

end.
