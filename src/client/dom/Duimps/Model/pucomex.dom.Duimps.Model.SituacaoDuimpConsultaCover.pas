unit pucomex.dom.Duimps.Model.SituacaoDuimpConsultaCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.SituacaoConferenciaAduaneiraCover,
  pucomex.dom.Duimps.Model.SituacaoConferenciaAnuenteCover;

type
  TSituacaoDuimpConsultaCover = class
  private
    FControleCarga: string;
    FSituacaoAnaliseRetificacao: string;
    FSituacaoConferenciaAduaneira: TArray<TSituacaoConferenciaAduaneiraCover>;
    FSituacaoConferenciaAnuente: TArray<TSituacaoConferenciaAnuenteCover>;
    FSituacaoDuimp: string;
    FSituacaoLicenciamento: string;
  public
    destructor Destroy; override;
    property ControleCarga: string read FControleCarga write FControleCarga;
    property SituacaoAnaliseRetificacao: string read FSituacaoAnaliseRetificacao write FSituacaoAnaliseRetificacao;
    property SituacaoConferenciaAduaneira: TArray<TSituacaoConferenciaAduaneiraCover> read FSituacaoConferenciaAduaneira write FSituacaoConferenciaAduaneira;
    property SituacaoConferenciaAnuente: TArray<TSituacaoConferenciaAnuenteCover> read FSituacaoConferenciaAnuente write FSituacaoConferenciaAnuente;
    property SituacaoDuimp: string read FSituacaoDuimp write FSituacaoDuimp;
    property SituacaoLicenciamento: string read FSituacaoLicenciamento write FSituacaoLicenciamento;
  end;

implementation

uses
{PROJECT}
  cbsCore.Reflection;

{ TSituacaoDuimpConsultaCover }

destructor TSituacaoDuimpConsultaCover.Destroy;
begin
  FreeArrayOfObjects<TSituacaoConferenciaAduaneiraCover>(FSituacaoConferenciaAduaneira);
  FreeArrayOfObjects<TSituacaoConferenciaAnuenteCover>(FSituacaoConferenciaAnuente);
  inherited;
end;

end.
