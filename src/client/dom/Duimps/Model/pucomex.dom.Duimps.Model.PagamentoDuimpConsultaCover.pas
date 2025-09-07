unit pucomex.dom.Duimps.Model.PagamentoDuimpConsultaCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.DadosPagamentoCover;

type
  TPagamentoDuimpConsultaCover = class
  private
    FPrincipal: TDadosPagamentoCover;
    FVersaoOrigem: Integer;
  public
    destructor Destroy; override;
    property Principal: TDadosPagamentoCover read FPrincipal write FPrincipal;
    property VersaoOrigem: Integer read FVersaoOrigem write FVersaoOrigem;
  end;

implementation

uses
{IDE}
  System.SysUtils;

{ TPagamentoDuimpConsultaCover }

destructor TPagamentoDuimpConsultaCover.Destroy;
begin
  FreeAndNil(FPrincipal);
  inherited;
end;

end.
