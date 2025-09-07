unit pucomex.dom.Duimps.Model.ItemTratamentoAdministrativoCover;

interface

type
  TItemTratamentoAdministrativoCover = class
  private
    FDescricao: string;
    FLpco: string;
    FNumeroItemDuimp: Integer;
    FObservacoes: string;
    FOrgao: string;
    FTipoTratamento: string;
  public
    property Descricao: string read FDescricao write FDescricao;
    property Lpco: string read FLpco write FLpco;
    property NumeroItemDuimp: Integer read FNumeroItemDuimp write FNumeroItemDuimp;
    property Observacoes: string read FObservacoes write FObservacoes;
    property Orgao: string read FOrgao write FOrgao;
    property TipoTratamento: string read FTipoTratamento write FTipoTratamento;
  end;

implementation

end.
