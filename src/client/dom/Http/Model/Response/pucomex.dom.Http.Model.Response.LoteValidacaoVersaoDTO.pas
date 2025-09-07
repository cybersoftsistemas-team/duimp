unit pucomex.dom.Http.Model.Response.LoteValidacaoVersaoDTO;

interface

uses
{PROJECT}
  pucomex.dom.Http.Model.Response.LoteValidacaoDTO;

type
  TLoteValidacaoVersaoDTO = class(TLoteValidacaoDTO)
  private
    FVersao: string;
  public
    property Seq;
    property Codigo;
    property Erros;
    property Sucesso;
    property Versao: string read FVersao write FVersao;
  end;

implementation

end.
