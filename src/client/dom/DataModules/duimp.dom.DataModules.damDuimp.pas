unit duimp.dom.DataModules.damDuimp;

interface

uses
{PROJECT}
  duimp.dom.DataModules.System.damMain,
  pucomex.dom.Contracts.Duimp,
  pucomex.dom.Duimps.Model.AdicaoValoresCalculadosDuimpCover,
  pucomex.dom.Duimps.Model.AtributoTributoCover,
  pucomex.dom.Duimps.Model.DuimpConsultaCover,
  pucomex.dom.Duimps.Model.ItemDuimpCover,
{IDE}
  System.Variants, System.Generics.Defaults, System.Classes, System.SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, Data.DB, FireDAC.Comp.Script,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
{$SCOPEDENUMS ON}
  TTribute = (PIS, COFINS);

  TStepFindDuimp = (
    CheckingDuimpVersion,
    DuimpLocated,
    ExecutingScripts,
    Locating,
    LocatingDuimp,
    SavingDuimpItem,
    Completed
  );

  TStepProcessCreate = (
    IsPossibleCreateProcess,
    CreatingProcess,
    UpdateProcessData,
    UpdateGoodsData,
    UpdateMerchandiseData,
    PostingPayments,
    PostingImportDifference,
    Completed
  );
{$SCOPEDENUMS OFF}

  TDoUpdateRecord = reference to procedure(const ASender: TDataSet);
  TFindDuimpEvent = reference to procedure(const AStep: TStepFindDuimp; const AValue: Variant);
  TProcessCreateEvent = reference to procedure(const AStep: TStepProcessCreate; const AValue: Variant);

  TdamDuimp = class(TdamMain)
    dsoDUI: TDataSource;
    qryUnRFB: TFDQuery;
    qryUnRFBCodigo: TIntegerField;
    qryUnRFBDescricao: TStringField;
    qryDCR: TFDQuery;
    dsoDCR: TDataSource;
    qryIncoterms: TFDQuery;
    qryIncotermsCodigoICT: TStringField;
    qryIncotermsDescricaoICT: TStringField;
    qryIncotermsFreteICT: TBooleanField;
    qryIncotermsSeguroICT: TBooleanField;
    qryIncotermsTextoICT: TMemoField;
    qryDCI: TFDQuery;
    dsoDCI: TDataSource;
    qryDCRId: TGuidField;
    qryDCRDataRegistro: TSQLTimeStampField;
    qryDCRImportadorNI: TStringField;
    qryDCRImportadorTipo: TStringField;
    qryDCRSituacaoDuimp: TStringField;
    qryDCRValorTotalLocalEmbarqueBRL: TFloatField;
    qryDCRValorTotalLocalEmbarqueUSD: TFloatField;
    qryDCIId: TGuidField;
    qryDCIAdicao: TIntegerField;
    qryDCICondicaoVendaValorBRL: TFloatField;
    qryDCICondicaoVendaValorMoedaNegociada: TFloatField;
    qryDCIFabricanteCodigo: TStringField;
    qryDCIFabricanteCodigoPais: TStringField;
    qryDCIFabricanteNIOperador: TStringField;
    qryDCIFabricanteVersao: TIntegerField;
    qryDCIExportadorCodigo: TStringField;
    qryDCIExportadorCodigoPais: TStringField;
    qryDCIExportadorNIOperador: TStringField;
    qryDCIExportadorVersao: TIntegerField;
    qryDCIIncotermCodigo: TStringField;
    qryDCIMoedaNegociadaSimbolo: TStringField;
    qryDCINumeroItem: TIntegerField;
    qryDCIPesoLiquido: TFloatField;
    qryDCIProdutoCodigo: TIntegerField;
    qryDCIProdutoDescricao: TStringField;
    qryDCIProdutoVersao: TIntegerField;
    qryDCIProdutoNIResponsavel: TStringField;
    qryDCIQuantidadeComercial: TFloatField;
    qryDCIUnidadeComercial: TStringField;
    qryDAD: TFDQuery;
    dsoDAD: TDataSource;
    qryDIT: TFDQuery;
    dsoDIT: TDataSource;
    qryDADId: TGuidField;
    qryDADDenominacaoCodigo: TIntegerField;
    qryDADMoedaNegociadaSimbolo: TStringField;
    qryDADMoedaNegociadaValor: TFloatField;
    qryDADTipo: TStringField;
    qryDADValorBRL: TFloatField;
    qryDADCapaItemId: TGuidField;
    qryDCIMoedaNegociadaCodigo: TIntegerField;
    dsoDCG: TDataSource;
    qryDCG: TFDQuery;
    qryDCIIncotermDescricao: TStringField;
    qryDCIFreteICT: TBooleanField;
    qryDCISeguroICT: TBooleanField;
    qryDCITextoICT: TStringField;
    qryDCIPesoLiquidoUnitario: TFloatField;
    qryDCICondicaoVendaValorFreteBRL: TFloatField;
    qryDCICondicaoVendaValorSeguroBRL: TFloatField;
    qryDCGId: TGuidField;
    qryDCGIdentificacao: TStringField;
    qryDCGIdentificacaoCargaTipo: TStringField;
    qryDCGSeguroMoedaNegociadaSimbolo: TStringField;
    qryDCGSeguroMoedaNegociadaValor: TFloatField;
    qryDCGSeguroMoedaNegociadaValorCotacao: TFloatField;
    qryDCGFreteMoedaNegociadaSimbolo: TStringField;
    qryDCGFreteMoedaNegociadaValor: TFloatField;
    qryDCGFreteMoedaNegociadaValorCotacao: TFloatField;
    qryDCGUnidadeDespachoCodigo: TIntegerField;
    updDCG: TFDUpdateSQL;
    qryDCGFreteMoedaNegociadaCodigo: TIntegerField;
    qryDCGLocalDesembaracoDesc: TStringField;
    qryDCGSeguroMoedaNegociadaCodigo: TIntegerField;
    qryACV: TFDQuery;
    dsoACV: TDataSource;
    qryACVMoedaNegociadaValorBRL: TFloatField;
    qryACVMoedaNegociadaSimbolo: TStringField;
    qryACVMoedaNegociadaValor: TFloatField;
    updDAD: TFDUpdateSQL;
    qryFCV: TFDQuery;
    dsoFCV: TDataSource;
    dsoFSV: TDataSource;
    qryFSV: TFDQuery;
    qryACVMoedaNegociadaValorCotacao: TFloatField;
    qryDCGFreteMoedaNegociadaValorBRL: TFloatField;
    qryDCGSeguroMoedaNegociadaValorBRL: TFloatField;
    qryFCVMoedaNegociadaSimbolo: TStringField;
    qryFCVMoedaNegociadaValor: TFloatField;
    qryFCVMoedaNegociadaValorCotacao: TFloatField;
    qryFCVMoedaNegociadaValorBRL: TFloatField;
    qryDCICondicaoVendaValorFreteCotacao: TFloatField;
    qryDCICondicaoVendaValorSeguroCotacao: TFloatField;
    qryDCICondicaoVendaValorFrete: TFloatField;
    qryDCICondicaoVendaValorSeguro: TFloatField;
    sptDCI: TFDScript;
    updDCI: TFDUpdateSQL;
    qryDCICondicaoVendaValorVlcBRL: TFloatField;
    qryDCICondicaoVendaValorMoedaNegociadaVlc: TFloatField;
    qryDADDenominacaoDescricao: TStringField;
    qryDCIIncotermValorBRL: TFloatField;
    qryDCIIncotermValorMoedaNegociada: TFloatField;
    qryDCIIncotermValorUnitario: TFloatField;
    qryDCIIncotermValorVlcBRL: TFloatField;
    qryDCIIncotermValorUnitarioVlc: TFloatField;
    qryDCIIncotermValorMoedaNegociadaVlc: TFloatField;
    qryDITId: TGuidField;
    qryDITMercadoriaValorLocalEmbarqueBRL: TFloatField;
    qryDITMercadoriaValorAduaneiroBRL: TFloatField;
    qryDITCapaItemId: TGuidField;
    qryDIA: TFDQuery;
    dsoDIA: TDataSource;
    qryDIAId: TGuidField;
    qryDIATributoCodigo: TStringField;
    qryDIARegimeCodigo: TIntegerField;
    qryDIAFundamentoCodigo: TIntegerField;
    qryDIAItemTributoId: TGuidField;
    qryDAA: TFDQuery;
    dsoDAA: TDataSource;
    qryDAAId: TGuidField;
    qryDAACodigo: TStringField;
    qryDAAValor: TStringField;
    qryDAAItemTributoAplicadoIdId: TGuidField;
    qryDIARegimeDescricao: TStringField;
    updDIA: TFDUpdateSQL;
    qryFSVMoedaNegociadaSimbolo: TStringField;
    qryFSVMoedaNegociadaValor: TFloatField;
    qryFSVMoedaNegociadaValorCotacao: TFloatField;
    qryFSVMoedaNegociadaValorBRL: TFloatField;
    qryASV: TFDQuery;
    dsoASV: TDataSource;
    qryASVMoedaNegociadaSimbolo: TStringField;
    qryASVMoedaNegociadaValor: TFloatField;
    qryASVMoedaNegociadaValorCotacao: TFloatField;
    qryASVMoedaNegociadaValorBRL: TFloatField;
    qryFCVMoedaNegociadaId: TIntegerField;
    qryFSVMoedaNegociadaId: TIntegerField;
    qryACVMoedaNegociadaId: TIntegerField;
    qryASVMoedaNegociadaId: TIntegerField;
    qryDTC: TFDQuery;
    dsoDTC: TDataSource;
    qryDTCId: TGuidField;
    qryDTCTipo: TStringField;
    qryDTCVersaoId: TGuidField;
    qryDTV: TFDQuery;
    dsoDTV: TDataSource;
    qryDTVId: TGuidField;
    qryDTVCalculado: TFloatField;
    qryDTVAReduzir: TFloatField;
    qryDTVDevido: TFloatField;
    qryDTVSuspenso: TFloatField;
    qryDTVARecolher: TFloatField;
    qryDTVRecolhido: TFloatField;
    qryDTVTributoCalculadoId: TGuidField;
    qryDTVSel: TFDQuery;
    qryDTVSelId: TGuidField;
    qryDTVSelCalculado: TFloatField;
    qryDTVSelAReduzir: TFloatField;
    qryDTVSelDevido: TFloatField;
    qryDTVSelSuspenso: TFloatField;
    qryDTVSelARecolher: TFloatField;
    qryDTVSelRecolhido: TFloatField;
    qryDTVSelTributoCalculadoId: TGuidField;
    qryDTVSelVersaoId: TGuidField;
    qryDTVMajorado: TFloatField;
    qryDTVSelMajorado: TFloatField;
    qryDIC: TFDQuery;
    dsoDIC: TDataSource;
    qryDICId: TGuidField;
    qryDICTipo: TStringField;
    qryDICItemTributoId: TGuidField;
    qryDVB: TFDQuery;
    dsoDVB: TDataSource;
    qryDVBId: TGuidField;
    qryDVBCalculado: TFloatField;
    qryDVBAReduzir: TFloatField;
    qryDVBDevido: TFloatField;
    qryDVBSuspenso: TFloatField;
    qryDVBARecolher: TFloatField;
    qryDVBOriginalDevido: TFloatField;
    qryDVBCalculadoPagProporcional: TFloatField;
    qryDVBItemTributoCalculadoId: TGuidField;
    qryDMC: TFDQuery;
    dsoDMC: TDataSource;
    qryDMCId: TGuidField;
    qryDMCCodigoFundamentoLegalNormal: TIntegerField;
    qryDMCBaseCalculoBRL: TFloatField;
    qryDMCBaseCalculoEspecificaBRL: TFloatField;
    qryDMCBaseCalculoReduzidaBRL: TFloatField;
    qryDMCPercentualReducaoBaseCalculo: TFloatField;
    qryDMCTipoAliquota: TStringField;
    qryDMCPercentualReducaoAliquotaReduzida: TFloatField;
    qryDMCValorAliquota: TFloatField;
    qryDMCValorAliquotaEspecifica: TFloatField;
    qryDMCValorAliquotaReduzida: TFloatField;
    qryDMCNormal: TFloatField;
    qryDMCTributado: TBooleanField;
    qryDMCPercentualPagamento: TFloatField;
    qryDMCItemTributoCalculadoId: TGuidField;
    qryDIAFundamentoDescricao: TStringField;
    qryDICSel: TFDQuery;
    dsoDICSel: TDataSource;
    qryDICSelId: TGuidField;
    qryDICSelCodigoFundamentoLegalNormal: TIntegerField;
    qryDICSelBaseCalculoBRL: TFloatField;
    qryDICSelBaseCalculoEspecificaBRL: TFloatField;
    qryDICSelBaseCalculoReduzidaBRL: TFloatField;
    qryDICSelPercentualReducaoBaseCalculo: TFloatField;
    qryDICSelTipoAliquota: TStringField;
    qryDICSelPercentualReducaoAliquotaReduzida: TFloatField;
    qryDICSelValorAliquota: TFloatField;
    qryDICSelValorAliquotaEspecifica: TFloatField;
    qryDICSelValorAliquotaReduzida: TFloatField;
    qryDICSelNormal: TFloatField;
    qryDICSelTributado: TBooleanField;
    qryDICSelPercentualPagamento: TFloatField;
    qryDICSelCalculado: TFloatField;
    qryDICSelAReduzir: TFloatField;
    qryDICSelDevido: TFloatField;
    qryDICSelSuspenso: TFloatField;
    qryDICSelARecolher: TFloatField;
    qryDICSelOriginalDevido: TFloatField;
    qryDICSelCalculadoPagProporcional: TFloatField;
    qryDICSelDescricaoFundamentoLegalNormal: TStringField;
    qryDICSelItemTributoId: TGuidField;
    qryDTVSelNotaFiscal: TFloatField;
    dsoDUV: TDataSource;
    qryDCIVersaoId: TGuidField;
    qryDCICaracterizacaoImportacaoIndicador: TStringField;
    qryDCICaracterizacaoImportacaoNI: TStringField;
    qryMOD: TFDQuery;
    qryMODModalidadeCodigo: TIntegerField;
    qryMODModalidadeDescricao: TStringField;
    qryMODCaracterizacaoImportacaoIndicador: TStringField;
    qryDCIModalidadeCodigo: TIntegerField;
    qryDCIModalidadeDescricao: TStringField;
    qryDCGMotivoSituacaoEspecialCodigo: TStringField;
    qryDCGPaisProcedenciaCodigo: TStringField;
    qryDRR: TFDQuery;
    dsoDRR: TDataSource;
    qryDRRId: TGuidField;
    qryDRRCanalConsolidado: TStringField;
    qryDRA: TFDQuery;
    qryRFB: TFDQuery;
    dsoDRA: TDataSource;
    dsoRFB: TDataSource;
    qryDRAId: TGuidField;
    qryDRAOrgao: TStringField;
    qryDRAResultado: TStringField;
    qryDRAResultadoAnaliseRiscoId: TGuidField;
    qryRFBId: TGuidField;
    qryRFBOrgao: TStringField;
    qryRFBResultado: TStringField;
    qryRFBResultadoAnaliseRiscoId: TGuidField;
    qryMDS: TFDQuery;
    qryMDSVersaoId: TGuidField;
    qryMDSModalidades: TMemoField;
    dsoMDS: TDataSource;
    qryADV: TFDQuery;
    dsoADV: TDataSource;
    qryADVMoedaNegociadaId: TIntegerField;
    qryADVMoedaNegociadaSimbolo: TStringField;
    qryADVMoedaNegociadaValor: TFloatField;
    qryADVMoedaNegociadaValorCotacao: TFloatField;
    qryADVMoedaNegociadaValorBRL: TFloatField;
    qryDCIProdutoCodigoInterno: TIntegerField;
    qryProd: TFDQuery;
    qryProdCodigo: TIntegerField;
    sptProd: TFDScript;
    qryDCICamex: TBooleanField;
    qryDCIDumping: TBooleanField;
    qryDCRInformacaoComplementar: TStringField;
    qryDPG: TFDQuery;
    dsoDPG: TDataSource;
    qryDPGVersaoOrigem: TIntegerField;
    qryDPGDataPagamento: TSQLTimeStampField;
    qryDPGCodigoReceita: TStringField;
    qryDPGBanco: TStringField;
    qryDPGAgencia: TStringField;
    qryDPGConta: TStringField;
    qryDPGTributo: TStringField;
    qryDPGValor: TFloatField;
    qryDPGDuimpId: TGuidField;
    qryDPJ: TFDQuery;
    qryDPJId: TGuidField;
    qryDPJCodigoReceita: TStringField;
    qryDPJValor: TFloatField;
    qryDPJDataPagamentoJuros: TSQLTimeStampField;
    qryDPJBancoJuros: TStringField;
    qryDPJAgenciaJuros: TStringField;
    qryDPJContaJuros: TStringField;
    qryDPGId: TGuidField;
    qryDPGSel: TFDQuery;
    dsoDPGSel: TDataSource;
    qryDPGSelId: TGuidField;
    qryDPGSelAgencia: TStringField;
    qryDPGSelBanco: TStringField;
    qryDPGSelCodigoReceita: TStringField;
    qryDPGSelConta: TStringField;
    qryDPGSelDataPagamento: TSQLTimeStampField;
    qryDPGSelTributo: TStringField;
    qryDPGSelValor: TFloatField;
    qryDPGSelVersaoOrigem: TIntegerField;
    qryDPGSelDuimpId: TGuidField;
    qryDPGSelModalidadeCodigo: TIntegerField;
    qryDPGSelModalidadeDescricao: TStringField;
    qryDPGSelCodigoCF: TStringField;
    qryDPGSelDescricaoCF: TStringField;
    qryDPGSelCustoCF: TBooleanField;
    qryDPGSelCusto_EntradaCF: TBooleanField;
    qryDPGSelCusto_OutrosCF: TBooleanField;
    qryDPGSelCusto_SeletivoCF: TBooleanField;
    qryDPGSelNivelCF: TSmallintField;
    qryDPGSelTipoCF: TStringField;
    qryDIE: TFDQuery;
    dsoDIE: TDataSource;
    qryDIF: TFDQuery;
    dsoDIF: TDataSource;
    qryDIEId: TGuidField;
    qryDIECEP: TStringField;
    qryDIECodigo: TStringField;
    qryDIEEmail: TStringField;
    qryDIEMunicipio: TStringField;
    qryDIENIOperador: TStringField;
    qryDIENome: TStringField;
    qryDIEPaisCodigo: TStringField;
    qryDIERua: TStringField;
    qryDIEVersao: TIntegerField;
    qryDIFId: TGuidField;
    qryDIFCEP: TStringField;
    qryDIFCodigo: TStringField;
    qryDIFEmail: TStringField;
    qryDIFMunicipio: TStringField;
    qryDIFNIOperador: TStringField;
    qryDIFNome: TStringField;
    qryDIFPaisCodigo: TStringField;
    qryDIFRua: TStringField;
    qryDIFVersao: TIntegerField;
    updDIE: TFDUpdateSQL;
    updDIF: TFDUpdateSQL;
    qryDIECodigoInterno: TIntegerField;
    qryDIFCodigoInterno: TIntegerField;
    sptFRN: TFDScript;
    qryEXP: TFDQuery;
    dsoEXP: TDataSource;
    qryFAB: TFDQuery;
    dsoFAB: TDataSource;
    qryEXPCodigo: TStringField;
    qryEXPCEP: TStringField;
    qryEXPEmail: TStringField;
    qryEXPMunicipio: TStringField;
    qryEXPNIOperador: TStringField;
    qryEXPNome: TStringField;
    qryEXPPaisCodigo: TStringField;
    qryEXPRua: TStringField;
    qryEXPVersao: TIntegerField;
    qryEXPAdicao: TIntegerField;
    qryLFR: TFDQuery;
    qryLFRCodigoInterno: TIntegerField;
    qryLFRCEP: TStringField;
    qryLFREmail: TStringField;
    qryLFRMunicipio: TStringField;
    qryLFRNome: TStringField;
    qryLFRRua: TStringField;
    qryDIFBairro: TStringField;
    qryDIFEstado: TStringField;
    qryDIFRua_Numero: TStringField;
    qryDIEBairro: TStringField;
    qryDIEEstado: TStringField;
    qryDIERua_Numero: TStringField;
    qryEXPBairro: TStringField;
    qryEXPEstado: TStringField;
    qryEXPRua_Numero: TStringField;
    qryFABAdicao: TIntegerField;
    qryFABBairro: TStringField;
    qryFABCodigo: TStringField;
    qryFABCEP: TStringField;
    qryFABEmail: TStringField;
    qryFABEstado: TStringField;
    qryFABMunicipio: TStringField;
    qryFABNIOperador: TStringField;
    qryFABNome: TStringField;
    qryFABPaisCodigo: TStringField;
    qryFABRua: TStringField;
    qryFABRua_Numero: TStringField;
    qryFABVersao: TIntegerField;
    qryPRO: TFDQuery;
    dsoPRO: TDataSource;
    updPRO: TFDUpdateSQL;
    qryDCIProdutoNomeInterno: TStringField;
    qryProdNome: TStringField;
    qryPRODescricao: TStringField;
    qryPRODescricao_Reduzida: TStringField;
    qryPROUnidade: TStringField;
    qryPRONCM: TStringField;
    qryPROModalidade: TStringField;
    qryATS: TFDQuery;
    qryATSatributo: TStringField;
    qryATSnomeApresentacao: TStringField;
    qryATSnome: TStringField;
    qryATSorientacaoPreenchimento: TStringField;
    qryATSFormaPreenchimento: TStringField;
    qryATSModalidade: TStringField;
    qryATSMultivalorado: TBooleanField;
    qryATSncm: TStringField;
    qryATSValor: TStringField;
    dsoATS: TDataSource;
    updATS: TFDUpdateSQL;
    qryDOM: TFDQuery;
    qryDOMAtributo: TStringField;
    qryDOMCodigo: TIntegerField;
    qryDOMDescricao: TStringField;
    qryPROProdutoCodigoInterno: TIntegerField;
    qryPROProdutoCodigo: TIntegerField;
    qryATSProdutoCodigoInterno: TIntegerField;
    qryDCIProdutoNCM: TStringField;
    qryPROModalidadeCodigo: TSmallintField;
    qryDPR: TFDQuery;
    dsoDPR: TDataSource;
    qryDCITipoAplicacao: TStringField;
    qryDCITipoAplicacaoDescricao: TStringField;
    qryDCRTipoAplicacao: TStringField;
    qryDCRTipoAplicacaoDescricao: TStringField;
    updDCR: TFDUpdateSQL;
    qryDCIClienteCodigo: TIntegerField;
    qryDCIClienteNome: TStringField;
    qryDCRCaracterizacaoImportacaoNI: TStringField;
    qryDCRClienteCodigo: TIntegerField;
    qryDCRClienteNome: TStringField;
    qryCAC: TFDQuery;
    qryDRRExibicao: TStringField;
    qryDRRValor: TStringField;
    updDRR: TFDUpdateSQL;
    qryCACId: TStringField;
    qryCACExibicao: TStringField;
    qryCACValor: TStringField;
    qryDCRIncentivoFiscalCodigo: TIntegerField;
    qryDCRIncentivoFiscalNome: TStringField;
    qryDCRUFDesembaraco: TStringField;
    qryDCRUFDesembaracoNome: TStringField;
    qryDCRUFImportacao: TStringField;
    qryDCRUFImportacaoNome: TStringField;
    qryProc: TFDQuery;
    qryProcProcesso: TStringField;
    qryProcNumero_Declaracao: TStringField;
    qryProcTipo: TStringField;
    qryProcData_RegistroDeclaracao: TSQLTimeStampField;
    qryProcData_DesembaracoDeclaracao: TSQLTimeStampField;
    qryProcIncentivo_Fiscal: TStringField;
    qryProcTipo_Mercadoria: TIntegerField;
    qryProcLocal_DesembaracoCodigo: TIntegerField;
    qryProcUF_Desembaraco: TStringField;
    qryProcCliente: TIntegerField;
    qryProcReducao_PIS: TFloatField;
    qryProcReducao_COFINS: TFloatField;
    qryProcRemover_Valoracao: TBooleanField;
    qryProcDA: TBooleanField;
    qryProcAdmissao_Temporaria: TBooleanField;
    qryProcSuspensao_Impostos: TBooleanField;
    qryProcEntreposto: TBooleanField;
    qryProcRemover_FreteNacBC: TBooleanField;
    qryProcFob: TCurrencyField;
    qryProcFob_Adicoes: TCurrencyField;
    qryProcFOB_ME: TCurrencyField;
    qryProcFob_MEAdicoes: TCurrencyField;
    qryProcMoeda_FOB: TSmallintField;
    qryProcTaxa_FOB: TFloatField;
    qryProcFrete: TCurrencyField;
    qryProcFrete_ME: TCurrencyField;
    qryProcMoeda_Frete: TSmallintField;
    qryProcTaxa_Frete: TFloatField;
    qryProcSeguro: TCurrencyField;
    qryProcSeguro_ME: TCurrencyField;
    qryProcMoeda_Seguro: TSmallintField;
    qryProcTaxa_Seguro: TFloatField;
    qryProcQuantidade: TFloatField;
    qryProcQuantidade_Digitada: TFloatField;
    qryProcQuantidade_Liberada: TFloatField;
    qryProcPeso_Liquido: TFloatField;
    qryProcII: TCurrencyField;
    qryProcValor_PIS: TCurrencyField;
    qryProcValor_IPI: TCurrencyField;
    qryProcValor_PIS2: TCurrencyField;
    qryProcValor_COFINS: TCurrencyField;
    qryProcValor_COFINS2: TCurrencyField;
    qryProcAd_Valorem: TCurrencyField;
    qryProcModalidade_Importacao: TSmallintField;
    qryProcCanal_SISCOMEX: TStringField;
    qryProcVia_Transporte: TSmallintField;
    qryProcProcesso_Abertura: TSQLTimeStampField;
    qryProcBloqueado: TBooleanField;
    qryProcCourrier: TBooleanField;
    qryProcDesativado: TBooleanField;
    qryProcTaxa_SISCOMEX: TCurrencyField;
    qryProcAFRMM: TCurrencyField;
    qryProcTUP: TCurrencyField;
    qryDCRClienteCNPJ: TStringField;
    qryDCGViaTransporteCodigo: TSmallintField;
    qryDCGViaTransporteDescricao: TStringField;
    qryIFI: TFDQuery;
    qryIFICodigo: TSmallintField;
    qryIFINome: TStringField;
    dsoIFI: TDataSource;
    qryDUI: TFDQuery;
    qryDUIId: TGuidField;
    qryDUIAdmissaoTemporaria: TBooleanField;
    qryDUIChaveAcesso: TStringField;
    qryDUIDesembaracoAduaneiro: TBooleanField;
    qryDUIEntrepostoAduaneiro: TBooleanField;
    qryDUINumero: TStringField;
    qryDUIProcessoNumeroVinculado: TStringField;
    qryDUIRemoverFreteTerrirtorioNacionalBCImpostos: TBooleanField;
    qryDUIRemoverValoracaoNoValorFob: TBooleanField;
    qryDUISuspensaoImpostos: TBooleanField;
    qryDUV: TFDQuery;
    qryDUVId: TGuidField;
    qryDUVProcessoNumero: TStringField;
    qryDUVVersao: TIntegerField;
    qryDUVDuimpId: TGuidField;
    qryMOE: TFDQuery;
    qryMOECodigo: TIntegerField;
    qryMOENome: TStringField;
    qryMOESimbolo: TStringField;
    qryMOEPais: TStringField;
    qryMOETipo: TStringField;
    qryUFD: TFDQuery;
    qryUFDUF: TStringField;
    qryUFDEstado: TStringField;
    dsoUFD: TDataSource;
    qryUFI: TFDQuery;
    qryUFIUF: TStringField;
    qryUFIEstado: TStringField;
    dsoUFI: TDataSource;
    qryDCRFobAdicaoMoeda: TStringField;
    qryDCRFobAdicaoTipo: TStringField;
    qryDCRFobAdicaoValorTotal: TFloatField;
    qryDCRFobMoeda: TStringField;
    qryDCRFobTipo: TStringField;
    qryDCRFobValorTotal: TFloatField;
    qryDCRFobAdicaoValorTotalBRL: TFloatField;
    qryDCRFobValorTotalBRL: TFloatField;
    qryVTA: TFDQuery;
    dsoVTA: TDataSource;
    qryVTAId: TGuidField;
    qryVTAMoeda: TStringField;
    qryVTATipo: TStringField;
    qryVTAValorTotal: TFloatField;
    qryVTACotacao: TFloatField;
    qryVTAValorTotalBRL: TFloatField;
    qryVTF: TFDQuery;
    qryVTFId: TGuidField;
    qryVTFMoeda: TStringField;
    qryVTFTipo: TStringField;
    qryVTFValorTotal: TFloatField;
    qryVTFCotacao: TFloatField;
    qryVTFValorTotalBRL: TFloatField;
    dsoVTF: TDataSource;
    dsoProc: TDataSource;
    qryITR: TFDQuery;
    qryDPRId: TGuidField;
    qryDPRAdicao: TIntegerField;
    qryDPRProdutoCodigo: TIntegerField;
    qryDPRProdutoVersao: TIntegerField;
    qryDPRProdutoCodigoInterno: TIntegerField;
    qryDPRModalidadeCodigo: TIntegerField;
    qryDPRUnidadeComercial: TStringField;
    qryDPRCamex: TBooleanField;
    qryDPRTipoAliquota: TStringField;
    qryDPRAliquotaEntradaII: TFloatField;
    qryDPRAliquotaEntradaIPI: TFloatField;
    qryDPRAliquotaEntradaPIS: TFloatField;
    qryDPRAliquotaEntradaCOFINS: TFloatField;
    qryDPRAliquotaSaidaII: TFloatField;
    qryDPRAliquotaSaidaIPI: TFloatField;
    qryDPRAliquotaSaidaPIS: TFloatField;
    qryDPRAliquotaSaidaCOFINS: TFloatField;
    qryDPRValorII: TFloatField;
    qryDPRValorIPI: TFloatField;
    qryDPRValorPIS: TFloatField;
    qryDPRValorCOFINS: TFloatField;
    qryITRId: TGuidField;
    qryITRAdicao: TIntegerField;
    qryITRProdutoCodigo: TIntegerField;
    qryITRProdutoVersao: TIntegerField;
    qryITRProdutoCodigoInterno: TIntegerField;
    qryITRModalidadeCodigo: TIntegerField;
    qryITRUnidadeComercial: TStringField;
    qryITRCamex: TBooleanField;
    qryITRTipoAliquota: TStringField;
    qryITRAliquotaEntradaII: TFloatField;
    qryITRAliquotaEntradaIPI: TFloatField;
    qryITRAliquotaEntradaPIS: TFloatField;
    qryITRAliquotaEntradaCOFINS: TFloatField;
    qryITRAliquotaSaidaII: TFloatField;
    qryITRAliquotaSaidaIPI: TFloatField;
    qryITRAliquotaSaidaPIS: TFloatField;
    qryITRAliquotaSaidaCOFINS: TFloatField;
    qryITRValorII: TFloatField;
    qryITRValorIPI: TFloatField;
    qryITRValorPIS: TFloatField;
    qryITRValorCOFINS: TFloatField;
    qryDPRAliquotaII: TFloatField;
    qryDPRAliquotaIPI: TFloatField;
    qryDPRAliquotaPIS: TFloatField;
    qryDPRAliquotaCOFINS: TFloatField;
    qryITRAliquotaII: TFloatField;
    qryITRAliquotaIPI: TFloatField;
    qryITRAliquotaPIS: TFloatField;
    qryITRAliquotaCOFINS: TFloatField;
    qryPROTipo_Item: TSmallintField;
    qryPROAliquota_II: TFloatField;
    qryPROAliquota_IPI: TFloatField;
    qryPROAliquota_PIS: TFloatField;
    qryPROAliquota_COFINS: TFloatField;
    qryPROValor_II: TCurrencyField;
    qryPROValor_IPI: TFloatField;
    qryPROValor_PIS: TCurrencyField;
    qryPROValor_COFINS: TCurrencyField;
    qryPROReducao_II: TFloatField;
    qryPROReducao_IPI: TFloatField;
    qryPROReducao_PIS: TFloatField;
    qryPROReducao_COFINS: TFloatField;
    qryPROICMS_Reducao: TFloatField;
    qryPROPIS_Nota: TFloatField;
    qryPROPIS_NotaSaida: TFloatField;
    qryPROCOFINS_Nota: TFloatField;
    qryPROCOFINS_NotaSaida: TFloatField;
    qryPROCodigo_Fabricante: TStringField;
    qryPROPeso_Liquido: TFloatField;
    qryPROTabela_CAMEX: TBooleanField;
    qryProcUF_Importacao: TStringField;
    qryDCRTipoAplicacaoCodigo: TSmallintField;
    qryDPRAliquotaReduzidaII: TFloatField;
    qryDPRAliquotaReduzidaIPI: TFloatField;
    qryDPRAliquotaReduzidaPIS: TFloatField;
    qryDPRAliquotaReduzidaCOFINS: TFloatField;
    qryITRAliquotaReduzidaII: TFloatField;
    qryITRAliquotaReduzidaIPI: TFloatField;
    qryITRAliquotaReduzidaPIS: TFloatField;
    qryITRAliquotaReduzidaCOFINS: TFloatField;
    qryICMS: TFDQuery;
    qryICMSUF: TStringField;
    qryICMSReducao_ICMS: TFloatField;
    qryCON: TFDQuery;
    qryCONLinha: TSmallintField;
    qryCONProcesso_Numero: TStringField;
    qryCONProcesso_DigitosAno: TSmallintField;
    qryCONSISCOMEX_MascaraPO: TStringField;
    qryCONSISCOMEX_MascaraItem: TStringField;
    qryCONSISCOMEX_MascaraPOFech: TStringField;
    qryCONSISCOMEX_MascaraItemFech: TStringField;
    qryCONSISCOMEX_MascaraReferencia: TStringField;
    qryCONSISCOMEX_MascaraPosicao: TSmallintField;
    qryCONRamo_Atividade: TSmallintField;
    qryDPRProdutoDescricao: TStringField;
    qryITRProdutoDescricao: TStringField;
    dsoITR: TDataSource;
    qryFRN: TFDQuery;
    qryFRNId: TGuidField;
    qryFRNBairro: TStringField;
    qryFRNCEP: TStringField;
    qryFRNEmail: TStringField;
    qryFRNEstado: TStringField;
    qryFRNMunicipio: TStringField;
    qryFRNNIOperador: TStringField;
    qryFRNNome: TStringField;
    qryFRNPaisCodigo: TStringField;
    qryFRNRua: TStringField;
    qryFRNRua_Numero: TStringField;
    qryFRNVersao: TIntegerField;
    dsoFRN: TDataSource;
    updFRN: TFDUpdateSQL;
    qryFRNPais: TStringField;
    qryFRNMunicipio_Codigo: TIntegerField;
    qryFRNNome_Fantasia: TStringField;
    qryFRNIndicador_IE: TStringField;
    qryFRNRamo_Atividade: TIntegerField;
    qryFRNIsento: TBooleanField;
    qryFRNAtivo: TBooleanField;
    qryFRNCodigo: TIntegerField;
    qryFRNCodigo_DUIMP: TStringField;
    qryProcProcesso_Mestre: TStringField;
    qryPRS: TFDQuery;
    dsoPRS: TDataSource;
    qryPRSProcessoNumero: TStringField;
    qryDCRFobAdicaoMoedaCodigo: TIntegerField;
    qryDCRFobMoedaCodigo: TIntegerField;
    qryDCRFobAdicaoValorCotacao: TFloatField;
    qryDCRFobValorCotacao: TFloatField;
    qryDCRQuantidadeTotal: TFloatField;
    qryDCRPesoLiquidoTotal: TFloatField;
    qryTCV: TFDQuery;
    qryTCVId: TGuidField;
    qryTCVTipo: TStringField;
    qryTCVCalculado: TFloatField;
    qryTCVAReduzir: TFloatField;
    qryTCVDevido: TFloatField;
    qryTCVSuspenso: TFloatField;
    qryTCVARecolher: TFloatField;
    qryTCVRecolhido: TFloatField;
    qryTCVMajorado: TFloatField;
    qryTCVNotaFiscal: TFloatField;
    qryMDSModalidadeCodigos: TMemoField;
    qryDCRValAduaneiraValorTotal: TFloatField;
    qryDCRValAduaneiraCotacao: TFloatField;
    qryDCRValAduaneiraValorTotalBRL: TFloatField;
    qryADI: TFDQuery;
    dsoADI: TDataSource;
    updADI: TFDUpdateSQL;
    qryADIRegistro: TLargeintField;
    qryADIAdicao: TSmallintField;
    qryADIQuantidade: TFloatField;
    qryADIValor_Unitario: TFloatField;
    qryADIValor_UnitarioReal: TFloatField;
    qryADINCM: TStringField;
    qryADIPeso_Liquido: TFloatField;
    qryADILancado_Entrada: TFloatField;
    qryADILancado_Saida: TFloatField;
    qryADIValor_PIS: TCurrencyField;
    qryADIValor_COFINS: TCurrencyField;
    qryADIDumping: TBooleanField;
    qryADIValor_SemAdValorem: TFloatField;
    qryADIOrdem: TIntegerField;
    qryADIPedido: TStringField;
    qryADICIDE_Aliquota: TFloatField;
    qryADICIDE_ValorDevido: TCurrencyField;
    qryADICIDE_ValorRecolher: TCurrencyField;
    qryADIIncoterm: TStringField;
    qryDPRNumero_Declaracao: TStringField;
    qryITRNumero_Declaracao: TStringField;
    qryDPRNumeroItem: TIntegerField;
    qryITRNumeroItem: TIntegerField;
    qryADINumeroItem: TSmallintField;
    qryADINumero_Declaracao: TStringField;
    qryDPRRegistro: TLargeintField;
    qryITRRegistro: TLargeintField;
    qryDPRQuantidadeComercial: TFloatField;
    qryITRQuantidadeComercial: TFloatField;
    qryDPRValorUnitario: TFloatField;
    qryITRValorUnitario: TFloatField;
    qryDPRValorUnitarioBRL: TFloatField;
    qryITRValorUnitarioBRL: TFloatField;
    qryPROFornecedorCodigo: TIntegerField;
    qryPROFornecedor: TStringField;
    qryADIExportadorCodigo: TIntegerField;
    qryADIExportador: TStringField;
    qryDPRPesoLiquidoUnitario: TFloatField;
    qryITRPesoLiquidoUnitario: TFloatField;
    qryDPRDumping: TBooleanField;
    qryITRDumping: TBooleanField;
    qryDPRAliquotaCIDE: TFloatField;
    qryDPRAliquotaEntradaCIDE: TFloatField;
    qryDPRAliquotaSaidaCIDE: TFloatField;
    qryDPRValorCIDE: TFloatField;
    qryDPRAliquotaReduzidaCIDE: TFloatField;
    qryITRAliquotaCIDE: TFloatField;
    qryITRAliquotaEntradaCIDE: TFloatField;
    qryITRAliquotaSaidaCIDE: TFloatField;
    qryITRValorCIDE: TFloatField;
    qryITRAliquotaReduzidaCIDE: TFloatField;
    qryDPRIncotermCodigo: TStringField;
    qryITRIncotermCodigo: TStringField;
    qryDPRValorDevidoII: TFloatField;
    qryDPRValorDevidoIPI: TFloatField;
    qryDPRValorDevidoPIS: TFloatField;
    qryDPRValorDevidoCOFINS: TFloatField;
    qryDPRValorDevidoCIDE: TFloatField;
    qryDPRValorARecolherII: TFloatField;
    qryDPRValorARecolherIPI: TFloatField;
    qryDPRValorARecolherPIS: TFloatField;
    qryDPRValorARecolherCOFINS: TFloatField;
    qryDPRValorARecolherCIDE: TFloatField;
    qryITRValorDevidoII: TFloatField;
    qryITRValorDevidoIPI: TFloatField;
    qryITRValorDevidoPIS: TFloatField;
    qryITRValorDevidoCOFINS: TFloatField;
    qryITRValorDevidoCIDE: TFloatField;
    qryITRValorARecolherII: TFloatField;
    qryITRValorARecolherIPI: TFloatField;
    qryITRValorARecolherPIS: TFloatField;
    qryITRValorARecolherCOFINS: TFloatField;
    qryITRValorARecolherCIDE: TFloatField;
    sptPED: TFDScript;
    sptPGR: TFDScript;
    qryBXA: TFDQuery;
    qryBXABaixados: TIntegerField;
    cmdPRIns: TFDCommand;
    cmdPRUpd: TFDCommand;
    cmdPRBIns: TFDCommand;
    qryCONSISCOMEX_Orgao: TStringField;
    qryCONSISCOMEX_Documento: TStringField;
    qryCONSISCOMEX_CentroCusto: TStringField;
    qryProcBanco: TSmallintField;
    qryDTVSelTipo: TStringField;
    qryCFPis: TFDQuery;
    qryCFPisCodigoReceita: TStringField;
    qryCFPisCodigoCF: TStringField;
    qryCFPisDescricaoCF: TStringField;
    qryCFPisTipoCF: TStringField;
    qryCFPisCustoCF: TBooleanField;
    qryCFPisCusto_SeletivoCF: TBooleanField;
    qryCFPisCusto_EntradaCF: TBooleanField;
    qryCFPisCusto_OutrosCF: TBooleanField;
    qryCFPisNivelCF: TSmallintField;
    qryMCS: TFDQuery;
    dsoMCS: TDataSource;
    qryMCSCodigo: TIntegerField;
    qryMCSDescricao: TStringField;
    qryMCSSISCOMEX_Orgao: TStringField;
    qryMCSSISCOMEX_Documento: TStringField;
    qryMCSSISCOMEX_CentroCusto: TStringField;
    qryMCSSISCOMEX_ClassificacaoDifPIS: TStringField;
    qryMCSSISCOMEX_ClassificacaoDifCOFINS: TStringField;
    qryMCSClassificacao_AFRMM: TStringField;
    qryMCSClassificacao_TUP: TStringField;
    qryCFCofins: TFDQuery;
    qryCFCofinsCodigoReceita: TStringField;
    qryCFCofinsCodigoCF: TStringField;
    qryCFCofinsDescricaoCF: TStringField;
    qryCFCofinsTipoCF: TStringField;
    qryCFCofinsCustoCF: TBooleanField;
    qryCFCofinsCusto_SeletivoCF: TBooleanField;
    qryCFCofinsCusto_EntradaCF: TBooleanField;
    qryCFCofinsCusto_OutrosCF: TBooleanField;
    qryCFCofinsNivelCF: TSmallintField;
    qryCFAfrmm: TFDQuery;
    qryCFAfrmmCodigoReceita: TStringField;
    qryCFAfrmmCodigoCF: TStringField;
    qryCFAfrmmDescricaoCF: TStringField;
    qryCFAfrmmTipoCF: TStringField;
    qryCFAfrmmCustoCF: TBooleanField;
    qryCFAfrmmCusto_SeletivoCF: TBooleanField;
    qryCFAfrmmCusto_EntradaCF: TBooleanField;
    qryCFAfrmmCusto_OutrosCF: TBooleanField;
    qryCFAfrmmNivelCF: TSmallintField;
    qryCFTup: TFDQuery;
    qryCFTupCodigoReceita: TStringField;
    qryCFTupCodigoCF: TStringField;
    qryCFTupDescricaoCF: TStringField;
    qryCFTupTipoCF: TStringField;
    qryCFTupCustoCF: TBooleanField;
    qryCFTupCusto_SeletivoCF: TBooleanField;
    qryCFTupCusto_EntradaCF: TBooleanField;
    qryCFTupCusto_OutrosCF: TBooleanField;
    qryCFTupNivelCF: TSmallintField;
    qryDCIIncotermMoedaNegociadaSimboloCVT: TStringField;
    qryDCIIncotermMoedaNegociadaCotacaoCVT: TFloatField;
    qryDCIIncotermValorMoedaNegociadaCVT: TFloatField;
    qryDCIIncotermValorMoedaNegociadaVlcCVT: TFloatField;
    qryDCIIncotermValorUnitarioCVT: TFloatField;
    qryDCIIncotermValorUnitarioVlcCVT: TFloatField;
    qryDPRFobMoedaSimbolo: TStringField;
    qryDPRFobMoedaCotacao: TFloatField;
    qryDPRFobValorUnitario: TFloatField;
    qryDPRFobValorUnitarioSemVlc: TFloatField;
    qryITRFobMoedaSimbolo: TStringField;
    qryITRFobMoedaCotacao: TFloatField;
    qryITRFobValorUnitario: TFloatField;
    qryITRFobValorUnitarioSemVlc: TFloatField;
    qryDCGFreteFobSimbolo: TStringField;
    qryDCGFreteFobValor: TFloatField;
    qryDCGFreteFobCotacao: TFloatField;
    qryDCGSeguroFobSimbolo: TStringField;
    qryDCGSeguroFobValor: TFloatField;
    qryDCGSeguroFobCotacao: TFloatField;
    qryProcIncoterms: TStringField;
    qryDCICondicaoVendaMoedaNegociadaSimboloCVT: TStringField;
    qryDCICondicaoVendaMoedaNegociadaCotacaoCVT: TFloatField;
    qryDCICondicaoVendaValorMoedaNegociadaCVT: TFloatField;
    qryDCICondicaoVendaValorMoedaNegociadaVlcCVT: TFloatField;
    qryDCICondicaoVendaValorUnitarioCVT: TFloatField;
    qryDCICondicaoVendaValorUnitarioVlcCVT: TFloatField;
    qryDCICondicaoVendaValorFreteCVT: TFloatField;
    qryDCICondicaoVendaValorSeguroCVT: TFloatField;
    qryDCIValorUnitario: TFloatField;
    qryDCIValorUnitarioVlc: TFloatField;
    qryDCIValorUnitarioBRL: TFloatField;
    qryDCIValorUnitarioVlcBRL: TFloatField;
    qryDCGFreteFobMoedaNegociadaCodigo: TIntegerField;
    qryDCGSeguroFobMoedaNegociadaCodigo: TIntegerField;
    cmdCOT: TFDCommand;
    cmdDVDel: TFDCommand;
    qryDCIUnidadeComercialCodigo: TStringField;
    qryITRUnidadeComercialCodigo: TStringField;
    qryDPRUnidadeComercialCodigo: TStringField;
    qryDUVNumero: TStringField;
    qryCONProcesso_ImportarFechado: TBooleanField;
    qryDTVDiferenca: TFloatField;
    qryDTVSelDiferenca: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure MoedaNegociadaValorGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure qryDUINewRecord(DataSet: TDataSet);
    procedure qryDCINewRecord(DataSet: TDataSet);
    procedure qryDCGSeguroMoedaNegociadaCodigoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure qryDCGFreteMoedaNegociadaCodigoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure qryDADNewRecord(DataSet: TDataSet);
    procedure qryDADTipoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure qryDCIFreteSeguroGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure qryDITNewRecord(DataSet: TDataSet);
    procedure qryDIANewRecord(DataSet: TDataSet);
    procedure qryDAANewRecord(DataSet: TDataSet);
    procedure qryDTCNewRecord(DataSet: TDataSet);
    procedure qryDTVNewRecord(DataSet: TDataSet);
    procedure qryDICNewRecord(DataSet: TDataSet);
    procedure qryDVBNewRecord(DataSet: TDataSet);
    procedure qryDMCNewRecord(DataSet: TDataSet);
    procedure qryDUVNewRecord(DataSet: TDataSet);
    procedure qryDRANewRecord(DataSet: TDataSet);
    procedure qryRFBNewRecord(DataSet: TDataSet);
    procedure qryDCIProdutoCodigoInternoChange(Sender: TField);
    procedure qryDPGNewRecord(DataSet: TDataSet);
    procedure qryDPJNewRecord(DataSet: TDataSet);
    procedure qryOpeCodigoInternoChange(Sender: TField);
    procedure qryATSValorGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure DataModuleDestroy(Sender: TObject);
    procedure qryDCRUFImportacaoChange(Sender: TField);
    procedure qryDCRUFDesembaracoChange(Sender: TField);
    procedure qryDUIRemoverValoracaoNoValorFobChange(Sender: TField);
  private
    FCanalConsolidado: TStrings;
    function GetItemCover(AItems: TArray<TItemDuimpCover>; const ANumeroItem: Integer;
      const AComparer: IComparer<TItemDuimpCover>): TItemDuimpCover;
    procedure AdditionCreate(const ARegistro, AAdicao: Integer; const ANCM, AExportador, AProdutoDescricao, AIncoterm: string;
      const AQuantidade, AValor_Unitario, AValor_UnitarioReal, APesoLiquidoUnitario, APIS, ACOFINS, ACIDE,
      AValorUnitarioSemVlc, AValorDevidoCIDE, AValorARecolherCIDE: Double; const ADumping: Boolean);
    procedure ApplyUpdates(const ADataSet: TFDDataSet); overload;
    procedure ApplyUpdates(const ADataSet: TFDDataSet; const ADoUpdateRecord: TDoUpdateRecord); overload;
    procedure CloseDataSets;
    procedure CheckMoedaGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure CreateCanalConsolidado;
    procedure DifferenceLaunch;
    procedure DoApplyUpdates(const ADataSet: TFDDataSet; const ADoUpdateRecord: TDoUpdateRecord);
    procedure GeneratePaymentAndReceipt(const ASender: TDataSet; const AValue: Double; const ATipoCF: string;
      const ABanco: Integer; const ABanco_Conta: string; const APRObservacao: string; const APRBObservacao: string);
    procedure OpenDataSets;
    procedure OPERefresh;    
    procedure PaymentsCreate(const ASender: TDataSet);
    procedure PostDataSet(const ASender: TDataSet);
    procedure AdditionsCreate(const AProcessCreateEvent: TProcessCreateEvent);
    procedure SortItemDuimpCover(var AItems: TArray<TItemDuimpCover>; var AComparer: IComparer<TItemDuimpCover>);
    procedure TryCreateDAADataSet(const AAtributos: TArray<TAtributoTributoCover>);
    procedure TryCreateDADDataSet(const AItem: TItemDuimpCover);
    procedure TryCreateDCGDataSet(const ADuimp: TDuimpConsultaCover);
    procedure TryCreateDCIDataSet(const ADuimp: TDuimpConsultaCover; const AFindDuimpEvent: TFindDuimpEvent);
    procedure TryCreateDCRDataSet(const ANumer: string; const AVersion: Integer; const AFindDuimpEvent: TFindDuimpEvent);
    procedure TryCreateDIADataSet(const AItem: TItemDuimpCover);
    procedure TryCreateDICDataSet(const AItem: TItemDuimpCover);
    procedure TryCreateDIEDataSet(const AItem: TItemDuimpCover);
    procedure TryCreateDIFDataSet(const AItem: TItemDuimpCover);
    procedure TryCreateDITDataSet(const AItem: TItemDuimpCover);
    procedure TryCreateDRRDataSet(const ADuimp: TDuimpConsultaCover);
    procedure TryCreateDUIDataSet(const ANumer: string; const AFindDuimpEvent: TFindDuimpEvent);
    procedure InsertQuote(const AMoedaCodigo: Integer; const AData: TDate; const AValor: Double);
  protected
    procedure AfterDataBaseChange; override;
    procedure BeforeDataBaseChange; override;
  public
    function FindDuimp(const ANumer: string; const ARedoDuimp: Boolean; const AFindDuimpEvent: TFindDuimpEvent = nil): Boolean;
    function GetCanalConsolidado: TStrings;
    procedure PrepareNewProcess;
    procedure ProcessCancelUpdates;
    procedure ProductApplyUpdates;
    procedure ProductCancelUpdates;
    procedure ProcessCreate(const AProcessCreateEvent: TProcessCreateEvent);
    procedure ProductGet(const AProdutoCodigo, AProdutoVersao, AProdutoCodigoInterno, AModalidadeCodigo, AAdicao,
      ATipoItem: Integer; const AUFImportacao, AUnidadeComercial, ATipoAliquota, ADescricaoMercadoria: string;
      const ACamex: Boolean; const AII, AIPI, APIS, ACOFINS, APIS_ENTRADA, APIS_SAIDA, ACOFINS_ENTRADA, ACOFINS_SAIDA,
      AValorII, AValorIPI, AValorPIS, AValorCOFINS, AReduzidaII, AReduzidaIPI, AReduzidaPIS, AReduzidaCOFINS: Double);
    procedure UpdateDCI;
    procedure UpdateCancelOpe;
    procedure UpdateProduct;
    procedure UpdateOpe;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
{IDE}
  System.DateUtils,
  System.Generics.Collections,
{PROJECT}
  cbsCore.Reflection,
  cbsCore.SysUtils,
  duimp.dom.DataModules.damAttrs,
  duimp.dom.DataModules.damConnection,
  duimp.dom.Products.Attributes.FillingForm,
  duimp.dom.System.Application,
  duimp.dom.System.ImportaUtils,
  duimp.dom.System.Utils,
  pucomex.dom.Contracts.Http.Response.OperadorEstrangeiroIntegracao,
  pucomex.dom.Duimps.Model.AcrescimoDeducaoConsultaItemCover,
  pucomex.dom.Duimps.Model.IdentificadorItemDuimpCover,
  pucomex.dom.Duimps.Model.OperadorEstrangeiroIntegracaoDTO,
  pucomex.dom.Duimps.Model.PagamentoDuimpConsultaCover,
  pucomex.dom.Duimps.Model.ProdutoCampoSimplesIntegracaoDTO,
  pucomex.dom.Duimps.Model.ProdutoIntegracaoDTO,
  pucomex.dom.Duimps.Model.ResultadoAnaliseRiscoAnuenteCover,
  pucomex.dom.Duimps.Model.ResultadoAnaliseRiscoRfbCover,
  pucomex.dom.Duimps.Model.TributoCalculadoDuimpConsultaCover,
  pucomex.dom.Duimps.Model.TributoCalculadoItemCover,
  pucomex.dom.Duimps.Model.TributoItemCover,
  pucomex.dom.Products,
  pucomex.dom.Products.ForeignOperators,
  pucomex.dom.Support.Authenticator,
  pucomex.dom.Support.PUComex;

