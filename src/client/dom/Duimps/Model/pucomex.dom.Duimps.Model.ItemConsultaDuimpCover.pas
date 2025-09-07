unit pucomex.dom.Duimps.Model.ItemConsultaDuimpCover;

interface

uses
{PROJECT}
  pucomex.dom.Duimps.Model.ItemDuimpCover;

type
  TItemConsultaDuimpCover = class
  private
    FDetalhes: TItemDuimpCover;
    FLink: string;
    FIndice: Integer;
  public
    destructor Destroy; override;
    property Detalhes: TItemDuimpCover read FDetalhes write FDetalhes;
    property Indice: Integer read FIndice write FIndice;
    property Link: string read FLink write FLink;
  end;

implementation

uses
{IDE}
  System.SysUtils;

destructor TItemConsultaDuimpCover.Destroy;
begin
  FreeAndNil(FDetalhes);
  inherited;
end;

end.
