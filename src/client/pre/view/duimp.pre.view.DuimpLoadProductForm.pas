unit duimp.pre.view.DuimpLoadProductForm;

interface

uses
{PROJECT}
  duimp.pre.view.System.LoadFormDef,
{IDE}
  System.Classes, Vcl.Controls, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinOffice2019Colorful,
  cxProgressBar, cxLabel, cxClasses, dxTaskbarProgress;

type
  TfrmDuimpLoadProduct = class(TfrmLoadDef)
    labInfo: TcxLabel;
    pbrDUI: TcxProgressBar;
    labDUI: TcxLabel;
  protected
    procedure SetMax(const AValue: Double); override;
    procedure SetPosition(const Value: Double); override;
  end;

implementation

{$R *.dfm}

{ TfrmDuimpLoadProduct }

procedure TfrmDuimpLoadProduct.SetMax(const AValue: Double);
begin
  inherited;
  pbrDUI.Properties.Max := AValue;
end;

procedure TfrmDuimpLoadProduct.SetPosition(const Value: Double);
begin
  inherited;
  pbrDUI.Position := Value;
end;

end.
