unit pucomex.dom.Duimps.Model.EquipeTrabalhoDuimpConsultaCover;

interface

type
  TEquipeTrabalhoDuimpConsultaCover = class
  private
    FCodigo: string;
    FDescricao: string;
    FSiglaOrgao: string;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property SiglaOrgao: string read FSiglaOrgao write FSiglaOrgao;
  end;

implementation

end.
