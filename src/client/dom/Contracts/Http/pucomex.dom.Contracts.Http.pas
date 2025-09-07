unit pucomex.dom.Contracts.Http;

interface

uses
{IDE}
  IdHTTP,
  IdHeaderList,
  System.SysUtils;

type
  IHttp = interface
    ['{3A3DF5DF-580B-4B01-A99E-BB4ECFC0D226}']
    function CreateRequest: TIdHTTP;
    function GetBaseURL: string;
    function GetCertFile: TFileName;
    function GetHeaders: TIdHeaderList;
    function GetIniFile: TFileName;
    function GetKeyFile: string;
    function GetPassword: string;
    function GetRootCertFile: string;
    procedure LoadConfig;
    procedure SaveConfig;
    procedure SetBaseURL(const AValue: string);
    procedure SetCertFile(const AValue: TFileName);
    procedure SetIniFile(const AValue: TFileName);
    procedure SetKeyFile(const AValue: string);
    procedure SetPassword(const AValue: string);
    procedure SetRootCertFile(const AValue: string);
    property BaseURL: string read GetBaseURL write SetBaseURL;
    property CertFile: TFileName read GetCertFile write SetCertFile;
    property Headers: TIdHeaderList read GetHeaders;
    property IniFile: TFileName read GetIniFile write SetIniFile;
    property KeyFile: string read GetKeyFile write SetKeyFile;
    property Password: string read GetPassword write SetPassword;
    property RootCertFile: string read GetRootCertFile write SetRootCertFile;
  end;

implementation

end.
