unit pucomex.dom.Duimps.Model.SituacaoConferenciaAduaneiraCover;

interface

type
  TSituacaoConferenciaAduaneiraCover = class
  private
    FIndicadorAutorizacaoEntrega: string;
    FIndicadorDesembaracoDecisaoJudicial: string;
    FSiglaOrgao: string;
    FSituacao: string;
  public
    property IndicadorAutorizacaoEntrega: string read FIndicadorAutorizacaoEntrega write FIndicadorAutorizacaoEntrega;
    property IndicadorDesembaracoDecisaoJudicial: string read FIndicadorDesembaracoDecisaoJudicial write FIndicadorDesembaracoDecisaoJudicial;
    property SiglaOrgao: string read FSiglaOrgao write FSiglaOrgao;
    property Situacao: string read FSituacao write FSituacao;
  end;

implementation

end.
