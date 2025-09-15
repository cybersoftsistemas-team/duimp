unit duimp.pre.view.DuimpPdFFram;

interface

uses
{PROJECT}
  duimp.dom.DataModules.damDuimp,
  duimp.dom.DataModules.System.damMain,
  duimp.pre.view.System.PageDefFram,
{IDE}
  System.Classes, Data.DB, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2019Colorful, cxContainer, cxEdit, dxLayoutcxEditAdapters,
  dxLayoutContainer, dxLayoutControlAdapters, dxCore, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  cxDBData, cxCheckBox, Vcl.Menus, cxEditRepositoryItems, System.Actions, Vcl.ActnList, cxTextEdit, cxMemo, cxRichEdit, cxDBRichEdit, cxGridBandedTableView,
  cxGridDBBandedTableView, cxButtonEdit, cxDBEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, Vcl.DBCtrls,
  cxGridViewLayoutContainer, cxGridLayoutView, cxGridDBLayoutView, cxGridCustomLayoutView, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxPC, dxSkinsForm, dxLayoutLookAndFeels, cxLocalization, cxClasses, System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList, cxLabel, dxLayoutControl,
  dxSkinOffice2019Black;

type
  TfraDuimpPageDef = class(TfraPageDef)
    pclDuimpProcess: TcxPageControl;
    loiDuimp: TdxLayoutItem;
    tshDuimp: TcxTabSheet;
    btnFindDuimp: TcxButton;
    loiFindDuimp: TdxLayoutItem;
    actFindDuimp: TAction;
    edrDuimp: TcxEditRepository;
    edrDuimpDispYesOrNo: TcxEditRepositoryCheckBoxItem;
    actProcessSave: TAction;
    actProcessCancel: TAction;
    actSaveOpe: TAction;
    actCancelOpe: TAction;
    lclDUIGroup_Root: TdxLayoutGroup;
    lclDUI: TdxLayoutControl;
    loipclDuimp: TdxLayoutItem;
    pclDuimp: TcxPageControl;
    tshDuimpCouver: TcxTabSheet;
    lclDuimp: TdxLayoutControl;
    edtSituacaoDuimp: TcxDBTextEdit;
    edtUnidadeDespachoDescricao: TcxDBTextEdit;
    edtDataRegistro: TcxDBTextEdit;
    edtImportadorNI: TcxDBTextEdit;
    edtFreteMoedaNegociadaSimbolo: TcxDBTextEdit;
    edtFreteMoedaNegociadaValorCotacao: TcxDBTextEdit;
    edtSeguroMoedaNegociadaSimbolo: TcxDBTextEdit;
    edtSeguroMoedaNegociadaValorCotacao: TcxDBTextEdit;
    edtFreteMoedaNegociadaValorBRL: TcxDBTextEdit;
    edtFreteMoedaNegociadaValor: TcxDBTextEdit;
    edtSeguroMoedaNegociadaValorBRL: TcxDBTextEdit;
    edtSeguroMoedaNegociadaValor: TcxDBTextEdit;
    grdFOA: TcxGrid;
    grdFOADBTableView: TcxGridDBTableView;
    grdFOADBTableViewMoedaNegociadaId: TcxGridDBColumn;
    grdFOADBTableViewMoedaNegociadaSimbolo: TcxGridDBColumn;
    grdFOADBTableViewMoedaNegociadaValor: TcxGridDBColumn;
    grdFOADBTableViewMoedaNegociadaValorCotacao: TcxGridDBColumn;
    grdFOADBTableViewMoedaNegociadaValorBRL: TcxGridDBColumn;
    grdFOALevel: TcxGridLevel;
    grdFOB: TcxGrid;
    grdFOBDBTableView: TcxGridDBTableView;
    grdFOBDBTableViewMoedaNegociadaId: TcxGridDBColumn;
    grdFOBDBTableViewMoedaNegociadaSimbolo: TcxGridDBColumn;
    grdFOBDBTableViewMoedaNegociadaValor: TcxGridDBColumn;
    grdFOBDBTableViewMoedaNegociadaValorCotacao: TcxGridDBColumn;
    grdFOBDBTableViewMoedaNegociadaValorBRL: TcxGridDBColumn;
    grdFOBLevel: TcxGridLevel;
    cbxRemoverValoracaoNoValorFob: TcxDBCheckBox;
    grdDTC: TcxGrid;
    grdDTCDBTableView: TcxGridDBTableView;
    grdDTCDBTableViewId: TcxGridDBColumn;
    grdDTCDBTableViewTipo: TcxGridDBColumn;
    grdDTCDBTableViewVersaoId: TcxGridDBColumn;
    grdDTVDBLayoutView: TcxGridDBLayoutView;
    grdDTVDBLayoutViewId: TcxGridDBLayoutViewItem;
    grdDTVDBLayoutViewCalculado: TcxGridDBLayoutViewItem;
    grdDTVDBLayoutViewAReduzir: TcxGridDBLayoutViewItem;
    grdDTVDBLayoutViewDevido: TcxGridDBLayoutViewItem;
    grdDTVDBLayoutViewSuspenso: TcxGridDBLayoutViewItem;
    grdDTVDBLayoutViewARecolher: TcxGridDBLayoutViewItem;
    grdDTVDBLayoutViewRecolhido: TcxGridDBLayoutViewItem;
    grdDTVDBLayoutViewMajorado: TcxGridDBLayoutViewItem;
    grdDTVDBLayoutViewNotaFiscal: TcxGridDBLayoutViewItem;
    grdDTVDBLayoutViewTributoCalculadoId: TcxGridDBLayoutViewItem;
    grdDTVDBLayoutViewVersaoId: TcxGridDBLayoutViewItem;
    grdDTVDBLayoutViewGroup_Root: TdxLayoutGroup;
    grdDTVDBLayoutViewLayoutItem1: TcxGridLayoutItem;
    grdDTVDBLayoutViewLayoutItem2: TcxGridLayoutItem;
    grdDTVDBLayoutViewLayoutItem3: TcxGridLayoutItem;
    grdDTVDBLayoutViewLayoutItem4: TcxGridLayoutItem;
    grdDTVDBLayoutViewLayoutItem5: TcxGridLayoutItem;
    grdDTVDBLayoutViewLayoutItem6: TcxGridLayoutItem;
    grdDTVDBLayoutViewLayoutItem7: TcxGridLayoutItem;
    grdDTVDBLayoutViewLayoutItem8: TcxGridLayoutItem;
    grdDTVDBLayoutViewLayoutItem9: TcxGridLayoutItem;
    grdDTVDBLayoutViewLayoutItem10: TcxGridLayoutItem;
    grdDTVDBLayoutViewLayoutItem11: TcxGridLayoutItem;
    grdDTCLevel: TcxGridLevel;
    grdDTVLevel: TcxGridLevel;
    grdADV: TcxGrid;
    grdADVDBTableView: TcxGridDBTableView;
    grdADVDBTableViewMoedaNegociadaId: TcxGridDBColumn;
    grdADVDBTableViewMoedaNegociadaSimbolo: TcxGridDBColumn;
    grdADVDBTableViewMoedaNegociadaValor: TcxGridDBColumn;
    grdADVDBTableViewMoedaNegociadaValorCotacao: TcxGridDBColumn;
    grdADVDBTableViewMoedaNegociadaValorBRL: TcxGridDBColumn;
    grdADVLevel: TcxGridLevel;
    cbxDesembaracoAduaneiro: TcxDBCheckBox;
    cbxAdmissaoTemporaria: TcxDBCheckBox;
    cbxSuspensaoImpostos: TcxDBCheckBox;
    cbxEntrepostoAduaneiro: TcxDBCheckBox;
    cbxRemoverFreteTerrirtrioNacionalBCImpostos: TcxDBCheckBox;
    lclDuimpGroup_Root: TdxLayoutGroup;
    loiSituacaoDuimp: TdxLayoutItem;
    loiLocalDesembaracoDesc: TdxLayoutItem;
    loiDataRegistroDeclaracao: TdxLayoutItem;
    loiImportador: TdxLayoutItem;
    loiFreteDescMN: TdxLayoutItem;
    loiFreteValorMN: TdxLayoutItem;
    loiSeguroDescMN: TdxLayoutItem;
    loiSeguroValorMN: TdxLayoutItem;
    loiCondicaoVendaVlrBRLTotalFrete: TdxLayoutItem;
    loiFreteMe: TdxLayoutItem;
    loiCondicaoVendaVlrBRLTotalSeguro: TdxLayoutItem;
    loiSeguroMe: TdxLayoutItem;
    ltgCarga: TdxLayoutGroup;
    loigrdFOA: TdxLayoutItem;
    loigrdFOB: TdxLayoutItem;
    ltgUnidadeDespachoCodigo: TdxLayoutGroup;
    ltgFreteMoeda: TdxLayoutGroup;
    ltgFrete: TdxLayoutGroup;
    ltgSeguro: TdxLayoutGroup;
    ltgSeguroMoeda: TdxLayoutGroup;
    loicbxAddValoracaoNoValorFob: TdxLayoutItem;
    ltgOpcoesDiversas: TdxLayoutGroup;
    loigrdDTC: TdxLayoutItem;
    ltgTributos: TdxLayoutGroup;
    ltgMercadoria: TdxLayoutGroup;
    loigrdADV: TdxLayoutItem;
    loicbxDesembaracoAduaneiro: TdxLayoutItem;
    loicbxAdmissaoTemporaria: TdxLayoutItem;
    loicbxSuspensaoImpostos: TdxLayoutItem;
    loicbxEntrepostoAduaneiro: TdxLayoutItem;
    loicbxRemoverFreteTerrirtrioNacionalBCImpostos: TdxLayoutItem;
    dxLayoutAutoCreatedGroup20: TdxLayoutAutoCreatedGroup;
    tshGoods: TcxTabSheet;
    lclGoods: TdxLayoutControl;
    pclDCI: TcxPageControl;
    tshDCI: TcxTabSheet;
    dxLayoutControl1: TdxLayoutControl;
    grdDCI: TcxGrid;
    grdDCIDBBandedTableView: TcxGridDBBandedTableView;
    grdDCIDBBandedTableViewId: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewAdicao: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCamex: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCaracterizacaoImportacaoIndicador: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCaracterizacaoImportacaoNI: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCondicaoVendaValorBRL: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCondicaoVendaValorFreteBRL: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCondicaoVendaValorFreteCotacao: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCondicaoVendaValorFrete: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCondicaoVendaValorMoedaNegociada: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCondicaoVendaValorSeguroBRL: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCondicaoVendaValorSeguroCotacao: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCondicaoVendaValorSeguro: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewDumping: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewFabricanteCodigo: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewFabricanteCodigoPais: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewFabricanteNIOperador: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewFabricanteVersao: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewExportadorCodigo: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewExportadorCodigoPais: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewExportadorNIOperador: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewExportadorVersao: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewIncotermCodigo: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewIncotermDescricao: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewIncotermFrete: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewIncotermSeguro: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewIncotermTexto: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewIncotermValorBRL: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewIncotermValorVcBRL: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewIncotermValorMoedaNegociada: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewIncotermValorMoedaNegociadaVlc: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewIncotermValorUnitario: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewIncotermValorUnitarioVlc: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewModalidadeCodigo: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewModalidadeDescricao: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewMoedaNegociadaCodigo: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewMoedaNegociadaSimbolo: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewNumeroItem: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewPesoLiquido: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewPesoLiquidoUnitario: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewProdutoCodigo: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewProdutoCodigoInterno: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewProdutoDescricao: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewProdutoDescricaoInterno: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewProdutoNIResponsavel: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewProdutoVersao: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewQuantidadeComercial: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewUnidadeComercial: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewVersaoId: TcxGridDBBandedColumn;
    grdDCILevel: TcxGridLevel;
    redIncotermTexto: TcxDBRichEdit;
    grdDAD: TcxGrid;
    grdDADDBTableView: TcxGridDBTableView;
    grdDADDBTableViewId: TcxGridDBColumn;
    grdDADDBTableViewTipo: TcxGridDBColumn;
    grdDADDBTableViewMoedaNegociadaSimbolo: TcxGridDBColumn;
    grdDADDBTableViewMoedaNegociadaValor: TcxGridDBColumn;
    grdDADDBTableViewDenominacaoCodigo: TcxGridDBColumn;
    grdDADDBTableViewValorBRL: TcxGridDBColumn;
    grdDADDBTableViewDenominacaoDescricao: TcxGridDBColumn;
    grdDADDBTableViewCapaItemId: TcxGridDBColumn;
    grdDADLevel: TcxGridLevel;
    edtProdutoCodigoInterno: TcxDBButtonEdit;
    edtProdutoNomeInterno: TcxDBTextEdit;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    loigrdDCI: TdxLayoutItem;
    loiIncotermTexto: TdxLayoutItem;
    loigrdDAD: TdxLayoutItem;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    lsi3: TdxLayoutSplitterItem;
    loiedtProdutoCodigoInterno: TdxLayoutItem;
    loiedtProdutoNomeInterno: TdxLayoutItem;
    dxLayoutAutoCreatedGroup7: TdxLayoutAutoCreatedGroup;
    tshTRI: TcxTabSheet;
    dxLayoutControl2: TdxLayoutControl;
    edtMercadoriaValorLocalEmbarqueBRL: TcxDBTextEdit;
    edtMercadoriaValorAduaneiroBRL: TcxDBTextEdit;
    edtIncotermValorBRL: TcxDBTextEdit;
    grdDIA: TcxGrid;
    grdDIADBTableView: TcxGridDBTableView;
    grdDIADBTableViewId: TcxGridDBColumn;
    grdDIADBTableViewTributoCodigo: TcxGridDBColumn;
    grdDIADBTableViewRegimeCodigo: TcxGridDBColumn;
    grdDIADBTableViewRegimeDescricao: TcxGridDBColumn;
    grdDIADBTableViewFundamentoCodigo: TcxGridDBColumn;
    grdDIADBTableViewItemTributoId: TcxGridDBColumn;
    grdDIADBTableViewFundamentoDescricao: TcxGridDBColumn;
    grdDIALevel: TcxGridLevel;
    grdDIC: TcxGrid;
    grdDICSelDBLayoutView: TcxGridDBLayoutView;
    grdDICSelDBLayoutViewDuimpItcId: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewCodigoFundamentoLegalNormal: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewDescricaoFundamentoLegalNormal: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewBaseCalculoBRL: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewBaseCalculoEspecificaBRL: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewBaseCalculoReduzidaBRL: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewPercentualReducaoBaseCalculo: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewTipoAliquota: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewPercentualReducaoAliquotaReduzida: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewValorAliquota: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewValorAliquotaEspecifica: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewValorAliquotaReduzida: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewNormal: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewTributado: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewPercentualPagamento: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewCalculado: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewAReduzir: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewDevido: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewSuspenso: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewARecolher: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewOriginalDevido: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewCalculadoPagProporcional: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewDuimpItId: TcxGridDBLayoutViewItem;
    grdDICSelDBLayoutViewGroup_Root: TdxLayoutGroup;
    grdDICSelDBLayoutViewLayoutItem1: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem2: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem3: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem4: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem5: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem6: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem7: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem8: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem9: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem10: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem11: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem12: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem13: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem14: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem15: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem16: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem17: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem18: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem19: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem20: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem21: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem22: TcxGridLayoutItem;
    grdDICSelDBLayoutViewLayoutItem23: TcxGridLayoutItem;
    grdDICSelDBLayoutViewAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    grdDICSelDBLayoutViewAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    grdDICDBTableView: TcxGridDBTableView;
    grdDICDBTableViewId: TcxGridDBColumn;
    grdDICDBTableViewTipo: TcxGridDBColumn;
    grdDICDBTableViewItemTributoId: TcxGridDBColumn;
    grdDICLevel: TcxGridLevel;
    grdDICSelLevel: TcxGridLevel;
    dxLayoutControl2Group_Root: TdxLayoutGroup;
    loigrdDIA: TdxLayoutItem;
    dxLayoutGroup4: TdxLayoutGroup;
    loiMercadoriaValorLocalEmbarqueBRL: TdxLayoutItem;
    loiIncotermValorBRL: TdxLayoutItem;
    loiMercadoriaValorAduaneiroBRL: TdxLayoutItem;
    loigrdDIC: TdxLayoutItem;
    tshCamex: TcxTabSheet;
    lclCamex: TdxLayoutControl;
    grdCMX: TcxGrid;
    grdCMXDBTableView: TcxGridDBTableView;
    grdCMXDBTableViewId: TcxGridDBColumn;
    grdCMXDBTableViewCamex: TcxGridDBColumn;
    grdCMXDBTableViewAdicao: TcxGridDBColumn;
    grdCMXDBTableViewNumeroItem: TcxGridDBColumn;
    grdCMXDBTableViewProdutoCodigo: TcxGridDBColumn;
    grdCMXDBTableViewProdutoVersao: TcxGridDBColumn;
    grdCMXDBTableViewProdutoCodigoInterno: TcxGridDBColumn;
    grdCMXDBTableViewProdutoDescricao: TcxGridDBColumn;
    grdCMXDBTableViewProdutoDescricaoInterno: TcxGridDBColumn;
    grdCMXDBTableViewVersaoId: TcxGridDBColumn;
    grdCMXLevel: TcxGridLevel;
    lclCamexGroup_Root: TdxLayoutGroup;
    dxLayoutItem6: TdxLayoutItem;
    tshDUM: TcxTabSheet;
    lclDUM: TdxLayoutControl;
    grdDUM: TcxGrid;
    grdDUMDBTableView: TcxGridDBTableView;
    grdDUMDBTableViewId: TcxGridDBColumn;
    grdDUMDBTableViewDumping: TcxGridDBColumn;
    grdDUMDBTableViewAdicao: TcxGridDBColumn;
    grdDUMDBTableViewNumeroItem: TcxGridDBColumn;
    grdDUMDBTableViewProdutoCodigo: TcxGridDBColumn;
    grdDUMDBTableViewProdutoVersao: TcxGridDBColumn;
    grdDUMDBTableViewProdutoCodigoInterno: TcxGridDBColumn;
    grdDUMDBTableViewProdutoDescricao: TcxGridDBColumn;
    grdDUMDBTableViewProdutoDescricaoInterno: TcxGridDBColumn;
    grdDUMDBTableViewVersaoId: TcxGridDBColumn;
    grdDUMLevel: TcxGridLevel;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutItem7: TdxLayoutItem;
    tshEF: TcxTabSheet;
    lclEF: TdxLayoutControl;
    edtExpNome: TcxDBTextEdit;
    edtFabNome: TcxDBTextEdit;
    edtExpEmail: TcxDBTextEdit;
    edtFabEmail: TcxDBTextEdit;
    edtExpRua: TcxDBTextEdit;
    edtFabLogradouro: TcxDBTextEdit;
    edtExpMunicipio: TcxDBTextEdit;
    edtFabMunicipio: TcxDBTextEdit;
    edtExpCEP: TcxDBTextEdit;
    edtExpPaisCodigo: TcxDBTextEdit;
    edtFabCep: TcxDBTextEdit;
    edtFabPaisCodigo: TcxDBTextEdit;
    edtExpCodigoInterno: TcxDBButtonEdit;
    edtFabCodigoInterno: TcxDBButtonEdit;
    edtExpVersao: TcxDBTextEdit;
    edtFabVersao: TcxDBTextEdit;
    edtExpNIOperador: TcxDBTextEdit;
    edtFabNIOperador: TcxDBTextEdit;
    edtExpCodigo: TcxDBButtonEdit;
    edtFabCodigo: TcxDBButtonEdit;
    btnCancelOpe: TcxButton;
    btnSaveOpe: TcxButton;
    edtExpRua_Numero: TcxDBTextEdit;
    edtFabRua_Numero: TcxDBTextEdit;
    edtExpBairro: TcxDBTextEdit;
    edtFabBairro: TcxDBTextEdit;
    ltgManufacturerOrProducerGroup_Root: TdxLayoutGroup;
    loiedtExpNome: TdxLayoutItem;
    ltgFornecedor: TdxLayoutGroup;
    loiedtFabNome: TdxLayoutItem;
    ltgFabricante: TdxLayoutGroup;
    loiedtExpEmail: TdxLayoutItem;
    loiedtFabEmail: TdxLayoutItem;
    ltgExpEndereco: TdxLayoutGroup;
    ltgFabEndereco: TdxLayoutGroup;
    loiedtExpRua: TdxLayoutItem;
    loiedtFabLogradouro: TdxLayoutItem;
    loiedtExpMunicipio: TdxLayoutItem;
    loiedtFabMunicipio: TdxLayoutItem;
    loiedtExpCEP: TdxLayoutItem;
    ltgForEnd1: TdxLayoutGroup;
    loiedtExpPaisCodigo: TdxLayoutItem;
    loiedtFabCep: TdxLayoutItem;
    lagFabEnd1: TdxLayoutAutoCreatedGroup;
    loiedtFabPaisCodigo: TdxLayoutItem;
    loiedtExpCodigoInterno: TdxLayoutItem;
    loiedtFabCodigoInterno: TdxLayoutItem;
    loiedtExpVersao: TdxLayoutItem;
    dxLayoutAutoCreatedGroup12: TdxLayoutAutoCreatedGroup;
    loiedtFabVersao: TdxLayoutItem;
    dxLayoutAutoCreatedGroup11: TdxLayoutAutoCreatedGroup;
    loiedtExpNIOperador: TdxLayoutItem;
    loiedtFabNIOperador: TdxLayoutItem;
    loiedtExpCodigo: TdxLayoutItem;
    loiedtFabCodigo: TdxLayoutItem;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutAutoCreatedGroup13: TdxLayoutAutoCreatedGroup;
    dxLayoutItem16: TdxLayoutItem;
    dxLayoutAutoCreatedGroup10: TdxLayoutAutoCreatedGroup;
    loiedtExpRua_Numero: TdxLayoutItem;
    loiedtFabRua_Numero: TdxLayoutItem;
    dxLayoutAutoCreatedGroup17: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup19: TdxLayoutAutoCreatedGroup;
    loiedtExpBairro: TdxLayoutItem;
    loiedtFabBairro: TdxLayoutItem;
    ltgGoods_Root: TdxLayoutGroup;
    loipclDCI: TdxLayoutItem;
    tshDPG: TcxTabSheet;
    lclDPG: TdxLayoutControl;
    grdDPG: TcxGrid;
    grdDPGDBTableView: TcxGridDBTableView;
    grdDPGDBTableViewId: TcxGridDBColumn;
    grdDPGDBTableViewModalidadeCodigo: TcxGridDBColumn;
    grdDPGDBTableViewModalidadeDescricao: TcxGridDBColumn;
    grdDPGDBTableViewCodigoReceita: TcxGridDBColumn;
    grdDPGDBTableViewAgencia: TcxGridDBColumn;
    grdDPGDBTableViewBanco: TcxGridDBColumn;
    grdDPGDBTableViewConta: TcxGridDBColumn;
    grdDPGDBTableViewDataPagamento: TcxGridDBColumn;
    grdDPGDBTableViewTributo: TcxGridDBColumn;
    grdDPGDBTableViewValor: TcxGridDBColumn;
    grdDPGDBTableViewVersaoOrigem: TcxGridDBColumn;
    grdDPGDBTableViewDuimpId: TcxGridDBColumn;
    grdDPGLevel: TcxGridLevel;
    lclDPGGroup_Root: TdxLayoutGroup;
    dxLayoutItem9: TdxLayoutItem;
    tshExpFab: TcxTabSheet;
    lclFornFabric: TdxLayoutControl;
    grdExp: TcxGrid;
    grdExpDBTableView: TcxGridDBTableView;
    grdExpDBTableViewAdicao: TcxGridDBColumn;
    grdExpDBTableViewCodigo: TcxGridDBColumn;
    grdExpDBTableViewNome: TcxGridDBColumn;
    grdExpDBTableViewEmail: TcxGridDBColumn;
    grdExpDBTableViewNIOperador: TcxGridDBColumn;
    grdExpDBTableViewVersao: TcxGridDBColumn;
    grdExpDBTableViewRua: TcxGridDBColumn;
    grdExpDBTableViewRua_Numero: TcxGridDBColumn;
    grdExpDBTableViewBairro: TcxGridDBColumn;
    grdExpDBTableViewMunicipio: TcxGridDBColumn;
    grdExpDBTableViewCEP: TcxGridDBColumn;
    grdExpDBTableViewEstado: TcxGridDBColumn;
    grdExpDBTableViewPaisCodigo: TcxGridDBColumn;
    grdExpLevel: TcxGridLevel;
    grdFab: TcxGrid;
    grdFabDBTableView: TcxGridDBTableView;
    grdFabDBTableViewAdicao: TcxGridDBColumn;
    grdFabDBTableViewCodigo: TcxGridDBColumn;
    grdFabDBTableViewNome: TcxGridDBColumn;
    grdFabDBTableViewEmail: TcxGridDBColumn;
    grdFabDBTableViewNIOperador: TcxGridDBColumn;
    grdFabDBTableViewVersao: TcxGridDBColumn;
    grdFabDBTableViewRua: TcxGridDBColumn;
    grdFabDBTableViewRua_Numero: TcxGridDBColumn;
    grdFabDBTableViewBairro: TcxGridDBColumn;
    grdFabDBTableViewMunicipio: TcxGridDBColumn;
    grdFabDBTableViewCEP: TcxGridDBColumn;
    grdFabDBTableViewEstado: TcxGridDBColumn;
    grdFabDBTableViewPaisCodigo: TcxGridDBColumn;
    grdFabLevel: TcxGridLevel;
    lclFornFabricGroup_Root: TdxLayoutGroup;
    loiOpeExp: TdxLayoutItem;
    lsi1: TdxLayoutSplitterItem;
    loiOpeFab: TdxLayoutItem;
    tshInfCompl: TcxTabSheet;
    lclIFC: TdxLayoutControl;
    redInformacaoComplementar: TcxDBRichEdit;
    lclIFCGroup_Root: TdxLayoutGroup;
    loiInformacaoComplementar: TdxLayoutItem;
    grdDCIDBBandedTableViewProdutoNCM: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewProdutoNomeInterno: TcxGridDBBandedColumn;
    dxLayoutAutoCreatedGroup21: TdxLayoutAutoCreatedGroup;
    dxLayoutItem2: TdxLayoutItem;
    edtTipoAplicacaoDescricao: TcxDBTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    edtClienteNome: TcxDBTextEdit;
    grdDCIDBBandedTableViewClienteCodigo: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewClienteNome: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewTipoAplicacao: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewTipoAplicacaoDescricao: TcxGridDBBandedColumn;
    edtUFDesembaracoNome: TcxDBTextEdit;
    dxLayoutItem8: TdxLayoutItem;
    edtUFImportacaoNome: TcxDBTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    edtModalidades: TcxDBTextEdit;
    dxLayoutItem12: TdxLayoutItem;
    dbrgrpCanalConsolidado: TDBRadioGroup;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutAutoCreatedGroup24: TdxLayoutAutoCreatedGroup;
    ltgProcesso: TdxLayoutGroup;
    edtProcessoNumeroVinculado: TcxDBTextEdit;
    dxLayoutItem17: TdxLayoutItem;
    edtClienteCNPJ: TcxDBTextEdit;
    loiedtClienteCNPJ: TdxLayoutItem;
    dxLayoutAutoCreatedGroup14: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup15: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup16: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup9: TdxLayoutAutoCreatedGroup;
    btnProcessSave: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutAutoCreatedGroup18: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup6: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup;
    edtViaTransporteDescricao: TcxDBTextEdit;
    dxLayoutItem19: TdxLayoutItem;
    sryDUI: TcxStyleRepository;
    stlGrd: TcxStyle;
    edtIdentificacao: TcxDBTextEdit;
    dxLayoutItem20: TdxLayoutItem;
    dxLayoutAutoCreatedGroup5: TdxLayoutAutoCreatedGroup;
    cbxIncentivoFiscalNome: TcxDBLookupComboBox;
    dxLayoutItem21: TdxLayoutItem;
    cbxUFImportacao: TcxDBLookupComboBox;
    dxLayoutItem14: TdxLayoutItem;
    cbxUFDesembaraco: TcxDBLookupComboBox;
    dxLayoutItem10: TdxLayoutItem;
    edtFobValorTotal: TcxDBButtonEdit;
    dxLayoutItem23: TdxLayoutItem;
    edtFobAdicaoValorTotal: TcxDBButtonEdit;
    dxLayoutItem24: TdxLayoutItem;
    edtFobValorTotalBRL: TcxDBButtonEdit;
    dxLayoutItem22: TdxLayoutItem;
    edtFobAdicaoValorTotalBRL: TcxDBButtonEdit;
    dxLayoutItem25: TdxLayoutItem;
    dxLayoutAutoCreatedGroup8: TdxLayoutAutoCreatedGroup;
    actFindProdutoCodigoInterno: TAction;
    actShowProdutoCodigoInterno: TAction;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutItem5: TdxLayoutItem;
    cbxProcessoNumero: TcxDBLookupComboBox;
    dxLayoutItem18: TdxLayoutItem;
    edtValAduaneiraValorTotal: TcxDBButtonEdit;
    dxLayoutItem26: TdxLayoutItem;
    edtValAduaneiraValorTotalBRL: TcxDBButtonEdit;
    dxLayoutAutoCreatedGroup25: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup22: TdxLayoutAutoCreatedGroup;
    lsi2: TdxLayoutSeparatorItem;
    edtFobValorCotacao: TcxDBTextEdit;
    dxLayoutItem27: TdxLayoutItem;
    edtFobAdicaoValorCotacao: TcxDBTextEdit;
    dxLayoutItem28: TdxLayoutItem;
    edtValAduaneiraCotacao: TcxDBTextEdit;
    dxLayoutItem29: TdxLayoutItem;
    grdDCIDBBandedTableViewCondicaoVendaValorVlcBRL: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCondicaoVendaValorMoedaNegociadaVlc: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewIncotermMoedaNegociadaSimboloCVT: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewIncotermMoedaNegociadaCotacaoCVT: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewIncotermValorMoedaNegociadaCVT: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewIncotermValorMoedaNegociadaVlcCVT: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewIncotermValorUnitarioCVT: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewIncotermValorUnitarioVlcCVT: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewValorUnitarioVlc: TcxGridDBBandedColumn;
    edtFreteFobValor: TcxDBTextEdit;
    loiedtFreteFobValor: TdxLayoutItem;
    edtSeguroFobValor: TcxDBTextEdit;
    loiedtSeguroFobValor: TdxLayoutItem;
    grdDCIDBBandedTableViewCondicaoVendaMoedaNegociadaSimboloCVT: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCondicaoVendaMoedaNegociadaCotacaoCVT: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCondicaoVendaValorMoedaNegociadaCVT: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCondicaoVendaValorMoedaNegociadaVlcCVT: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCondicaoVendaValorUnitarioCVT: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCondicaoVendaValorUnitarioVlcCVT: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCondicaoVendaValorFreteCVT: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewCondicaoVendaValorSeguroCVT: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewValorUnitario: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewValorUnitarioBRL: TcxGridDBBandedColumn;
    grdDCIDBBandedTableViewValorUnitarioVlcBRL: TcxGridDBBandedColumn;
    grdDPGDBTableViewCodigoCF: TcxGridDBColumn;
    grdDPGDBTableViewTipoCF: TcxGridDBColumn;
    grdDPGDBTableViewCustoCF: TcxGridDBColumn;
    grdDPGDBTableViewCusto_EntradaCF: TcxGridDBColumn;
    grdDPGDBTableViewCusto_OutrosCF: TcxGridDBColumn;
    grdDPGDBTableViewCusto_SeletivoCF: TcxGridDBColumn;
    grdDPGDBTableViewDescricaoCF: TcxGridDBColumn;
    grdDPGDBTableViewNivelCF: TcxGridDBColumn;
    cbxRedoDuimp: TcxCheckBox;
    dxLayoutItem30: TdxLayoutItem;
    grdDCIDBBandedTableViewUnidadeComercialCodigo: TcxGridDBBandedColumn;
    edtSearchDuimp: TcxMaskEdit;
    dxLayoutItem31: TdxLayoutItem;
    grdDTVDBLayoutViewLayoutItem12: TcxGridLayoutItem;
    grdDTVDBLayoutViewTipo: TcxGridDBLayoutViewItem;
    grdDTVDBLayoutViewLayoutItem13: TcxGridLayoutItem;
    grdDTVDBLayoutViewDiferenca: TcxGridDBLayoutViewItem;
    procedure actFindDuimpExecute(Sender: TObject);
    procedure cbxModalidadePropertiesEditValueChanged(Sender: TObject);
    procedure edtProdutoCodigoInternoPropertiesEditValueChanged(Sender: TObject);
    procedure grdCMXDBTableViewCamexPropertiesEditValueChanged(Sender: TObject);
    procedure grdDUMDBTableViewDumpingPropertiesEditValueChanged(Sender: TObject);
    procedure actSaveOpeExecute(Sender: TObject);
    procedure actCancelOpeExecute(Sender: TObject);
    procedure actProcessSaveExecute(Sender: TObject);
    procedure actProcessCancelExecute(Sender: TObject);
    procedure cbxRemoverValoracaoNoValorFobPropertiesEditValueChanged(Sender: TObject);
    procedure actShowProdutoCodigoInternoExecute(Sender: TObject);
  private
    procedure ValoracaoNoValorFob;
    function GetdamDuimp: TdamDuimp;
  protected
    function GetDataModuleType: damMainType; override;
    function GetInternalNavBarGroupCaption: string; override;
    procedure CreateCanal;
    procedure DataChange(Sender: TObject; Field: TField); override;
  public
    constructor Create(AOwner: TComponent); override;
    property DataModule: TdamDuimp read GetdamDuimp;
  end;

