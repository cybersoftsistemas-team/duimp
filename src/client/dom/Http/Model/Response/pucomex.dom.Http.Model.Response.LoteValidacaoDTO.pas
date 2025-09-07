unit pucomex.dom.Http.Model.Response.LoteValidacaoDTO;

interface

type
  TLoteValidacaoDTO = class
  private
    FSeq: Integer;
    FCodigo: string;
    FErros: TArray<string>;
    FSucesso: Boolean;
  public
    property Seq: Integer read FSeq write FSeq;
    property Codigo: string read FCodigo write FCodigo;
    property Erros: TArray<string> read FErros write FErros;
    property Sucesso: Boolean read FSucesso write FSucesso;
  end;

implementation

end.
