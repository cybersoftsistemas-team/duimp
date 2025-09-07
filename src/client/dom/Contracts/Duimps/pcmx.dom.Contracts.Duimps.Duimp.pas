unit pcmx.dom.Contracts.Duimps.Duimp;

interface

type
  IDuimp = interface
    ['{2B0892C6-0595-4395-861B-C6DD5EC8EE5F}']
    function GetNumero: string;
    function ChaveAcesso: string;
    procedure SetNumero(const AValue: string);
    procedure SetChaveAcesso(const AValue: string);
  end;

implementation

end.
