unit duimp.pre.view.DuimpLoadForm;

interface

uses
{PROJECT}
  duimp.pre.view.System.LoadFormDef,
{IDE}
  System.Classes, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinOffice2019Colorful, cxLabel, Vcl.Controls, cxProgressBar,
  cxClasses, dxTaskbarProgress, Vcl.ExtCtrls;

type
  TfrmDuimpLoad = class(TfrmLoadDef)
    pbrDUI: TcxProgressBar;
    labDUI: TcxLabel;
    labInfo: TcxLabel;
  protected
    procedure SetMax(const AValue: Double); override;
    procedure SetPosition(const Value: Double); override;
  end;

implementation

{$R *.dfm}

{ TfrmDuimpLoad }

procedure TfrmDuimpLoad.SetMax(const AValue: Double);
begin
  inherited;
  pbrDUI.Properties.Max := AValue;
end;

procedure TfrmDuimpLoad.SetPosition(const Value: Double);
begin
  inherited;
  pbrDUI.Position := Value;
end;

end.
