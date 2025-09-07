unit pucomex.dom.Attributes.Ncm.Model.Ncm;

interface

uses
{PROJECT}
  pucomex.dom.Attributes.Ncm.Model.Atributos;

type
  TListaNcm = class
  private
    FCodigoNCM: string;
    FListaAtributos: TArray<TListaAtributos>;
  public
    destructor Destroy; override;
    property CodigoNCM: string read FCodigoNCM write FCodigoNCM;
    property ListaAtributos: TArray<TListaAtributos> read FListaAtributos write FListaAtributos;
  end;

implementation

uses
{PROJECT}
  cbsCore.Reflection;

{ TListaNcm }

destructor TListaNcm.Destroy;
begin
  FreeArrayOfObjects<TListaAtributos>(FListaAtributos);
  inherited;
end;

end.
