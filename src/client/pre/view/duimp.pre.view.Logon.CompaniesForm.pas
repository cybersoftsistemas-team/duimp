unit duimp.pre.view.Logon.CompaniesForm;

interface

uses
{PROJECT}
  duimp.dom.DataModules.damUserAuth,

  duimp.pre.view.System.DialogDefForm,
{IDE}
  Data.DB, System.Classes, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2019Colorful, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutContainer, dxCore, Vcl.ComCtrls, dxtree, dxdbtree, cxLocalization, cxContainer, cxEdit, System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList, System.Actions,
  Vcl.ActnList, dxSkinsForm, cxClasses, dxLayoutLookAndFeels, Vcl.StdCtrls, cxButtons, dxLayoutControl, dxSkinOffice2019Black;

type
  TfrmCompanies = class(TfrmDialogDef)
    loitrvDomain: TdxLayoutItem;
    trvCompany: TdxDBTreeView;
    procedure dxFluentDesignFormShow(Sender: TObject);
    procedure trvCompanyGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure trvCompanyChange(Sender: TObject; Node: TTreeNode);
    procedure actWindowOkExecute(Sender: TObject);
    procedure dxFluentDesignFormActivate(Sender: TObject);
  private
    function GetdamUserAuth: TdamUserAuth;
  public
    property DataModule: TdamUserAuth read GetdamUserAuth;
  end;

implementation

{$R *.dfm}

{ TfrmCompanies }

function TfrmCompanies.GetdamUserAuth: TdamUserAuth;
begin
  Result := TdamUserAuth(inherited DataModule);
end;

procedure TfrmCompanies.trvCompanyChange(Sender: TObject; Node: TTreeNode);
begin
  actWindowOk.Enabled := (Node.Level > 0) and not DataModule.qryCMPDesativada.AsBoolean;
end;

procedure TfrmCompanies.trvCompanyGetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  if Node.Level > 0 then
  begin
    Node.ImageIndex := 1;
    Node.SelectedIndex := Node.ImageIndex;
  end;
end;

procedure TfrmCompanies.actWindowOkExecute(Sender: TObject);
begin
  if Assigned(trvCompany.Selected) and (trvCompany.Selected.Level > 0) and not DataModule.qryCMPDesativada.AsBoolean then
  begin
    inherited;
  end;
end;

procedure TfrmCompanies.dxFluentDesignFormActivate(Sender: TObject);
begin
  inherited;
  CanMoveOwnerForm := True;
end;

procedure TfrmCompanies.dxFluentDesignFormShow(Sender: TObject);
begin
  inherited;
  DataModule.qryCMP.Close;
  DataModule.qryCMP.Open;
  trvCompany.Selected := trvCompany.Items[0];
end;

end.