implementation

{$R *.dfm}

uses
{IDE}
  System.SysUtils,
  System.Threading,
  System.Variants,
  Vcl.Forms,
  Winapi.Windows,
{PROJECT}
  cbsCore.Reflection,
  cbsCore.SysUtils,
  duimp.pre.view.DuimpLoadForm,
  duimp.pre.view.DuimpLoadProductForm,
  duimp.pre.view.ProcessDialogForm,
  duimp.pre.view.ProductPropertyDialogForm,
  pucomex.dom.Support.PUComex;

{ TfraDuimpPageDef }

constructor TfraDuimpPageDef.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  loigrdDAD.Visible := False;
  pclDuimp.ActivePage := tshDuimp;
  CreateCanal;
  pclDuimpProcess.ActivePage := tshDuimp;
  pclDuimp.ActivePage := tshDuimpCouver;
end;

function TfraDuimpPageDef.GetdamDuimp: TdamDuimp;
begin
  Result := TdamDuimp(inherited DataModule);
end;

function TfraDuimpPageDef.GetDataModuleType: damMainType;
begin
  Result := TdamDuimp;
end;

function TfraDuimpPageDef.GetInternalNavBarGroupCaption: string;
begin
  Result := 'Importar';
end;

procedure TfraDuimpPageDef.cbxModalidadePropertiesEditValueChanged(Sender: TObject);
begin
  if not DataModule.qryDUI.IsEmpty then
  begin
    edtSearchDuimp.Text := DataModule.qryDUINumero.AsString;
    actFindDuimp.Execute;
  end;
