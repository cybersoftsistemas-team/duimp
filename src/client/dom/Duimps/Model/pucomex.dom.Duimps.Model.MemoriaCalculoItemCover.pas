unit pucomex.dom.Duimps.Model.MemoriaCalculoItemCover;

interface

type
  TMemoriaCalculoItemCover = class
  private
    FBaseCalculoBRL: Currency;
    FBaseCalculoEspecificaBRL: Currency;
    FBaseCalculoReduzidaBRL: Currency;
    FCodigoFundamentoLegalNormal: Integer;
    FNormal: Currency;
    FPercentualPagamento: Currency;
    FPercentualReducaoAliquotaReduzida: Currency;
    FPercentualReducaoBaseCalculo: Currency;
    FTipoAliquota: string;
    FTributado: Boolean;
    FValorAliquota: Currency;
    FValorAliquotaEspecifica: Currency;
    FValorAliquotaReduzida: Currency;
  public
    property BaseCalculoBRL: Currency read FBaseCalculoBRL write FBaseCalculoBRL;
    property BaseCalculoEspecificaBRL: Currency read FBaseCalculoEspecificaBRL write FBaseCalculoEspecificaBRL;
    property BaseCalculoReduzidaBRL: Currency read FBaseCalculoReduzidaBRL write FBaseCalculoReduzidaBRL;
    property CodigoFundamentoLegalNormal: Integer read FCodigoFundamentoLegalNormal write FCodigoFundamentoLegalNormal;
    property Normal: Currency read FNormal write FNormal;
    property PercentualPagamento: Currency read FPercentualPagamento write FPercentualPagamento;
    property PercentualReducaoAliquotaReduzida: Currency read FPercentualReducaoAliquotaReduzida write FPercentualReducaoAliquotaReduzida;
    property PercentualReducaoBaseCalculo: Currency read FPercentualReducaoBaseCalculo write FPercentualReducaoBaseCalculo;
    property TipoAliquota: string read FTipoAliquota write FTipoAliquota;
    property Tributado: Boolean read FTributado write FTributado;
    property ValorAliquota: Currency read FValorAliquota write FValorAliquota;
    property ValorAliquotaEspecifica: Currency read FValorAliquotaEspecifica write FValorAliquotaEspecifica;
    property ValorAliquotaReduzida: Currency read FValorAliquotaReduzida write FValorAliquotaReduzida;
  end;

implementation

end.
