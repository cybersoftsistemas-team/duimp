unit duimp.pre.view.ProdAttDomsDialogForm;

interface

uses
{PROJECT}
  duimp.pre.view.System.DialogDefForm,
{IDE}
  System.Classes, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxLayoutControlAdapters, dxCore, cxLocalization, cxContainer, cxEdit, System.ImageList,
  Vcl.ImgList, Vcl.Controls, cxImageList, System.Actions, Vcl.ActnList, dxSkinsForm, cxClasses, dxLayoutLookAndFeels, dxLayoutContainer, Vcl.StdCtrls, cxButtons, dxLayoutControl,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid;

type
  TfrmProdAttDomsDialog = class(TfrmDialogDef)
    dxLayoutItem1: TdxLayoutItem;
    grdAttDoms: TcxGrid;
    grdAttDomsDBTableView: TcxGridDBTableView;
    grdAttDomsDBTableViewAtributo: TcxGridDBColumn;
    grdAttDomsDBTableViewcodigo: TcxGridDBColumn;
    grdAttDomsDBTableViewdescricao: TcxGridDBColumn;
    grdAttDomsLevel: TcxGridLevel;
    procedure dxFluentDesignFormCreate(Sender: TObject);
    procedure grdAttDomsDBTableViewDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
{IDE}
  duimp.dom.DataModules.damProducts;

{ TfrmProdAttDomsDialog }

procedure TfrmProdAttDomsDialog.dxFluentDesignFormCreate(Sender: TObject);
begin
  inherited;
  actWindowOk.Enabled := not grdAttDomsDBTableView.DataController.DataSource.DataSet.IsEmpty;
end;

procedure TfrmProdAttDomsDialog.grdAttDomsDBTableViewDblClick(Sender: TObject);
begin
  var LDataSet := grdAttDomsDBTableView.DataController.DataSource.DataSet;
  if not LDataSet.IsEmpty and (grdAttDomsDBTableView.Controller.SelectedRowCount > 0) then
  begin
    ModalResult := btnWindowOk.ModalResult;
  end;
end;

end.
