unit duimp.pre.view.System.DialogDefForm;

interface

uses
{PROJECT}
  duimp.pre.view.System.DefForm,
{IDE}
  System.Classes, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2019Colorful, dxLayoutControlAdapters, dxCore, Vcl.Menus, System.Actions,
  Vcl.ActnList, dxLayoutContainer, Vcl.StdCtrls, cxButtons, cxLocalization, cxContainer, cxEdit, System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList, dxSkinsForm, cxClasses,
  dxLayoutLookAndFeels, dxLayoutControl, dxSkinOffice2019Black;

type
  TfrmDialogDef = class(TfrmDef)
    btnWindowOk: TcxButton;
    loibtnWindowOk: TdxLayoutItem;
    btnWindowCancel: TcxButton;
    loibtnWindowCancel: TdxLayoutItem;
    lagBtns: TdxLayoutAutoCreatedGroup;
    lsi1: TdxLayoutSeparatorItem;
    actWindowOk: TAction;
    actWindowCancel: TAction;
    procedure actWindowOkExecute(Sender: TObject);
    procedure actWindowCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmDialogDef.actWindowCancelExecute(Sender: TObject);
begin
  ModalResult := btnWindowCancel.ModalResult;
end;

procedure TfrmDialogDef.actWindowOkExecute(Sender: TObject);
begin
  ModalResult := btnWindowOk.ModalResult;
end;

end.