end;

procedure TfraDuimpPageDef.cbxRemoverValoracaoNoValorFobPropertiesEditValueChanged(Sender: TObject);
begin
  ValoracaoNoValorFob;
end;

procedure TfraDuimpPageDef.CreateCanal;
var
  I: Integer;
begin
  dbrgrpCanalConsolidado.Items.Clear;
  for I := 0 to Pred(DataModule.GetCanalConsolidado.Count) do
  begin
    dbrgrpCanalConsolidado.Items.Add(DataModule.GetCanalConsolidado.Names[I]);
    dbrgrpCanalConsolidado.Values.Add(DataModule.GetCanalConsolidado.ValueFromIndex[I]);
  end;
end;

procedure TfraDuimpPageDef.DataChange(Sender: TObject; Field: TField);
begin
  if (Sender = DataModule.dsoDIE) or (Sender = DataModule.dsoDIF) then
  begin
    if Sender = DataModule.dsoDIE then
    begin
      edtExpCodigo.Properties.Buttons[0].Visible := not DataModule.qryDIE.IsEmpty and DataModule.qryDIECodigoInterno.IsNull and
        not DataModule.qryDIECodigo.IsNull;
    end;
    if Sender = DataModule.dsoDIF then
    begin
      edtFabCodigo.Properties.Buttons[0].Visible := not DataModule.qryDIF.IsEmpty and DataModule.qryDIFCodigoInterno.IsNull and
        not DataModule.qryDIFCodigo.IsNull;
    end;
    actSaveOpe.Enabled := (DataModule.dsoDIE.DataSet.State in dsEditModes) or (DataModule.dsoDIF.DataSet.State in dsEditModes);
    actCancelOpe.Enabled := actSaveOpe.Enabled;
  end;
  if Sender = DataModule.dsoDCI then
  begin
    actShowProdutoCodigoInterno.Visible := True;
  end;
  if (Sender = DataModule.dsoDUI) or
    (Sender = DataModule.dsoDCR) or
    (Sender = DataModule.dsoDUV) then
  begin
    actProcessSave.Enabled :=
      (not DataModule.dsoDUI.DataSet.IsEmpty or
       not DataModule.dsoDCR.DataSet.IsEmpty or
       not DataModule.dsoDUV.DataSet.IsEmpty) and
      ((DataModule.dsoDUI.DataSet.State in dsEditModes) or
       (DataModule.dsoDCR.DataSet.State in dsEditModes) or
       (DataModule.dsoDUV.DataSet.State in dsEditModes));
    actProcessCancel.Enabled := actProcessSave.Enabled;
  end;
  if DataModule.qryDCR.State in dsEditModes then
  begin
    if DataModule.qryDCRUFDesembaraco.AsString.Trim.IsEmpty then
    begin
      DataModule.qryDCRUFDesembaraco.AsString := PComex.Duimp.NI_ESTADO;
    end;
    if DataModule.qryDCRUFImportacao.AsString.Trim.IsEmpty then
    begin
      DataModule.qryDCRUFImportacao.AsString := PComex.Duimp.NI_ESTADO;
    end;
  end;
