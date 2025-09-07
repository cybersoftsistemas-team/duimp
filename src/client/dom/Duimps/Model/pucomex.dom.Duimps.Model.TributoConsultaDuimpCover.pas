unit pucomex.dom.Duimps.Model.TributoConsultaDuimpCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.MercadoriaDuimpConsultaCover,
  pucomex.dom.Duimps.Model.TributoCalculadoDuimpConsultaCover;

type
  TTributoConsultaDuimpCover = class
  private
    FMercadoria: TMercadoriaDuimpConsultaCover;
    FTributosCalculados: TArray<TTributoCalculadoDuimpConsultaCover>;
  public
    destructor Destroy; override;
    property Mercadoria: TMercadoriaDuimpConsultaCover read FMercadoria write FMercadoria;
    property TributosCalculados: TArray<TTributoCalculadoDuimpConsultaCover> read FTributosCalculados write FTributosCalculados;
  end;

implementation

uses
{IDE}
  System.SysUtils,
{PROJECT}
  cbsCore.Reflection;

{ TTributoConsultaDuimpCover }

destructor TTributoConsultaDuimpCover.Destroy;
begin
  FreeAndNil(FMercadoria);
  FreeArrayOfObjects<TTributoCalculadoDuimpConsultaCover>(FTributosCalculados);
  inherited;
end;

end.