{ TdamDuimp }

function TdamDuimp.FindDuimp(const ANumer: string; const ARedoDuimp: Boolean; const AFindDuimpEvent: TFindDuimpEvent = nil): Boolean;
begin
  if Assigned(AFindDuimpEvent) then
  begin
    AFindDuimpEvent(TStepFindDuimp.Locating, Null);
  end;
  if ARedoDuimp and not qryDUV.IsEmpty and SameText(ANumer.Trim, qryDUINumero.AsString) then
  begin
    cmdDVDel.ParamByName('VersaoId').AsGuid := qryDUVId.AsGuid;
    cmdDVDel.Prepare;
    cmdDVDel.Execute;
  end;
  BeforeDataBaseChange;
  AfterDataBaseChange;
  qryDUI.ParamByName('Numero').AsString := ANumer;
  OpenDataSets;
  TryCreateDUIDataSet(ANumer, AFindDuimpEvent);
  Result := not qryDUI.IsEmpty;
end;

function TdamDuimp.GetCanalConsolidado: TStrings;
begin
  Result := FCanalConsolidado;
end;

function TdamDuimp.GetItemCover(AItems: TArray<TItemDuimpCover>; const ANumeroItem: Integer;
  const AComparer: IComparer<TItemDuimpCover>): TItemDuimpCover;
