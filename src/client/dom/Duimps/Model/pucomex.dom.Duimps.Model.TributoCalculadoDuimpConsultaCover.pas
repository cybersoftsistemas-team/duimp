unit pucomex.dom.Duimps.Model.TributoCalculadoDuimpConsultaCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.ValoresTributoDuimpConsultaCover;

type
  TTributoCalculadoDuimpConsultaCover = class
  private
    FTipo: string;
    FValoresBRL: TValoresTributoDuimpConsultaCover;
  public
    destructor Destroy; override;
    property Tipo: string read FTipo write FTipo;
    property ValoresBRL: TValoresTributoDuimpConsultaCover read FValoresBRL write FValoresBRL;
  end;

implementation

uses
{IDE}
  System.SysUtils;

{ TTributoCalculadoDuimpConsultaCover }

destructor TTributoCalculadoDuimpConsultaCover.Destroy;
begin
  FreeAndNil(FValoresBRL);
  inherited;
end;

end.
