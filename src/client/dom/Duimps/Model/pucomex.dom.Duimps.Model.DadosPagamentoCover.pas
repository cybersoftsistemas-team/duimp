unit pucomex.dom.Duimps.Model.DadosPagamentoCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.JurosPagamentoCover,
  pucomex.dom.Duimps.Model.TributoDuimpConsultaCover;

type
  TDadosPagamentoCover = class
  private
    FBanco: string;
    FValor: Currency;
    FDataPagamento: string;
    FCodigoReceita: string;
    FJuros: TJurosPagamentoCover;
    FConta: string;
    FAgencia: string;
    FTributo: TTributoDuimpConsultaCover;
  public
    destructor Destroy; override;
    property Agencia: string read FAgencia write FAgencia;
    property Banco: string read FBanco write FBanco;
    property CodigoReceita: string read FCodigoReceita write FCodigoReceita;
    property Conta: string read FConta write FConta;
    property DataPagamento: string read FDataPagamento write FDataPagamento;
    property Juros: TJurosPagamentoCover read FJuros write FJuros;
    property Tributo: TTributoDuimpConsultaCover read FTributo write FTributo;
    property Valor: Currency read FValor write FValor;
  end;

implementation

uses
{IDE}
  System.SysUtils;

{ TDadosPagamentoCover }

destructor TDadosPagamentoCover.Destroy;
begin
  FreeAndNil(FJuros);
  FreeAndNil(FTributo);
  inherited;
end;

end.
