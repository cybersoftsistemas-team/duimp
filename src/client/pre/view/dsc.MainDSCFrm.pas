unit dsc.MainDSCFrm;

interface

uses
{PROJECT}
  dsc.dom.DataModules.damMainDSC,
  duimp.dom.DataModules.System.damMain,
  duimp.pre.view.System.DefForm,
{IDE}
  Data.DB, System.Classes, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxLayoutcxEditAdapters,
  dxLayoutContainer, dxLayoutControlAdapters, dxCore, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.Menus, dxBar, cxClasses, dxBarApplicationMenu, dxRibbon, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, cxButtons, cxGroupBox, cxRadioGroup, cxDBEdit, cxTextEdit, cxPC, cxLocalization, System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList,
  dxSkinsForm, dxLayoutLookAndFeels, dxLayoutControl;

type
  TfrmMainDSC = class(TfrmDef)
    pclMain: TcxPageControl;
    loipclMain: TdxLayoutItem;
    tshConnProp: TcxTabSheet;
    btnWindowsApply: TcxButton;
    loibtnWindowsApply: TdxLayoutItem;
    btnWindowsClose: TcxButton;
    loibtnWindowsClose: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    btnWindowsOk: TcxButton;
    loibtnWindowsOk: TdxLayoutItem;
    actWindowsClose: TAction;
    actWindowsApply: TAction;
    actWindowsOk: TAction;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    edtName: TcxDBTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    edtHost: TcxDBTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    edtPath: TcxDBTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    cxDBTextEdit4: TcxDBTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    ltgProps: TdxLayoutGroup;
    lsi1: TdxLayoutSeparatorItem;
    dxLayoutItem5: TdxLayoutItem;
    rgpProtocol: TcxDBRadioGroup;
    dxLayoutLabeledItem1: TdxLayoutLabeledItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    edtCertificateName: TcxDBTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    edtCertificatePassword: TcxDBTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    actDatabase: TAction;
    dxLayoutItem8: TdxLayoutItem;
    btnDatabase: TcxButton;
    dxBarApplicationMenu: TdxBarApplicationMenu;
    dxBarManager: TdxBarManager;
    bibClose: TdxBarButton;
    dxBarManager1Bar1: TdxBar;
    bibFile: TdxBarSubItem;
    bibOpenWorkspace: TdxBarButton;
    actOpenWorkspace: TAction;
    procedure actDatabaseExecute(Sender: TObject);
    procedure dxFluentDesignFormCreate(Sender: TObject);
  private
    FWorkSpace: string;
    function GetDataModule: TdamMainDSC;
  protected
    function GetDataModuleType: damMainType; override;
    procedure DataChange(Sender: TObject; Field: TField); override;
  public
    property DataModule: TdamMainDSC read GetDataModule;
  end;

var
  frmMainDSC: TfrmMainDSC;

implementation

uses
{IDE}
  Vcl.Forms,
{PROJECT}
  duimp.pre.view.ConnectionEditorForm;

{$R *.dfm}

{ TfrmMainDSC }

function TfrmMainDSC.GetDataModule: TdamMainDSC;
begin
  Result := TdamMainDSC(inherited DataModule);
end;

function TfrmMainDSC.GetDataModuleType: damMainType;
begin
  Result := TdamMainDSC;
end;

procedure TfrmMainDSC.actDatabaseExecute(Sender: TObject);
var
  LConnectionString: string;
begin
  LConnectionString := damMainDSC.mtbDUCConnectionString.AsString;
  if TConnectionEditor.Execute(Self, LConnectionString, Self.Caption) then
  begin

  end;
end;

procedure TfrmMainDSC.DataChange(Sender: TObject; Field: TField);
begin
  inherited;

end;

procedure TfrmMainDSC.dxFluentDesignFormCreate(Sender: TObject);
begin
  inherited;
  Self.Caption := Application.Title;
end;

end.
