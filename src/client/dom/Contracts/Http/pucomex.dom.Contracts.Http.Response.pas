unit pucomex.dom.Contracts.Http.Response;

interface

type
  IResponse = interface
    ['{D7994ABA-1444-4BBA-BEAB-BCD643CAEA5A}']
    function GetDataString: string;
    function GetResponseCode: Integer;
    property DataString: string read GetDataString;
    property ResponseCode: Integer read GetResponseCode;
  end;

implementation

end.
