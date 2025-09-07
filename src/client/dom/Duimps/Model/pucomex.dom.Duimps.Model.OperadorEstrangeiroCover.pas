unit pucomex.dom.Duimps.Model.OperadorEstrangeiroCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.OperadorEstrangeiroIntegracaoDTO,
  pucomex.dom.Duimps.Model.PaisCover;

type
  TOperadorEstrangeiroCover = class
  private
    FCodigo: string;
    FDetalhes: TOperadorEstrangeiroIntegracaoDTO;
    FNiOperador: string;
    FPais: TPaisCover;
    FVersao: string;
  public
    destructor Destroy; override;
    property Codigo: string read FCodigo write FCodigo;
    property Detalhes: TOperadorEstrangeiroIntegracaoDTO read FDetalhes write FDetalhes;
    property NiOperador: string read FNiOperador write FNiOperador;
    property Pais: TPaisCover read FPais write FPais;
    property Versao: string read FVersao write FVersao;
  end;

implementation

uses
{IDE}
  System.SysUtils;

{ TOperadorEstrangeiroCover }

destructor TOperadorEstrangeiroCover.Destroy;
begin
  FreeAndNil(FDetalhes);
  FreeAndNil(FPais);
  inherited;
end;

end.
