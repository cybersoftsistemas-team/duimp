unit duimp.pre.view.ProcessDialogForm;

interface

uses
{PROJECT}
  duimp.dom.DataModules.damDuimp,
  duimp.pre.view.System.DialogDefForm,
{IDE}
  System.UITypes, System.Classes, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2019Colorful, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, dxCore, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxDBEdit, cxLocalization,
  System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList, System.Actions, Vcl.ActnList, dxSkinsForm, cxClasses, dxLayoutLookAndFeels, dxLayoutContainer, Vcl.StdCtrls, cxButtons,
  dxLayoutControl;

type
  TfrmProcessDialog = class(TfrmDialogDef)
    dxLayoutItem2: TdxLayoutItem;
    edtProcesso_Mestre: TcxDBTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    cbxIncentivo_Fiscal: TcxDBLookupComboBox;
    dxLayoutItem4: TdxLayoutItem;
    cbxUFImportacao: TcxDBLookupComboBox;
    dxLayoutItem5: TdxLayoutItem;
    edtUFImportacaoNome: TcxDBTextEdit;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    dxLayoutItem6: TdxLayoutItem;
    cbxUFDesembaraco: TcxDBLookupComboBox;
    dxLayoutItem7: TdxLayoutItem;
    edtUFDesembaracoNome: TcxDBTextEdit;
    dxLayoutItem8: TdxLayoutItem;
    edtProcesso: TcxDBTextEdit;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    procedure dxFluentDesignFormShow(Sender: TObject);
  private
    function GetdamDuimp: TdamDuimp;
  public
    property DataModule: TdamDuimp read GetdamDuimp;
  end;

implementation

{$R *.dfm}

uses
{IDE}
  System.SysUtils;

procedure TfrmProcessDialog.dxFluentDesignFormShow(Sender: TObject);
begin
  inherited;
  actWindowOk.Enabled := not DataModule.qryProcProcesso.AsString.Trim.IsEmpty and
    not DataModule.qryProcIncentivo_Fiscal.AsString.Trim.IsEmpty and
    not DataModule.qryProcUF_Importacao.AsString.Trim.IsEmpty and
    not DataModule.qryProcUF_Desembaraco.AsString.Trim.IsEmpty;
end;

function TfrmProcessDialog.GetdamDuimp: TdamDuimp;
begin
  Result := TdamDuimp(inherited DataModule);
end;

end.
