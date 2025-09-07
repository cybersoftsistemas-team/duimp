unit pcmx.dom.Contracts.Duimps;

interface

uses
{PROJECT}
  pcmx.dom.Contracts.Duimps.ForeignOperator,
  pcmx.dom.Contracts.Duimps.Products,
  pcmx.dom.Duimps.Duimp,
  pucomex.dom.Contracts.Authenticator,
  pucomex.dom.Contracts.Http,
{IDE}
  System.Generics.Collections;

type
{$SCOPEDENUMS ON}
  TActiveState = (Open, Opening, Closed);
{$SCOPEDENUMS OFF}

  IDuimps = interface(IHTTP)
    ['{368CE5D8-E8AB-4BA6-8B59-A68BD272C0B8}']
    function GetActive: Boolean;
    function GetActiveState: TActiveState;
    function GetAuthenticator: IAuthenticator;
    function GetCpfCnpjRaiz: string;
    function GetData: TEnumerable<TDuimp>;
    function GetDATA_INICIO: TDate;
    function GetDATA_TERMINO: TDate;
    function GetForeignOperators: IDuimpForeignOperators;
    function GetNI_IMPORTADOR: string;
    function GetNUMERO_DUIMP: string;
    function GetProducts: IDuimpProducts;
    procedure Close;
    procedure Open;
    procedure SetActive(const AValue: Boolean);
    procedure SetActiveState(const AValue: TActiveState);
    procedure SetAuthenticator(const AValue: IAuthenticator);
    procedure SetDATA_INICIO(const AValue: TDate);
    procedure SetDATA_TERMINO(const AValue: TDate);
    procedure SetNI_IMPORTADOR(const AValue: string);
    procedure SetNUMERO_DUIMP(const AValue: string);
    property Active: Boolean read GetActive write SetActive;
    property ActiveState: TActiveState read GetActiveState write SetActiveState;
    property Authenticator: IAuthenticator read GetAuthenticator write SetAuthenticator;
    property CpfCnpjRaiz: string read GetCpfCnpjRaiz;
    property Data: TEnumerable<TDuimp> read GetData;
    property DATA_INICIO: TDate read GetDATA_INICIO write SetDATA_INICIO;
    property DATA_TERMINO: TDate read GetDATA_TERMINO write SetDATA_TERMINO;
    property ForeignOperators: IDuimpForeignOperators read GetForeignOperators;
    property NI_IMPORTADOR: string read GetNI_IMPORTADOR write SetNI_IMPORTADOR;
    property NUMERO_DUIMP: string read GetNUMERO_DUIMP write SetNUMERO_DUIMP;
    property Products: IDuimpProducts read GetProducts;
  end;

implementation

end.