var
  LFoundIndex: Integer;
  LItem: TItemDuimpCover;
begin
  LItem := TItemDuimpCover.Create;
  try
    LItem.Identificacao := TIdentificadorItemDuimpCover.Create;
    LItem.Identificacao.NumeroItem := ANumeroItem;
    if TArray.BinarySearch<TItemDuimpCover>(AItems, LItem, LFoundIndex, AComparer) then
    begin
      Exit(AItems[LFoundIndex]);
    end;
  finally
    FreeAndNil(LItem);
  end;
  Result := nil;
end;

procedure TdamDuimp.GeneratePaymentAndReceipt(const ASender: TDataSet; const AValue: Double; const ATipoCF: string;
  const ABanco: Integer; const ABanco_Conta, APRObservacao, APRBObservacao: string);
var 
  LNumeroParam: TFDParam;
  LRegistroParam: TFDParam;
begin 
  cmdPRIns.Unprepare;
  cmdPRIns.Params.ParamByName('CodigoCF').AsString := ASender.FieldByName('CodigoCF').AsString;
  cmdPRIns.Params.ParamByName('SISCOMEX_Orgao').AsString := qryCON.FieldByName('SISCOMEX_Orgao').AsString;
  cmdPRIns.Params.ParamByName('SISCOMEX_Documento').AsString := qryCON.FieldByName('SISCOMEX_Documento').AsString;
  cmdPRIns.Params.ParamByName('SISCOMEX_CentroCusto').AsString := qryCON.FieldByName('SISCOMEX_CentroCusto').AsString;
  cmdPRIns.Params.ParamByName('TipoCF').AsString := ASender.FieldByName('TipoCF').AsString;
  cmdPRIns.Params.ParamByName('Data_RegistroDeclaracao').AsDateTime := qryProcData_RegistroDeclaracao.AsDateTime;
  cmdPRIns.Params.ParamByName('Numero_Declaracao').AsString := qryProcNumero_Declaracao.AsString;
  cmdPRIns.Params.ParamByName('Processo').AsString := qryProcProcesso.AsString;
  cmdPRIns.Params.ParamByName('CustoCF').AsBoolean := ASender.FieldByName('CustoCF').AsBoolean;
  cmdPRIns.Params.ParamByName('Custo_SeletivoCF').AsBoolean := ASender.FieldByName('Custo_SeletivoCF').AsBoolean;
  cmdPRIns.Params.ParamByName('Custo_EntradaCF').AsBoolean := ASender.FieldByName('Custo_EntradaCF').AsBoolean;
  cmdPRIns.Params.ParamByName('Custo_OutrosCF').AsBoolean := ASender.FieldByName('Custo_OutrosCF').AsBoolean;
  cmdPRIns.Params.ParamByName('NivelCF').AsInteger := ASender.FieldByName('NivelCF').AsInteger;
  cmdPRIns.Params.ParamByName('Empresa').AsInteger := cbsApplication.CompanyId;
  cmdPRIns.Params.ParamByName('Filial').AsInteger := cbsApplication.CompanyBranch;
  cmdPRIns.Params.ParamByName('Multa').AsFloat := 0;
  cmdPRIns.Params.ParamByName('Juros').AsFloat := 0;
  cmdPRIns.Params.ParamByName('Desconto').AsFloat := 0;
  cmdPRIns.Params.ParamByName('Valor_Baixado').AsFloat := 0;
  cmdPRIns.Params.ParamByName('Valor_Documento').AsFloat := AValue;
  cmdPRIns.Params.ParamByName('Valor_Parcela').AsFloat := AValue;
  cmdPRIns.Params.ParamByName('Valor_Total').AsFloat := AValue;
  cmdPRIns.Params.ParamByName('Valor_Operacao').AsFloat := AValue;
  cmdPRIns.Params.ParamByName('Observacao').AsString := APRObservacao;
  if ABanco > 0 then
  begin
    cmdPRIns.Params.ParamByName('Valor_Baixado').AsFloat := AValue;
  end;
  LNumeroParam := cmdPRIns.ParamByName('Numero');
  LNumeroParam.ParamType := ptOutput;
  cmdPRIns.Execute;
  if qryProcBanco.AsInteger > 0 then
  begin
    cmdPRBIns.Unprepare;
    cmdPRBIns.Params.ParamByName('Numero').AsInteger             := LNumeroParam.AsInteger;
    cmdPRBIns.Params.ParamByName('Data').AsDateTime              := qryProcData_RegistroDeclaracao.AsDateTime;
    cmdPRBIns.Params.ParamByName('Tipo').AsString                := ATipoCF;
    cmdPRBIns.Params.ParamByName('Valor').AsFloat                := AValue;
    cmdPRBIns.Params.ParamByName('Banco').AsInteger              := qryProcBanco.AsInteger;
    cmdPRBIns.Params.ParamByName('Forma_Tipo').AsString          := '';
    cmdPRBIns.Params.ParamByName('Forma_TipoDocumento').AsString := '';
    cmdPRBIns.Params.ParamByName('Observacao').AsString          := APRBObservacao;
    cmdPRBIns.Params.ParamByName('Banco_Conta').AsString         := ABanco_Conta;    
    LRegistroParam := cmdPRBIns.ParamByName('Registro');
    LRegistroParam.ParamType := ptOutput;
    cmdPRBIns.Execute;
    cmdPRUpd.Unprepare;
    cmdPRUpd.Params.ParamByName('Baixa_Numero').AsInteger        := LRegistroParam.AsInteger;
    cmdPRUpd.Params.ParamByName('Valor').AsFloat                 := AValue;
    cmdPRUpd.Params.ParamByName('Banco').AsInteger               := qryProcBanco.AsInteger;
    cmdPRUpd.Params.ParamByName('Numero').AsInteger              := LNumeroParam.AsInteger;
    cmdPRUpd.Execute;
  end;