end;

procedure TfraDuimpPageDef.edtProdutoCodigoInternoPropertiesEditValueChanged(Sender: TObject);
begin
  DataModule.UpdateProduct;
end;

procedure TfraDuimpPageDef.grdCMXDBTableViewCamexPropertiesEditValueChanged(Sender: TObject);
begin
  DataModule.UpdateDCI;
end;

procedure TfraDuimpPageDef.grdDUMDBTableViewDumpingPropertiesEditValueChanged(Sender: TObject);
begin
  DataModule.UpdateDCI;
end;

procedure TfraDuimpPageDef.actCancelOpeExecute(Sender: TObject);
begin
  DataModule.UpdateCancelOpe;
end;

procedure TfraDuimpPageDef.actFindDuimpExecute(Sender: TObject);
begin
  ShowLoading<TfrmDuimpLoad>(
    procedure(const ALoad: TfrmDuimpLoad)
    begin
      var LVersion := 1;
      pclDuimpProcess.ActivePage := tshDuimp;
      pclDCI.ActivePage := tshDCI;
      pclDuimp.ActivePage := tshDuimpCouver;
      Self.Update;
      var LNumeroDuimp := string(edtSearchDuimp.Text).Trim.Replace('-', '');
      if not SameText(LNumeroDuimp, DataModule.qryDUINumero.AsString) then
      begin
        cbxRedoDuimp.Checked := False;
      end;
      var LFounded := DataModule.FindDuimp(LNumeroDuimp, cbxRedoDuimp.Checked,
        procedure(const AStep: TStepFindDuimp; const AValue: Variant)
        begin
          if AStep = TStepFindDuimp.Locating then
          begin
            ALoad.labDUI.Caption := Format('Duimp: %s', [edtSearchDuimp.Text]);
            ALoad.labInfo.Properties.Alignment.Horz := taLeftJustify;
            ALoad.Show;
          end
          else if AStep = TStepFindDuimp.CheckingDuimpVersion then
          begin
            ALoad.labInfo.Caption := 'Verificando a versão da Duimp...';
          end
          else if AStep = TStepFindDuimp.LocatingDuimp then
          begin
            LVersion := AValue;
            ALoad.labDUI.Caption := Format('Duimp: %s; Versão: %d', [edtSearchDuimp.Text, VarToInt(AValue)]);
          end
          else if AStep = TStepFindDuimp.DuimpLocated then
          begin
            ALoad.Max := AValue;
            ALoad.labDUI.Caption := Format('Importando Duimp: %s; Versão: %d', [edtSearchDuimp.Text, LVersion]);
          end
          else if AStep = TStepFindDuimp.SavingDuimpItem then
          begin
            ALoad.labInfo.Caption := Format('Salvando item: Adição: %3.3d; Nº Item: %3.3d; Produto: %10.10d',
            [DataModule.qryDCIAdicao.AsInteger
            ,DataModule.qryDCINumeroItem.AsInteger
            ,DataModule.qryDCIProdutoCodigo.AsInteger]);
            ALoad.StepIt;
            ALoad.labInfo.Properties.Alignment.Horz := taCenter;
          end
          else if AStep = TStepFindDuimp.ExecutingScripts then
          begin
            ALoad.labInfo.Caption := 'Executando Scripts...';
            ALoad.labInfo.Properties.Alignment.Horz := taLeftJustify;
          end;
          Application.ProcessMessages;
        end);
      cbxRedoDuimp.Checked := False;
      cbxRedoDuimp.Enabled := LFounded and DataModule.qryCONProcesso_ImportarFechado.AsBoolean;
      tshDuimp.Caption := Format('Duimp (Versão: %d)', [DataModule.qryDUVVersao.AsInteger]);
      tshGoods.Caption := Format('Mercadorias (%d)', [DataModule.qryDCI.RecordCount]);
      tshDPG.Caption := Format('Pagamentos (%d)', [DataModule.dsoDPGSel.DataSet.RecordCount]);
      grdDCIDBBandedTableViewCondicaoVendaValorFrete.Caption := Format('Frete %s', [IIF(LFounded and not DataModule.qryDCGFreteMoedaNegociadaSimbolo.AsString.Trim.IsEmpty, Concat('(', DataModule.qryDCGFreteMoedaNegociadaSimbolo.AsString, ')'), '')]);
      grdDCIDBBandedTableViewCondicaoVendaValorSeguro.Caption := Format('Seguro %s', [IIF(LFounded and not DataModule.qryDCGSeguroMoedaNegociadaSimbolo.AsString.Trim.IsEmpty, Concat('(', DataModule.qryDCGSeguroMoedaNegociadaSimbolo.AsString, ')'), '')]);
      grdDCIDBBandedTableViewIncotermValorUnitarioCVT.Caption := Format(Concat(grdDCIDBBandedTableViewIncotermValorUnitarioVlc.Caption, ' %s'), [IIF(LFounded and not DataModule.qryDCIIncotermMoedaNegociadaSimboloCVT.AsString.Trim.IsEmpty, Concat('(', DataModule.qryDCIIncotermMoedaNegociadaSimboloCVT.AsString, ')'), '')]);
      grdDCIDBBandedTableViewIncotermValorUnitarioVlcCVT.Caption := grdDCIDBBandedTableViewIncotermValorUnitarioCVT.Caption;
      grdDCIDBBandedTableViewIncotermValorMoedaNegociadaCVT.Caption := Format(Concat(grdDCIDBBandedTableViewIncotermValorMoedaNegociadaVlc.Caption, ' %s'), [IIF(LFounded and not DataModule.qryDCIIncotermMoedaNegociadaSimboloCVT.AsString.Trim.IsEmpty, Concat('(', DataModule.qryDCIIncotermMoedaNegociadaSimboloCVT.AsString, ')'), '')]);
      grdDCIDBBandedTableViewIncotermValorMoedaNegociadaVlcCVT.Caption := grdDCIDBBandedTableViewIncotermValorMoedaNegociadaCVT.Caption;
      grdDCIDBBandedTableView.ViewData.Expand(not DataModule.qryFCV.IsEmpty and (DataModule.qryFCV.RecordCount < 1));
      grdDPGDBTableView.ViewData.Expand(True);
      cbxRemoverValoracaoNoValorFob.Enabled := LFounded and not DataModule.qryADV.IsEmpty;
      grdADVDBTableView.Styles.Background := IIF<TcxStyle>(LFounded and not DataModule.qryADV.IsEmpty, nil, stlGrd);
      loiedtFreteFobValor.Caption := Format('Valor %s:', [IIF(LFounded and not DataModule.qryDCIIncotermMoedaNegociadaSimboloCVT.AsString.Trim.IsEmpty, Concat('(', DataModule.qryDCIIncotermMoedaNegociadaSimboloCVT.AsString, ')'), '')]);
      loiedtSeguroFobValor.Caption := loiedtFreteFobValor.Caption;
    end,
    False);
