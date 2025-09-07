unit duimp.pre.view.ConnectionEditorForm;

interface

uses
{PROJECT}
  duimp.pre.view.System.DialogDefForm,
{IDE}
  System.Classes, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2019Colorful, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutContainer, dxLayoutcxEditAdapters, dxCore, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Vcl.Dialogs, cxEditRepositoryItems, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxPC, cxLocalization, System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList, System.Actions, Vcl.ActnList,
  dxSkinsForm, cxClasses, dxLayoutLookAndFeels, Vcl.StdCtrls, cxButtons, dxLayoutControl;

type
  TConnectionEditor = class(TfrmDialogDef)
    loiDatabase: TdxLayoutItem;
    pclCec: TcxPageControl;
    tshDef: TcxTabSheet;
    lclDBDefGroup_Root: TdxLayoutGroup;
    lclDBDef: TdxLayoutControl;
    grdParamsLevel: TcxGridLevel;
    grdParams: TcxGrid;
    dxLayoutItem3: TdxLayoutItem;
    sryCec: TcxStyleRepository;
    stlContent: TcxStyle;
    mtbPRM: TFDMemTable;
    dsoPRM: TDataSource;
    mtbPRMParam: TStringField;
    mtbPRMValue: TStringField;
    mtbPRMDefault: TStringField;
    grdParamsDBTableView: TcxGridDBTableView;
    grdParamsDBTableViewParam: TcxGridDBColumn;
    grdParamsDBTableViewValue: TcxGridDBColumn;
    grdParamsDBTableViewDefault: TcxGridDBColumn;
    stlFont: TcxStyle;
    btnTestConnection: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    actTestConnection: TAction;
    lsi2: TdxLayoutSeparatorItem;
    btnDefaults: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    actDefaults: TAction;
    edrCec: TcxEditRepository;
    ertPassword: TcxEditRepositoryTextItem;
    ertEdit: TcxEditRepositoryTextItem;
    ertParams: TcxEditRepositoryComboBoxItem;
    dlgOpenDialog: TOpenDialog;
    dxLayoutItem5: TdxLayoutItem;
    cbxServerID: TcxComboBox;
    procedure dxFluentDesignFormActivate(Sender: TObject);
    procedure dxFluentDesignFormCreate(Sender: TObject);
    procedure dxFluentDesignFormDestroy(Sender: TObject);
    procedure grdParamsDBTableViewCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grdParamsDBTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure grdParamsDBTableViewValueGetPropertiesForEdit(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure grdParamsDBTableViewValueGetProperties(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure actDefaultsExecute(Sender: TObject);
    procedure actTestConnectionExecute(Sender: TObject);
    procedure mtbPRMAfterPost(DataSet: TDataSet);
    procedure grdParamsExit(Sender: TObject);
    procedure cbxServerIDPropertiesChange(Sender: TObject);
  private
    FConnection: TFDCustomConnection;
    FDataChange: Boolean;
    FDefaults: TStrings;
    FDriverID: String;
    FEdited: TStrings;
    FResults: TStrings;
    class function Execute(const AOwner: TComponent; const AConnection: TFDCustomConnection; const ACaption: String): Boolean; overload;
    function GetTempConnection: TFDCustomConnection;
    function IsDriverKnown(const ADrvID: String; out ADrvMeta: IFDPhysDriverMetadata): Boolean;
    procedure FillConnParams(const AParams: TStrings);
    procedure FillParamGrids;
    procedure FillParamValues(const AAsIs: Boolean);
    procedure GetDriverParams(const ADrvID: String; AStrs: TStrings);
    procedure OverrideBy(AThis, AByThat: TStrings);
    procedure PostEdited;
    procedure ResetConnectionDef;
    procedure ResetData;
    procedure SetConnectionParams(const AConnection: TFDCustomConnection);
  public
    class function Execute(const AOwner: TComponent; var AConnStr: String; const ACaption: String): Boolean; overload;
  end;

implementation

uses
{IDE}
  FireDAC.Stan.Util,
  System.SysUtils,
  System.UITypes,
  System.Variants,
  Vcl.Graphics;

{$R *.dfm}

function GUIxSetupEditor(AItems: TStrings; AFileEdt: TCustomEdit; AOpenDlg: TOpenDialog; const AType: String): Integer;
const
  S_True = 'True';
  S_False = 'False';
  S_Yes = 'Yes';
  S_No = 'No';
var
  I: Integer;
begin
  Result := 1;
  if AType = '@L' then
  begin
    AItems.BeginUpdate;
    try
      AItems.Clear;
      AItems.Add(S_True);
      AItems.Add(S_False);
    finally
      AItems.EndUpdate;
    end;
  end
  else if AType = '@Y' then
  begin
    AItems.BeginUpdate;
    try
      AItems.Clear;
      AItems.Add(S_Yes);
      AItems.Add(S_No);
    finally
      AItems.EndUpdate;
    end;
  end
  else if AType = '@I' then
  begin
    Result := 0;
  end
  else if (AType = '') or (AType = '@S') or (AType = '@P') then
  begin
    Result := 0;
  end
  else if Copy(AType, 1, 2) = '@F' then
  begin
//    AFileEdt.Text := '';
//    AOpenDlg.Filter := Copy(AType, 4, MAXINT) + '|All Files|*.*';
//    AOpenDlg.FilterIndex := 0;
    Result := 2;
  end
  else
  begin
    I := 1;
    AItems.BeginUpdate;
    try
      AItems.Clear;
      while I <= Length(AType) do
      begin
        AItems.Add(FDExtractFieldName(AType, I));
      end;
    finally
      AItems.EndUpdate;
    end;
  end;
end;

class function TConnectionEditor.Execute(const AOwner: TComponent; const AConnection: TFDCustomConnection;
  const ACaption: String): Boolean;
var
  LFrm: TConnectionEditor;
begin
  LFrm := TConnectionEditor.Create(AOwner);
  try
    LFrm.FConnection := AConnection;
    LFrm.Caption := Format('%s - [%s]', [LFrm.Caption, ACaption]);
    FDManager.GetDriverNames(LFrm.cbxServerID.Properties.Items);
    if AConnection.DriverName <> '' then
    begin
      LFrm.cbxServerID.Text := AConnection.DriverName;
      LFrm.FDriverID := AConnection.DriverName;
    end;
    LFrm.FEdited.SetStrings(AConnection.Params);
    LFrm.FillParamValues(False);
    LFrm.FillParamGrids;
    Result := LFrm.ShowModal = mrOK;
    if Result then
    begin
      LFrm.SetConnectionParams(AConnection);
    end;
  finally
    FDFree(LFrm);
  end;
end;

class function TConnectionEditor.Execute(const AOwner: TComponent; var AConnStr: String; const ACaption: String): Boolean;
var
  LConn: TFDCustomConnection;
begin
  LConn := TFDCustomConnection.Create(nil);
  try
    LConn.Temporary := True;
    LConn.ResultConnectionDef.ParseString(AConnStr);
    Result := Execute(AOwner, LConn, ACaption);
    if Result then
    begin
      AConnStr := LConn.ResultConnectionDef.BuildString();
    end;
  finally
    FDFree(LConn);
  end;
end;

function TConnectionEditor.GetTempConnection: TFDCustomConnection;
begin
  Result := TFDConnection.Create(nil);
  if Assigned(FConnection) then
  begin
    Result.Name := FConnection.Name;
  end;
  SetConnectionParams(Result);
  if (FConnection <> nil) and FConnection.Temporary then
  begin
    Result.Params.Pooled := False;
  end;
end;

function TConnectionEditor.IsDriverKnown(const ADrvID: String; out ADrvMeta: IFDPhysDriverMetadata): Boolean;
var
  I: Integer;
  LManMeta: IFDPhysManagerMetadata;
begin
  FDPhysManager.CreateMetadata(LManMeta);
  for I := 0 to LManMeta.DriverCount - 1 do if
    CompareText(LManMeta.DriverID[I], ADrvID) = 0 then
  begin
    LManMeta.CreateDriverMetadata(ADrvID, ADrvMeta);
    Exit(True);
  end;
  Result := False;
end;

procedure TConnectionEditor.mtbPRMAfterPost(DataSet: TDataSet);
begin
  PostEdited;
end;

procedure TConnectionEditor.FillConnParams(const AParams: TStrings);
var
  I: Integer;
  LChanged: Boolean;
  LKey, LVal: String;
  LRecNo: Integer;
begin
  AParams.Clear;
  if FConnection <> nil then
    AParams.SetStrings(FEdited)
  else
  begin
    for I := 0 to FEdited.Count - 1 do
    begin
      LKey := FEdited.Names[I];
      LVal := FEdited.Values[LKey];
      LChanged := False;
      LRecNo := mtbPRM.RecNo;
      mtbPRM.DisableControls;
      try
        mtbPRM.First;
        while not mtbPRM.Eof do
        begin
          if AnsiCompareText(mtbPRMParam.AsString, LKey) = 0 then
          begin
            LChanged := True;
            Break;
          end;
          mtbPRM.Next;
        end;
      finally
        mtbPRM.RecNo := LRecNo;
        mtbPRM.EnableControls;
      end;
      if LChanged then
      begin
        LChanged := FDefaults.Values[LKey] <> LVal;
      end;
      if LChanged then
      begin
        AParams.Add(LKey + '=' + LVal);
      end;
    end;
  end;
end;

procedure TConnectionEditor.FillParamGrids;
var
  I: Integer;
  LDrvMeta: IFDPhysDriverMetadata;
  LTab: TFDDatSTable;
begin
  if IsDriverKnown(FDriverID, LDrvMeta) then
  begin
    LTab := LDrvMeta.GetConnParams(FResults);
    FDataChange := False;
    mtbPRM.DisableControls;
    try
      mtbPRM.EmptyDataSet;
      for I := 0 to LTab.Rows.Count - 1 do
      begin
        mtbPRM.Append;
        mtbPRMParam.AsString := LTab.Rows[I].GetData('Name');
        mtbPRMValue.AsString := FResults.Values[LTab.Rows[I].GetData('Name')];
        mtbPRMDefault.AsString := LTab.Rows[I].GetData('DefVal');
        mtbPRM.Post;
      end;
      mtbPRM.First;
    finally
      FDFree(LTab);
      mtbPRM.EnableControls;
      FDataChange := True;
    end;
  end;
end;

procedure TConnectionEditor.FillParamValues(const AAsIs: Boolean);
var
  LStrs: TFDStringList;
begin
  LStrs := TFDStringList.Create;
  try
    FDefaults.Clear;
    if FDriverID <> '' then
    begin
      GetDriverParams(FDriverID, FDefaults);
    end;
    FResults.SetStrings(FDefaults);
    FResults.Values['Name'] := FDriverID;
    if not AAsIs then
    begin
      OverrideBy(FResults, FEdited);
    end;
  finally
    FDFree(LStrs);
  end;
end;

procedure TConnectionEditor.GetDriverParams(const ADrvID: String; AStrs: TStrings);
var
  I: Integer;
  LDrvMeta: IFDPhysDriverMetadata;
  LTab: TFDDatSTable;
begin
  if IsDriverKnown(ADrvID, LDrvMeta) then
  begin
    LTab := LDrvMeta.GetConnParams(AStrs);
    try
      for I := 0 to LTab.Rows.Count - 1 do
      begin
        AStrs.Add(LTab.Rows[I].GetData('Name') + '=' + LTab.Rows[I].GetData('DefVal'));
      end;
    finally
      FDFree(LTab);
    end;
  end;
end;

procedure TConnectionEditor.grdParamsDBTableViewCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  LKey: String;
  LValue: String;
begin
  if (AViewInfo.Item.Index in [0,1]) and (AViewInfo.GridRecord.Index = 0) then
  begin
    ACanvas.Font.Color := stlFont.TextColor;
    ACanvas.Font.Style := stlFont.Font.Style;
  end
  else if (AViewInfo.Item.Index = 1) and (AViewInfo.GridRecord.Index > 0) then
  begin
    LKey := AViewInfo.GridRecord.Values[grdParamsDBTableViewParam.Index];
    LValue := AViewInfo.GridRecord.Values[grdParamsDBTableViewValue.Index];
    if FDefaults.Values[LKey] <> LValue then
    begin
      ACanvas.Brush.Color := clInfoBk;
    end;
    ACanvas.Font.Color := clHotLight;
  end;
end;

procedure TConnectionEditor.grdParamsDBTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  grdParamsDBTableViewValue.Options.Editing := AFocusedRecord.Index > 0;
end;

procedure TConnectionEditor.grdParamsDBTableViewValueGetProperties(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties);
begin
  if SameText(VarToStr(ARecord.Values[grdParamsDBTableViewParam.Index]), 'database') or
    SameText(VarToStr(ARecord.Values[grdParamsDBTableViewParam.Index]), 'password') then
  begin
    AProperties := ertPassword.Properties;
  end;
end;

procedure TConnectionEditor.grdParamsDBTableViewValueGetPropertiesForEdit(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties);
var
  LDrvMeta: IFDPhysDriverMetadata;
  LNewEditor: Integer;
  LTab: TFDDatSTable;
begin
  if SameText(VarToStr(ARecord.Values[grdParamsDBTableViewParam.Index]), 'database') or
    SameText(VarToStr(ARecord.Values[grdParamsDBTableViewParam.Index]), 'password') then
  begin
    AProperties := ertPassword.Properties;
  end
  else if SameText(VarToStr(ARecord.Values[grdParamsDBTableViewParam.Index]), 'server') and
    (FDriverID = 'MSSQL') then
  begin
    AProperties := ertEdit.Properties;
  end
  else if Assigned(ARecord) and IsDriverKnown(FDriverID, LDrvMeta) then
  begin
    LTab := LDrvMeta.GetConnParams(FResults);
    try
      LNewEditor := GUIxSetupEditor(ertParams.Properties.Items, nil,
        dlgOpenDialog, LTab.Rows[ARecord.Index].GetData('Type'));
    finally
      FDFree(LTab);
    end;
    case LNewEditor of
      1: AProperties := ertParams.Properties;
      else
        AProperties := ertEdit.Properties;
    end;
  end
  else
    AProperties := ertEdit.Properties;
end;

procedure TConnectionEditor.grdParamsExit(Sender: TObject);
begin
  if mtbPRM.State in dsEditModes then
  begin
    mtbPRM.Post;
  end;
end;

procedure TConnectionEditor.OverrideBy(AThis, AByThat: TStrings);
var
  I: Integer;
  LKey: String;
  LValue: String;
begin
  for I := 0 to AByThat.Count - 1 do
  begin
    LKey := AByThat.Names[I];
    LValue := AByThat.Values[LKey];
    AThis.Values[LKey] := LValue;
  end;
end;

procedure TConnectionEditor.PostEdited;
var
  I: Integer;
begin
  if FDataChange then
  begin
    I := FEdited.IndexOfName(mtbPRMParam.AsString);
    if I = -1 then
    begin
      I := FEdited.Add('');
    end;
    FEdited[I] := mtbPRMParam.AsString + '=' + mtbPRMValue.AsString;
  end;
end;

procedure TConnectionEditor.ResetConnectionDef;
begin
  FEdited.Clear;
  FillParamValues(True);
  FillParamGrids;
end;

procedure TConnectionEditor.ResetData;
begin
  ResetConnectionDef;
end;

procedure TConnectionEditor.SetConnectionParams(const AConnection: TFDCustomConnection);
begin
  AConnection.Close;
  FillConnParams(AConnection.Params);
  AConnection.DriverName := FDriverID;
end;

procedure TConnectionEditor.actDefaultsExecute(Sender: TObject);
begin
  ResetData;
end;

procedure TConnectionEditor.actTestConnectionExecute(Sender: TObject);
begin
  ShowLoading(
    procedure
    var
      LConn: TFDCustomConnection;
    begin
      LConn := GetTempConnection;
      try
        LConn.Close;
        LConn.Open;
        ShowMessage('Conexão estabelecida com sucesso.');
      finally
        FDFree(LConn);
      end;
    end);
end;

procedure TConnectionEditor.cbxServerIDPropertiesChange(Sender: TObject);
var
  LValue: String;
begin
  LValue := cbxServerID.Text;
  if  not LValue.Trim.IsEmpty and (FDriverID <> LValue) then
  begin
    FDriverID := LValue;
    FEdited.Clear;
    FillParamValues(True);
    FillParamGrids;
  end;
end;

procedure TConnectionEditor.dxFluentDesignFormActivate(Sender: TObject);
begin
  inherited;
  CanMoveOwnerForm := True;
end;

procedure TConnectionEditor.dxFluentDesignFormCreate(Sender: TObject);
begin
  inherited;
  FDefaults := TFDStringList.Create;
  FEdited := TFDStringList.Create;
  FResults := TFDStringList.Create;
  mtbPRM.CreateDataSet;
end;

procedure TConnectionEditor.dxFluentDesignFormDestroy(Sender: TObject);
begin
  mtbPRM.EmptyDataSet;
  FDFreeAndNil(FDefaults);
  FDFreeAndNil(FResults);
  FDFreeAndNil(FEdited);
  inherited;
end;

end.
