unit pucomex.dom.Duimps.Model.TratamentoAdministrativoCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.ItemTratamentoAdministrativoCover,
  pucomex.dom.Duimps.Model.ResultadoProcessamentoTACover;

type
  TTratamentoAdministrativoCover = class
  private
    FItensTratamentoAdministrativo: TArray<TItemTratamentoAdministrativoCover>;
    FResultadoProcessamentoTA: TResultadoProcessamentoTACover;
  public
    destructor Destroy; override;
    property ItensTratamentoAdministrativo: TArray<TItemTratamentoAdministrativoCover> read FItensTratamentoAdministrativo write FItensTratamentoAdministrativo;
    property ResultadoProcessamentoTA: TResultadoProcessamentoTACover read FResultadoProcessamentoTA write FResultadoProcessamentoTA;
  end;

implementation

uses
{IDE}
  System.SysUtils,
{PROJECT}
  cbsCore.Reflection;

{ TTratamentoAdministrativoCover }

destructor TTratamentoAdministrativoCover.Destroy;
begin
  FreeArrayOfObjects<TItemTratamentoAdministrativoCover>(FItensTratamentoAdministrativo);
  FreeAndNil(FResultadoProcessamentoTA);
  inherited;
end;

end.