end;

procedure TfraDuimpPageDef.actProcessCancelExecute(Sender: TObject);
begin
  DataModule.ProcessCancelUpdates;
end;

procedure TfraDuimpPageDef.actProcessSaveExecute(Sender: TObject);
var
  frmProcessDialog: TfrmProcessDialog;
  LModalResult: TModalResult;
begin
  frmProcessDialog := TfrmProcessDialog.Create(Self, DataModule, False);
  try
    DataModule.PrepareNewProcess;
    LModalResult := frmProcessDialog.ShowModal;
  finally
    DataModule.OnDataChange := DataChange;
    FreeAndNil(frmProcessDialog);
  end;
  if LModalResult = mrOk then
  begin
    ShowLoading<TfrmDuimpLoadProduct>(
      procedure(const ALoad: TfrmDuimpLoadProduct)
      begin
        DataModule.ProcessCreate(
          procedure(const AStep: TStepProcessCreate; const AValue: Variant)
          begin
            if AStep = TStepProcessCreate.IsPossibleCreateProcess then
            begin
              if DataModule.qryDCI.LocateEx('UnidadeComercialCodigo', '') then
              begin
                pclDuimp.Properties.ActivePage := tshGoods;
                pclDCI.Properties.ActivePage := tshDCI;
                raise Exception.Create('Existe mercadoria que não tem a sua unidade cadastrada.');
              end;
            end;
            if AStep = TStepProcessCreate.CreatingProcess then
            begin
              ALoad.labDUI.Caption := Format('Salvando o processo %s', [VarToStr(AValue)]);
            end;
            if AStep = TStepProcessCreate.UpdateProcessData then
            begin
              ALoad.labDUI.Caption := Format('Atualizando os dados do processo %s', [VarToStr(AValue)]);
            end;
            if AStep = TStepProcessCreate.UpdateGoodsData then
            begin
              ALoad.Max := AValue;
              ALoad.labDUI.Caption := 'Atualizando os dados da mercadoria';
            end;
            if AStep = TStepProcessCreate.UpdateMerchandiseData then
            begin
              ALoad.labInfo.Caption := Format('Mercadoria: Adição: %3.3d; Nº Item: %3.3d; Produto: %10.10d',
                [DataModule.qryDPRAdicao.AsInteger
                ,DataModule.qryDPRNumeroItem.AsInteger
                ,DataModule.qryDPRProdutoCodigo.AsInteger]);
              ALoad.StepIt;
            end;
            if AStep = TStepProcessCreate.PostingPayments then
            begin
              ALoad.labInfo.Caption := 'Lançando os pagamentos...';
            end;
            if AStep = TStepProcessCreate.PostingImportDifference then
            begin
              ALoad.labInfo.Caption := 'Lançando as diferenças de importação...';
            end;
            Application.ProcessMessages;
            if AStep = TStepProcessCreate.Completed then
            begin
              TThread.CreateAnonymousThread(
                procedure
                begin
                  TThread.Synchronize(nil,
                    procedure
                    begin
                      Application.NormalizeTopMosts;
                      Application.MessageBox(PChar(Format('O processo %s foi salvo com sucesso!', [AValue])), 'Informação', MB_OK or MB_ICONINFORMATION);
                      Application.RestoreTopMosts;
                    end
                  );
                end
              ).Start;
            end;
          end
        );
      end);
  end
  else
    DataModule.ProcessCancelUpdates;
