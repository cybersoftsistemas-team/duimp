unit pucomex.dom.Contracts.Http.Response;

interface

type
  IResponse = interface
    ['{D7994ABA-1444-4BBA-BEAB-BCD643CAEA5A}']
    function GetDataString: string;
    function GetMsg: string;
    function GetResponseCode: Integer;
    property DataString: string read GetDataString;
    property Msg: string read GetMsg;
    property ResponseCode: Integer read GetResponseCode;
  end;

implementation

end.
