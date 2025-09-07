unit duimp.pre.view.ConnectionsForm;

interface

uses
{PROJECT}
  duimp.pre.view.System.DefForm,
{IDE}
  System.Classes, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2019Black,
  dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxCore, cxLocalization, cxContainer, cxEdit,
  System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList, System.Actions, Vcl.ActnList, dxSkinsForm, cxClasses,
  dxLayoutLookAndFeels, dxLayoutContainer, dxLayoutControl, dxLayoutcxEditAdapters, cxLabel, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, Vcl.StdActns;

type
  TfrmConnections = class(TfrmDef)
    dxLayoutItem1: TdxLayoutItem;
    labConnectionList: TcxLabel;
    dxLayoutItem2: TdxLayoutItem;
    grdConnections: TcxGrid;
    grdConnectionsDBTableView: TcxGridDBTableView;
    grdlvlConnections: TcxGridLevel;
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
    grdConnectionsDBTableViewId: TcxGridDBColumn;
    grdConnectionsDBTableViewHost: TcxGridDBColumn;
    grdConnectionsDBTableViewPath: TcxGridDBColumn;
    grdConnectionsDBTableViewPort: TcxGridDBColumn;
    grdConnectionsDBTableViewProtocol: TcxGridDBColumn;
    grdConnectionsDBTableViewUrl: TcxGridDBColumn;
    procedure actWindowCloseExecute(Sender: TObject);
    procedure dxFluentDesignFormPaint(Sender: TObject);
    procedure dxFluentDesignFormActivate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
{IDE}
  System.SysUtils,
  System.Types,
  Vcl.Graphics,
{PROJECT}
  duimp.dom.DataModules.damUserAuth,
  duimp.pre.view.AddConnectionForm;

{$R *.dfm}

procedure TfrmConnections.actAddExecute(Sender: TObject);
var
  LForm: TfrmAddConnection;
begin
  LForm := TfrmAddConnection.Create(Self, DataModule, False);
  try
    LForm.ShowModal;
  finally
    FreeAndNil(LForm);
  end;
end;

procedure TfrmConnections.actWindowCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmConnections.dxFluentDesignFormActivate(Sender: TObject);
begin
  inherited;
  CanMoveOwnerForm := True;
end;

procedure TfrmConnections.dxFluentDesignFormPaint(Sender: TObject);
var
  LR: TRect;
begin
  LR := ClientRect;
  Canvas.Brush.Color := clWindow;
  Canvas.FillRect(LR);
  inherited;
end;

end.