end;

procedure TfraDuimpPageDef.actSaveOpeExecute(Sender: TObject);
begin
  DataModule.UpdateOpe;
end;

procedure TfraDuimpPageDef.actShowProdutoCodigoInternoExecute(Sender: TObject);
var
  LForm: TfrmProductPropertyDialog;
begin
  LForm := TfrmProductPropertyDialog.Create(Self, DataModule, False);
  try
    LForm.ShowModal;
  finally
    DataModule.OnDataChange := DataChange;
    FreeAndNil(LForm);
  end;
end;

procedure TfraDuimpPageDef.ValoracaoNoValorFob;
const
  LSemValoracaoIndex = 4;
  LComValoracaoIndex = 5;
var
  LRemoverValoracaoNoValorFob: Boolean;
begin
  LRemoverValoracaoNoValorFob := DataModule.qryDUIRemoverValoracaoNoValorFob.AsBoolean;
  grdDCIDBBandedTableView.Bands[LSemValoracaoIndex].Visible := LRemoverValoracaoNoValorFob;
  grdDCIDBBandedTableView.Bands[LComValoracaoIndex].Visible := not LRemoverValoracaoNoValorFob;
  lsi3.Visible := not LRemoverValoracaoNoValorFob;
  loigrdDAD.Visible := not DataModule.qryADV.IsEmpty and not LRemoverValoracaoNoValorFob;
  loiMercadoriaValorLocalEmbarqueBRL.Visible := not LRemoverValoracaoNoValorFob;
  loiIncotermValorBRL.Visible := LRemoverValoracaoNoValorFob;
  grdFOADBTableView.DataController.DataSource := IIF(not LRemoverValoracaoNoValorFob, DataModule.dsoACV, DataModule.dsoASV);
  grdFOBDBTableView.DataController.DataSource := IIF(not LRemoverValoracaoNoValorFob, DataModule.dsoFCV, DataModule.dsoFSV);
end;

initialization
begin
  RegisterPageDef(TfraDuimpPageDef);
end;

end.
