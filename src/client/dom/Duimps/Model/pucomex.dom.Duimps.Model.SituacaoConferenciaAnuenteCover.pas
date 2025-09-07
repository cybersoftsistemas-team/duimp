unit pucomex.dom.Duimps.Model.SituacaoConferenciaAnuenteCover;

interface

type
  TSituacaoConferenciaAnuenteCover = class
  private
    FIndicadorAutorizacaoProsseguimentoConferenciaAnuente: string;
    FIndicadorConclusaoDecisaoJudicial: string;
    FSiglaOrgao: string;
    FSituacao: string;
  public
    property IndicadorAutorizacaoProsseguimentoConferenciaAnuente: string read FIndicadorAutorizacaoProsseguimentoConferenciaAnuente write FIndicadorAutorizacaoProsseguimentoConferenciaAnuente;
    property IndicadorConclusaoDecisaoJudicial: string read FIndicadorConclusaoDecisaoJudicial write FIndicadorConclusaoDecisaoJudicial;
    property SiglaOrgao: string read FSiglaOrgao write FSiglaOrgao;
    property Situacao: string read FSituacao write FSituacao;
  end;

implementation

end.
