unit duimp.dom.Products.Attributes.FillingForm;

interface

type
  AttributeFillingForm = (
    LISTA_ESTATICA,
    BOOLEANO,
    DATA,
    DATA_HORA,
    NUMERO_INTEIRO,
    NUMERO_REAL,
    TEXTO,
    DOMINIO_DINAMICO,
    COMPOSTO,
    LISTA_TABX_FILTRO
  );

  TAttributeFillingFormFormExtensions = record Helper for AttributeFillingForm
  public
    function ToString: string;
  end;

implementation

uses
{IDE}
  System.Rtti;

{ TAttributeFillingFormFormExtensions }

function TAttributeFillingFormFormExtensions.ToString: string;
begin
  Result := TRttiEnumerationType.GetName(Self);
end;

end.
