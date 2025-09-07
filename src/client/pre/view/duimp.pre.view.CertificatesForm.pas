unit duimp.pre.view.CertificatesForm;

interface

uses
{PROJECT}
  duimp.dom.DataModules.damUserAuth,
  duimp.pre.view.System.DefForm,
  pucomex.dom.Contracts.Authenticator,
{IDE}
  FireDAC.Comp.Client, System.Classes, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2019Colorful, dxLayoutcxEditAdapters,
  dxLayoutContainer, dxLayoutControlAdapters, dxCore, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.Menus, System.Actions, Vcl.ActnList, Vcl.StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, cxLabel, cxLocalization, System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList, dxSkinsForm, cxClasses, dxLayoutLookAndFeels,
  dxLayoutControl;

type
  TfrmCertificates = class(TfrmDef)
    dxLayoutItem1: TdxLayoutItem;
    labCertificateList: TcxLabel;
    dxLayoutItem2: TdxLayoutItem;
    grdCET: TcxGrid;
    grdCETDBTableView: TcxGridDBTableView;
    grdlvlCET: TcxGridLevel;
    dxLayoutItem3: TdxLayoutItem;
    btnWindowClose: TcxButton;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    actWindowClose: TAction;
    dxLayoutItem4: TdxLayoutItem;
    btnAdd: TcxButton;
    actAdd: TAction;
    btnEdit: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    actEdit: TAction;
    btnDelete: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    actDelete: TAction;
    btnClear: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    actClear: TAction;
    lsi1: TdxLayoutSeparatorItem;
    btnTestConnection: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    btnDatabase: TcxButton;
    dxLayoutItem9: TdxLayoutItem;
    lsi2: TdxLayoutSeparatorItem;
    actTestConnection: TAction;
    actDatabase: TAction;
    dxLayoutGroup1: TdxLayoutGroup;
    grdCETDBTableViewId: TcxGridDBColumn;
    grdCETDBTableViewName: TcxGridDBColumn;
    grdCETDBTableViewHost: TcxGridDBColumn;
    grdCETDBTableViewPath: TcxGridDBColumn;
    grdCETDBTableViewPort: TcxGridDBColumn;
    grdCETDBTableViewProtocol: TcxGridDBColumn;
    grdCETDBTableViewUrl: TcxGridDBColumn;
    grdCETDBTableViewCertificatePath: TcxGridDBColumn;
    grdCETDBTableViewPassword: TcxGridDBColumn;
    grdCETDBTableViewPreview: TcxGridDBColumn;
    dxLayoutItem10: TdxLayoutItem;
    btnDataSetSelected: TcxButton;
    actSelected: TAction;
    procedure actWindowCloseExecute(Sender: TObject);
    procedure dxFluentDesignFormActivate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure dxFluentDesignFormCreate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actClearExecute(Sender: TObject);
    procedure actDatabaseExecute(Sender: TObject);
    procedure actSelectedExecute(Sender: TObject);
    procedure grdCETDBTableViewCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure actTestConnectionExecute(Sender: TObject);
  private
    function GetdamUserAuth: TdamUserAuth;
    function GetTestAuthentication: IAuthenticator;
    function GetTestConnection: TFDCustomConnection;
    procedure AddCertification;
    procedure CertificationForm(const AAppend: Boolean = True);
    procedure EdtCertification;
  protected
    procedure DataChange(Sender: TObject; Field: TField); override;
  public
    property DataModule: TdamUserAuth read GetdamUserAuth;
  end;

implementation

uses
{IDE}
  FireDAC.Stan.Util,
  System.SysUtils,
  System.UITypes,
  Vcl.Graphics,
  Vcl.Dialogs,
  Vcl.Forms,
  Winapi.Windows,
{PROJECT}
  cbsCore.Reflection,
  duimp.pre.view.CertificateForm,
  duimp.pre.view.ConnectionEditorForm,
  pucomex.dom.Authenticator;

{$R *.dfm}

function TfrmCertificates.GetdamUserAuth: TdamUserAuth;
begin
  Result := TdamUserAuth(inherited DataModule);
end;

function TfrmCertificates.GetTestAuthentication: IAuthenticator;
begin
  Result := TAuthenticator.Create;
  Result.Headers.Clear;
  Result.Headers.AddValue('Role-Type', 'IMPEXP');
  Result.BaseURL := Concat(DataModule.mtbCERProtocol.AsString, DataModule.mtbCERHost.AsString);
  Result.Resource := DataModule.mtbCERPath.AsString;
  Result.Password := DataModule.mtbCERPassword.AsString;
  Result.CertFile := DataModule.mtbCERCertificatePath.AsString;
end;

