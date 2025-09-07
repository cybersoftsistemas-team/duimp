unit pucomex.dom.Http.Model.Response.RespostaApiErro.DuimpApiMessageCover;

interface

type
  TDuimpApiMessageCover = class
  private
    FCode: string;
    FField: string;
    FMessage: string;
  public
    property Code: string read FCode write FCode;
    property Field: string read FField write FField;
    property Message: string read FMessage write FMessage;
  end;

implementation

end.