end;

procedure TdamDuimp.PaymentsCreate(const ASender: TDataSet);
var
  LValue: Double;
begin
  LValue :=
    {IF}IIF(not SameText(ASender.FieldByName('CodigoReceita').AsString, '5629'){THEN},
      ASender.FieldByName('Valor').AsFloat
    {ELSE},
      qryProcValor_COFINS2.AsFloat
    {ENDIF});
  GeneratePaymentAndReceipt(
    ASender
   ,LValue
   ,ASender.FieldByName('TipoCF').AsString
   ,ASender.FieldByName('Banco').AsInteger
   ,ASender.FieldByName('Conta').AsString
   ,''
   ,Concat('Baixa referente a lançamento importado do siscomex DI nº: ', qryProcNumero_Declaracao.AsString, 
    '; Processo nº: ', qryProcProcesso.AsString));
end;

procedure TdamDuimp.PostDataSet(const ASender: TDataSet);
begin
  if ASender.State in dsEditModes then
  begin
    ASender.Post;
  end;
end;

procedure TdamDuimp.PrepareNewProcess;
begin
  PostDataSet(qryDUI);
  PostDataSet(qryDUV);
  PostDataSet(qryDCR);
  qryProc.Close;
  qryProc.Open;
  qryProc.Edit;
  qryProcNumero_Declaracao.AsString := qryDUVNumero.AsString;
  qryProcTipo.AsString := 'IMPORTAÇÃO';
  qryProcUF_Desembaraco.AsString := qryDCRUFDesembaraco.AsString;
  qryProcUF_Importacao.AsString := qryDCRUFImportacao.AsString;
  qryProcProcesso_Mestre.AsString := qryDUIProcessoNumeroVinculado.AsString;
  qryProcFob.AsFloat := qryDCRFobValorTotalBRL.AsFloat;
  qryProcFob_ME.AsFloat := qryDCRFobValorTotal.AsFloat;
  qryProcFob_Adicoes.AsFloat := qryDCRFobAdicaoValorTotalBRL.AsFloat;
  qryProcFob_MEAdicoes.AsFloat := qryDCRFobAdicaoValorTotal.AsFloat;
  qryProcFrete.AsFloat := qryDCGFreteMoedaNegociadaValorBRL.AsFloat;
  qryProcFrete_ME.AsFloat := qryDCGFreteFobValor.AsFloat;
  qryProcMoeda_FOB.AsInteger := qryDCRFobMoedaCodigo.AsInteger;
  qryProcMoeda_Frete.AsInteger := qryDCGFreteFobMoedaNegociadaCodigo.AsInteger;
  qryProcMoeda_Seguro.AsInteger := qryDCGSeguroFobMoedaNegociadaCodigo.AsInteger;
  qryProcTaxa_FOB.AsFloat := qryDCRFobValorCotacao.AsFloat;
  qryProcSeguro.AsFloat := qryDCGSeguroMoedaNegociadaValorBRL.AsFloat;
  qryProcSeguro_ME.AsFloat := qryDCGSeguroFobValor.AsFloat;
  qryProcTaxa_Frete.AsFloat := qryDCGFreteFobCotacao.AsFloat;
  qryProcTaxa_Seguro.AsFloat := qryDCGSeguroFobCotacao.AsFloat;
  qryProcQuantidade.AsFloat := qryDCRQuantidadeTotal.AsFloat;
  qryProcQuantidade_Digitada.AsFloat := qryProcQuantidade.AsFloat;
  qryProcQuantidade_Liberada.AsFloat := 0;
  qryProcPeso_Liquido.AsFloat := qryDCRPesoLiquidoTotal.AsFloat;
  qryProcTipo_Mercadoria.AsInteger := qryDCRTipoAplicacaoCodigo.AsInteger;
  if qryIFI.LocateEx('Codigo', qryDCRIncentivoFiscalCodigo.AsInteger) then
  begin
    qryProcIncentivo_Fiscal.AsString := qryIFINome.AsString;
  end
  else
    qryProcIncentivo_Fiscal.Clear;
  qryProcII.Clear;
  qryProcValor_IPI.Clear;
  qryProcValor_PIS.Clear;
  qryProcValor_PIS2.Clear;
  qryProcValor_COFINS.Clear;
  qryProcValor_COFINS2.Clear;
  qryProcAFRMM.Clear;
  qryProcTUP.Clear;
  if not qryProcDA.AsBoolean then
  begin
    if qryTCV.LocateEx('Tipo', 'II') then
    begin
      qryProcII.AsFloat := qryTCVARecolher.AsFloat;
    end;
    if qryTCV.LocateEx('Tipo', 'IPI') then
    begin
      qryProcValor_IPI.AsFloat := qryTCVARecolher.AsFloat;
    end;
    if qryTCV.LocateEx('Tipo', 'PIS') then
    begin
      qryProcValor_PIS.AsFloat := qryTCVARecolher.AsFloat;
      qryProcValor_PIS2.AsFloat := qryTCVNotaFiscal.AsFloat;
    end;
    if qryTCV.LocateEx('Tipo', 'COFINS') then
    begin
      qryProcValor_COFINS.AsFloat := qryTCVARecolher.AsFloat;
      qryProcValor_COFINS2.AsFloat := qryTCVNotaFiscal.AsFloat;
    end;
  end;
  if qryTCV.LocateEx('Tipo', 'AFRMM') then
  begin
    qryProcAFRMM.AsFloat := qryTCVARecolher.AsFloat;
  end;
  if qryTCV.LocateEx('Tipo', 'TUP') then
  begin
    qryProcTUP.AsFloat := qryTCVARecolher.AsFloat;
  end;
  qryProcModalidade_Importacao.AsInteger := qryMDSModalidadeCodigos.AsInteger;
  qryProcLocal_DesembaracoCodigo.AsInteger := qryDCGUnidadeDespachoCodigo.AsInteger;
  qryProcData_RegistroDeclaracao.AsDateTime := DateOf(qryDCRDataRegistro.AsDateTime);
  qryProcVia_Transporte.AsInteger := qryDCGViaTransporteCodigo.AsInteger;
  qryProcAd_Valorem.AsFloat := qryDCRValAduaneiraValorTotal.AsFloat;
  qryProcTaxa_SISCOMEX.AsFloat :=
    (function: Double
     var
       LRecNo: Integer;
     begin
       LRecNo := qryDPGSel.RecNo;
       try
         if qryDPGSel.LocateEx('CodigoReceita', '7811') then
         begin
           Exit(qryDPGSel.FieldByName('Valor').AsFloat);
         end;
         Result := 0;
       finally
         qryDPGSel.RecNo := LRecNo;
       end;
     end)();
  qryProcReducao_PIS.AsFloat := 0;
  qryProcReducao_COFINS.AsFloat := 0;
  qryProcCanal_SISCOMEX.AsString := qryDRRCanalConsolidado.AsString;
  qryProcProcesso_Abertura.AsDateTime := Date;
  qryProcDesativado.AsBoolean := False;
  qryProcBloqueado.AsBoolean := False;
  qryProcCourrier.AsBoolean := False;
  qryProcCliente.AsInteger := qryDCRClienteCodigo.AsInteger;
  qryProcRemover_Valoracao.AsBoolean := qryDUIRemoverValoracaoNoValorFob.AsBoolean;
  qryProcDA.AsBoolean := qryDUIDesembaracoAduaneiro.AsBoolean;
  qryProcAdmissao_Temporaria.AsBoolean := qryDUIAdmissaoTemporaria.AsBoolean;
  qryProcSuspensao_Impostos.AsBoolean := qryDUISuspensaoImpostos.AsBoolean;
  qryProcEntreposto.AsBoolean := qryDUIEntrepostoAduaneiro.AsBoolean;
  qryProcRemover_FreteNacBC.AsBoolean := qryDUIRemoverFreteTerrirtorioNacionalBCImpostos.AsBoolean;
  qryProcIncoterms.AsString := qryDCIIncotermCodigo.AsString;