function TfrmCertificates.GetTestConnection: TFDCustomConnection;
begin
  Result := TFDConnection.Create(nil);
  Result.ConnectionString := DataModule.mtbCERConnectionString.AsString;
end;

procedure TfrmCertificates.grdCETDBTableViewCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[grdCETDBTableViewId.Index] = DataModule.mtbCONId.AsVariant then
  begin
    ACanvas.Font.Style := ACanvas.Font.Style + [fsBold];
  end
  else
    ACanvas.Font.Style := ACanvas.Font.Style - [fsBold];
end;

procedure TfrmCertificates.actAddExecute(Sender: TObject);
begin
  AddCertification;
end;

procedure TfrmCertificates.actClearExecute(Sender: TObject);
begin
  if Application.MessageBox(PChar(Format('Tem certeza de que deseja remover todas as conexões?',
    [DataModule.mtbCERName.AsString])), 'Confirmação', MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = mrYes then
  begin
    DataModule.mtbCER.DisableControls;
    try
      DataModule.mtbCER.First;
      while not DataModule.mtbCER.IsEmpty do
      begin
        DataModule.mtbCER.Delete;
      end;
      DataModule.SaveCertificateData;
    finally
      DataModule.mtbCER.EnableControls;
    end;
  end;
end;

procedure TfrmCertificates.actDatabaseExecute(Sender: TObject);
var
  LConnectionString: string;
begin
  LConnectionString := DataModule.mtbCERConnectionString.AsString;
  if TConnectionEditor.Execute(Self, LConnectionString, DataModule.mtbCERName.AsString) then
  begin
    DataModule.mtbCER.Edit;
    DataModule.mtbCERConnectionString.AsString := LConnectionString;
    DataModule.mtbCER.Post;
  end;
end;

procedure TfrmCertificates.actDeleteExecute(Sender: TObject);
begin
  if Application.MessageBox(PChar(Format('Tem certeza de que deseja remover a conexão ''%s''?',
    [DataModule.mtbCERName.AsString])), 'Confirmação', MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = mrYes then
  begin
    DataModule.mtbCER.Delete;
    DataModule.SaveCertificateData;
  end;
end;

procedure TfrmCertificates.actEditExecute(Sender: TObject);
begin
  EdtCertification;
end;

procedure TfrmCertificates.actSelectedExecute(Sender: TObject);
begin
  DataModule.SetConnectionSelected(DataModule.mtbCERId.AsGuid,
    DataModule.mtbCERName.AsString, DataModule.mtbCERConnectionString.AsString);
  sclMain.SkinPaletteName := IIF(DataModule.mtbCERHost.AsString.Contains('val.'), 'Amber', 'Default');
end;

procedure TfrmCertificates.actTestConnectionExecute(Sender: TObject);
begin
  ShowLoading(
    procedure
    var
      LAuth: IAuthenticator;
      LConn: TFDCustomConnection;
    begin
      LAuth := GetTestAuthentication;
      try
        LAuth.Execute;
        LConn := GetTestConnection;
        try
          LConn.Close;
          LConn.Open;
        finally
          FDFree(LConn);
        end;
        ShowMessage('Conexão estabelecida com sucesso.');
      finally
        LAuth := nil;
      end;
    end);
end;

procedure TfrmCertificates.actWindowCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmCertificates.AddCertification;
begin
  CertificationForm;
end;

procedure TfrmCertificates.CertificationForm(const AAppend: Boolean);
var
  LForm: TfrmCertificate;
begin
  LForm := TfrmCertificate.Create(Self, DataModule, False);
  try
    if AAppend then
    begin
      DataModule.mtbCER.Append;
    end
    else
      DataModule.mtbCER.Edit;
    LForm.ShowModal;
  finally
    DataModule.OnDataChange := DataChange;
    FreeAndNil(LForm);
  end;
end;

procedure TfrmCertificates.DataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := not(DataModule.mtbCER.State in dsEditModes) and  not DataModule.mtbCER.IsEmpty;
  actDelete.Enabled := actEdit.Enabled;
  actClear.Enabled := actEdit.Enabled;
  actTestConnection.Enabled := actEdit.Enabled;
  actDatabase.Enabled := actEdit.Enabled;
  actSelected.Enabled := actEdit.Enabled and not IsEqualGUID(DataModule.mtbCERId.AsGuid, DataModule.mtbCONId.AsGuid);
end;

procedure TfrmCertificates.dxFluentDesignFormActivate(Sender: TObject);
begin
  inherited;
  CanMoveOwnerForm := True;
end;

procedure TfrmCertificates.dxFluentDesignFormCreate(Sender: TObject);
begin
  inherited;
  DataModule.mtbCER.Refresh;
end;

procedure TfrmCertificates.EdtCertification;
begin
  CertificationForm(False);
end;

end.
