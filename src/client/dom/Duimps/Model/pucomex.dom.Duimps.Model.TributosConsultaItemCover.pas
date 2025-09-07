unit pucomex.dom.Duimps.Model.TributosConsultaItemCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.MercadoriaValoresCalculadosItemCover,
  pucomex.dom.Duimps.Model.TributoCalculadoItemCover,
  pucomex.dom.Duimps.Model.TributoItemCover;

type
  TTributosConsultaItemCover = class
  private
    FMercadoria: TMercadoriaValoresCalculadosItemCover;
    FTributosAplicados: TArray<TTributoItemCover>;
    FTributosCalculados: TArray<TTributoCalculadoItemCover>;
  public
    destructor Destroy; override;
    property Mercadoria: TMercadoriaValoresCalculadosItemCover read FMercadoria write FMercadoria;
    property TributosAplicados: TArray<TTributoItemCover> read FTributosAplicados write FTributosAplicados;
    property TributosCalculados: TArray<TTributoCalculadoItemCover> read FTributosCalculados write FTributosCalculados;
  end;

implementation

uses
{IDE}
  System.SysUtils,
{PROJECT}
  cbsCore.Reflection;

{ TTributosConsultaItemCover }

destructor TTributosConsultaItemCover.Destroy;
begin
  FreeAndNil(FMercadoria);
  FreeArrayOfObjects<TTributoItemCover>(FTributosAplicados);
  FreeArrayOfObjects<TTributoCalculadoItemCover>(FTributosCalculados);
  inherited;
end;

end.
