unit pucomex.dom.Duimps.Model.TributoItemCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.AtributoTributoCover,
  pucomex.dom.Duimps.Model.FundamentoCover,
  pucomex.dom.Duimps.Model.TributoCover,
  pucomex.dom.Duimps.Model.RegimeCover;

type
  TTributoItemCover = class
  private
    FAtributos: TArray<TAtributoTributoCover>;
    FFundamento: TFundamentoCover;
    FTributo: TTributoCover;
    FRegime: TRegimeCover;
  public
    destructor Destroy; override;
    property Atributos: TArray<TAtributoTributoCover> read FAtributos write FAtributos;
    property Fundamento: TFundamentoCover read FFundamento write FFundamento;
    property Tributo: TTributoCover read FTributo write FTributo;
    property Regime: TRegimeCover read FRegime write FRegime;
  end;

implementation

uses
{IDE}
  System.SysUtils,
{PROJECT}
  cbsCore.Reflection;

{ TTributoItemCover }

destructor TTributoItemCover.Destroy;
begin
  FreeArrayOfObjects<TAtributoTributoCover>(FAtributos);
  FreeAndNil(FFundamento);
  FreeAndNil(FTributo);
  FreeAndNil(FRegime);
  inherited;
end;

end.
