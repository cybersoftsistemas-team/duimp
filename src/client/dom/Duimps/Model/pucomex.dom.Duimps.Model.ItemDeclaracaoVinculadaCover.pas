unit pucomex.dom.Duimps.Model.ItemDeclaracaoVinculadaCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.ValorBRLConsultaItemCover;

type
  TItemDeclaracaoVinculadaCover = class
  private                                 
    FFrete: TValorBRLConsultaItemCover;   
    FNcm: string;
    FNumeroItemDeclaracaoVinculada: Integer;  
    FQtdUnidadeEstatistica: Currency;
    FSeguro: TValorBRLConsultaItemCover;
  public
    property Frete: TValorBRLConsultaItemCover read FFrete write FFrete;
    property Ncm: string read FNcm write FNcm;
    property NumeroItemDeclaracaoVinculada: Integer read FNumeroItemDeclaracaoVinculada write FNumeroItemDeclaracaoVinculada;
    property QtdUnidadeEstatistica: Currency read FQtdUnidadeEstatistica write FQtdUnidadeEstatistica;
    property Seguro: TValorBRLConsultaItemCover read FSeguro write FSeguro;
  end;

implementation

end.
