unit pucomex.dom.Duimps.Model.ResultadoAnaliseRiscoDuimpCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.ResultadoAnaliseRiscoAnuenteCover,
  pucomex.dom.Duimps.Model.ResultadoAnaliseRiscoRfbCover;

type
  TResultadoAnaliseRiscoDuimpCover = class
  private
    FCanalConsolidado: string;
    FResultadoAnuente: TArray<TResultadoAnaliseRiscoAnuenteCover>;
    FResultadoRFB: TArray<TResultadoAnaliseRiscoRfbCover>;
  public
    destructor Destroy; override;
    property CanalConsolidado: string read FCanalConsolidado write FCanalConsolidado;
    property ResultadoAnuente: TArray<TResultadoAnaliseRiscoAnuenteCover> read FResultadoAnuente write FResultadoAnuente;
    property ResultadoRFB: TArray<TResultadoAnaliseRiscoRfbCover> read FResultadoRFB write FResultadoRFB;
  end;

implementation

uses
{PROJECT}
  cbsCore.Reflection;

{ TResultadoAnaliseRiscoDuimpCover }

destructor TResultadoAnaliseRiscoDuimpCover.Destroy;
begin
  FreeArrayOfObjects<TResultadoAnaliseRiscoAnuenteCover>(FResultadoAnuente);
  FreeArrayOfObjects<TResultadoAnaliseRiscoRfbCover>(FResultadoRFB);
  inherited;
end;

end.
