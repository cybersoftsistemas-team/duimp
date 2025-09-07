unit pucomex.dom.Http.Model.Response.RespostaApiErro.IdentificacaoDuimpRespostaApi;

interface

type
  TIdentificacaoDuimpRespostaApi = class
  private
    FNumero: string;
    FVersao: string;
  public
    property Numero: string read FNumero write FNumero;
    property Versao: string read FVersao write FVersao;
  end;

implementation

end.