end;

procedure TdamDuimp.ProcessCancelUpdates;
begin
  qryDUI.Cancel;
  qryDCR.Cancel;
  qryProc.Cancel;
  qryDUV.Cancel;
  qryDUI.CancelUpdates;
  qryDCR.CancelUpdates;
  qryProc.CancelUpdates;
  qryDUV.CancelUpdates;
end;

procedure TdamDuimp.ProcessCreate(const AProcessCreateEvent: TProcessCreateEvent);
begin
  if Assigned(AProcessCreateEvent) then
  begin
    AProcessCreateEvent(TStepProcessCreate.IsPossibleCreateProcess, Null);
  end;
  PostDataSet(qryDUI);
  PostDataSet(qryDUV);
  PostDataSet(qryDCR);
  PostDataSet(qryProc);
  var LInTransaction := not damConnection.DBCliente.InTransaction;
  if LInTransaction then
  begin
    damConnection.DBCliente.StartTransaction;
  end;
  try
    InsertQuote(
      qryProcMoeda_FOB.AsInteger
     ,qryProcData_RegistroDeclaracao.AsDateTime
     ,qryProcTaxa_FOB.AsFloat
    );
    if Assigned(AProcessCreateEvent) then
    begin
      AProcessCreateEvent(TStepProcessCreate.CreatingProcess, qryDUVProcessoNumero.AsString);
    end;
    ApplyUpdates(qryProc);
    Sleep(1500);
    if Assigned(AProcessCreateEvent) then
    begin
      AProcessCreateEvent(TStepProcessCreate.UpdateProcessData, qryDUVProcessoNumero.AsString);
    end;
    sptPED.Params.ParamByName('Numero_Declaracao').AsString := qryProcNumero_Declaracao.AsString;
    sptPED.Params.ParamByName('Processo').AsString := qryProcProcesso.AsString;
    sptPED.ValidateAll;
    sptPED.ExecuteAll;
    Sleep(1000);
    AdditionsCreate(AProcessCreateEvent);
    qryBXA.Close;
    qryBXA.ParamByName('Numero_Declaracao').AsString := qryProcNumero_Declaracao.AsString;
    qryBXA.Open;
    if not qryProcDA.AsBoolean and
      not qryProcSuspensao_Impostos.AsBoolean and
      (qryBXABaixados.AsInteger = 0) then
    begin
      if Assigned(AProcessCreateEvent) then
      begin
        AProcessCreateEvent(TStepProcessCreate.PostingPayments, Null);
      end;
      sptPGR.Params.ParamByName('Numero_Declaracao').AsString := qryProcNumero_Declaracao.AsString;
      sptPGR.ValidateAll;
      sptPGR.ExecuteAll;
      ApplyUpdates(qryDPGSel, PaymentsCreate);
      Sleep(1000);
      if Assigned(AProcessCreateEvent) then
      begin
        AProcessCreateEvent(TStepProcessCreate.PostingImportDifference, Null);
      end;
      DifferenceLaunch;
      Sleep(1000);
    end;
    if LInTransaction then
    begin
      damConnection.DBCliente.Commit;
    end;
    if Assigned(AProcessCreateEvent) then
    begin
      AProcessCreateEvent(TStepProcessCreate.Completed, qryProcProcesso.AsString);
    end;
  except
    if LInTransaction then
    begin
      damConnection.DBCliente.Rollback;
    end;
    raise;
  end;
end;

procedure TdamDuimp.ProductApplyUpdates;
begin                  
  ApplyUpdates(qryDUI);
  ApplyUpdates(qryDUV);
  ApplyUpdates(qryDCR);
  ApplyUpdates(qryFRN);
  ApplyUpdates(qryPRO);
  ApplyUpdates(qryATS);
  ApplyUpdates(qryADI);
  qryDCI.Refresh;
end;

procedure TdamDuimp.ProductCancelUpdates;
begin
  qryADI.CancelUpdates;
  qryATS.CancelUpdates;
  qryPRO.CancelUpdates;
  qryFRN.CancelUpdates;
  qryDCR.CancelUpdates;
  qryDUV.CancelUpdates;
  qryDUI.CancelUpdates;
end;

procedure TdamDuimp.AdditionCreate(const ARegistro, AAdicao: Integer; const ANCM, AExportador, AProdutoDescricao,
  AIncoterm: string; const AQuantidade, AValor_Unitario, AValor_UnitarioReal, APesoLiquidoUnitario, APIS, ACOFINS, ACIDE,
  AValorUnitarioSemVlc, AValorDevidoCIDE, AValorARecolherCIDE: Double; const ADumping: Boolean);
begin
  qryADI.Edit;
  if ARegistro > 0 then
  begin
    qryADIRegistro.AsInteger := ARegistro;
  end;
  qryADIAdicao.AsInteger := AAdicao;
  qryADIQuantidade.AsFloat := AQuantidade;
  qryADIValor_Unitario.AsFloat := AValor_Unitario;
  qryADIValor_UnitarioReal.AsFloat := AValor_UnitarioReal;
  qryADIValor_SemAdValorem.AsFloat := AValorUnitarioSemVlc;
  qryADINCM.AsString := ANCM;
  qryADIExportador.AsString := AExportador;
  qryADIPeso_Liquido.AsFloat := APesoLiquidoUnitario;
  qryADILancado_Entrada.AsFloat := AQuantidade;
  qryADIValor_PIS.AsFloat := APIS;
  qryADIValor_COFINS.AsFloat := ACOFINS;
  qryADIDumping.AsBoolean := ADumping;
  if not qryCONSISCOMEX_MascaraItem.AsString.Trim.IsEmpty then
  begin
    qryADIOrdem.AsString := PegaParte(
     AProdutoDescricao
    ,qryCONSISCOMEX_MascaraItem.AsString
    ,qryCONSISCOMEX_MascaraItemFech.AsString);
  end;
  if not qryCONSISCOMEX_MascaraPO.AsString.Trim.IsEmpty then
  begin
    qryADIPedido.AsString := PegaParte(
     AProdutoDescricao
    ,qryCONSISCOMEX_MascaraPO.AsString
    ,qryCONSISCOMEX_MascaraPOFech.AsString);
  end; 
  qryADICIDE_Aliquota.AsFloat := ACIDE;
  qryADICIDE_ValorDevido.AsFloat := AValorDevidoCIDE;
  qryADICIDE_ValorRecolher.AsFloat := AValorARecolherCIDE;
  qryADIIncoterm.AsString := AIncoterm;
  qryADI.Post;
end;

procedure TdamDuimp.AdditionsCreate(const AProcessCreateEvent: TProcessCreateEvent);
var
  LDataSource: TDataSource;
  LInTransaction: Boolean;
begin
  if (qryDUI.ChangeCount > 0) then
  begin
    qryDUI.ApplyUpdates;
  end;
  qryDPR.Refresh;
  LDataSource := qryPRO.MasterSource;
  if Assigned(AProcessCreateEvent) then
  begin
    AProcessCreateEvent(TStepProcessCreate.UpdateGoodsData, qryDPR.RecordCount);
  end;
  try
    LInTransaction := not damConnection.DBCliente.InTransaction;
    if LInTransaction then
    begin
      damConnection.DBCliente.StartTransaction;
    end;
    try
      qryATS.Close;
      qryFRN.Close;
      qryFRN.MasterSource := dsoDPR;
      qryFRN.Open;
      qryPRO.Close;
      qryPRO.MasterSource := dsoDPR;
      qryPRO.Open;
      qryADI.Close;
      qryADI.MasterSource := dsoDPR;
      qryADI.Open;
      qryDPR.First;
      while not qryDPR.Eof do
      begin
        if Assigned(AProcessCreateEvent) then
        begin
          AProcessCreateEvent(TStepProcessCreate.UpdateMerchandiseData, Null);
        end;
        ProductGet(
          qryDPRProdutoCodigo.AsInteger
         ,qryDPRProdutoVersao.AsInteger
         ,qryDPRProdutoCodigoInterno.AsInteger
         ,qryDPRModalidadeCodigo.AsInteger
         ,qryDPRAdicao.AsInteger
         ,qryDCRTipoAplicacaoCodigo.AsInteger
         ,qryDCRUFImportacao.AsString
         ,qryDPRUnidadeComercialCodigo.AsString
         ,qryDPRTipoAliquota.AsString
         ,qryDPRProdutoDescricao.AsString
         ,qryDPRCamex.AsBoolean
         ,qryDPRAliquotaII.AsFloat
         ,qryDPRAliquotaIPI.AsFloat
         ,qryDPRAliquotaPIS.AsFloat
         ,qryDPRAliquotaCOFINS.AsFloat
         ,qryDPRAliquotaEntradaPIS.AsFloat
         ,qryDPRAliquotaSaidaPIS.AsFloat
         ,qryDPRAliquotaEntradaCOFINS.AsFloat
         ,qryDPRAliquotaSaidaCOFINS.AsFloat
         ,qryDPRValorII.AsFloat
         ,qryDPRValorIPI.AsFloat
         ,qryDPRValorPIS.AsFloat
         ,qryDPRValorCOFINS.AsFloat
         ,qryDPRAliquotaReduzidaII.AsFloat
         ,qryDPRAliquotaReduzidaIPI.AsFloat
         ,qryDPRAliquotaReduzidaPIS.AsFloat
         ,qryDPRAliquotaReduzidaCOFINS.AsFloat
        );
        AdditionCreate(
          qryDPRRegistro.AsInteger
         ,qryDPRAdicao.AsInteger
         ,qryPRONCM.AsString
         ,qryPROFornecedor.AsString
         ,qryDPRProdutoDescricao.AsString
         ,qryDPRIncotermCodigo.AsString
         ,qryDPRQuantidadeComercial.AsFloat
         ,qryDPRFobValorUnitario.AsFloat
         ,qryDPRValorUnitarioBRL.AsFloat
         ,qryDPRPesoLiquidoUnitario.AsFloat
         ,qryDPRValorPIS.AsFloat
         ,qryDPRValorCOFINS.AsFloat
         ,qryDPRValorCIDE.AsFloat
         ,qryDPRFobValorUnitarioSemVlc.AsFloat
         ,qryDPRValorDevidoCIDE.AsFloat
         ,qryDPRValorARecolherCIDE.AsFloat
         ,qryDPRDumping.AsBoolean
        );
        qryDPR.Next;
      end;
      ProductApplyUpdates;
      qryDIE.Refresh;
      qryDIF.Refresh;
      if LInTransaction then
      begin
        damConnection.DBCliente.Commit;
      end;
    except
      ProductCancelUpdates;
      if LInTransaction then
      begin
        damConnection.DBCliente.Rollback;
      end;
      raise;
    end;
  finally
    qryPRO.Close;
    qryPRO.MasterSource := LDataSource;
    qryPRO.Open;
  end;
end;

procedure TdamDuimp.ProductGet(const AProdutoCodigo, AProdutoVersao, AProdutoCodigoInterno, AModalidadeCodigo,
  AAdicao, ATipoItem: Integer; const AUFImportacao, AUnidadeComercial, ATipoAliquota, ADescricaoMercadoria: string;
  const ACamex: Boolean; const AII, AIPI, APIS, ACOFINS, APIS_ENTRADA, APIS_SAIDA, ACOFINS_ENTRADA, ACOFINS_SAIDA,
  AValorII, AValorIPI, AValorPIS, AValorCOFINS, AReduzidaII, AReduzidaIPI, AReduzidaPIS, AReduzidaCOFINS: Double);
var
  LForeignOperators: TForeignOperators;
  LProducts: TProducts;
