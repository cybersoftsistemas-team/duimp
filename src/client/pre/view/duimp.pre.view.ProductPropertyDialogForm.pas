unit duimp.pre.view.ProductPropertyDialogForm;

interface

uses
{PROJECT}
  duimp.dom.DataModules.damDuimp,
  duimp.pre.view.System.DialogDefForm,
{IDE}
  System.UITypes, System.Classes, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2019Colorful, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutContainer, dxLayoutcxEditAdapters, dxCore, cxContainer, cxEdit, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxEditRepositoryItems, cxMaskEdit, cxButtonEdit, cxDBEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, cxPC, cxMemo, cxRichEdit, cxDBRichEdit, cxTextEdit, cxLocalization, System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList, System.Actions,
  Vcl.ActnList, dxSkinsForm, cxClasses, dxLayoutLookAndFeels, Vcl.StdCtrls, cxButtons, dxLayoutControl;

type
  TfrmProductPropertyDialog = class(TfrmDialogDef)
    edrProd: TcxEditRepository;
    ertList: TcxEditRepositoryButtonItem;
    ertText: TcxEditRepositoryTextItem;
    ertYesOrNo: TcxEditRepositoryComboBoxItem;
    ertDouble: TcxEditRepositoryCurrencyItem;
    ertInt: TcxEditRepositorySpinItem;
    ertDate: TcxEditRepositoryDateItem;
    ertDataTime: TcxEditRepositoryDateItem;
    dxLayoutItem1: TdxLayoutItem;
    edtCodigo_DUIMP: TcxDBTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    edtNCM: TcxDBTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    edtDescricao_Reduzida: TcxDBTextEdit;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxLayoutItem5: TdxLayoutItem;
    redDescricao: TcxDBRichEdit;
    pclProps: TcxPageControl;
    dxLayoutItem6: TdxLayoutItem;
    tshAttributes: TcxTabSheet;
    lclAttrsGroup_Root: TdxLayoutGroup;
    lclAttrs: TdxLayoutControl;
    loigrdAtts: TdxLayoutItem;
    grdAtts: TcxGrid;
    grdAttsDBTableView: TcxGridDBTableView;
    grdAttsDBTableViewProdutoCodigoInterno: TcxGridDBColumn;
    grdAttsDBTableViewncm: TcxGridDBColumn;
    grdAttsDBTableViewatributo: TcxGridDBColumn;
    grdAttsDBTableViewnomeApresentacao: TcxGridDBColumn;
    grdAttsDBTableViewnome: TcxGridDBColumn;
    grdAttsDBTableVieworientacaoPreenchimento: TcxGridDBColumn;
    grdAttsDBTableViewformaPreenchimento: TcxGridDBColumn;
    grdAttsDBTableViewmodalidade: TcxGridDBColumn;
    grdAttsDBTableViewmultivalorado: TcxGridDBColumn;
    grdAttsDBTableViewvalor: TcxGridDBColumn;
    grdAttsLevel: TcxGridLevel;
    tshFRN: TcxTabSheet;
    lclFRNGroup_Root: TdxLayoutGroup;
    lclFRN: TdxLayoutControl;
    loiedtFRNCodigo_DUIMP: TdxLayoutItem;
    edtFRNCodigo_DUIMP: TcxDBButtonEdit;
    loiedtFRNVersao: TdxLayoutItem;
    edtFRNVersao: TcxDBTextEdit;
    loiedtFRNNIOperador: TdxLayoutItem;
    edtFRNNIOperador: TcxDBTextEdit;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    loiedtFRNNome: TdxLayoutItem;
    edtFRNNome: TcxDBTextEdit;
    loiedtFRNEmail: TdxLayoutItem;
    edtFRNEmail: TcxDBTextEdit;
    ltgAddress: TdxLayoutGroup;
    loiedtFRNRua: TdxLayoutItem;
    edtFRNRua: TcxDBTextEdit;
    loiedtFRNBairro: TdxLayoutItem;
    edtFRNBairro: TcxDBTextEdit;
    loiedtFRNMunicipio: TdxLayoutItem;
    edtFRNMunicipio: TcxDBTextEdit;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    loiedtFRNCEP: TdxLayoutItem;
    edtFRNCEP: TcxDBTextEdit;
    loiedtFRNRua_Numero: TdxLayoutItem;
    edtFRNRua_Numero: TcxDBTextEdit;
    dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup;
    dxLayoutItem4: TdxLayoutItem;
    edtFRNPaisCodigo: TcxDBTextEdit;
    dxLayoutAutoCreatedGroup5: TdxLayoutAutoCreatedGroup;
    procedure dxFluentDesignFormShow(Sender: TObject);
    procedure dxFluentDesignFormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdAttsDBTableViewvalorGetProperties(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure dxFluentDesignFormCreate(Sender: TObject);
  private
    function GetdamDuimp: TdamDuimp;
  public
    property DataModule: TdamDuimp read GetdamDuimp;
  end;

implementation

{$R *.dfm}

uses
{IDE}
  System.SysUtils,
{PROJECT}
  duimp.dom.Products.Attributes.FillingForm;

{ TfrmProductPropertyDialog }

function TfrmProductPropertyDialog.GetdamDuimp: TdamDuimp;
begin
  Result := TdamDuimp(inherited DataModule);
end;

procedure TfrmProductPropertyDialog.dxFluentDesignFormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataModule.ProductCancelUpdates;
  inherited;
end;

procedure TfrmProductPropertyDialog.dxFluentDesignFormCreate(Sender: TObject);
begin
  inherited;
  pclProps.Properties.ActivePage := tshAttributes;
end;

procedure TfrmProductPropertyDialog.dxFluentDesignFormShow(Sender: TObject);
begin
  inherited;
  DataModule.qryFRN.Close;
  DataModule.qryFRN.MasterSource := DataModule.dsoITR;
  DataModule.qryFRN.Open;
  DataModule.qryADI.Close;
  DataModule.qryADI.MasterSource := DataModule.dsoITR;
  DataModule.qryADI.Open;
  DataModule.ProductGet(
    DataModule.qryDCIProdutoCodigo.AsInteger
   ,DataModule.qryDCIProdutoVersao.AsInteger
   ,DataModule.qryDCIProdutoCodigoInterno.AsInteger
   ,DataModule.qryDCIModalidadeCodigo.AsInteger
   ,DataModule.qryDCIAdicao.AsInteger
   ,DataModule.qryDCRTipoAplicacaoCodigo.AsInteger
   ,DataModule.qryDCRUFImportacao.AsString
   ,DataModule.qryDCIUnidadeComercial.AsString
   ,DataModule.qryITRTipoAliquota.AsString
   ,DataModule.qryITRProdutoDescricao.AsString
   ,DataModule.qryDCICamex.AsBoolean
   ,DataModule.qryITRAliquotaII.AsFloat
   ,DataModule.qryITRAliquotaIPI.AsFloat
   ,DataModule.qryITRAliquotaPIS.AsFloat
   ,DataModule.qryITRAliquotaCOFINS.AsFloat
   ,DataModule.qryITRAliquotaEntradaPIS.AsFloat
   ,DataModule.qryITRAliquotaSaidaPIS.AsFloat
   ,DataModule.qryITRAliquotaEntradaCOFINS.AsFloat
   ,DataModule.qryITRAliquotaSaidaCOFINS.AsFloat
   ,DataModule.qryITRValorII.AsFloat
   ,DataModule.qryITRValorIPI.AsFloat
   ,DataModule.qryITRValorPIS.AsFloat
   ,DataModule.qryITRValorCOFINS.AsFloat
   ,DataModule.qryITRAliquotaReduzidaII.AsFloat
   ,DataModule.qryITRAliquotaReduzidaIPI.AsFloat
   ,DataModule.qryITRAliquotaReduzidaPIS.AsFloat
   ,DataModule.qryITRAliquotaReduzidaCOFINS.AsFloat
  );
  grdAttsDBTableView.DataController.GotoFirst;
end;

procedure TfrmProductPropertyDialog.grdAttsDBTableViewvalorGetProperties(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties);
begin
  if SameText(ARecord.Values[grdAttsDBTableViewformaPreenchimento.Index], LISTA_ESTATICA.ToString) then
  begin
    AProperties := ertList.Properties;
  end
  else if SameText(ARecord.Values[grdAttsDBTableViewformaPreenchimento.Index], BOOLEANO.ToString) then
  begin
    AProperties := ertYesOrNo.Properties;
  end
  else if SameText(ARecord.Values[grdAttsDBTableViewformaPreenchimento.Index],
    duimp.dom.Products.Attributes.FillingForm.DATA.ToString) then
  begin
    AProperties := ertDate.Properties;
  end
  else if SameText(ARecord.Values[grdAttsDBTableViewformaPreenchimento.Index], DATA_HORA.ToString) then
  begin
    AProperties := ertDataTime.Properties;
  end
  else if SameText(ARecord.Values[grdAttsDBTableViewformaPreenchimento.Index], NUMERO_INTEIRO.ToString) then
  begin
    AProperties := ertInt.Properties;
  end
  else if SameText(ARecord.Values[grdAttsDBTableViewformaPreenchimento.Index], NUMERO_REAL.ToString) then
  begin
    AProperties := ertDouble.Properties;
  end
  else
    AProperties := ertText.Properties;
end;

end.
