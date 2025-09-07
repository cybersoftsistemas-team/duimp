unit pucomex.dom.Http.Model.Response.RespostaApiErro;

interface

uses
{PROJECT}
  pucomex.dom.Http.Model.Response.RespostaApiErro.DuimpApiMessageCover,
  pucomex.dom.Http.Model.Response.RespostaApiErro.IdentificacaoDuimpRespostaApi;

type
  TRespostaApiErro = class
  private
    FErrors: TArray<TDuimpApiMessageCover>;
    FIdentificacao: TIdentificacaoDuimpRespostaApi;
    FMessage: string;
  public
    destructor Destroy; override;
    property Errors: TArray<TDuimpApiMessageCover> read FErrors write FErrors;
    property Identificacao: TIdentificacaoDuimpRespostaApi read FIdentificacao write FIdentificacao;
    property Message: string read FMessage write FMessage;
  end;

implementation

uses
{IDE}
  System.SysUtils,
{PROJECT}
  cbsCore.Reflection;

{ TRespostaApiErro }

destructor TRespostaApiErro.Destroy;
begin
  FreeArrayOfObjects<TDuimpApiMessageCover>(FErrors);
  FreeAndNil(FIdentificacao);
  inherited;
end;

end.
