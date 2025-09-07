unit pucomex.dom.Duimps.Model.Tributos;

interface

type
{$SCOPEDENUMS ON}
  TTipoAliquota = (AD_VALOREM, ESPECIFICA);
{$SCOPEDENUMS OFF}

  TValoresTributos = class
  private
    FBaseCalculoBRL: Currency;
    FTipoAliquota: TTipoAliquota;
    FValorAliquota: Currency;
    FValorAliquotaEspecifica: Currency;
    FValorAliquotaEspecificaXQtde: Currency;
    FValorAliquotaReduzida: Currency;
    FValorARecolherBRL: Currency;
    FValorCalculadoBRL: Currency;
    FValorDevidoBRL: Currency;
  public
    property BaseCalculoBRL: Currency read FBaseCalculoBRL write FBaseCalculoBRL;
    property TipoAliquota: TTipoAliquota read FTipoAliquota write FTipoAliquota;
    property ValorAliquota: Currency read FValorAliquota write FValorAliquota;
    property ValorAliquotaEspecifica: Currency read FValorAliquotaEspecifica write FValorAliquotaEspecifica;
    property ValorAliquotaEspecificaXQtde: Currency read FValorAliquotaEspecificaXQtde write FValorAliquotaEspecificaXQtde;
    property ValorAliquotaReduzida: Currency read FValorAliquotaReduzida write FValorAliquotaReduzida;
    property ValorARecolherBRL: Currency read FValorARecolherBRL write FValorARecolherBRL;
    property ValorCalculadoBRL: Currency read FValorCalculadoBRL write FValorCalculadoBRL;
    property ValorDevidoBRL: Currency read FValorDevidoBRL write FValorDevidoBRL;
  end;

  TTributos = class
  private
    FCIDE: TValoresTributos;
    FCOFINS: TValoresTributos;
    FII: TValoresTributos;
    FIPI: TValoresTributos;
    FPIS: TValoresTributos;
  public
    constructor Create;
    destructor Destroy; override;
    property CIDE: TValoresTributos read FCIDE write FCIDE;
    property COFINS: TValoresTributos read FCOFINS write FCOFINS;
    property II: TValoresTributos read FII write FII;
    property IPI: TValoresTributos read FIPI write FIPI;
    property PIS: TValoresTributos read FPIS write FPIS;
  end;

  TTipoAliquotaExtensions = record helper for TTipoAliquota
  public
    function ToString: string;
  end;

implementation

uses
{IDE}
  System.Rtti,
  System.SysUtils;

{ TTipoAliquotaExtensions }

function TTipoAliquotaExtensions.ToString: string;
begin
  Result := TRttiEnumerationType.GetName(Self);
end;

{ TTributos }

constructor TTributos.Create;
begin
  inherited Create;
  FCIDE := TValoresTributos.Create;
  FCOFINS := TValoresTributos.Create;
  FII := TValoresTributos.Create;
  FIPI := TValoresTributos.Create;
  FPIS := TValoresTributos.Create;
end;

destructor TTributos.Destroy;
begin
  FreeAndNil(FCIDE);
  FreeAndNil(FCOFINS);
  FreeAndNil(FII);
  FreeAndNil(FIPI);
  FreeAndNil(FPIS);
  inherited;
end;

end.
