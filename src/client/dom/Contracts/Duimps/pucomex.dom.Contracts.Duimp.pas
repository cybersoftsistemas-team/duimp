unit pucomex.dom.Contracts.Duimp;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Http,
  pucomex.dom.Contracts.Http.Response,
  pucomex.dom.Duimps.Model.InformacoesVersaoVigenteCover,
  pucomex.dom.Duimps.Model.DuimpConsultaCover,
  pucomex.dom.Http.Model.Response.RespostaApiErro;

type
  IApiErroResponse = interface(IResponse)
    ['{C08D6B02-6B73-4A11-AFDD-FEFD07B4455E}']
    function GetContent: TRespostaApiErro;
    property Content: TRespostaApiErro read GetContent;
  end;

  IDuimpResponse = interface(IResponse)
    ['{D7994ABA-1444-4BBA-BEAB-BCD643CAEA5A}']
    function GetContent: TDuimpConsultaCover;
    property Content: TDuimpConsultaCover read GetContent;
  end;

  IDuimpVersaoResponse = interface(IResponse)
    ['{2BBD591D-DF27-43B5-86F2-F085B25A2947}']
    function GetContent: TInformacoesVersaoVigenteCover;
    property Content: TInformacoesVersaoVigenteCover read GetContent;
  end;

  TApiErroResponseEvent = reference to procedure(const AResponse: IApiErroResponse);
  TDuimpResponseEvent = reference to procedure(const AResponse: IDuimpResponse);
  TDuimpVersaoResponseEvent = reference to procedure(const AResponse: IDuimpVersaoResponse);

  IDuimp = interface(IHttp)
    ['{BE0EE65E-5537-49CA-8633-A029A6BF1ED9}']
    function GetCpfCnpjRaiz: string;
    function GetNI_ESTADO: string;
    function GetNI_IMPORTADOR: string;
    procedure Get(const ANumber: string; const AVersao: Integer; const AResponseEvent: TDuimpResponseEvent;
      const AErroResponseEvent: TApiErroResponseEvent = nil);
    procedure GetCurrentVersion(const ANumber: string; const AResponseEvent: TDuimpVersaoResponseEvent);
    procedure SetNI_ESTADO(const AValue: string);
    procedure SetNI_IMPORTADOR(const AValue: string);
    property CpfCnpjRaiz: string read GetCpfCnpjRaiz;
    property NI_ESTADO: string read GetNI_ESTADO write SetNI_ESTADO;
    property NI_IMPORTADOR: string read GetNI_IMPORTADOR write SetNI_IMPORTADOR;
  end;

implementation

end.
