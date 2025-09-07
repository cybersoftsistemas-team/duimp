unit pucomex.dom.Attributes.Ncm.Model.NcmAtributos;

interface

uses
{PROJECT}
  pucomex.dom.Attributes.Ncm.Model.AtributoDetalhes,
  pucomex.dom.Attributes.Ncm.Model.Ncm;

type
  TNcmAtributos = class
  strict private
    FDetalhesAtributos: TArray<TDetalhesAtributos>;
    FListaNcm: TArray<TListaNcm>;
  public
    destructor Destroy; override;
    property DetalhesAtributos: TArray<TDetalhesAtributos> read FDetalhesAtributos write FDetalhesAtributos;
    property ListaNcm: TArray<TListaNcm> read FListaNcm write FListaNcm;
  end;

implementation

uses
{PROJECT}
  cbsCore.Reflection;

{TNcmAtributos}

destructor TNcmAtributos.Destroy;
begin
  FreeArrayOfObjects<TDetalhesAtributos>(DetalhesAtributos);
  FreeArrayOfObjects<TListaNcm>(ListaNcm);
  inherited;
end;


end.