begin
  LForeignOperators := TForeignOperators.Create(Authenticator);
  try
    LForeignOperators.GetByID(
      qryFRNCodigo_DUIMP.AsString,
      PComex.Duimp.CpfCnpjRaiz,
      qryFRNPaisCodigo.AsString,
      procedure(const AResponse: IOEIResponse)
      var
        LBairro: string;
        LNumero: string;
        LOperador: TOperadorEstrangeiroIntegracaoDTO;
        LRua: string;
      begin
        if AResponse.ResponseCode = 200 then
        begin
          LOperador := AResponse.Content.ToArray[0];
          GetAddressVariables(LOperador.Logradouro, LRua, LNumero, LBairro);
          qryFRN.Edit;
          qryFRNNome.AsString := LOperador.Nome;
          qryFRNRua.AsString := LRua;
          qryFRNRua_Numero.AsString := LNumero;
          qryFRNBairro.AsString := LBairro;
          qryFRNMunicipio.AsString := LOperador.NomeCidade;
          qryFRNCEP.AsString := LOperador.Cep;
          qryFRNEmail.AsString := LOperador.Email;
          qryFRN.Post;
        end;
      end);
  finally
    FreeAndNil(LForeignOperators);
  end;

  LProducts := TProducts.Create(Authenticator);
  try
    LProducts.GetByID(
      AProdutoCodigo,
      AProdutoVersao,
      PComex.Duimp.CpfCnpjRaiz,
      procedure(const AResponse: IProductResponse)
      var
        LProduct: TProdutoIntegracaoDTO;

        function GetCodigo_Fabricante: string;
        begin
          Result := '';
          if not qryCONSISCOMEX_MascaraReferencia.AsString.Trim.IsEmpty then
          begin
            if (qryCONSISCOMEX_MascaraReferencia.AsString.Trim = '*') or
              (qryCONSISCOMEX_MascaraPosicao.AsInteger = 1) then
            begin
              Result := PegaParte(
               LProduct.Descricao
              ,''
              ,qryCONSISCOMEX_MascaraReferencia.AsString.Trim);
            end
            else
              Result := PegaParte(
               LProduct.Descricao
              ,qryCONSISCOMEX_MascaraReferencia.AsString.Trim
              ,'');
          end;
        end;

      var
        damAttrs: TdamAttrs;
        LAttr: TProdutoCampoSimplesIntegracaoDTO;
      begin
        if AResponse.ResponseCode = 200 then
        begin
          LProduct := AResponse.Content;
          qryICMS.Close;
          qryICMS.ParamByName('UF').AsString := AUFImportacao;
          qryICMS.Open;
          qryPRO.Edit;
          if AProdutoCodigoInterno > 0 then
          begin
            qryPROProdutoCodigoInterno.AsInteger := AProdutoCodigoInterno;
          end;
          qryPRODescricao.AsString := LProduct.Descricao;
          qryPRODescricao_Reduzida.AsString := LProduct.Denominacao;
          qryPROUnidade.AsString := AUnidadeComercial;
          qryPRONCM.AsString := LProduct.Ncm;
          qryPROTipo_Item.AsInteger := ATipoItem;
          qryPROAliquota_II.AsFloat := AII;
          qryPROAliquota_IPI.AsFloat := AIPI;
          qryPROAliquota_PIS.AsFloat := APIS;
          qryPROAliquota_COFINS.AsFloat := ACOFINS;
          if SameText(ATipoAliquota, 'AD_VALOREM')
            or SameText(ATipoAliquota, '') then
          begin
            qryPROValor_II.AsFloat := 0;
            qryPROValor_IPI.AsFloat := 0;
            qryPROValor_PIS.AsFloat := 0;
            qryPROValor_COFINS.AsFloat := 0;
          end
          else
          begin
            qryPROValor_II.AsFloat := AValorII;
            qryPROValor_IPI.AsFloat := AValorIPI;
            qryPROValor_PIS.AsFloat := AValorPIS;
            qryPROValor_COFINS.AsFloat := AValorCOFINS;
          end;
          qryPROReducao_II.AsFloat := AReduzidaII;
          qryPROReducao_IPI.AsFloat := AReduzidaIPI;
          qryPROReducao_PIS.AsFloat := AReduzidaPIS;
          qryPROReducao_COFINS.AsFloat := AReduzidaCOFINS;
          qryPROICMS_Reducao.AsFloat := qryICMSReducao_ICMS.AsFloat;
          qryPROPIS_Nota.AsFloat := APIS_ENTRADA;
          qryPROPIS_NotaSaida.AsFloat := APIS_SAIDA;
          qryPROCOFINS_Nota.AsFloat := ACOFINS_ENTRADA;
          qryPROCOFINS_NotaSaida.AsFloat := ACOFINS_SAIDA;
          qryPROCodigo_Fabricante.AsString := GetCodigo_Fabricante;
          qryPROModalidade.AsString := LProduct.Modalidade;
          qryPROModalidadeCodigo.AsInteger := AModalidadeCodigo;
          qryPROProdutoCodigo.AsInteger := LProduct.Codigo;
          qryPROFornecedor.AsString := qryFRNCodigo_DUIMP.AsString;
          qryPRO.Post;
          damAttrs := TdamAttrs.Create(nil);
          try
            damAttrs.Import(LProduct.Ncm, LProduct.Denominacao, AUnidadeComercial,
              ATipoAliquota, ACamex, AAdicao, AModalidadeCodigo, AII, AIPI, APIS,
              ACOFINS, APIS_ENTRADA, APIS_SAIDA, ACOFINS_ENTRADA, ACOFINS_SAIDA,
              qryICMSReducao_ICMS.AsFloat);
            qryDOM.Close;
            qryDOM.ParamByName('NCM').AsString := LProduct.Ncm;
            qryDOM.Open;
            if not qryATS.Active then
            begin
              qryATS.Open;
            end;
            if not qryATS.IsEmpty then
            begin
              for LAttr in LProduct.Atributos do if
                qryATS.LocateEx('Atributo', LAttr.Atributo) and
                qryATSValor.AsString.Trim.IsEmpty then
              begin
                qryATS.Edit;
                qryATSValor.AsString := LAttr.Valor;
                qryATS.Post;
              end;
            end;
          finally
            FreeAndNil(damAttrs);
            qryICMS.Close;
          end;
        end;
      end);
  finally
    FreeAndNil(LProducts);
  end;
end;

procedure TdamDuimp.AfterDataBaseChange;
begin
  qryUnRFB.Open;
  qryIncoterms.Open;
  qryMod.Open;
end;

procedure TdamDuimp.ApplyUpdates(const ADataSet: TFDDataSet; const ADoUpdateRecord: TDoUpdateRecord);
begin
  DoApplyUpdates(ADataSet, ADoUpdateRecord);
end;

procedure TdamDuimp.ApplyUpdates(const ADataSet: TFDDataSet);
begin
  DoApplyUpdates(ADataSet, nil);
end;

procedure TdamDuimp.BeforeDataBaseChange;
begin
  qryMod.Close;
  qryUnRFB.Close;
  qryIncoterms.Close;
  CloseDataSets;
end;

procedure TdamDuimp.CheckMoedaGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsInteger = 0) or (Sender.AsInteger = 9999) then
  begin
    Text := '';
  end
  else
    Text := Sender.AsString;
end;

procedure TdamDuimp.CloseDataSets;
begin
  qryPRS.Close;
  qryCON.Close;
  qryIFI.Close;
  qryDICSel.Close;
  qryDTVSel.Close;
  qryDTV.Close;
  qryDTC.Close;
  qryDAA.Close;
  qryDIA.Close;
  qryDIT.Close;
  qryDIC.Close;
  qryDVB.Close;
  qryDMC.Close;
  qryDCG.Close;
  qryDAD.Close;
  qryACV.Close;
  qryFCV.Close;
  qryFSV.Close;
  qryASV.Close;
  qryADV.Close;
  qryCFTup.Close;
  qryCFAfrmm.Close;
  qryCFCofins.Close;
  qryCFPis.Close;
  qryMCS.Close;
  qryMDS.Close;
  qryDIF.Close;
  qryDIE.Close;
  qryDPGSel.Close;
  qryPRO.Close;
  qryDCI.Close;
  qryITR.Close;
  qryRFB.Close;
  qryDRA.Close;
  qryDRR.Close;
  qryDPR.Close;
  qryDUV.Close;
  qryDPJ.Close;
  qryDPG.Close;
  qryDUI.Close;
  qryProc.Close;
  qryEXP.Close;
  qryFAB.Close;
  qryUFD.Close;
  qryUFI.Close;
  qryVTA.Close;
  qryVTF.Close;
  qryTCV.Close;
end;

procedure TdamDuimp.CreateCanalConsolidado;
begin
  qryCAC.Close;
  try
    qryCAC.Open;
    FCanalConsolidado.Clear;
    while not qryCAC.Eof do
    begin
      FCanalConsolidado.AddPair(qryCACExibicao.AsString, qryCACId.AsString);
      qryCAC.Next;
    end;
  finally
    qryCAC.Close;
  end;
end;

procedure TdamDuimp.DataModuleCreate(Sender: TObject);
begin
  inherited;
  FCanalConsolidado := TStringList.Create;
  CreateCanalConsolidado;
  updPRO.ModifySQL.Assign(updPRO.InsertSQL);
  updFRN.ModifySQL.Assign(updFRN.InsertSQL);
  updADI.ModifySQL.Assign(updADI.InsertSQL);
end;

procedure TdamDuimp.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(FCanalConsolidado);
  inherited;
end;

procedure TdamDuimp.DifferenceLaunch;
var 
  LValue: Double;
begin
  // PIS...
  LValue := qryProcValor_PIS.AsFloat - qryProcValor_PIS2.AsFloat;
  if qryDTVSel.LocateEx('Tipo', 'PIS') and 
    (qryDTVSelMajorado.AsFloat > 0) and
    not qryCFPis.IsEmpty and (LValue > 0) then
  begin
    GeneratePaymentAndReceipt(
      qryCFPis
     ,LValue
     ,qryCFPisTipoCF.AsString
     ,qryProcBanco.AsInteger
     ,''
     ,'Diferença de PIS importação'
     ,Concat('Baixa referente a lançamento de Diferença de PIS importado do siscomex Duimp nº: ', qryProcNumero_Declaracao.AsString, '; Processo nº: ', qryProc.FieldByName('Processo').AsString));
  end;
  // COFINS...
  LValue := qryProcValor_COFINS.AsFloat - qryProcValor_COFINS2.AsFloat;
  if qryDTVSel.LocateEx('Tipo', 'COFINS') and
    (qryDTVSelMajorado.AsFloat > 0) and
    not qryCFCofins.IsEmpty and (LValue > 0) then
  begin
    GeneratePaymentAndReceipt(
      qryCFCofins
     ,LValue
     ,qryCFCofinsTipoCF.AsString
     ,qryProcBanco.AsInteger
     ,''
     ,'Diferença de COFINS importação'
     ,Concat('Baixa referente a lançamento de Diferença de COFINS importado do siscomex Duimp nº: ', qryProcNumero_Declaracao.AsString, '; Processo nº: ', qryProcProcesso.AsString));
  end;
  // AFRMM...
  LValue := qryProcAFRMM.AsFloat;
  if not qryCFAfrmm.IsEmpty and (LValue > 0) then
  begin
    GeneratePaymentAndReceipt(
      qryCFAfrmm
     ,LValue
     ,qryCFAfrmmTipoCF.AsString
     ,qryProcBanco.AsInteger
     ,''
     ,'Marinha Mercante (AFRMM)'
     ,Concat('Baixa referente a lançamento de Diferença de AFRMM importado do siscomex Duimp nº: ', qryProcNumero_Declaracao.AsString, '; Processo nº: ', qryProcProcesso.AsString));
  end;
  // TUP...
  LValue := qryProcTUP.AsFloat;
  if not qryCFTup.IsEmpty and (LValue > 0) then
  begin
    GeneratePaymentAndReceipt(
      qryCFTup
     ,LValue
     ,qryCFTupTipoCF.AsString
     ,qryProcBanco.AsInteger
     ,''
     ,'Tarifa utilização Portuário (TUP)'
     ,Concat('Baixa referente a lançamento de Diferença de TUP importado do siscomex Duimp nº: ', qryProcNumero_Declaracao.AsString, '; Processo nº: ', qryProcProcesso.AsString));
  end;
end;

procedure TdamDuimp.DoApplyUpdates(const ADataSet: TFDDataSet; const ADoUpdateRecord: TDoUpdateRecord);
var
  LRecNo: Integer;
begin
  if Assigned(ADoUpdateRecord) then
  begin
    LRecNo := ADataSet.RecNo;
    try
      ADataSet.First;
      while not ADataSet.Eof do
      begin
        if Assigned(ADoUpdateRecord) then
        begin
          ADoUpdateRecord(ADataSet);
        end;
        ADataSet.Next;
      end;
    finally
      ADataSet.RecNo := LRecNo;
    end;
  end;
  if ADataSet.ChangeCount > 0 then
  begin
    ADataSet.ApplyUpdates;
  end;
end;

procedure TdamDuimp.MoedaNegociadaValorGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.AsFloat > 0 then
  begin
    Text := FormatCurr(TFloatField(Sender).DisplayFormat, Sender.AsFloat);
  end
  else
    Text := '';
end;

procedure TdamDuimp.qryATSValorGetText(Sender: TField; var Text: string; DisplayText: Boolean);
var
  LValue: Boolean;
begin
  Text := Sender.AsString;
  if SameText(qryATSFormaPreenchimento.AsString, LISTA_ESTATICA.ToString) then
  begin
    if StrToIntDef(Sender.AsString, 0) = 0 then
    begin
      Text := '';
    end
    else if qryDOM.LocateEx('Atributo;Codigo',
      VarArrayOf([qryATSAtributo.AsString, StrToIntDef(Sender.AsString, -1)])) then
    begin
      Text := qryDOM.FieldByName('Descricao').AsString;
    end;
  end
  else if SameText(qryATSFormaPreenchimento.AsString, BOOLEANO.ToString) and
    not Sender.AsString.Trim.IsEmpty and TryStrToBool(Sender.AsString, LValue) then
  begin
    Text := GetYesOrNoItems[LValue.ToInteger];
  end;
end;

procedure TdamDuimp.OpenDataSets;
begin
  qryCON.Open;
  qryDUI.Open;
  qryProc.Open;
  qryDPG.Open;
  qryDPJ.Open;
  qryDUV.Open;
  qryDPR.Open;
  qryDRR.Open;
  qryDRA.Open;
  qryRFB.Open;
  qryDCR.Open;
  qryDCI.Open;
  qryITR.Open;
  qryPRO.Open;
  qryDPGSel.Open;
  qryDIE.Open;
  qryDIF.Open;
  qryMDS.Open;
  qryMCS.Open;
  qryCFPis.Open;  
  qryCFCofins.Open;
  qryCFAfrmm.Open;
  qryCFTup.Open;
  qryACV.Open;
  qryFSV.Open;
  qryFCV.Open;
  qryASV.Open;
  qryADV.Open;
  qryDAD.Open;
  qryDCG.Open;
  qryDIT.Open;
  qryDIC.Open;
  qryDVB.Open;
  qryDMC.Open;
  qryDIA.Open;
  qryDAA.Open;
  qryDTC.Open;
  qryDTV.Open;
  qryDTVSel.Open;
  qryDICSel.Open;
  qryEXP.Open;
  qryFAB.Open;
  qryIFI.Open;
  qryUFD.Open;
  qryUFI.Open;
  qryVTA.Open;
  qryVTF.Open;
  qryTCV.Open;
  qryPRS.Open;
end;

procedure TdamDuimp.TryCreateDAADataSet(const AAtributos: TArray<TAtributoTributoCover>);
var
  LAtributo: TAtributoTributoCover;
begin
  for LAtributo in AAtributos do
  begin
    qryDAA.Append;
    qryDAACodigo.AsString := LAtributo.Codigo;
    qryDAAValor.AsString := LAtributo.Valor;
    qryDAA.Post;
  end;
end;

procedure TdamDuimp.TryCreateDADDataSet(const AItem: TItemDuimpCover);
var
  LAD: TAcrescimoDeducaoConsultaItemCover;
begin
  for LAD in AItem.CondicaoVenda.AcrescimosDeducoes do
  begin
    qryDAD.Append;
    qryDADDenominacaoCodigo.AsInteger := LAD.Denominacao.Codigo;
    qryDADMoedaNegociadaSimbolo.AsString := LAD.Moeda.Codigo;
    qryDADMoedaNegociadaValor.AsFloat := LAD.Moeda.Valor;
    qryDADTipo.AsString := LAD.Tipo;
    qryDADValorBRL.AsFloat := LAD.ValorBRL;
    qryDAD.Post;
  end;
end;

procedure TdamDuimp.TryCreateDCGDataSet(const ADuimp: TDuimpConsultaCover);
begin
  qryDCG.Append;
  qryDCGIdentificacao.AsString := ADuimp.Carga.Identificacao;
  qryDCGIdentificacaoCargaTipo.AsString := ADuimp.Carga.TipoIdentificacaoCarga;
  qryDCGFreteMoedaNegociadaSimbolo.AsString := ADuimp.Carga.Frete.CodigoMoedaNegociada;
  qryDCGFreteMoedaNegociadaValor.AsFloat := ADuimp.Carga.Frete.ValorMoedaNegociada;
  if Assigned(ADuimp.Carga.MotivoSituacaoEspecial) then
  begin
    qryDCGMotivoSituacaoEspecialCodigo.AsString := ADuimp.Carga.MotivoSituacaoEspecial.Codigo;
  end;
  if Assigned(ADuimp.Carga.PaisProcedencia) then
  begin
    qryDCGPaisProcedenciaCodigo.AsString := ADuimp.Carga.PaisProcedencia.Codigo;
  end;
  qryDCGSeguroMoedaNegociadaSimbolo.AsString := ADuimp.Carga.Seguro.CodigoMoedaNegociada;
  qryDCGSeguroMoedaNegociadaValor.AsFloat := ADuimp.Carga.Seguro.ValorMoedaNegociada;
  qryDCGUnidadeDespachoCodigo.AsInteger := ADuimp.Carga.UnidadeDeclarada.Codigo;
  qryDCG.Post;
