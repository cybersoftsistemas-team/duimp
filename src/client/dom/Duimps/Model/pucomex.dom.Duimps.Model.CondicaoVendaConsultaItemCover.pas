unit pucomex.dom.Duimps.Model.CondicaoVendaConsultaItemCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.AcrescimoDeducaoConsultaItemCover,
  pucomex.dom.Duimps.Model.IncotermCover,
  pucomex.dom.Duimps.Model.MetodoValoracaoCover,
  pucomex.dom.Duimps.Model.ValorBRLConsultaItemCover;

type
  TCondicaoVendaConsultaItemCover = class
  private
    FAcrescimosDeducoes: TArray<TAcrescimoDeducaoConsultaItemCover>;
    FFrete: TValorBRLConsultaItemCover;
    FIncoterm: TIncotermCover;
    FMetodoValoracao: TMetodoValoracaoCover;
    FSeguro: TValorBRLConsultaItemCover;
    FValorBRL: Currency;
    FValorMoedaNegociada: Currency;
  public
    destructor Destroy; override;
    property AcrescimosDeducoes: TArray<TAcrescimoDeducaoConsultaItemCover> read FAcrescimosDeducoes write FAcrescimosDeducoes;
    property Frete: TValorBRLConsultaItemCover read FFrete write FFrete;
    property Incoterm: TIncotermCover read FIncoterm write FIncoterm;
    property MetodoValoracao: TMetodoValoracaoCover read FMetodoValoracao write FMetodoValoracao;
    property Seguro: TValorBRLConsultaItemCover read FSeguro write FSeguro;
    property ValorBRL: Currency read FValorBRL write FValorBRL;
    property ValorMoedaNegociada: Currency read FValorMoedaNegociada write FValorMoedaNegociada;
  end;

implementation

uses
{IDE}
  System.SysUtils,
{PROJECT}
  cbsCore.Reflection;

{ TCondicaoVendaConsultaItemCover }

destructor TCondicaoVendaConsultaItemCover.Destroy;
begin
  FreeArrayOfObjects<TAcrescimoDeducaoConsultaItemCover>(FAcrescimosDeducoes);
  FreeAndNil(FFrete);
  FreeAndNil(FIncoterm);
  FreeAndNil(FSeguro);
  FreeAndNil(FMetodoValoracao);
  inherited;
end;

end.
