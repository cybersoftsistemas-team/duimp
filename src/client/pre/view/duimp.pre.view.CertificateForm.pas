unit duimp.pre.view.CertificateForm;

interface

uses
{PROJECT}
  duimp.dom.DataModules.damUserAuth,
  duimp.pre.view.System.DialogDefForm,
{IDE}
  Data.DB, System.UITypes, System.Classes, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2019Colorful, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, dxCore, cxContainer, cxEdit, Vcl.Dialogs, cxButtonEdit, cxDBEdit, cxGroupBox, cxRadioGroup, cxMaskEdit, cxSpinEdit, cxTextEdit, cxLocalization,
  System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList, System.Actions, Vcl.ActnList, dxSkinsForm, cxClasses, dxLayoutLookAndFeels, dxLayoutContainer, Vcl.StdCtrls, cxButtons,
  dxLayoutControl;

type
  TfrmCertificate = class(TfrmDialogDef)
    edtHost: TcxDBTextEdit;
    loiedtHost: TdxLayoutItem;
    ltg1: TdxLayoutGroup;
    edtPort: TcxDBSpinEdit;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    edtPath: TcxDBTextEdit;
    ltg2: TdxLayoutGroup;
    loi1: TdxLayoutItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    edtPreview: TcxDBTextEdit;
    dxLayoutItem8: TdxLayoutItem;
    rgpProtocol: TcxDBRadioGroup;
    dxLayoutItem9: TdxLayoutItem;
    lsi2: TdxLayoutSeparatorItem;
    edtCertificatePath: TcxDBButtonEdit;
    dxLayoutItem6: TdxLayoutItem;
    edtPassword: TcxDBButtonEdit;
    dxLayoutItem7: TdxLayoutItem;
    dlgCertificate: TOpenDialog;
    actPassword: TAction;
    dxLayoutItem3: TdxLayoutItem;
    edtName: TcxDBTextEdit;
    procedure dxFluentDesignFormActivate(Sender: TObject);
    procedure edtCertificatePathPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure dxFluentDesignFormClose(Sender: TObject; var Action: TCloseAction);
    procedure actPasswordExecute(Sender: TObject);
  private
    function GetdamUserAuth: TdamUserAuth;
  protected
    procedure DataChange(Sender: TObject; Field: TField); override;
  public
    property DataModule: TdamUserAuth read GetdamUserAuth;
  end;

implementation

uses
{IDE}
  System.SysUtils,
{PROJECT}
  cbsCore.Reflection;

{$R *.dfm}

{ TfrmCertificate }

function TfrmCertificate.GetdamUserAuth: TdamUserAuth;
begin
  Result := TdamUserAuth(inherited DataModule);
end;

procedure TfrmCertificate.actPasswordExecute(Sender: TObject);
begin
  actPassword.ImageIndex := IIF(actPassword.ImageIndex = 1, 2, 1);
  edtPassword.Properties.EchoMode := IIF(actPassword.ImageIndex = 1, eemPassword, eemNormal);
end;

procedure TfrmCertificate.DataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actWindowOk.Enabled := DataModule.IsURLValid;
end;

procedure TfrmCertificate.dxFluentDesignFormActivate(Sender: TObject);
begin
  inherited;
  CanMoveOwnerForm := True;
end;

procedure TfrmCertificate.dxFluentDesignFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  begin
    DataModule.mtbCER.Post;
  end
  else
    DataModule.mtbCER.Cancel;
end;

procedure TfrmCertificate.edtCertificatePathPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  dlgCertificate.InitialDir := ExtractFilePath(DataModule.mtbCERCertificatePath.AsString);
  if dlgCertificate.Execute then
  begin
    DataModule.mtbCERCertificatePath.AsString := dlgCertificate.FileName;
  end;
end;

end.