end;

procedure TdamDuimp.TryCreateDCRDataSet(const ANumer: string; const AVersion: Integer;
  const AFindDuimpEvent: TFindDuimpEvent);
var
  LDuimp: TDuimpConsultaCover;
begin
  if qryDCR.IsEmpty and (AVersion > 0) then
  begin
    try
      if Assigned(AFindDuimpEvent) then
      begin
        AFindDuimpEvent(TStepFindDuimp.LocatingDuimp, AVersion);
      end;
      PComex.Duimp.Get(ANumer, AVersion,
        procedure(const AResponse: IDuimpResponse)
        begin
          if AResponse.ResponseCode = 200 then
          begin
            LDuimp := AResponse.Content;
            if Assigned(AFindDuimpEvent) then
            begin
              AFindDuimpEvent(TStepFindDuimp.DuimpLocated, Length(LDuimp.ItensDuimpCover));
            end;
            TThread.Queue(nil,
              procedure
              begin
                if qryDUIChaveAcesso.AsString.Trim.IsEmpty then
                begin
                  qryDUI.Edit;
                  qryDUIChaveAcesso.AsString := LDuimp.Identificacao.ChaveAcesso;
                  qryDUI.Post;
                end;
                TryCreateDRRDataSet(LDuimp);
              end);
            TThread.Queue(nil,
              procedure
              var
                LPayment: TPagamentoDuimpConsultaCover;
              begin
                for LPayment in LDuimp.Pagamentos do if
                  not qryDPG.LocateEx('VersaoOrigem;Tributo', VarArrayOf([
                  LPayment.VersaoOrigem, LPayment.Principal.Tributo.Tipo])) then
                begin
                  qryDPG.Append;
                  qryDPGVersaoOrigem.AsInteger := LPayment.VersaoOrigem;
                  qryDPGDataPagamento.AsDateTime := StringTimeStampToDateTime(LPayment.Principal.DataPagamento);
                  qryDPGCodigoReceita.AsString := LPayment.Principal.CodigoReceita;
                  qryDPGBanco.AsString := LPayment.Principal.Banco;
                  qryDPGAgencia.AsString := LPayment.Principal.Agencia;
                  qryDPGConta.AsString := LPayment.Principal.Conta;
                  qryDPGTributo.AsString := LPayment.Principal.Tributo.Tipo;
                  qryDPGValor.AsFloat := LPayment.Principal.Valor;
                  qryDPG.Post;
                  qryDPJ.Append;
                  qryDPJCodigoReceita.AsString := LPayment.Principal.Juros.CodigoReceita;
                  qryDPJValor.AsFloat := LPayment.Principal.Juros.Valor;
                  qryDPJDataPagamentoJuros.AsDateTime := StringTimeStampToDateTime(LPayment.Principal.Juros.DataPagamentoJuros);
                  qryDPJBancoJuros.AsString := LPayment.Principal.Juros.BancoJuros;
                  qryDPJAgenciaJuros.AsString := LPayment.Principal.Juros.AgenciaJuros;
                  qryDPJContaJuros.AsString := LPayment.Principal.Juros.ContaJuros;
                  qryDPJ.Post;
                end;
              end);
            TThread.Queue(nil,
              procedure
              var
                LTributo: TTributoCalculadoDuimpConsultaCover;

                procedure AddTributo(const ATipo: string; const ACalculado, AAReduzir, ADevido, ASuspenso,
                  AARecolher, ARecolhido, AMajorado: Double);
                begin
                  qryDTC.Append;
                  qryDTCTipo.AsString := ATipo;
                  qryDTC.Post;
                  qryDTV.Append;
                  qryDTVCalculado.AsFloat := ACalculado;
                  qryDTVAReduzir.AsFloat := AAReduzir;
                  qryDTVDevido.AsFloat := ADevido;
                  qryDTVSuspenso.AsFloat := ASuspenso;
                  qryDTVARecolher.AsFloat := AARecolher;
                  qryDTVRecolhido.AsFloat := ARecolhido;
                  qryDTVMajorado.AsFloat := AMajorado;
                  qryDTV.Post;
                end;

              begin
                qryDCR.Append;
                qryDCRCaracterizacaoImportacaoNI.Clear;
                qryDCRDataRegistro.AsDateTime := StringTimeStampToDateTime(LDuimp.Identificacao.DataRegistro);;
                qryDCRImportadorNI.AsString := LDuimp.Identificacao.Importador.Ni;
                qryDCRImportadorTipo.AsString := LDuimp.Identificacao.Importador.TipoImportador;
                qryDCRInformacaoComplementar.AsString := LDuimp.Identificacao.InformacaoComplementar;
                qryDCRSituacaoDuimp.AsString := LDuimp.Situacao.SituacaoDuimp;
                qryDCRTipoAplicacao.Clear;
                qryDCRValorTotalLocalEmbarqueBRL.AsFloat := LDuimp.Tributos.Mercadoria.ValorTotalLocalEmbarqueBRL;
                qryDCRValorTotalLocalEmbarqueUSD.AsFloat := LDuimp.Tributos.Mercadoria.ValorTotalLocalEmbarqueUSD;
                qryDCR.Post;
                for LTributo in LDuimp.Tributos.TributosCalculados do
                begin
                  AddTributo(
                   LTributo.Tipo
                  ,LTributo.ValoresBRL.Calculado
                  ,LTributo.ValoresBRL.AReduzir
                  ,LTributo.ValoresBRL.Devido
                  ,LTributo.ValoresBRL.Suspenso
                  ,LTributo.ValoresBRL.ARecolher
                  ,LTributo.ValoresBRL.Recolhido
                  ,0);
                end;
                if LDuimp.AFRMM > 0 then
                begin
                  AddTributo('AFRMM', 0, 0, 0, 0, LDuimp.AFRMM, LDuimp.AFRMM, 0);
                end;
                if LDuimp.Tup > 0 then
                begin
                  AddTributo('TUP'  , 0, 0, 0, 0, LDuimp.Tup  , LDuimp.Tup  , 0);
                end;
              end);
            TThread.Queue(nil,
              procedure
              begin
                TryCreateDCIDataSet(LDuimp, AFindDuimpEvent);
              end);
            TThread.Queue(nil,
              procedure
              begin
                TryCreateDCGDataSet(LDuimp);
              end);
          end;
        end);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  end;
end;

procedure TdamDuimp.TryCreateDIADataSet(const AItem: TItemDuimpCover);
var
  LItem: TTributoItemCover;
begin
  for LItem in AItem.Tributos.TributosAplicados do
  begin
    qryDIA.Append;
    qryDIATributoCodigo.AsString := LItem.Tributo.Codigo;
    qryDIARegimeCodigo.AsInteger := LItem.Regime.Codigo;
    qryDIAFundamentoCodigo.AsInteger := LItem.Fundamento.Codigo;
    qryDIA.Post;
    TryCreateDAADataSet(LItem.Atributos);
  end;
end;

procedure TdamDuimp.TryCreateDICDataSet(const AItem: TItemDuimpCover);
var
  LItem: TTributoCalculadoItemCover;
begin
  for LItem in AItem.Tributos.TributosCalculados do
  begin
    qryDIC.Append;
    qryDICTipo.AsString := LItem.Tipo;
    qryDIC.Post;
    qryDMC.Append;
    qryDMCCodigoFundamentoLegalNormal.AsInteger := LItem.MemoriaCalculo.CodigoFundamentoLegalNormal;
    qryDMCBaseCalculoBRL.AsFloat := LItem.MemoriaCalculo.BaseCalculoBRL;
    qryDMCBaseCalculoEspecificaBRL.AsFloat := LItem.MemoriaCalculo.BaseCalculoEspecificaBRL;
    qryDMCBaseCalculoReduzidaBRL.AsFloat := LItem.MemoriaCalculo.BaseCalculoReduzidaBRL;
    qryDMCPercentualReducaoBaseCalculo.AsFloat := LItem.MemoriaCalculo.PercentualReducaoBaseCalculo;
    qryDMCTipoAliquota.AsString := LItem.MemoriaCalculo.TipoAliquota;
    qryDMCPercentualReducaoAliquotaReduzida.AsFloat := LItem.MemoriaCalculo.PercentualReducaoAliquotaReduzida;
    qryDMCValorAliquota.AsFloat := LItem.MemoriaCalculo.ValorAliquota;
    qryDMCValorAliquotaEspecifica.AsFloat := LItem.MemoriaCalculo.ValorAliquotaEspecifica;
    qryDMCValorAliquotaReduzida.AsFloat := LItem.MemoriaCalculo.ValorAliquotaReduzida;
    qryDMCNormal.AsFloat := LItem.MemoriaCalculo.Normal;
    qryDMCTributado.AsBoolean := LItem.MemoriaCalculo.Tributado;
    qryDMCPercentualPagamento.AsFloat := LItem.MemoriaCalculo.PercentualPagamento;
    qryDMC.Post;
    qryDVB.Append;
    qryDVBCalculado.AsFloat := LItem.ValoresBRL.Calculado;
    qryDVBAReduzir.AsFloat := LItem.ValoresBRL.AReduzir;
    qryDVBDevido.AsFloat := LItem.ValoresBRL.Devido;
    qryDVBSuspenso.AsFloat := LItem.ValoresBRL.Suspenso;
    qryDVBARecolher.AsFloat := LItem.ValoresBRL.ARecolher;
    qryDVBOriginalDevido.AsFloat := LItem.ValoresBRL.OriginalDevido;
    qryDVBCalculadoPagProporcional.AsFloat := LItem.ValoresBRL.CalculadoPagProporcional;
    qryDVB.Post;
  end;
end;

procedure TdamDuimp.TryCreateDIEDataSet(const AItem: TItemDuimpCover);
begin
  if AItem.Exportador.Codigo.Trim.IsEmpty then
  begin
    Exit;
  end;
  qryDIE.Append;
  qryDIECodigo.AsString := AItem.Exportador.Codigo;
  qryDIENIOperador.AsString := AItem.Exportador.NiOperador;
  qryDIEPaisCodigo.AsString := AItem.Exportador.Pais.Codigo;
  qryDIEVersao.AsInteger := AItem.Exportador.Versao.ToInteger;
  qryDIE.Post;
end;

procedure TdamDuimp.TryCreateDIFDataSet(const AItem: TItemDuimpCover);
begin
  if AItem.Fabricante.Codigo.Trim.IsEmpty then
  begin
    Exit;
  end;
  qryDIF.Append;
  qryDIFCodigo.AsString := AItem.Fabricante.Codigo;
  qryDIFNIOperador.AsString := AItem.Fabricante.NiOperador;
  qryDIFPaisCodigo.AsString := AItem.Fabricante.Pais.Codigo;
  qryDIFVersao.AsInteger := AItem.Fabricante.Versao.ToInteger;
  qryDIF.Post;
end;

procedure TdamDuimp.TryCreateDCIDataSet(const ADuimp: TDuimpConsultaCover; const AFindDuimpEvent: TFindDuimpEvent);
var
  LAdd: TAdicaoValoresCalculadosDuimpCover;
  LComparer: IComparer<TItemDuimpCover>;
  LItem: TItemDuimpCover;
  LItems: TArray<TItemDuimpCover>;
  LItemIndex: Integer;
begin
  LItems := ADuimp.ItensDuimpCover;
  SortItemDuimpCover(LItems, LComparer);
  for LAdd in ADuimp.Adicoes do
  begin
    for LItemIndex in LAdd.Itens do
    begin
      LItem := GetItemCover(LItems, LItemIndex, LComparer);
      qryDCI.Append;
      qryDCIAdicao.AsInteger := LAdd.Numero;
      qryDCICamex.AsBoolean := False;
      qryDCICaracterizacaoImportacaoIndicador.AsString := LItem.CaracterizacaoImportacao.Indicador;
      if not LItem.CaracterizacaoImportacao.Ni.Trim.IsEmpty then
      begin
        qryDCICaracterizacaoImportacaoNI.AsString := LItem.CaracterizacaoImportacao.Ni;
      end
      else
        qryDCICaracterizacaoImportacaoNI.Clear;
      qryDCICondicaoVendaValorBRL.AsFloat := LItem.CondicaoVenda.ValorBRL;
      qryDCICondicaoVendaValorFreteBRL.AsFloat := LItem.CondicaoVenda.Frete.ValorBRL;
      qryDCICondicaoVendaValorMoedaNegociada.AsFloat := LItem.CondicaoVenda.ValorMoedaNegociada;
      qryDCICondicaoVendaValorSeguroBRL.AsFloat := LItem.CondicaoVenda.Seguro.ValorBRL;
      qryDCIDumping.AsBoolean := False;
      if not LItem.Fabricante.Codigo.Trim.IsEmpty then
      begin
        qryDCIFabricanteCodigo.AsString := LItem.Fabricante.Codigo;
        qryDCIFabricanteCodigoPais.AsString := LItem.Fabricante.Pais.Codigo;
        qryDCIFabricanteNIOperador.AsString := LItem.Fabricante.NiOperador;
        qryDCIFabricanteVersao.AsInteger := LItem.Fabricante.Versao.ToInteger;
      end;
      qryDCIExportadorCodigo.AsString := LItem.Exportador.Codigo;
      qryDCIExportadorCodigoPais.AsString := LItem.Exportador.Pais.Codigo;
      qryDCIExportadorNIOperador.AsString := LItem.Exportador.NiOperador;
      qryDCIExportadorVersao.AsInteger := LItem.Exportador.Versao.ToInteger;
      qryDCIIncotermCodigo.AsString := LItem.CondicaoVenda.Incoterm.Codigo;
      qryDCIMoedaNegociadaSimbolo.AsString := LItem.Mercadoria.MoedaNegociada.Codigo;
      qryDCINumeroItem.AsInteger := LItem.Identificacao.NumeroItem;
      qryDCIPesoLiquido.AsFloat := LItem.Mercadoria.PesoLiquido;
      qryDCIPesoLiquidoUnitario.AsFloat := LItem.Mercadoria.PesoLiquido / LItem.Mercadoria.QuantidadeComercial;
      qryDCIProdutoCodigo.AsInteger := LItem.Produto.Codigo;
      qryDCIProdutoDescricao.AsString := LItem.Mercadoria.Descricao;
      qryDCIProdutoVersao.AsInteger := LItem.Produto.Versao;
      qryDCIProdutoNIResponsavel.AsString := LItem.Produto.NiResponsavel;
      qryDCIQuantidadeComercial.AsFloat := LItem.Mercadoria.QuantidadeComercial;
      qryDCITipoAplicacao.AsString := LItem.Mercadoria.TipoAplicacao.Codigo;
      qryDCIUnidadeComercial.AsString := LItem.Mercadoria.UnidadeComercial;
      qryDCIValorUnitario.AsFloat := LItem.Mercadoria.ValorUnitarioMoedaNegociada;
      qryDCIValorUnitarioBRL.AsFloat := LItem.CondicaoVenda.ValorBRL / LItem.Mercadoria.QuantidadeComercial;
      qryDCI.Post;
      if Assigned(AFindDuimpEvent) then
      begin
        AFindDuimpEvent(TStepFindDuimp.SavingDuimpItem, Null);
      end;
      TryCreateDADDataSet(LItem);
      TryCreateDIEDataSet(LItem);
      TryCreateDIFDataSet(LItem);
      TryCreateDITDataSet(LItem);
    end;
  end;
end;

procedure TdamDuimp.TryCreateDITDataSet(const AItem: TItemDuimpCover);
begin
  qryDIT.Append;
  qryDITMercadoriaValorLocalEmbarqueBRL.AsFloat := AItem.Tributos.Mercadoria.ValorLocalEmbarqueBRL;
  qryDITMercadoriaValorAduaneiroBRL.AsFloat := AItem.Tributos.Mercadoria.ValorAduaneiroBRL;
  qryDIT.Post;
  TryCreateDIADataSet(AItem);
  TryCreateDICDataSet(AItem);
end;

procedure TdamDuimp.TryCreateDRRDataSet(const ADuimp: TDuimpConsultaCover);
var
  LDRA: TResultadoAnaliseRiscoAnuenteCover;
  LRFB: TResultadoAnaliseRiscoRfbCover;
