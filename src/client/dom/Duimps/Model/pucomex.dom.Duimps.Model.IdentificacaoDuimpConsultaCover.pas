unit pucomex.dom.Duimps.Model.IdentificacaoDuimpConsultaCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.ImportadorCover;

type
  TIdentificacaoDuimpConsultaCover = class
  private
    FChaveAcesso: string;
    FDataRegistro: string;
    FImportador: TImportadorCover;
    FInformacaoComplementar: string;
    FNumero: string;
    FResponsavelRegistroNumero: string;
    FVersao: Integer;
  public
    destructor Destroy; override;
    property ChaveAcesso: string read FChaveAcesso write FChaveAcesso;
    property DataRegistro: string read FDataRegistro write FDataRegistro;
    property Importador: TImportadorCover read FImportador write FImportador;
    property InformacaoComplementar: string read FInformacaoComplementar write FInformacaoComplementar;
    property Numero: string read FNumero write FNumero;
    property ResponsavelRegistroNumero: string read FResponsavelRegistroNumero write FResponsavelRegistroNumero;
    property Versao: Integer read FVersao write FVersao;
  end;

implementation

uses
{IDE}
  System.SysUtils;

{ TIdentificacaoDuimpConsultaCover }

destructor TIdentificacaoDuimpConsultaCover.Destroy;
begin
  FreeAndNil(FImportador);
  inherited;
end;

end.