begin
  qryDRR.Append;
  qryDRRCanalConsolidado.AsString := ADuimp.ResultadoAnaliseRisco.CanalConsolidado;
  qryDRR.Post;
  for LDRA in ADuimp.ResultadoAnaliseRisco.ResultadoAnuente do
  begin
    qryDRA.Append;
    qryDRAOrgao.AsString := LDRA.Orgao;
    qryDRAResultado.AsString := LDRA.Resultado;
    qryDRA.Post;
  end;
  for LRFB in ADuimp.ResultadoAnaliseRisco.ResultadoRFB do
  begin
    qryRFB.Append;
    qryRFBOrgao.AsString := LRFB.Orgao;
    qryRFBResultado.AsString := LRFB.Resultado;
    qryRFB.Post;
  end;
end;

procedure TdamDuimp.TryCreateDUIDataSet(const ANumer: string; const AFindDuimpEvent: TFindDuimpEvent);
var
  LInTransaction: Boolean;
  LVersion: Integer;
begin
  LVersion := qryDUVVersao.AsInteger;
  if Assigned(AFindDuimpEvent) then
  begin
    AFindDuimpEvent(TStepFindDuimp.CheckingDuimpVersion, Null);
  end;
  PComex.Duimp.GetCurrentVersion(ANumer,
    procedure(const AResponse: IDuimpVersaoResponse)
    begin
      if AResponse.ResponseCode = 200 then
      begin
        TThread.Queue(nil,
          procedure
          begin
            LVersion := AResponse.Content.Versao.ToInteger;
          end);
      end;
    end);
  if (LVersion > qryDUVVersao.AsInteger) or
    (qryDUVVersao.AsInteger = 0) then
  begin
    if qryDUI.IsEmpty then
    begin
      qryDUI.Append;
      qryDUIAdmissaoTemporaria.AsBoolean := false;
      qryDUIDesembaracoAduaneiro.AsBoolean := false;
      qryDUIEntrepostoAduaneiro.AsBoolean := false;
      qryDUINumero.AsString := ANumer;
      qryDUIRemoverFreteTerrirtorioNacionalBCImpostos.AsBoolean := false;
      qryDUIRemoverValoracaoNoValorFob.AsBoolean := False;
      qryDUISuspensaoImpostos.AsBoolean := false;
      qryDUI.Post;
    end;
    qryDUV.Append;
    qryDUVProcessoNumero.Clear;
    qryDUVVersao.AsInteger := LVersion;
    qryDUV.Post;
    TryCreateDCRDataSet(ANumer, LVersion, AFindDuimpEvent);
    if Assigned(AFindDuimpEvent) then
    begin
      AFindDuimpEvent(TStepFindDuimp.ExecutingScripts, Null);
    end;
    LInTransaction := qryDUI.Connection.InTransaction;
    if not LInTransaction then
    begin
      qryDUI.Connection.StartTransaction;
    end;
    try
      qryDUI.ApplyUpdates;
      qryDPG.ApplyUpdates;
      qryDPJ.ApplyUpdates;
      qryDUV.ApplyUpdates;
      qryDRR.ApplyUpdates;
      qryDRA.ApplyUpdates;
      qryRFB.ApplyUpdates;
      qryDCR.ApplyUpdates;
      qryDCI.ApplyUpdates;
      qryDIE.ApplyUpdates;
      qryDIF.ApplyUpdates;
      qryDAD.ApplyUpdates;
      qryDCG.ApplyUpdates;
      qryDIT.ApplyUpdates;
      qryDIC.ApplyUpdates;
      qryDVB.ApplyUpdates;
      qryDMC.ApplyUpdates;
      qryDIA.ApplyUpdates;
      qryDAA.ApplyUpdates;
      qryDTC.ApplyUpdates;
      qryDTV.ApplyUpdates;

      sptDCI.Params.ParamByName('VersaoId').AsGuid := qryDUVId.AsGuid;
      sptDCI.ValidateAll;

      if sptDCI.Status = ssFinishWithErrors then
      begin
        if not LInTransaction then
        begin
          sptDCI.Connection.Rollback;
        end;
      end
      else if sptDCI.Status = ssFinishSuccess then
      begin
        sptDCI.ExecuteAll;
        if sptDCI.TotalErrors = 0 then
        begin
          if not LInTransaction then
          begin
            sptDCI.Connection.Commit;
            qryDCR.Refresh;
          end;
        end
        else if not LInTransaction then
        begin
          sptDCI.Connection.Rollback;
        end;
      end;
      CloseDataSets;
      OpenDataSets;
    except
      on E: Exception do
      begin
        qryDTV.CancelUpdates;
        qryDTC.CancelUpdates;
        qryDAA.CancelUpdates;
        qryDIA.CancelUpdates;
        qryDMC.CancelUpdates;
        qryDVB.CancelUpdates;
        qryDIC.CancelUpdates;
        qryDIT.CancelUpdates;
        qryDCG.CancelUpdates;
        qryDAD.CancelUpdates;
        qryDIF.CancelUpdates;
        qryDIE.CancelUpdates;
        qryDCI.CancelUpdates;
        qryDCR.CancelUpdates;
        qryRFB.CancelUpdates;
        qryDRA.CancelUpdates;
        qryDRR.CancelUpdates;
        qryDUV.CancelUpdates;
        qryDPJ.CancelUpdates;
        qryDPG.CancelUpdates;
        qryDUI.CancelUpdates;
        if not LInTransaction then
        begin
          qryDUI.Connection.Rollback;
        end;
        raise Exception.Create(E.Message);
      end;
    end;
  end;
end;


procedure TdamDuimp.UpdateDCI;
begin
  qryDCI.Post;
  qryDCI.ApplyUpdates;
end;

procedure TdamDuimp.UpdateCancelOpe;
begin
  if qryDIE.State in dsEditModes then
  begin
    qryDIE.CancelUpdates;
  end;
  if qryDIF.State in dsEditModes then
  begin
    qryDIF.CancelUpdates;
  end;
end;

procedure TdamDuimp.UpdateProduct;
begin
  if qryDCI.State in dsEditModes then
  begin
    qryDCI.Post;
    qryDCI.ApplyUpdates;
    sptProd.Params.ParamByName('ProdutoCodigo').AsInteger := qryDCIProdutoCodigo.AsInteger;
    sptProd.Params.ParamByName('ProdutoCodigoInterno').AsInteger := qryDCIProdutoCodigoInterno.AsInteger;
    sptProd.ValidateAll;
    sptProd.ExecuteAll;
    qryDCI.Refresh;
  end;
end;

procedure TdamDuimp.UpdateOpe;
begin
  if qryDIE.State in dsEditModes then
  begin
    qryDIE.Post;
    qryDIE.ApplyUpdates;
    sptFRN.Params.ParamByName('Codigo').AsString := qryDIECodigo.AsString;
    sptFRN.Params.ParamByName('CodigoInterno').AsInteger := qryDIECodigoInterno.AsInteger;
    sptFRN.ValidateAll;
    sptFRN.ExecuteAll;
    OPERefresh;
  end;
  if qryDIF.State in dsEditModes then
  begin
    qryDIF.Post;
    qryDIF.ApplyUpdates;
    sptFRN.Params.ParamByName('Codigo').AsString := qryDIFCodigo.AsString;
    sptFRN.Params.ParamByName('CodigoInterno').AsInteger := qryDIFCodigoInterno.AsInteger;
    sptFRN.ValidateAll;
    sptFRN.ExecuteAll;
    OPERefresh;
  end;
end;

procedure TdamDuimp.InsertQuote(const AMoedaCodigo: Integer; const AData: TDate; const AValor: Double);
begin
  cmdCOT.ParamByName('Moeda').AsInteger := AMoedaCodigo;
  cmdCOT.ParamByName('Data').AsDate := AData;
  cmdCOT.ParamByName('Valor').AsFloat := AValor;
  cmdCOT.Execute;
end;

procedure TdamDuimp.OPERefresh;
begin
  qryDIE.Refresh;
  qryDIF.Refresh;
  qryEXP.Refresh;
  qryFAB.Refresh;
end;

procedure TdamDuimp.qryDAANewRecord(DataSet: TDataSet);
begin
  qryDAAId.AsGuid := TGUID.NewGuid;
end;

procedure TdamDuimp.qryDADNewRecord(DataSet: TDataSet);
begin
  qryDADId.AsGuid := TGUID.NewGuid;
end;

procedure TdamDuimp.qryDADTipoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.AsString = 'ACRESCIMO' then
  begin
    Text := 'ACRÉSCIMO';
  end
  else if Sender.AsString = 'DEDUCAO' then
  begin
    Text := 'DEDUÇÃO';
  end;
end;

procedure TdamDuimp.qryDCGFreteMoedaNegociadaCodigoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  CheckMoedaGetText(Sender, Text, DisplayText);
end;

procedure TdamDuimp.qryDCGSeguroMoedaNegociadaCodigoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  CheckMoedaGetText(Sender, Text, DisplayText);
end;

procedure TdamDuimp.qryDIANewRecord(DataSet: TDataSet);
begin
  qryDIAId.AsGuid := TGUID.NewGuid;
end;

procedure TdamDuimp.qryDICNewRecord(DataSet: TDataSet);
begin
  qryDICId.AsGuid := TGUID.NewGuid;
end;

procedure TdamDuimp.qryDITNewRecord(DataSet: TDataSet);
begin
  qryDITId.AsGuid := TGUID.NewGuid;
end;

procedure TdamDuimp.qryDMCNewRecord(DataSet: TDataSet);
begin
  qryDMCId.AsGuid := TGUID.NewGuid;
end;

procedure TdamDuimp.qryDRANewRecord(DataSet: TDataSet);
begin
  qryDRAId.AsGuid := TGUID.NewGuid;
  qryDRAResultadoAnaliseRiscoId.AsGuid := qryDRRId.AsGuid;
end;

procedure TdamDuimp.qryDTCNewRecord(DataSet: TDataSet);
begin
  qryDTCId.AsGuid := TGUID.NewGuid;
end;

procedure TdamDuimp.qryDTVNewRecord(DataSet: TDataSet);
begin
  qryDTVId.AsGuid := TGUID.NewGuid;
end;

procedure TdamDuimp.qryDCIFreteSeguroGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.AsBoolean then
  begin
    Text := 'SIM';
  end
  else
    Text := 'NÃO';
end;

procedure TdamDuimp.qryDCINewRecord(DataSet: TDataSet);
begin
  qryDCIId.AsGuid := TGUID.NewGuid;
  qryDCICondicaoVendaValorVlcBRL.AsFloat := 0;
  qryDCICondicaoVendaValorMoedaNegociadaVlc.AsFloat := 0;
  qryDCIIncotermValorBRL.AsFloat := 0;
  qryDCIIncotermValorVlcBRL.AsFloat := 0;
  qryDCIIncotermValorMoedaNegociada.AsFloat := 0;
  qryDCIIncotermValorMoedaNegociadaVlc.AsFloat := 0;
  qryDCIIncotermValorUnitario.AsFloat := 0;
  qryDCIIncotermValorUnitarioVlc.AsFloat := 0;
  qryDCIValorUnitarioBRL.AsFloat := 0;
  qryDCIValorUnitarioVlc.AsFloat := 0;
  qryDCIValorUnitarioVlcBRL.AsFloat := 0;
end;

procedure TdamDuimp.qryDCIProdutoCodigoInternoChange(Sender: TField);
begin
  qryDCIProdutoNomeInterno.Clear;
  if not Sender.IsNull then
  begin
    qryProd.Close;
    try
      qryProd.ParamByName('ProdutoCodigoInterno').AsInteger := Sender.AsInteger;
      qryProd.Open;
      if not qryProd.IsEmpty then
      begin
        qryDCIProdutoNomeInterno.AsString := qryProdNome.AsString;
      end
      else
      begin
        Sender.Clear;
      end;
    finally
      qryProd.Close;
    end;
  end;
end;

procedure TdamDuimp.qryDCRUFDesembaracoChange(Sender: TField);
begin
  qryDCRUFDesembaracoNome.AsString := qryUFDEstado.AsString;
end;

procedure TdamDuimp.qryDCRUFImportacaoChange(Sender: TField);
begin
  qryDCRUFImportacaoNome.AsString := qryUFIEstado.AsString;
end;

procedure TdamDuimp.qryDUINewRecord(DataSet: TDataSet);
begin
  qryDUIId.AsGuid := TGUID.NewGuid;
end;

procedure TdamDuimp.qryDUIRemoverValoracaoNoValorFobChange(Sender: TField);

  procedure SetDCREditMode;
  begin
    if not(qryDCR.State in dsEditModes) then
    begin
      qryDCR.Edit;
    end;
  end;

begin
  if qryDUIRemoverValoracaoNoValorFob.AsBoolean and
    qryVTA.LocateEx('Moeda;Tipo', VarArrayOf([qryDCRFobAdicaoMoeda.AsString, 'SEM_VALORACAO'])) then
  begin
    SetDCREditMode;
    qryDCRFobAdicaoValorTotal.AsFloat := qryVTAValorTotal.AsFloat;
    qryDCRFobAdicaoValorTotalBRL.AsFloat := qryVTAValorTotalBRL.AsFloat;
  end
  else if not qryDUIRemoverValoracaoNoValorFob.AsBoolean and
    qryVTA.LocateEx('Moeda;Tipo', VarArrayOf([qryDCRFobAdicaoMoeda.AsString, 'COM_VALORACAO'])) then
  begin
    SetDCREditMode;
    qryDCRFobAdicaoValorTotal.AsFloat := qryVTAValorTotal.AsFloat;
    qryDCRFobAdicaoValorTotalBRL.AsFloat := qryVTAValorTotalBRL.AsFloat;
  end;
  if qryDUIRemoverValoracaoNoValorFob.AsBoolean and
    qryVTF.LocateEx('Moeda;Tipo', VarArrayOf([qryDCRFobAdicaoMoeda.AsString, 'SEM_VALORACAO'])) then
  begin
    SetDCREditMode;
    qryDCRFobValorTotal.AsFloat := qryVTFValorTotal.AsFloat;
    qryDCRFobValorTotalBRL.AsFloat := qryVTFValorTotalBRL.AsFloat;
  end
  else if not qryDUIRemoverValoracaoNoValorFob.AsBoolean and
    qryVTF.LocateEx('Moeda;Tipo', VarArrayOf([qryDCRFobAdicaoMoeda.AsString, 'COM_VALORACAO'])) then
  begin
    SetDCREditMode;
    qryDCRFobValorTotal.AsFloat := qryVTFValorTotal.AsFloat;
    qryDCRFobValorTotalBRL.AsFloat := qryVTFValorTotalBRL.AsFloat;
  end;
end;

procedure TdamDuimp.qryDUVNewRecord(DataSet: TDataSet);
begin
  qryDUVId.AsGuid := TGUID.NewGuid;
end;

procedure TdamDuimp.qryDVBNewRecord(DataSet: TDataSet);
begin
  qryDVBId.AsGuid := TGUID.NewGuid;
end;

procedure TdamDuimp.qryOpeCodigoInternoChange(Sender: TField);
var
  LField: TField;
  LOnChangeEvent: TFieldNotifyEvent;
begin
  if Sender.IsNull then
  begin
    for LField in Sender.DataSet.Fields do if
      LField.Tag = 1 then
    begin
      LField.Clear;
    end;
  end
  else
  begin
    qryLFR.Close;
    try
      qryLFR.ParamByName('Codigo').AsInteger := Sender.AsInteger;
      qryLFR.Open;
      LOnChangeEvent := Sender.OnChange;
      try
        Sender.OnChange := nil;
        TFDQuery(Sender.DataSet).CopyRecord(qryLFR);
      finally
        Sender.OnChange := LOnChangeEvent;
      end;
    finally
      qryLFR.Close;
    end;
  end;
end;

procedure TdamDuimp.qryDPGNewRecord(DataSet: TDataSet);
begin
  qryDPGId.AsGuid := TGUID.NewGuid;
end;

procedure TdamDuimp.qryDPJNewRecord(DataSet: TDataSet);
begin
  qryDPJId.AsGuid := qryDPGId.AsGuid;
end;

procedure TdamDuimp.qryRFBNewRecord(DataSet: TDataSet);
begin
  qryRFBId.AsGuid := TGUID.NewGuid;
  qryRFBResultadoAnaliseRiscoId.AsGuid := qryDRRId.AsGuid;
end;

procedure TdamDuimp.SortItemDuimpCover(var AItems: TArray<TItemDuimpCover>; var AComparer: IComparer<TItemDuimpCover>);
begin
  AComparer := TComparer<TItemDuimpCover>.Construct(
    function(const ALeft, ARight: TItemDuimpCover): Integer
    begin
      Result := ALeft.Identificacao.NumeroItem - ARight.Identificacao.NumeroItem;
    end);
  TArray.Sort<TItemDuimpCover>(AItems, AComparer);
end;

end.

