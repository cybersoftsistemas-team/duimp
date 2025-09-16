inherited damDuimp: TdamDuimp
  OnDestroy = DataModuleDestroy
  Height = 654
  Width = 1011
  object dsoDUI: TDataSource
    DataSet = qryDUI
    OnStateChange = dsoStateChange
    OnDataChange = dsoDataChange
    Left = 86
    Top = 16
  end
  object qryUnRFB: TFDQuery
    IndexFieldNames = 'Codigo'
    Connection = damConnection.DBCadastro
    SQL.Strings = (
      'SELECT Codigo = CAST(URFB.Codigo AS Int)'
      ',URFB.Descricao'
      'FROM UnidadesRFB AS URFB')
    Left = 746
    Top = 143
    object qryUnRFBCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ReadOnly = True
    end
    object qryUnRFBDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Size = 80
    end
  end
  object qryDCR: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'Id'
    MasterSource = dsoDUV
    MasterFields = 'Id'
    DetailFields = 'Id'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.capas'
    UpdateOptions.KeyFields = 'Id'
    UpdateObject = updDCR
    SQL.Strings = (
      'DECLARE @VersaoId uniqueidentifier;'
      ''
      'SET @VersaoId = :Id;'
      ''
      'WITH Itens AS ('
      #9'SELECT CapaId = VersaoId'
      #9',CaracterizacaoImportacaoIndicador'
      #9',QuantidadeTotal = SUM(QuantidadeComercial)'
      #9',PesoLiquidoTotal = SUM(PesoLiquido)'
      #9'FROM duimp.capas_itens'
      #9'WHERE VersaoId = @VersaoId'
      #9'GROUP BY VersaoId, CaracterizacaoImportacaoIndicador'
      ')'
      'SELECT DUC.Id'
      ',DUC.CaracterizacaoImportacaoNI'
      ',ClienteCNPJ = CLI.CNPJ'
      ',ClienteCodigo = CLI.Codigo'
      ',ClienteNome = CLI.Nome'
      ',FobAdicaoMoedaCodigo = MFA.Codigo'
      ',FobAdicaoMoeda = DUC.FobAdicaoMoeda'
      ',FobAdicaoTipo = DUC.FobAdicaoTipo'
      ',FobAdicaoValorTotal = VTF1.ValorTotal'
      ',FobAdicaoValorCotacao = VTF1.Cotacao'
      ',FobAdicaoValorTotalBRL = VTF1.ValorTotalBRL'
      ',FobMoedaCodigo = MFO.Codigo'
      ',FobMoeda = DUC.FobMoeda'
      ',FobTipo = DUC.FobTipo'
      ',FobValorTotal = VTF2.ValorTotal'
      ',FobValorCotacao = VTF2.Cotacao'
      ',FobValorTotalBRL = VTF2.ValorTotalBRL'
      ',ValAduaneiraValorTotal = ISNULL(VAD.ValorTotal, 0)'
      ',ValAduaneiraCotacao = ISNULL(VAD.Cotacao, 0)'
      ',ValAduaneiraValorTotalBRL = ISNULL(VAD.ValorTotalBRL, 0)'
      ',DUC.DataRegistro'
      ',DUC.ImportadorNI'
      ',DUC.ImportadorTipo'
      ',DUC.IncentivoFiscalCodigo'
      ',IncentivoFiscalNome = IFI.Nome'
      ',DUC.InformacaoComplementar'
      ',DUC.SituacaoDuimp'
      ',DUC.TipoAplicacao'
      ',TipoAplicacaoCodigo = TIP.Codigo'
      ',TipoAplicacaoDescricao = TIP.Descricao'
      ',DUC.UFDesembaraco'
      ',UFDesembaracoNome = ESI.Nome'
      ',DUC.UFImportacao'
      ',UFImportacaoNome = ESD.Nome'
      ',DUC.ValorTotalLocalEmbarqueBRL'
      ',DUC.ValorTotalLocalEmbarqueUSD'
      ',ITN.QuantidadeTotal'
      ',ITN.PesoLiquidoTotal'
      'FROM duimp.capas DUC'
      'JOIN duimp.tipos_aplicacoes AS DTA'
      #9' ON DTA.Id = DUC.TipoAplicacao'
      'JOIN Cybersoft_Cadastros.dbo.TipoItem AS TIP'
      #9' ON DTA.TipoItemCodigo = TIP.Codigo'
      'JOIN Itens AS ITN'
      #9' ON ITN.CapaId = DUC.Id'
      'LEFT JOIN Cybersoft_Cadastros.dbo.Moedas AS MFA'
      #9' ON DUC.FobAdicaoMoeda = MFA.Simbolo'
      'LEFT JOIN Cybersoft_Cadastros.dbo.Moedas AS MFO'
      #9' ON DUC.FobAdicaoMoeda = MFO.Simbolo'
      'LEFT JOIN duimp.valores_totais_fob_adicoes AS VTF1'
      #9' ON VTF1.Id = DUC.Id'
      #9'AND VTF1.Moeda = DUC.FobAdicaoMoeda'
      #9'AND VTF1.Tipo = DUC.FobAdicaoTipo'
      'LEFT JOIN duimp.valores_totais_fob AS VTF2'
      #9' ON VTF2.Id = DUC.Id'
      #9'AND VTF2.Moeda = DUC.FobMoeda'
      #9'AND VTF2.Tipo = DUC.FobTipo'
      'LEFT JOIN duimp.valores_totais_val_aduaneiras AS VAD'
      #9' ON VAD.Id = DUC.Id'
      #9'AND VAD.Moeda = DUC.ValAduaneiraMoeda'
      'LEFT JOIN Cybersoft_Cadastros.dbo.IncentivosFiscais AS IFI'
      #9' ON IFI.Codigo = DUC.IncentivoFiscalCodigo'
      'LEFT JOIN Cybersoft_Cadastros.dbo.Estados AS ESD'
      #9' ON ESD.Codigo = DUC.UFDesembaraco'
      'LEFT JOIN Cybersoft_Cadastros.dbo.Estados AS ESI'
      #9' ON ESI.Codigo = DUC.UFImportacao'
      'LEFT JOIN Clientes AS CLI'
      #9' ON CLI.CNPJ = DUC.CaracterizacaoImportacaoNI'
      
        #9'AND ITN.CaracterizacaoImportacaoIndicador IN ('#39'IMPORTACAO_POR_C' +
        'ONTA_E_ORDEM'#39', '#39'IMPORTACAO_POR_ENCOMENDA'#39')'
      'WHERE DUC.Id = @VersaoId;')
    Left = 24
    Top = 143
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDCRId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object qryDCRCaracterizacaoImportacaoNI: TStringField
      FieldName = 'CaracterizacaoImportacaoNI'
      Origin = 'CaracterizacaoImportacaoNI'
      Size = 14
    end
    object qryDCRClienteCNPJ: TStringField
      Alignment = taCenter
      FieldName = 'ClienteCNPJ'
      Origin = 'ClienteCNPJ'
      OnGetText = CpfOrCnpfGetText
      OnSetText = CpfOrCnpfSetText
      Size = 14
    end
    object qryDCRClienteCodigo: TIntegerField
      FieldName = 'ClienteCodigo'
      Origin = 'ClienteCodigo'
    end
    object qryDCRClienteNome: TStringField
      FieldName = 'ClienteNome'
      Origin = 'ClienteNome'
      Size = 50
    end
    object qryDCRDataRegistro: TSQLTimeStampField
      FieldName = 'DataRegistro'
      Origin = 'DataRegistro'
      Required = True
    end
    object qryDCRFobAdicaoMoedaCodigo: TIntegerField
      FieldName = 'FobAdicaoMoedaCodigo'
      Origin = 'FobAdicaoMoedaCodigo'
    end
    object qryDCRFobAdicaoMoeda: TStringField
      FieldName = 'FobAdicaoMoeda'
      Origin = 'FobAdicaoMoeda'
      Size = 3
    end
    object qryDCRFobAdicaoTipo: TStringField
      FieldName = 'FobAdicaoTipo'
      Origin = 'FobAdicaoTipo'
      Size = 13
    end
    object qryDCRFobAdicaoValorTotal: TFloatField
      FieldName = 'FobAdicaoValorTotal'
      Origin = 'FobAdicaoValorTotal'
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDCRFobAdicaoValorCotacao: TFloatField
      FieldName = 'FobAdicaoValorCotacao'
      Origin = 'FobAdicaoValorCotacao'
      DisplayFormat = ',0.0000;-,0.0000'
    end
    object qryDCRFobAdicaoValorTotalBRL: TFloatField
      FieldName = 'FobAdicaoValorTotalBRL'
      Origin = 'FobAdicaoValorTotalBRL'
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDCRFobMoedaCodigo: TIntegerField
      FieldName = 'FobMoedaCodigo'
      Origin = 'FobMoedaCodigo'
    end
    object qryDCRFobMoeda: TStringField
      FieldName = 'FobMoeda'
      Origin = 'FobMoeda'
      Size = 3
    end
    object qryDCRFobTipo: TStringField
      FieldName = 'FobTipo'
      Origin = 'FobTipo'
      Size = 13
    end
    object qryDCRFobValorTotal: TFloatField
      FieldName = 'FobValorTotal'
      Origin = 'FobValorTotal'
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDCRFobValorCotacao: TFloatField
      FieldName = 'FobValorCotacao'
      Origin = 'FobValorCotacao'
      DisplayFormat = ',0.0000;-,0.0000'
    end
    object qryDCRFobValorTotalBRL: TFloatField
      FieldName = 'FobValorTotalBRL'
      Origin = 'FobValorTotalBRL'
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDCRValAduaneiraValorTotal: TFloatField
      FieldName = 'ValAduaneiraValorTotal'
      Origin = 'ValAduaneiraValorTotal'
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDCRValAduaneiraCotacao: TFloatField
      FieldName = 'ValAduaneiraCotacao'
      Origin = 'ValAduaneiraCotacao'
      DisplayFormat = ',0.0000;-,0.0000'
    end
    object qryDCRValAduaneiraValorTotalBRL: TFloatField
      FieldName = 'ValAduaneiraValorTotalBRL'
      Origin = 'ValAduaneiraValorTotalBRL'
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDCRImportadorNI: TStringField
      FieldName = 'ImportadorNI'
      Origin = 'ImportadorNI'
      Required = True
      OnGetText = CpfOrCnpfGetText
      OnSetText = CpfOrCnpfSetText
      Size = 14
    end
    object qryDCRImportadorTipo: TStringField
      FieldName = 'ImportadorTipo'
      Origin = 'ImportadorTipo'
      Required = True
      Size = 4
    end
    object qryDCRIncentivoFiscalCodigo: TIntegerField
      FieldName = 'IncentivoFiscalCodigo'
      Origin = 'IncentivoFiscalCodigo'
    end
    object qryDCRIncentivoFiscalNome: TStringField
      FieldName = 'IncentivoFiscalNome'
      Origin = 'IncentivoFiscalNome'
      Size = 15
    end
    object qryDCRInformacaoComplementar: TStringField
      FieldName = 'InformacaoComplementar'
      Origin = 'InformacaoComplementar'
      Size = 7800
    end
    object qryDCRSituacaoDuimp: TStringField
      FieldName = 'SituacaoDuimp'
      Origin = 'SituacaoDuimp'
      Required = True
      Size = 60
    end
    object qryDCRTipoAplicacao: TStringField
      FieldName = 'TipoAplicacao'
      Origin = 'TipoAplicacao'
      Size = 23
    end
    object qryDCRTipoAplicacaoCodigo: TSmallintField
      FieldName = 'TipoAplicacaoCodigo'
      Origin = 'TipoAplicacaoCodigo'
    end
    object qryDCRTipoAplicacaoDescricao: TStringField
      FieldName = 'TipoAplicacaoDescricao'
      Origin = 'TipoAplicacaoDescricao'
      Size = 50
    end
    object qryDCRUFDesembaraco: TStringField
      FieldName = 'UFDesembaraco'
      Origin = 'UFDesembaraco'
      OnChange = qryDCRUFDesembaracoChange
      Size = 2
    end
    object qryDCRUFDesembaracoNome: TStringField
      FieldName = 'UFDesembaracoNome'
      Origin = 'UFDesembaracoNome'
      Size = 30
    end
    object qryDCRUFImportacao: TStringField
      FieldName = 'UFImportacao'
      Origin = 'UFImportacao'
      OnChange = qryDCRUFImportacaoChange
      Size = 2
    end
    object qryDCRUFImportacaoNome: TStringField
      FieldName = 'UFImportacaoNome'
      Origin = 'UFImportacaoNome'
      Size = 30
    end
    object qryDCRValorTotalLocalEmbarqueBRL: TFloatField
      FieldName = 'ValorTotalLocalEmbarqueBRL'
      Origin = 'ValorTotalLocalEmbarqueBRL'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDCRValorTotalLocalEmbarqueUSD: TFloatField
      FieldName = 'ValorTotalLocalEmbarqueUSD'
      Origin = 'ValorTotalLocalEmbarqueUSD'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDCRQuantidadeTotal: TFloatField
      FieldName = 'QuantidadeTotal'
      Origin = 'QuantidadeTotal'
      ReadOnly = True
    end
    object qryDCRPesoLiquidoTotal: TFloatField
      FieldName = 'PesoLiquidoTotal'
      Origin = 'PesoLiquidoTotal'
      ReadOnly = True
    end
  end
  object dsoDCR: TDataSource
    DataSet = qryDCR
    OnStateChange = dsoStateChange
    OnDataChange = dsoDataChange
    Left = 86
    Top = 143
  end
  object qryIncoterms: TFDQuery
    Connection = damConnection.DBCadastro
    SQL.Strings = (
      'SELECT CodigoICT = ICT.Codigo'
      ',DescricaoICT = ICT.Descricao'
      ',FreteICT = ICT.Frete'
      ',SeguroICT = ICT.Seguro'
      ',TextoICT = ICT.Texto'
      'FROM Incoterms AS ICT')
    Left = 746
    Top = 80
    object qryIncotermsCodigoICT: TStringField
      FieldName = 'CodigoICT'
      Origin = 'CodigoICT'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryIncotermsDescricaoICT: TStringField
      FieldName = 'DescricaoICT'
      Origin = 'DescricaoICT'
      Size = 70
    end
    object qryIncotermsFreteICT: TBooleanField
      FieldName = 'FreteICT'
      Origin = 'FreteICT'
    end
    object qryIncotermsSeguroICT: TBooleanField
      FieldName = 'SeguroICT'
      Origin = 'SeguroICT'
    end
    object qryIncotermsTextoICT: TMemoField
      FieldName = 'TextoICT'
      Origin = 'TextoICT'
      BlobType = ftMemo
    end
  end
  object qryDCI: TFDQuery
    OnNewRecord = qryDCINewRecord
    CachedUpdates = True
    IndexFieldNames = 'VersaoId;Adicao;NumeroItem;ProdutoCodigo;ProdutoVersao'
    MasterSource = dsoDUV
    MasterFields = 'Id'
    DetailFields = 'VersaoId'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.capas_itens'
    UpdateOptions.KeyFields = 'Id'
    UpdateObject = updDCI
    SQL.Strings = (
      'DECLARE @VersaoId uniqueidentifier;'
      ''
      'SET @VersaoId = :Id;'
      ''
      'WITH FreteSeguro AS ('
      #9'SELECT VersaoId = DCG.Id'
      
        #9',FreteMoedaNegociadaValorCotacao = duimp.ValorCotacao(SUM(DCI.C' +
        'ondicaoVendaValorFreteBRL), DCG.FreteMoedaNegociadaValor)'
      
        #9',SeguroMoedaNegociadaValorCotacao = duimp.ValorCotacao(SUM(DCI.' +
        'CondicaoVendaValorSeguroBRL) , DCG.SeguroMoedaNegociadaValor)'
      #9'FROM duimp.cargas AS DCG'
      #9'JOIN duimp.capas_itens AS DCI '
      #9#9'ON DCG.Id = DCI.VersaoId'
      
        #9'GROUP BY DCG.Id, DCG.FreteMoedaNegociadaValor, DCG.SeguroMoedaN' +
        'egociadaValor'
      '),'
      'CapasItens AS ('
      '    SELECT CapaItemId = Id'
      #9',ValorMoedaNegociada = CondicaoVendaValorMoedaNegociada'
      #9',ValorMoedaNegociadaVlc = CondicaoVendaValorMoedaNegociadaVlc'
      #9',ValorUnitario = ValorUnitario'
      #9',ValorUnitarioVlc = ValorUnitarioVlc'
      
        #9',MoedaNegociadaCotacao = duimp.ValorCotacao(CondicaoVendaValorB' +
        'RL,  CondicaoVendaValorMoedaNegociada)'
      #9',VersaoId'
      '    FROM duimp.capas_itens'
      '    WHERE VersaoId = @VersaoId'
      '),'
      'DuimpCapas AS ('
      #9'SELECT VersaoId = Id'
      #9',MoedaSimbolo = FobMoeda'
      
        #9',MoedaCotacao = duimp.ValorCotacao(ValorTotalLocalEmbarqueBRL ,' +
        ' ValorTotalLocalEmbarqueUSD)'
      #9'FROM duimp.capas'
      #9'WHERE Id = @VersaoId'
      '),'
      'CapasItensValores AS ('
      #9'SELECT CapaItemId'
      #9',MoedaNegociadaSimbolo = DCP.MoedaSimbolo'
      
        #9',MoedaNegociadaCotacao = duimp.CotacaoValor(DCP.MoedaCotacao, M' +
        'oedaNegociadaCotacao)'
      
        #9',ValorMoedaNegociada = ValorMoedaNegociada * duimp.CotacaoValor' +
        '(DCP.MoedaCotacao, MoedaNegociadaCotacao)'
      
        #9',ValorMoedaNegociadaVlc = ValorMoedaNegociadaVlc * duimp.Cotaca' +
        'oValor(DCP.MoedaCotacao, MoedaNegociadaCotacao)'
      
        #9',ValorUnitario = ValorUnitario * duimp.CotacaoValor(DCP.MoedaCo' +
        'tacao, MoedaNegociadaCotacao)'
      
        #9',ValorUnitarioVlc = ValorUnitarioVlc * duimp.CotacaoValor(DCP.M' +
        'oedaCotacao, MoedaNegociadaCotacao)'
      #9'FROM CapasItens AS DCI'
      #9'JOIN DuimpCapas AS DCP'
      #9#9'ON DCP.VersaoId = DCI.VersaoId'
      '),'
      'CapasItensIncoterm AS ('
      '    SELECT CapaItemId = Id'
      #9',ValorMoedaNegociada = IncotermValorMoedaNegociada'
      #9',ValorMoedaNegociadaVlc = IncotermValorMoedaNegociadaVlc'
      #9',ValorUnitario = IncotermValorUnitario'
      #9',ValorUnitarioVlc = IncotermValorUnitarioVlc'
      
        #9',MoedaNegociadaCotacao = duimp.ValorCotacao(IncotermValorBRL,  ' +
        'IncotermValorMoedaNegociada)'
      #9',VersaoId'
      '    FROM duimp.capas_itens'
      '    WHERE VersaoId = @VersaoId'
      '),'
      'CapasItensValoresIncoterm AS ('
      #9'SELECT CapaItemId'
      #9',MoedaNegociadaSimbolo = DCP.MoedaSimbolo'
      
        #9',MoedaNegociadaCotacao = duimp.CotacaoValor(DCP.MoedaCotacao, M' +
        'oedaNegociadaCotacao)'
      
        #9',ValorMoedaNegociada = ValorMoedaNegociada * duimp.CotacaoValor' +
        '(DCP.MoedaCotacao, MoedaNegociadaCotacao)'
      
        #9',ValorMoedaNegociadaVlc = ValorMoedaNegociadaVlc * duimp.Cotaca' +
        'oValor(DCP.MoedaCotacao, MoedaNegociadaCotacao)'
      
        #9',ValorUnitario = ValorUnitario * duimp.CotacaoValor(DCP.MoedaCo' +
        'tacao, MoedaNegociadaCotacao)'
      
        #9',ValorUnitarioVlc = ValorUnitarioVlc * duimp.CotacaoValor(DCP.M' +
        'oedaCotacao, MoedaNegociadaCotacao)'
      #9'FROM CapasItensIncoterm AS DII'
      #9'JOIN DuimpCapas AS DCP'
      #9#9'ON DCP.VersaoId = DII.VersaoId'
      '),'
      'Unidades AS ('
      #9'SELECT Codigo = ('
      #9#9'SELECT TOP 1 Codigo'
      #9#9'FROM Cybersoft_Cadastros.dbo.UnidadeMedida'
      #9#9'WHERE SOUNDEX(Descricao) = SOUNDEX(UNM.Descricao)'
      #9')'
      #9',Descricao'
      #9'FROM Cybersoft_Cadastros.dbo.UnidadeMedida AS UNM'
      #9'GROUP BY Descricao'
      ')'
      'SELECT DCI.Id'
      ',DCI.Adicao'
      ',DCI.Camex'
      ',DCI.CaracterizacaoImportacaoIndicador'
      ',DCI.CaracterizacaoImportacaoNI'
      ',ClienteCodigo = CLI.Codigo'
      ',ClienteNome = CLI.Nome'
      ',DCI.CondicaoVendaValorBRL'
      ',DCI.CondicaoVendaValorVlcBRL'
      ',DCI.CondicaoVendaValorFreteBRL'
      
        ',CondicaoVendaValorFreteCotacao = ISNULL(CFS.FreteMoedaNegociada' +
        'ValorCotacao, 0)'
      
        ',CondicaoVendaValorFrete = ISNULL(duimp.ValorCotacao(DCI.Condica' +
        'oVendaValorFreteBRL, CFS.FreteMoedaNegociadaValorCotacao), 0)'
      ',DCI.CondicaoVendaValorMoedaNegociada'
      ',DCI.CondicaoVendaValorMoedaNegociadaVlc'
      ',DCI.CondicaoVendaValorSeguroBRL'
      
        ',CondicaoVendaValorSeguroCotacao = ISNULL(CFS.SeguroMoedaNegocia' +
        'daValorCotacao, 0)'
      
        ',CondicaoVendaValorSeguro = ISNULL(duimp.ValorCotacao(DCI.Condic' +
        'aoVendaValorSeguroBRL, CFS.SeguroMoedaNegociadaValorCotacao), 0)'
      
        ',CondicaoVendaMoedaNegociadaSimboloCVT = CIV.MoedaNegociadaSimbo' +
        'lo'
      
        ',CondicaoVendaMoedaNegociadaCotacaoCVT = CIV.MoedaNegociadaCotac' +
        'ao'
      ',CondicaoVendaValorMoedaNegociadaCVT = CIV.ValorMoedaNegociada'
      
        ',CondicaoVendaValorMoedaNegociadaVlcCVT = CIV.ValorMoedaNegociad' +
        'aVlc'
      ',CondicaoVendaValorUnitarioCVT = CIV.ValorUnitario'
      ',CondicaoVendaValorUnitarioVlcCVT = CIV.ValorUnitarioVlc'
      
        ',CondicaoVendaValorFreteCVT = ISNULL(duimp.ValorCotacao(DCI.Cond' +
        'icaoVendaValorFreteBRL, CFS.FreteMoedaNegociadaValorCotacao) * C' +
        'IVI.MoedaNegociadaCotacao, 0)'
      
        ',CondicaoVendaValorSeguroCVT = ISNULL(duimp.ValorCotacao(DCI.Con' +
        'dicaoVendaValorSeguroBRL, CFS.SeguroMoedaNegociadaValorCotacao) ' +
        '* CIVI.MoedaNegociadaCotacao, 0)'
      ',DCI.Dumping'
      ',DCI.FabricanteCodigo'
      ',DCI.FabricanteCodigoPais'
      ',DCI.FabricanteNIOperador'
      ',DCI.FabricanteVersao'
      ',DCI.ExportadorCodigo'
      ',DCI.ExportadorCodigoPais'
      ',DCI.ExportadorNIOperador'
      ',DCI.ExportadorVersao'
      ',DCI.IncotermCodigo'
      ',DCI.IncotermValorBRL'
      ',DCI.IncotermValorVlcBRL'
      ',DCI.MoedaNegociadaSimbolo'
      ',DCI.IncotermValorMoedaNegociada'
      ',DCI.IncotermValorMoedaNegociadaVlc'
      ',DCI.IncotermValorUnitario'
      ',DCI.IncotermValorUnitarioVlc'
      ',IncotermMoedaNegociadaSimboloCVT = CIVI.MoedaNegociadaSimbolo'
      ',IncotermMoedaNegociadaCotacaoCVT = CIVI.MoedaNegociadaCotacao'
      ',IncotermValorMoedaNegociadaCVT = CIVI.ValorMoedaNegociada'
      ',IncotermValorMoedaNegociadaVlcCVT = CIVI.ValorMoedaNegociadaVlc'
      ',IncotermValorUnitarioCVT = CIVI.ValorUnitario'
      ',IncotermValorUnitarioVlcCVT = CIVI.ValorUnitarioVlc'
      ',DCI.NumeroItem'
      ',DCI.PesoLiquido'
      ',DCI.PesoLiquidoUnitario'
      ',DCI.ProdutoCodigo'
      ',ProdutoCodigoInterno = PRO.Codigo'
      ',DCI.ProdutoDescricao'
      ',ProdutoNCM = PRO.NCM'
      ',DCI.ProdutoNIResponsavel'
      
        ',ProdutoNomeInterno = IIF(CHARINDEX('#39'<{'#39', PRO.Descricao_Reduzida' +
        ') > 0, SUBSTRING(PRO.Descricao_Reduzida, 0, CHARINDEX('#39'<{'#39', PRO.' +
        'Descricao_Reduzida) -1), PRO.Descricao_Reduzida)'
      ',DCI.ProdutoVersao'
      ',DCI.QuantidadeComercial'
      ',DCI.TipoAplicacao'
      ',TipoAplicacaoDescricao = TIP.Descricao'
      ',UnidadeComercialCodigo = ISNULL(UNI.Codigo, '#39#39')'
      ',DCI.UnidadeComercial'
      ',DCI.ValorUnitario'
      ',DCI.ValorUnitarioBRL'
      ',DCI.ValorUnitarioVlc'
      ',DCI.ValorUnitarioVlcBRL'
      ',DCI.VersaoId'
      'FROM duimp.capas_itens AS DCI'
      'JOIN duimp.tipos_aplicacoes AS DTA'
      #9' ON DTA.Id = DCI.TipoAplicacao'
      'JOIN Cybersoft_Cadastros.dbo.TipoItem AS TIP'
      #9' ON DTA.TipoItemCodigo = TIP.Codigo'
      'JOIN CapasItensValores AS CIV'
      #9' ON DCI.Id = CIV.CapaItemId'
      'JOIN CapasItensValoresIncoterm AS CIVI'
      #9' ON DCI.Id = CIVI.CapaItemId'
      'LEFT JOIN Clientes AS CLI'
      #9' ON CLI.CNPJ = DCI.CaracterizacaoImportacaoNI'
      
        #9'AND DCI.CaracterizacaoImportacaoIndicador IN ('#39'IMPORTACAO_POR_C' +
        'ONTA_E_ORDEM'#39', '#39'IMPORTACAO_POR_ENCOMENDA'#39')'
      'LEFT JOIN FreteSeguro AS CFS'
      #9' ON CFS.VersaoId = DCI.VersaoId'
      'LEFT JOIN Produtos AS PRO'
      #9' ON DCI.ProdutoCodigo = PRO.Codigo_DUIMP'
      'LEFT JOIN Unidades AS UNI'
      #9' ON UNI.Descricao = DCI.UnidadeComercial'
      'WHERE DCI.VersaoId = @VersaoId;')
    Left = 24
    Top = 207
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDCIId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 38
    end
    object qryDCIAdicao: TIntegerField
      DisplayLabel = 'Adi'#231#227'o'
      DisplayWidth = 8
      FieldName = 'Adicao'
      Origin = 'Adicao'
      Required = True
      DisplayFormat = '000'
    end
    object qryDCICamex: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'X'
      DisplayWidth = 5
      FieldName = 'Camex'
      Origin = 'Camex'
      Required = True
      Visible = False
    end
    object qryDCICaracterizacaoImportacaoIndicador: TStringField
      FieldName = 'CaracterizacaoImportacaoIndicador'
      Origin = 'CaracterizacaoImportacaoIndicador'
      Required = True
      Visible = False
      Size = 28
    end
    object qryDCICaracterizacaoImportacaoNI: TStringField
      Alignment = taCenter
      DisplayLabel = 'N.I.'
      DisplayWidth = 15
      FieldName = 'CaracterizacaoImportacaoNI'
      Origin = 'CaracterizacaoImportacaoNI'
      Size = 14
    end
    object qryDCIClienteCodigo: TIntegerField
      FieldName = 'ClienteCodigo'
      Origin = 'ClienteCodigo'
      Visible = False
    end
    object qryDCIClienteNome: TStringField
      FieldName = 'ClienteNome'
      Origin = 'ClienteNome'
      Visible = False
      Size = 50
    end
    object qryDCICondicaoVendaValorBRL: TFloatField
      DisplayWidth = 20
      FieldName = 'CondicaoVendaValorBRL'
      Origin = 'CondicaoVendaValorBRL'
      Required = True
      Visible = False
    end
    object qryDCICondicaoVendaValorVlcBRL: TFloatField
      DisplayWidth = 20
      FieldName = 'CondicaoVendaValorVlcBRL'
      Origin = 'CondicaoVendaValorVlcBRL'
      Required = True
      Visible = False
    end
    object qryDCICondicaoVendaValorFreteBRL: TFloatField
      DisplayWidth = 20
      FieldName = 'CondicaoVendaValorFreteBRL'
      Origin = 'CondicaoVendaValorFreteBRL'
      Required = True
      Visible = False
    end
    object qryDCICondicaoVendaValorFreteCotacao: TFloatField
      FieldName = 'CondicaoVendaValorFreteCotacao'
      Origin = 'CondicaoVendaValorFreteCotacao'
      ReadOnly = True
      Visible = False
    end
    object qryDCICondicaoVendaValorFrete: TFloatField
      DisplayLabel = 'Frete'
      DisplayWidth = 15
      FieldName = 'CondicaoVendaValorFrete'
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDCICondicaoVendaValorMoedaNegociada: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 20
      FieldName = 'CondicaoVendaValorMoedaNegociada'
      Origin = 'CondicaoVendaValorMoedaNegociada'
      Required = True
      DisplayFormat = ',0.0000000;-,0.0000000'
    end
    object qryDCICondicaoVendaValorMoedaNegociadaVlc: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 20
      FieldName = 'CondicaoVendaValorMoedaNegociadaVlc'
      Origin = 'CondicaoVendaValorMoedaNegociadaVlc'
      Required = True
      DisplayFormat = ',0.0000000;-,0.0000000'
    end
    object qryDCICondicaoVendaValorSeguroBRL: TFloatField
      DisplayWidth = 20
      FieldName = 'CondicaoVendaValorSeguroBRL'
      Origin = 'CondicaoVendaValorSeguroBRL'
      Required = True
      Visible = False
    end
    object qryDCICondicaoVendaValorSeguroCotacao: TFloatField
      FieldName = 'CondicaoVendaValorSeguroCotacao'
      Origin = 'CondicaoVendaValorSeguroCotacao'
      ReadOnly = True
      Visible = False
    end
    object qryDCICondicaoVendaValorSeguro: TFloatField
      DisplayLabel = 'Seguro'
      DisplayWidth = 15
      FieldName = 'CondicaoVendaValorSeguro'
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDCICondicaoVendaMoedaNegociadaSimboloCVT: TStringField
      FieldName = 'CondicaoVendaMoedaNegociadaSimboloCVT'
      Origin = 'CondicaoVendaMoedaNegociadaSimboloCVT'
      ReadOnly = True
      Visible = False
      Size = 3
    end
    object qryDCICondicaoVendaMoedaNegociadaCotacaoCVT: TFloatField
      FieldName = 'CondicaoVendaMoedaNegociadaCotacaoCVT'
      Origin = 'CondicaoVendaMoedaNegociadaCotacaoCVT'
      ReadOnly = True
      Visible = False
    end
    object qryDCICondicaoVendaValorMoedaNegociadaCVT: TFloatField
      FieldName = 'CondicaoVendaValorMoedaNegociadaCVT'
      Origin = 'CondicaoVendaValorMoedaNegociadaCVT'
      ReadOnly = True
      Visible = False
    end
    object qryDCICondicaoVendaValorMoedaNegociadaVlcCVT: TFloatField
      FieldName = 'CondicaoVendaValorMoedaNegociadaVlcCVT'
      Origin = 'CondicaoVendaValorMoedaNegociadaVlcCVT'
      ReadOnly = True
      Visible = False
    end
    object qryDCICondicaoVendaValorUnitarioCVT: TFloatField
      FieldName = 'CondicaoVendaValorUnitarioCVT'
      Origin = 'CondicaoVendaValorUnitarioCVT'
      ReadOnly = True
      Visible = False
    end
    object qryDCICondicaoVendaValorUnitarioVlcCVT: TFloatField
      FieldName = 'CondicaoVendaValorUnitarioVlcCVT'
      Origin = 'CondicaoVendaValorUnitarioVlcCVT'
      ReadOnly = True
      Visible = False
    end
    object qryDCICondicaoVendaValorFreteCVT: TFloatField
      FieldName = 'CondicaoVendaValorFreteCVT'
      Origin = 'CondicaoVendaValorFreteCVT'
      ReadOnly = True
      Visible = False
    end
    object qryDCICondicaoVendaValorSeguroCVT: TFloatField
      FieldName = 'CondicaoVendaValorSeguroCVT'
      Origin = 'CondicaoVendaValorSeguroCVT'
      ReadOnly = True
      Visible = False
    end
    object qryDCIDumping: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'X'
      FieldName = 'Dumping'
      Origin = 'Dumping'
      Required = True
      Visible = False
    end
    object qryDCIFabricanteCodigo: TStringField
      FieldName = 'FabricanteCodigo'
      Origin = 'FabricanteCodigo'
      Visible = False
      Size = 35
    end
    object qryDCIFabricanteCodigoPais: TStringField
      FieldName = 'FabricanteCodigoPais'
      Origin = 'FabricanteCodigoPais'
      Visible = False
      Size = 2
    end
    object qryDCIFabricanteNIOperador: TStringField
      FieldName = 'FabricanteNIOperador'
      Origin = 'FabricanteNIOperador'
      Visible = False
      Size = 11
    end
    object qryDCIFabricanteVersao: TIntegerField
      FieldName = 'FabricanteVersao'
      Origin = 'FabricanteVersao'
      Visible = False
    end
    object qryDCIExportadorCodigo: TStringField
      FieldName = 'ExportadorCodigo'
      Origin = 'ExportadorCodigo'
      Required = True
      Visible = False
      Size = 35
    end
    object qryDCIExportadorCodigoPais: TStringField
      FieldName = 'ExportadorCodigoPais'
      Origin = 'ExportadorCodigoPais'
      Required = True
      Visible = False
      Size = 2
    end
    object qryDCIExportadorNIOperador: TStringField
      FieldName = 'ExportadorNIOperador'
      Origin = 'ExportadorNIOperador'
      Required = True
      Visible = False
      Size = 11
    end
    object qryDCIExportadorVersao: TIntegerField
      FieldName = 'ExportadorVersao'
      Origin = 'ExportadorVersao'
      Required = True
      Visible = False
    end
    object qryDCIIncotermCodigo: TStringField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 7
      FieldName = 'IncotermCodigo'
      Origin = 'IncotermCodigo'
      Required = True
      Size = 10
    end
    object qryDCIIncotermDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'IncotermDescricao'
      LookupDataSet = qryIncoterms
      LookupKeyFields = 'CodigoICT'
      LookupResultField = 'DescricaoICT'
      KeyFields = 'IncotermCodigo'
      Size = 70
      Lookup = True
    end
    object qryDCIFreteICT: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'Frete'
      DisplayWidth = 8
      FieldKind = fkLookup
      FieldName = 'IncotermFrete'
      LookupDataSet = qryIncoterms
      LookupKeyFields = 'CodigoICT'
      LookupResultField = 'FreteICT'
      KeyFields = 'IncotermCodigo'
      OnGetText = qryDCIFreteSeguroGetText
      Lookup = True
    end
    object qryDCISeguroICT: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'Seguro'
      DisplayWidth = 8
      FieldKind = fkLookup
      FieldName = 'IncotermSeguro'
      LookupDataSet = qryIncoterms
      LookupKeyFields = 'CodigoICT'
      LookupResultField = 'SeguroICT'
      KeyFields = 'IncotermCodigo'
      OnGetText = qryDCIFreteSeguroGetText
      Lookup = True
    end
    object qryDCITextoICT: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'IncotermTexto'
      LookupDataSet = qryIncoterms
      LookupKeyFields = 'CodigoICT'
      LookupResultField = 'TextoICT'
      KeyFields = 'IncotermCodigo'
      Visible = False
      Size = 1000
      Lookup = True
    end
    object qryDCIIncotermValorBRL: TFloatField
      DisplayLabel = 'Valor Total (BRL)'
      DisplayWidth = 20
      FieldName = 'IncotermValorBRL'
      Origin = 'IncotermValorBRL'
      Required = True
      DisplayFormat = ',0.0000000;-,0.0000000'
    end
    object qryDCIIncotermValorVlcBRL: TFloatField
      DisplayLabel = 'Valor Total (BRL)'
      DisplayWidth = 20
      FieldName = 'IncotermValorVlcBRL'
      Origin = 'IncotermValorVlcBRL'
      Required = True
      DisplayFormat = ',0.0000000;-,0.0000000'
    end
    object qryDCIIncotermValorMoedaNegociada: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 20
      FieldName = 'IncotermValorMoedaNegociada'
      Origin = 'IncotermValorMoedaNegociada'
      Required = True
      DisplayFormat = ',0.0000000;-,0.0000000'
    end
    object qryDCIIncotermValorMoedaNegociadaVlc: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 20
      FieldName = 'IncotermValorMoedaNegociadaVlc'
      Origin = 'IncotermValorMoedaNegociadaVlc'
      Required = True
      DisplayFormat = ',0.0000000;-,0.0000000'
    end
    object qryDCIIncotermValorUnitario: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      DisplayWidth = 20
      FieldName = 'IncotermValorUnitario'
      Origin = 'IncotermValorUnitario'
      Required = True
      DisplayFormat = ',0.0000000;-,0.0000000'
    end
    object qryDCIIncotermValorUnitarioVlc: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      DisplayWidth = 20
      FieldName = 'IncotermValorUnitarioVlc'
      Origin = 'IncotermValorUnitarioVlc'
      Required = True
      DisplayFormat = ',0.0000000;-,0.0000000'
    end
    object qryDCIIncotermMoedaNegociadaSimboloCVT: TStringField
      FieldName = 'IncotermMoedaNegociadaSimboloCVT'
      Origin = 'IncotermMoedaNegociadaSimboloCVT'
      ReadOnly = True
      Visible = False
      Size = 3
    end
    object qryDCIIncotermMoedaNegociadaCotacaoCVT: TFloatField
      FieldName = 'IncotermMoedaNegociadaCotacaoCVT'
      Origin = 'IncotermMoedaNegociadaCotacaoCVT'
      ReadOnly = True
      Visible = False
    end
    object qryDCIIncotermValorMoedaNegociadaCVT: TFloatField
      DisplayLabel = 'Valor Total (USD)'
      DisplayWidth = 20
      FieldName = 'IncotermValorMoedaNegociadaCVT'
      Origin = 'IncotermValorMoedaNegociadaCVT'
      ReadOnly = True
      DisplayFormat = ',0.0000000;-,0.0000000'
    end
    object qryDCIIncotermValorMoedaNegociadaVlcCVT: TFloatField
      DisplayLabel = 'Valor Total (USD)'
      DisplayWidth = 20
      FieldName = 'IncotermValorMoedaNegociadaVlcCVT'
      Origin = 'IncotermValorMoedaNegociadaVlcCVT'
      ReadOnly = True
      DisplayFormat = ',0.0000000;-,0.0000000'
    end
    object qryDCIIncotermValorUnitarioCVT: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio (USD)'
      DisplayWidth = 20
      FieldName = 'IncotermValorUnitarioCVT'
      Origin = 'IncotermValorUnitarioCVT'
      ReadOnly = True
      Visible = False
      DisplayFormat = ',0.0000000;-,0.0000000'
    end
    object qryDCIIncotermValorUnitarioVlcCVT: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio (USD)'
      DisplayWidth = 20
      FieldName = 'IncotermValorUnitarioVlcCVT'
      Origin = 'IncotermValorUnitarioVlcCVT'
      ReadOnly = True
      Visible = False
      DisplayFormat = ',0.0000000;-,0.0000000'
    end
    object qryDCIModalidadeCodigo: TIntegerField
      FieldKind = fkLookup
      FieldName = 'ModalidadeCodigo'
      LookupDataSet = qryMOD
      LookupKeyFields = 'CaracterizacaoImportacaoIndicador'
      LookupResultField = 'ModalidadeCodigo'
      KeyFields = 'CaracterizacaoImportacaoIndicador'
      Visible = False
      Lookup = True
    end
    object qryDCIModalidadeDescricao: TStringField
      DisplayLabel = 'Indicador'
      DisplayWidth = 18
      FieldKind = fkLookup
      FieldName = 'ModalidadeDescricao'
      LookupDataSet = qryMOD
      LookupKeyFields = 'CaracterizacaoImportacaoIndicador'
      LookupResultField = 'ModalidadeDescricao'
      KeyFields = 'CaracterizacaoImportacaoIndicador'
      Size = 28
      Lookup = True
    end
    object qryDCIMoedaNegociadaCodigo: TIntegerField
      FieldKind = fkLookup
      FieldName = 'MoedaNegociadaCodigo'
      LookupDataSet = qryMOE
      LookupKeyFields = 'Simbolo'
      LookupResultField = 'Codigo'
      KeyFields = 'MoedaNegociadaSimbolo'
      Visible = False
      Lookup = True
    end
    object qryDCIMoedaNegociadaSimbolo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Moeda'
      DisplayWidth = 7
      FieldName = 'MoedaNegociadaSimbolo'
      Origin = 'MoedaNegociadaSimbolo'
      Required = True
      Size = 3
    end
    object qryDCINumeroItem: TIntegerField
      DisplayLabel = 'N'#186' Item'
      DisplayWidth = 8
      FieldName = 'NumeroItem'
      Origin = 'NumeroItem'
      Required = True
      DisplayFormat = '000'
    end
    object qryDCIPesoLiquido: TFloatField
      DisplayLabel = 'Peso L'#237'quido Total'
      DisplayWidth = 18
      FieldName = 'PesoLiquido'
      Origin = 'PesoLiquido'
      Required = True
      DisplayFormat = ',0.00000;-,0.00000'
    end
    object qryDCIPesoLiquidoUnitario: TFloatField
      DisplayLabel = 'Peso L'#237'quido Unit'#225'rio'
      DisplayWidth = 18
      FieldName = 'PesoLiquidoUnitario'
      ProviderFlags = []
      DisplayFormat = ',0.00000;-,0.00000'
    end
    object qryDCIProdutoCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 8
      FieldName = 'ProdutoCodigo'
      Origin = 'ProdutoCodigo'
      Required = True
    end
    object qryDCIProdutoCodigoInterno: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'ProdutoCodigoInterno'
      Origin = 'ProdutoCodigoInterno'
      OnChange = qryDCIProdutoCodigoInternoChange
    end
    object qryDCIProdutoDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o da Mercadoria'
      DisplayWidth = 25
      FieldName = 'ProdutoDescricao'
      Origin = 'ProdutoDescricao'
      Size = 4000
    end
    object qryDCIProdutoNCM: TStringField
      Alignment = taCenter
      DisplayLabel = 'NCM'
      FieldName = 'ProdutoNCM'
      Origin = 'ProdutoNCM'
      Size = 10
    end
    object qryDCIProdutoNIResponsavel: TStringField
      FieldName = 'ProdutoNIResponsavel'
      Origin = 'ProdutoNIResponsavel'
      Required = True
      Visible = False
      Size = 11
    end
    object qryDCIProdutoNomeInterno: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 63
      FieldName = 'ProdutoNomeInterno'
      Origin = 'ProdutoNomeInterno'
      Size = 60
    end
    object qryDCIProdutoVersao: TIntegerField
      DisplayLabel = 'Vers'#227'o'
      DisplayWidth = 8
      FieldName = 'ProdutoVersao'
      Origin = 'ProdutoVersao'
      Required = True
    end
    object qryDCIQuantidadeComercial: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 15
      FieldName = 'QuantidadeComercial'
      Origin = 'QuantidadeComercial'
      Required = True
      DisplayFormat = ',0.00000;-,0.00000'
    end
    object qryDCITipoAplicacao: TStringField
      FieldName = 'TipoAplicacao'
      Origin = 'TipoAplicacao'
      Required = True
      Visible = False
      Size = 23
    end
    object qryDCITipoAplicacaoDescricao: TStringField
      FieldName = 'TipoAplicacaoDescricao'
      Origin = 'TipoAplicacaoDescricao'
      Visible = False
      Size = 50
    end
    object qryDCIUnidadeComercialCodigo: TStringField
      Alignment = taCenter
      DisplayLabel = 'UN'
      FieldName = 'UnidadeComercialCodigo'
      Origin = 'UnidadeComercialCodigo'
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
    object qryDCIUnidadeComercial: TStringField
      DisplayLabel = 'Unidade Comercial'
      DisplayWidth = 19
      FieldName = 'UnidadeComercial'
      Origin = 'UnidadeComercial'
      Required = True
    end
    object qryDCIValorUnitario: TFloatField
      FieldName = 'ValorUnitario'
      Origin = 'ValorUnitario'
      Required = True
      Visible = False
    end
    object qryDCIValorUnitarioBRL: TFloatField
      FieldName = 'ValorUnitarioBRL'
      Origin = 'ValorUnitarioBRL'
      Required = True
      Visible = False
    end
    object qryDCIValorUnitarioVlc: TFloatField
      FieldName = 'ValorUnitarioVlc'
      Origin = 'ValorUnitarioVlc'
      Required = True
      Visible = False
    end
    object qryDCIValorUnitarioVlcBRL: TFloatField
      FieldName = 'ValorUnitarioVlcBRL'
      Origin = 'ValorUnitarioVlcBRL'
      Required = True
      Visible = False
    end
    object qryDCIVersaoId: TGuidField
      FieldName = 'VersaoId'
      Origin = 'VersaoId'
      Required = True
      Visible = False
      Size = 38
    end
  end
  object dsoDCI: TDataSource
    DataSet = qryDCI
    OnStateChange = dsoStateChange
    OnDataChange = dsoDataChange
    Left = 86
    Top = 207
  end
  object qryDAD: TFDQuery
    OnNewRecord = qryDADNewRecord
    CachedUpdates = True
    IndexFieldNames = 'CapaItemId;Tipo;MoedaNegociadaSimbolo'
    MasterSource = dsoDCI
    MasterFields = 'Id'
    DetailFields = 'CapaItemId'
    Connection = damConnection.DBCliente
    UpdateOptions.AssignedValues = [uvCountUpdatedRecords]
    UpdateOptions.CountUpdatedRecords = False
    UpdateOptions.UpdateTableName = 'duimp.acrescimos_deducoes'
    UpdateOptions.KeyFields = 'Id'
    UpdateObject = updDAD
    SQL.Strings = (
      'DECLARE @CapaItemId uniqueidentifier;'
      ''
      'SET @CapaItemId = :Id;'
      ''
      'SELECT DAD.Id'
      ',DAD.DenominacaoCodigo'
      ',DenominacaoDescricao = AVA.Descricao'
      ',DAD.MoedaNegociadaSimbolo'
      
        ',MoedaNegociadaValor = DAD.MoedaNegociadaValor * IIF(DAD.Tipo = ' +
        #39'DEDUCAO'#39', -1, 1)'
      ',DAD.Tipo'
      ',ValorBRL = DAD.ValorBRL * IIF(DAD.Tipo = '#39'DEDUCAO'#39', -1, 1)'
      ',DAD.CapaItemId'
      'FROM duimp.acrescimos_deducoes AS DAD'
      'JOIN Cybersoft_Cadastros.dbo.AcrescimoValoracaoAduaneira AS AVA'
      #9'ON DAD.DenominacaoCodigo = AVA.Codigo'
      'WHERE DAD.CapaItemId = @CapaItemId'
      'AND DAD.Tipo IN ('#39'ACRESCIMO'#39', '#39'DEDUCAO'#39');')
    Left = 24
    Top = 271
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDADId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 38
    end
    object qryDADDenominacaoCodigo: TIntegerField
      FieldName = 'DenominacaoCodigo'
      Origin = 'DenominacaoCodigo'
      Required = True
      Visible = False
    end
    object qryDADDenominacaoDescricao: TStringField
      DisplayLabel = 'Denomina'#231#227'o'
      DisplayWidth = 20
      FieldName = 'DenominacaoDescricao'
      ProviderFlags = []
      Size = 255
    end
    object qryDADMoedaNegociadaSimbolo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Moeda'
      DisplayWidth = 6
      FieldName = 'MoedaNegociadaSimbolo'
      Origin = 'MoedaNegociadaSimbolo'
      Required = True
      Size = 3
    end
    object qryDADMoedaNegociadaValor: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 7
      FieldName = 'MoedaNegociadaValor'
      Origin = 'MoedaNegociadaValor'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDADTipo: TStringField
      DisplayWidth = 7
      FieldName = 'Tipo'
      Origin = 'Tipo'
      Required = True
      Visible = False
      OnGetText = qryDADTipoGetText
      Size = 9
    end
    object qryDADValorBRL: TFloatField
      DisplayLabel = 'Valor (BRL)'
      FieldName = 'ValorBRL'
      Origin = 'ValorBRL'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDADCapaItemId: TGuidField
      FieldName = 'CapaItemId'
      Origin = 'CapaItemId'
      Required = True
      Visible = False
      Size = 38
    end
  end
  object dsoDAD: TDataSource
    DataSet = qryDAD
    Left = 86
    Top = 271
  end
  object qryDIT: TFDQuery
    OnNewRecord = qryDITNewRecord
    CachedUpdates = True
    IndexFieldNames = 'CapaItemId;Id'
    MasterSource = dsoDCI
    MasterFields = 'Id'
    DetailFields = 'CapaItemId'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.itens_tributos'
    UpdateOptions.KeyFields = 'Id'
    SQL.Strings = (
      'DECLARE @CapaItemId uniqueidentifier;'
      ''
      'SET @CapaItemId = :Id;'
      ''
      'SELECT DIT.Id'
      ',DIT.MercadoriaValorLocalEmbarqueBRL'
      ',DIT.MercadoriaValorAduaneiroBRL'
      ',DIT.CapaItemId'
      'FROM duimp.itens_tributos AS DIT'
      'WHERE DIT.CapaItemId = @CapaItemId;')
    Left = 496
    Top = 271
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDITId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object qryDITMercadoriaValorLocalEmbarqueBRL: TFloatField
      DisplayLabel = 'Local de Embarque (BRL)'
      FieldName = 'MercadoriaValorLocalEmbarqueBRL'
      Origin = 'MercadoriaValorLocalEmbarqueBRL'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDITMercadoriaValorAduaneiroBRL: TFloatField
      DisplayLabel = 'Valor Aduaneiro (BRL)'
      FieldName = 'MercadoriaValorAduaneiroBRL'
      Origin = 'MercadoriaValorAduaneiroBRL'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDITCapaItemId: TGuidField
      FieldName = 'CapaItemId'
      Origin = 'CapaItemId'
      Required = True
      Size = 38
    end
  end
  object dsoDIT: TDataSource
    DataSet = qryDIT
    Left = 558
    Top = 271
  end
  object dsoDCG: TDataSource
    DataSet = qryDCG
    Left = 86
    Top = 335
  end
  object qryDCG: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'Id'
    MasterSource = dsoDUV
    MasterFields = 'Id'
    DetailFields = 'Id'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.cargas'
    UpdateOptions.KeyFields = 'Id'
    UpdateObject = updDCG
    SQL.Strings = (
      'DECLARE @VersaoId uniqueidentifier;'
      ''
      'SET @VersaoId = :Id;'
      ''
      'WITH DuimpCapas AS ('
      '    SELECT Id AS VersaoId'
      #9',FobMoeda AS MoedaSimbolo'
      
        #9',duimp.ValorCotacao(ValorTotalLocalEmbarqueBRL, ValorTotalLocal' +
        'EmbarqueUSD) AS MoedaCotacao'
      '    FROM duimp.capas'
      '    WHERE Id = @VersaoId'
      '),'
      'FreteSeguro AS ('
      #9'SELECT VersaoId = DCG.Id'
      
        #9',FreteMoedaNegociadaSimbolo = NULLIF(DCG.FreteMoedaNegociadaSim' +
        'bolo, '#39#39')'
      
        #9',FreteMoedaNegociadaValorCotacao = duimp.ValorCotacao(SUM(DCI.C' +
        'ondicaoVendaValorFreteBRL), DCG.FreteMoedaNegociadaValor)'
      
        #9',SeguroMoedaNegociadaSimbolo = NULLIF(DCG.SeguroMoedaNegociadaS' +
        'imbolo, '#39#39')'
      
        #9',SeguroMoedaNegociadaValorCotacao = duimp.ValorCotacao(SUM(DCI.' +
        'CondicaoVendaValorSeguroBRL), DCG.SeguroMoedaNegociadaValor)'
      #9'FROM duimp.cargas AS DCG'
      #9'JOIN duimp.capas_itens AS DCI'
      #9#9'ON DCG.Id = DCI.VersaoId'
      #9'WHERE DCI.VersaoId = @VersaoId'
      
        #9'GROUP BY DCG.Id, DCG.FreteMoedaNegociadaSimbolo, DCG.FreteMoeda' +
        'NegociadaValor, '
      
        #9'         DCG.SeguroMoedaNegociadaSimbolo, DCG.SeguroMoedaNegoci' +
        'adaValor'
      ')'
      'SELECT DCG.Id'
      ',CFS.FreteMoedaNegociadaSimbolo'
      ',DCG.FreteMoedaNegociadaValor'
      ',CFS.FreteMoedaNegociadaValorCotacao'
      ',FreteFobSimbolo = DCP.MoedaSimbolo'
      
        ',FreteFobValor = DCG.FreteMoedaNegociadaValor * duimp.CotacaoVal' +
        'or(DCP.MoedaCotacao, CFS.FreteMoedaNegociadaValorCotacao)'
      ',FreteFobCotacao = DCP.MoedaCotacao'
      ',DCG.Identificacao'
      ',DCG.IdentificacaoCargaTipo'
      ',DCG.MotivoSituacaoEspecialCodigo'
      ',DCG.PaisProcedenciaCodigo'
      ',CFS.SeguroMoedaNegociadaSimbolo'
      ',DCG.SeguroMoedaNegociadaValor'
      ',CFS.SeguroMoedaNegociadaValorCotacao'
      ',SeguroFobSimbolo = DCP.MoedaSimbolo'
      
        ',SeguroFobValor = DCG.SeguroMoedaNegociadaValor * duimp.CotacaoV' +
        'alor(DCP.MoedaCotacao, CFS.SeguroMoedaNegociadaValorCotacao)'
      ',SeguroFobCotacao = DCP.MoedaCotacao'
      ',DCG.UnidadeDespachoCodigo'
      ',ViaTransporteCodigo = VIT.Codigo'
      ',ViaTransporteDescricao = VIT.Descricao'
      'FROM duimp.cargas AS DCG'
      'JOIN FreteSeguro AS CFS'
      #9'ON DCG.Id = CFS.VersaoId'
      'JOIN duimp.cargas_tipos AS DCT'
      #9'ON DCT.Id = DCG.IdentificacaoCargaTipo'
      'JOIN Cybersoft_Cadastros.dbo.ViaTransporte AS VIT'
      #9'ON VIT.Codigo = DCT.ViaTransporteCodigo'
      'JOIN DuimpCapas AS DCP'
      #9'ON DCP.VersaoId = DCG.Id'
      'WHERE DCG.Id = @VersaoId;')
    Left = 24
    Top = 335
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDCGId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object qryDCGIdentificacao: TStringField
      FieldName = 'Identificacao'
      Origin = 'Identificacao'
      Required = True
      Size = 32
    end
    object qryDCGIdentificacaoCargaTipo: TStringField
      FieldName = 'IdentificacaoCargaTipo'
      Origin = 'IdentificacaoCargaTipo'
      Required = True
      Size = 3
    end
    object qryDCGFreteMoedaNegociadaCodigo: TIntegerField
      FieldKind = fkLookup
      FieldName = 'FreteMoedaNegociadaCodigo'
      LookupDataSet = qryMOE
      LookupKeyFields = 'Simbolo'
      LookupResultField = 'Codigo'
      KeyFields = 'FreteMoedaNegociadaSimbolo'
      OnGetText = qryDCGFreteMoedaNegociadaCodigoGetText
      Lookup = True
    end
    object qryDCGFreteMoedaNegociadaSimbolo: TStringField
      FieldName = 'FreteMoedaNegociadaSimbolo'
      Origin = 'FreteMoedaNegociadaSimbolo'
      Size = 3
    end
    object qryDCGFreteMoedaNegociadaValor: TFloatField
      FieldName = 'FreteMoedaNegociadaValor'
      Origin = 'FreteMoedaNegociadaValor'
      Required = True
      OnGetText = MoedaNegociadaValorGetText
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDCGFreteMoedaNegociadaValorBRL: TFloatField
      DefaultExpression = 'FreteMoedaNegociadaValor * FreteMoedaNegociadaValorCotacao'
      FieldKind = fkInternalCalc
      FieldName = 'FreteMoedaNegociadaValorBRL'
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDCGFreteMoedaNegociadaValorCotacao: TFloatField
      FieldName = 'FreteMoedaNegociadaValorCotacao'
      ProviderFlags = []
      ReadOnly = True
      OnGetText = MoedaNegociadaValorGetText
      DisplayFormat = ',0.0000;-,0.0000'
    end
    object qryDCGFreteFobMoedaNegociadaCodigo: TIntegerField
      FieldKind = fkLookup
      FieldName = 'FreteFobMoedaNegociadaCodigo'
      LookupDataSet = qryMOE
      LookupKeyFields = 'Simbolo'
      LookupResultField = 'Codigo'
      KeyFields = 'FreteFobSimbolo'
      Lookup = True
    end
    object qryDCGFreteFobSimbolo: TStringField
      FieldName = 'FreteFobSimbolo'
      Origin = 'FreteFobSimbolo'
      Size = 3
    end
    object qryDCGFreteFobValor: TFloatField
      FieldName = 'FreteFobValor'
      Origin = 'FreteFobValor'
      ReadOnly = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDCGFreteFobCotacao: TFloatField
      FieldName = 'FreteFobCotacao'
      Origin = 'FreteFobCotacao'
      ReadOnly = True
    end
    object qryDCGMotivoSituacaoEspecialCodigo: TStringField
      FieldName = 'MotivoSituacaoEspecialCodigo'
      Origin = 'MotivoSituacaoEspecialCodigo'
      Size = 5
    end
    object qryDCGPaisProcedenciaCodigo: TStringField
      FieldName = 'PaisProcedenciaCodigo'
      Origin = 'PaisProcedenciaCodigo'
      Size = 2
    end
    object qryDCGSeguroMoedaNegociadaCodigo: TIntegerField
      FieldKind = fkLookup
      FieldName = 'SeguroMoedaNegociadaCodigo'
      LookupDataSet = qryMOE
      LookupKeyFields = 'Simbolo'
      LookupResultField = 'Codigo'
      KeyFields = 'SeguroMoedaNegociadaSimbolo'
      OnGetText = qryDCGSeguroMoedaNegociadaCodigoGetText
      Lookup = True
    end
    object qryDCGSeguroMoedaNegociadaSimbolo: TStringField
      FieldName = 'SeguroMoedaNegociadaSimbolo'
      Origin = 'SeguroMoedaNegociadaSimbolo'
      Size = 3
    end
    object qryDCGSeguroMoedaNegociadaValor: TFloatField
      FieldName = 'SeguroMoedaNegociadaValor'
      Origin = 'SeguroMoedaNegociadaValor'
      Required = True
      OnGetText = MoedaNegociadaValorGetText
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDCGSeguroMoedaNegociadaValorBRL: TFloatField
      DefaultExpression = 'SeguroMoedaNegociadaValor * SeguroMoedaNegociadaValorCotacao'
      FieldKind = fkInternalCalc
      FieldName = 'SeguroMoedaNegociadaValorBRL'
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDCGSeguroMoedaNegociadaValorCotacao: TFloatField
      FieldName = 'SeguroMoedaNegociadaValorCotacao'
      ProviderFlags = []
      ReadOnly = True
      OnGetText = MoedaNegociadaValorGetText
      DisplayFormat = ',0.0000;-,0.0000'
    end
    object qryDCGSeguroFobMoedaNegociadaCodigo: TIntegerField
      FieldKind = fkLookup
      FieldName = 'SeguroFobMoedaNegociadaCodigo'
      LookupDataSet = qryMOE
      LookupKeyFields = 'Simbolo'
      LookupResultField = 'Codigo'
      KeyFields = 'SeguroFobSimbolo'
      Lookup = True
    end
    object qryDCGSeguroFobSimbolo: TStringField
      FieldName = 'SeguroFobSimbolo'
      Origin = 'SeguroFobSimbolo'
      Size = 3
    end
    object qryDCGSeguroFobValor: TFloatField
      FieldName = 'SeguroFobValor'
      Origin = 'SeguroFobValor'
      ReadOnly = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDCGSeguroFobCotacao: TFloatField
      FieldName = 'SeguroFobCotacao'
      Origin = 'SeguroFobCotacao'
      ReadOnly = True
    end
    object qryDCGUnidadeDespachoCodigo: TIntegerField
      FieldName = 'UnidadeDespachoCodigo'
      Origin = 'UnidadeDespachoCodigo'
      Required = True
    end
    object qryDCGLocalDesembaracoDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'UnidadeDespachoDescricao'
      LookupDataSet = qryUnRFB
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'UnidadeDespachoCodigo'
      Size = 60
      Lookup = True
    end
    object qryDCGViaTransporteCodigo: TSmallintField
      FieldName = 'ViaTransporteCodigo'
      Origin = 'ViaTransporteCodigo'
    end
    object qryDCGViaTransporteDescricao: TStringField
      FieldName = 'ViaTransporteDescricao'
      Origin = 'ViaTransporteDescricao'
      Size = 30
    end
  end
  object updDCG: TFDUpdateSQL
    Connection = damConnection.DBCliente
    InsertSQL.Strings = (
      'INSERT INTO duimp.cargas'
      '(Id, FreteMoedaNegociadaSimbolo, FreteMoedaNegociadaValor, '
      
        '  Identificacao, IdentificacaoCargaTipo, MotivoSituacaoEspecialC' +
        'odigo, '
      '  PaisProcedenciaCodigo, SeguroMoedaNegociadaSimbolo, '
      '  SeguroMoedaNegociadaValor, UnidadeDespachoCodigo)'
      
        'VALUES (:NEW_Id, :NEW_FreteMoedaNegociadaSimbolo, :NEW_FreteMoed' +
        'aNegociadaValor, '
      
        '  :NEW_Identificacao, :NEW_IdentificacaoCargaTipo, :NEW_MotivoSi' +
        'tuacaoEspecialCodigo, '
      '  :NEW_PaisProcedenciaCodigo, :NEW_SeguroMoedaNegociadaSimbolo, '
      '  :NEW_SeguroMoedaNegociadaValor, :NEW_UnidadeDespachoCodigo);'
      
        'SELECT Id, FreteMoedaNegociadaSimbolo, FreteMoedaNegociadaValor,' +
        ' Identificacao, '
      
        '  IdentificacaoCargaTipo, MotivoSituacaoEspecialCodigo, PaisProc' +
        'edenciaCodigo, '
      '  SeguroMoedaNegociadaSimbolo, SeguroMoedaNegociadaValor, '
      '  UnidadeDespachoCodigo'
      'FROM duimp.cargas'
      'WHERE Id = :NEW_Id')
    FetchRowSQL.Strings = (
      
        'SELECT Id, FreteMoedaNegociadaSimbolo, FreteMoedaNegociadaValor,' +
        ' Identificacao, '
      
        '  IdentificacaoCargaTipo, MotivoSituacaoEspecialCodigo, PaisProc' +
        'edenciaCodigo, '
      '  SeguroMoedaNegociadaSimbolo, SeguroMoedaNegociadaValor, '
      '  UnidadeDespachoCodigo'
      'FROM duimp.cargas'
      'WHERE Id = :Id')
    Left = 146
    Top = 335
  end
  object qryACV: TFDQuery
    MasterSource = dsoDUV
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @VersaoId uniqueidentifier;'
      ''
      'SET @VersaoId = :Id;'
      ''
      'WITH Cotacao AS ('
      #9'SELECT VersaoId'
      
        #9',MoedaNegociadaValorCotacao = duimp.ValorCotacao(SUM(CondicaoVe' +
        'ndaValorBRL), NULLIF(SUM(CondicaoVendaValorMoedaNegociada), 0))'
      #9',MoedaNegociadaSimbolo'
      #9'FROM duimp.capas_itens'
      #9'WHERE VersaoId = @VersaoId'
      #9'GROUP BY VersaoId, MoedaNegociadaSimbolo'
      ')'
      ',Fobs AS ('
      #9'SELECT MoedaNegociadaSimbolo = DCI.MoedaNegociadaSimbolo'
      
        #9',MoedaNegociadaValor = SUM(DCI.CondicaoVendaValorMoedaNegociada' +
        'Vlc)'
      #9',MoedaNegociadaValorCotacao = CTA.MoedaNegociadaValorCotacao'
      #9'FROM duimp.capas_itens AS DCI'
      #9'JOIN Cotacao CTA'
      #9#9' ON CTA.VersaoId = DCI.VersaoId'
      #9#9'AND CTA.MoedaNegociadaSimbolo = DCI.MoedaNegociadaSimbolo'
      #9'WHERE DCI.VersaoId = @VersaoId'
      
        #9'GROUP BY DCI.MoedaNegociadaSimbolo, CTA.MoedaNegociadaValorCota' +
        'cao'
      ')'
      
        'SELECT MoedaNegociadaId = CAST(ROW_NUMBER() OVER (ORDER BY FOB.M' +
        'oedaNegociadaSimbolo) AS int)'
      ',MoedaNegociadaSimbolo = FOB.MoedaNegociadaSimbolo'
      ',MoedaNegociadaValor = FOB.MoedaNegociadaValor'
      ',MoedaNegociadaValorCotacao = FOB.MoedaNegociadaValorCotacao'
      'FROM Fobs AS FOB;')
    Left = 378
    Top = 207
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryACVMoedaNegociadaId: TIntegerField
      FieldName = 'MoedaNegociadaId'
      Origin = 'MoedaNegociadaId'
      ReadOnly = True
      Visible = False
    end
    object qryACVMoedaNegociadaSimbolo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Moeda'
      DisplayWidth = 4
      FieldName = 'MoedaNegociadaSimbolo'
      Origin = 'MoedaNegociada'
      Required = True
      Size = 3
    end
    object qryACVMoedaNegociadaValor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'MoedaNegociadaValor'
      Origin = 'MoedaNegociadaValor'
      ReadOnly = True
      DisplayFormat = ',0.0000;-,0.0000'
    end
    object qryACVMoedaNegociadaValorCotacao: TFloatField
      DisplayLabel = 'Cota'#231#227'o'
      DisplayWidth = 7
      FieldName = 'MoedaNegociadaValorCotacao'
      Origin = 'MoedaNegociadaValorCotacao'
      ReadOnly = True
      DisplayFormat = ',0.0000;-,0.0000'
    end
    object qryACVMoedaNegociadaValorBRL: TFloatField
      DefaultExpression = 'MoedaNegociadaValor * MoedaNegociadaValorCotacao'
      DisplayLabel = 'Valor (BRL)'
      FieldKind = fkInternalCalc
      FieldName = 'MoedaNegociadaValorBRL'
      Origin = 'Valor'
      ReadOnly = True
      DisplayFormat = ',0.0000;-,0.0000'
    end
  end
  object dsoACV: TDataSource
    DataSet = qryACV
    Left = 434
    Top = 207
  end
  object updDAD: TFDUpdateSQL
    Connection = damConnection.DBCliente
    InsertSQL.Strings = (
      'INSERT INTO duimp.acrescimos_deducoes'
      '(Id, DenominacaoCodigo, MoedaNegociadaSimbolo, '
      '  MoedaNegociadaValor, Tipo, ValorBRL, CapaItemId)'
      
        'VALUES (:NEW_Id, :NEW_DenominacaoCodigo, :NEW_MoedaNegociadaSimb' +
        'olo, '
      
        '  :NEW_MoedaNegociadaValor, :NEW_Tipo, :NEW_ValorBRL, :NEW_CapaI' +
        'temId);'
      
        'SELECT Id, DenominacaoCodigo, MoedaNegociadaSimbolo, MoedaNegoci' +
        'adaValor, '
      '  Tipo, ValorBRL, CapaItemId'
      'FROM duimp.acrescimos_deducoes'
      'WHERE Id = :NEW_Id')
    FetchRowSQL.Strings = (
      
        'SELECT Id, DenominacaoCodigo, MoedaNegociadaSimbolo, MoedaNegoci' +
        'adaValor, '
      '  Tipo, ValorBRL, CapaItemId'
      'FROM acrescimos_deducoes'
      'WHERE Id = :Id')
    Left = 146
    Top = 271
  end
  object qryFCV: TFDQuery
    MasterSource = dsoDUV
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @VersaoId uniqueidentifier;'
      ''
      'SET @VersaoId = :Id;'
      ''
      'WITH Cotacao AS ('
      #9'SELECT VersaoId'
      
        #9',MoedaNegociadaValorCotacao = duimp.ValorCotacao(SUM(CondicaoVe' +
        'ndaValorBRL), NULLIF(SUM(CondicaoVendaValorMoedaNegociada), 0))'
      #9',MoedaNegociadaSimbolo'
      #9'FROM duimp.capas_itens'
      #9'WHERE VersaoId = @VersaoId'
      #9'GROUP BY VersaoId, MoedaNegociadaSimbolo'
      ')'
      ',Fobs AS ('
      #9'SELECT MoedaNegociadaSimbolo = DCI.MoedaNegociadaSimbolo'
      #9',MoedaNegociadaValor = SUM(DCI.IncotermValorMoedaNegociadaVlc)'
      #9',MoedaNegociadaValorCotacao = CTA.MoedaNegociadaValorCotacao'
      #9'FROM duimp.capas_itens AS DCI'
      #9'JOIN Cotacao CTA'
      #9#9' ON CTA.VersaoId = DCI.VersaoId'
      #9#9'AND CTA.MoedaNegociadaSimbolo = DCI.MoedaNegociadaSimbolo'
      #9'WHERE DCI.VersaoId = @VersaoId'
      
        #9'GROUP BY DCI.MoedaNegociadaSimbolo, CTA.MoedaNegociadaValorCota' +
        'cao'
      ')'
      
        'SELECT MoedaNegociadaId = CAST(ROW_NUMBER() OVER (ORDER BY FOB.M' +
        'oedaNegociadaSimbolo) AS int)'
      ',MoedaNegociadaSimbolo = FOB.MoedaNegociadaSimbolo'
      ',MoedaNegociadaValor = FOB.MoedaNegociadaValor'
      ',MoedaNegociadaValorCotacao = FOB.MoedaNegociadaValorCotacao'
      'FROM Fobs AS FOB;')
    Left = 378
    Top = 80
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryFCVMoedaNegociadaId: TIntegerField
      FieldName = 'MoedaNegociadaId'
      Origin = 'MoedaNegociadaId'
      ReadOnly = True
      Visible = False
    end
    object qryFCVMoedaNegociadaSimbolo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Moeda'
      DisplayWidth = 4
      FieldName = 'MoedaNegociadaSimbolo'
      Origin = 'MoedaNegociadaSimbolo'
      Required = True
      Size = 3
    end
    object qryFCVMoedaNegociadaValor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'MoedaNegociadaValor'
      Origin = 'MoedaNegociadaValor'
      ReadOnly = True
      DisplayFormat = ',0.0000;-,0.0000'
    end
    object qryFCVMoedaNegociadaValorCotacao: TFloatField
      DisplayLabel = 'Cota'#231#227'o'
      DisplayWidth = 7
      FieldName = 'MoedaNegociadaValorCotacao'
      Origin = 'MoedaNegociadaValorCotacao'
      ReadOnly = True
      DisplayFormat = ',0.0000;-,0.0000'
    end
    object qryFCVMoedaNegociadaValorBRL: TFloatField
      DefaultExpression = 'MoedaNegociadaValor * MoedaNegociadaValorCotacao'
      DisplayLabel = 'Valor (BRL)'
      FieldKind = fkInternalCalc
      FieldName = 'MoedaNegociadaValorBRL'
      Origin = 'Valor'
      ReadOnly = True
      DisplayFormat = ',0.0000;-,0.0000'
    end
  end
  object dsoFCV: TDataSource
    DataSet = qryFCV
    Left = 434
    Top = 80
  end
  object dsoFSV: TDataSource
    DataSet = qryFSV
    Left = 434
    Top = 143
  end
  object qryFSV: TFDQuery
    MasterSource = dsoDUV
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @VersaoId UNIQUEIDENTIFIER;'
      ''
      'SET @VersaoId = :Id;'
      ''
      'WITH Cotacao AS ('
      #9'SELECT VersaoId'
      
        #9',MoedaNegociadaValorCotacao = duimp.ValorCotacao(SUM(CondicaoVe' +
        'ndaValorBRL), NULLIF(SUM(CondicaoVendaValorMoedaNegociada), 0))'
      #9',MoedaNegociadaSimbolo'
      #9'FROM duimp.capas_itens'
      #9'WHERE VersaoId = @VersaoId'
      #9'GROUP BY VersaoId, MoedaNegociadaSimbolo'
      ')'
      ',Fobs AS ('
      #9'SELECT MoedaNegociadaSimbolo = DCI.MoedaNegociadaSimbolo'
      #9',MoedaNegociadaValor = SUM(DCI.IncotermValorMoedaNegociada)'
      #9',MoedaNegociadaValorCotacao = CTA.MoedaNegociadaValorCotacao'
      #9'FROM duimp.capas_itens AS DCI'
      #9'JOIN Cotacao CTA'
      #9#9' ON CTA.VersaoId = DCI.VersaoId'
      #9#9'AND CTA.MoedaNegociadaSimbolo = DCI.MoedaNegociadaSimbolo'
      #9'WHERE DCI.VersaoId = @VersaoId'
      
        #9'GROUP BY DCI.MoedaNegociadaSimbolo, CTA.MoedaNegociadaValorCota' +
        'cao'
      ')'
      
        'SELECT MoedaNegociadaId = CAST(ROW_NUMBER() OVER (ORDER BY FOB.M' +
        'oedaNegociadaSimbolo) AS int)'
      ',MoedaNegociadaSimbolo = FOB.MoedaNegociadaSimbolo'
      ',MoedaNegociadaValor = FOB.MoedaNegociadaValor'
      ',MoedaNegociadaValorCotacao = FOB.MoedaNegociadaValorCotacao'
      'FROM Fobs AS FOB;')
    Left = 378
    Top = 143
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryFSVMoedaNegociadaId: TIntegerField
      FieldName = 'MoedaNegociadaId'
      Origin = 'MoedaNegociadaId'
      ReadOnly = True
      Visible = False
    end
    object qryFSVMoedaNegociadaSimbolo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Moeda'
      DisplayWidth = 4
      FieldName = 'MoedaNegociadaSimbolo'
      Origin = 'MoedaNegociadaSimbolo'
      Required = True
      Size = 3
    end
    object qryFSVMoedaNegociadaValor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'MoedaNegociadaValor'
      Origin = 'MoedaNegociadaValor'
      ReadOnly = True
      DisplayFormat = ',0.0000;-,0.0000'
    end
    object qryFSVMoedaNegociadaValorCotacao: TFloatField
      DisplayLabel = 'Cota'#231#227'o'
      DisplayWidth = 7
      FieldName = 'MoedaNegociadaValorCotacao'
      Origin = 'MoedaNegociadaValorCotacao'
      ReadOnly = True
      DisplayFormat = ',0.0000;-,0.0000'
    end
    object qryFSVMoedaNegociadaValorBRL: TFloatField
      DefaultExpression = 'MoedaNegociadaValor * MoedaNegociadaValorCotacao'
      DisplayLabel = 'Valor (BRL)'
      FieldKind = fkInternalCalc
      FieldName = 'MoedaNegociadaValorBRL'
      Origin = 'Valor'
      ReadOnly = True
      DisplayFormat = ',0.0000;-,0.0000'
    end
  end
  object sptDCI: TFDScript
    SQLScripts = <
      item
        Name = 'root'
        SQL.Strings = (
          '@Valuation'
          '@Incoterm'
          '@IncreasedValue'
          '@InvoiceItems'
          '@UpdateDuimpCapa'
          '@UpdateACVCouver'
          '@UpdateASVCouver'
          '@UpdateFCVCouver'
          '@UpdateFSVCouver'
          '@UpdateVADCouver')
      end
      item
        Name = 'Valuation'
        SQL.Strings = (
          'DECLARE @VersaoId uniqueidentifier;'
          ''
          'SET @VersaoId = :VersaoId;'
          ''
          'WITH Cotacao AS ('
          #9'SELECT VersaoId'
          
            #9',MoedaNegociadaValorCotacao = duimp.ValorCotacao(SUM(CondicaoVe' +
            'ndaValorBRL), NULLIF(SUM(CondicaoVendaValorMoedaNegociada), 0))'
          #9',MoedaNegociadaSimbolo'
          #9'FROM duimp.capas_itens'
          #9'WHERE VersaoId = @VersaoId'
          #9'GROUP BY VersaoId, MoedaNegociadaSimbolo'
          '),'
          'AcrescimosDeducoes AS ('
          #9'SELECT DAD.CapaItemId'
          #9',DAD.Tipo'
          #9',DAD.MoedaNegociadaSimbolo'
          
            #9',MoedaNegociadaCotacao = duimp.ValorCotacao(SUM(DAD.ValorBRL), ' +
            'NULLIF(SUM(DAD.MoedaNegociadaValor), 0))'
          #9',MoedaNegociadaValor = SUM(DAD.MoedaNegociadaValor)'
          #9'FROM duimp.capas_itens AS DCI'
          #9'JOIN duimp.acrescimos_deducoes AS DAD'
          #9#9'ON DCI.Id = DAD.CapaItemId'
          #9'WHERE DCI.VersaoId = @VersaoId'
          #9'AND DAD.Tipo IN ('#39'ACRESCIMO'#39', '#39'DEDUCAO'#39')'
          #9'GROUP BY DAD.CapaItemId, DAD.Tipo, DAD.MoedaNegociadaSimbolo'
          '),'
          'DuimpItens AS ('
          #9'SELECT DCI.Id'
          #9',DCI.QuantidadeComercial'
          #9',MoedaNegociadaValorVlc = '
          #9' SUM(DCI.CondicaoVendaValorMoedaNegociada) +'
          #9' COALESCE(SUM('
          #9#9'CASE '
          #9#9#9'WHEN DCI.MoedaNegociadaSimbolo = A.MoedaNegociadaSimbolo '
          #9#9#9#9'THEN A.MoedaNegociadaValor'
          
            #9#9#9'ELSE A.MoedaNegociadaValor * A.MoedaNegociadaCotacao / NULLIF' +
            '(CTA.MoedaNegociadaValorCotacao, 0)'
          #9#9'END'
          #9' ), 0) -'
          #9' COALESCE(SUM('
          #9#9'CASE '
          #9#9#9'WHEN DCI.MoedaNegociadaSimbolo = D.MoedaNegociadaSimbolo '
          #9#9#9#9'THEN D.MoedaNegociadaValor'
          
            #9#9#9'ELSE D.MoedaNegociadaValor * D.MoedaNegociadaCotacao / NULLIF' +
            '(CTA.MoedaNegociadaValorCotacao, 0)'
          #9#9'END'
          #9' ), 0)'
          #9',CTA.MoedaNegociadaValorCotacao'
          #9'FROM duimp.capas_itens AS DCI'
          #9'JOIN Cotacao AS CTA'
          #9#9' ON CTA.VersaoId = DCI.VersaoId'
          #9#9'AND DCI.MoedaNegociadaSimbolo = CTA.MoedaNegociadaSimbolo'
          #9'LEFT JOIN AcrescimosDeducoes AS A'
          #9#9' ON DCI.Id = A.CapaItemId'
          #9#9'AND A.Tipo = '#39'ACRESCIMO'#39
          #9'LEFT JOIN AcrescimosDeducoes AS D'
          #9#9' ON DCI.Id = D.CapaItemId'
          #9#9'AND D.Tipo = '#39'DEDUCAO'#39
          #9'WHERE DCI.VersaoId = @VersaoId'
          
            #9'GROUP BY DCI.Id, DCI.QuantidadeComercial, CTA.MoedaNegociadaVal' +
            'orCotacao'
          ')'
          'UPDATE duimp.capas_itens'
          
            'SET CondicaoVendaValorVlcBRL = DUI.MoedaNegociadaValorVlc * DUI.' +
            'MoedaNegociadaValorCotacao'
          
            ',CondicaoVendaValorMoedaNegociadaVlc = DUI.MoedaNegociadaValorVl' +
            'c'
          
            ',ValorUnitarioVlc = DUI.MoedaNegociadaValorVlc / DUI.QuantidadeC' +
            'omercial'
          
            ',ValorUnitarioVlcBRL = DUI.MoedaNegociadaValorVlc / DUI.Quantida' +
            'deComercial * DUI.MoedaNegociadaValorCotacao'
          'FROM DuimpItens AS DUI'
          'JOIN duimp.capas_itens AS DCI'
          #9'ON DUI.Id = DCI.Id;')
      end
      item
        Name = 'Incoterm'
        SQL.Strings = (
          'DECLARE @VersaoId uniqueidentifier;'
          ''
          'SET @VersaoId = :VersaoId;'
          ''
          'WITH Cotacao AS ('
          '    SELECT VersaoId'
          
            #9',MoedaNegociadaValorCotacao = duimp.ValorCotacao(SUM(CondicaoVe' +
            'ndaValorBRL), NULLIF(SUM(CondicaoVendaValorMoedaNegociada), 0))'
          #9',MoedaNegociadaSimbolo'
          '    FROM duimp.capas_itens'
          '    WHERE VersaoId = @VersaoId'
          '    GROUP BY VersaoId, MoedaNegociadaSimbolo'
          ')'
          ',FreteSeguro AS ('
          '    SELECT VersaoId = DCG.Id'
          
            #9',FreteMoedaNegociadaSimbolo = NULLIF(DCG.FreteMoedaNegociadaSim' +
            'bolo, '#39#39')'
          
            #9',FreteMoedaNegociadaValorCotacao = duimp.ValorCotacao(SUM(DCI.C' +
            'ondicaoVendaValorFreteBRL), NULLIF(DCG.FreteMoedaNegociadaValor,' +
            ' 0))'
          
            #9',SeguroMoedaNegociadaSimbolo = NULLIF(DCG.SeguroMoedaNegociadaS' +
            'imbolo, '#39#39')'
          
            #9',SeguroMoedaNegociadaValorCotacao = duimp.ValorCotacao(SUM(DCI.' +
            'CondicaoVendaValorSeguroBRL), NULLIF(DCG.SeguroMoedaNegociadaVal' +
            'or, 0))'
          '    FROM duimp.cargas AS DCG'
          '    JOIN duimp.capas_itens AS DCI '
          #9#9' ON DCG.Id = DCI.VersaoId'
          '    WHERE DCI.VersaoId = @VersaoId'
          
            '    GROUP BY DCG.Id, DCG.FreteMoedaNegociadaSimbolo, DCG.FreteMo' +
            'edaNegociadaValor,'
          #9#9'DCG.SeguroMoedaNegociadaSimbolo, DCG.SeguroMoedaNegociadaValor'
          ')'
          ',DuimpIncoterms AS ('
          #9'SELECT CapaItemId = DCI.Id'
          #9',MoedaNegociadaValor ='
          '     SUM(DCI.CondicaoVendaValorMoedaNegociada'
          #9#9'- COALESCE(CASE '
          
            #9#9#9'WHEN ICT.Frete = 0 AND CFS.FreteMoedaNegociadaSimbolo IS NOT ' +
            'NULL THEN'
          #9#9#9#9'CASE '
          
            #9#9#9#9#9'WHEN DCI.MoedaNegociadaSimbolo = CFS.FreteMoedaNegociadaSim' +
            'bolo THEN'
          
            #9#9#9#9#9#9'DCI.CondicaoVendaValorFreteBRL / NULLIF(CFS.FreteMoedaNego' +
            'ciadaValorCotacao, 0)'
          '                    ELSE'
          
            #9#9#9#9#9#9'(DCI.CondicaoVendaValorFreteBRL / NULLIF(CFS.FreteMoedaNeg' +
            'ociadaValorCotacao, 0))'
          
            '                         * (CFS.FreteMoedaNegociadaValorCotacao ' +
            '/ NULLIF(CTA.MoedaNegociadaValorCotacao, 0))'
          '                    END'
          #9#9#9#9'ELSE 0'
          #9#9#9'END'
          #9#9'  , 0)'
          '        - COALESCE(CASE '
          
            '            WHEN ICT.Seguro = 0 AND CFS.SeguroMoedaNegociadaSimb' +
            'olo IS NOT NULL THEN'
          #9#9#9#9'CASE '
          
            #9#9#9#9#9'WHEN DCI.MoedaNegociadaSimbolo = CFS.SeguroMoedaNegociadaSi' +
            'mbolo THEN'
          
            #9#9#9#9#9#9'(DCI.CondicaoVendaValorSeguroBRL / NULLIF(CFS.SeguroMoedaN' +
            'egociadaValorCotacao, 0))'
          #9#9#9#9#9'ELSE'
          
            #9#9#9#9#9#9'(DCI.CondicaoVendaValorSeguroBRL / NULLIF(CFS.SeguroMoedaN' +
            'egociadaValorCotacao, 0))'
          
            '                         * (CFS.SeguroMoedaNegociadaValorCotacao' +
            ' / NULLIF(CTA.MoedaNegociadaValorCotacao, 0))'
          #9#9#9#9#9'END'
          #9#9#9#9'ELSE 0'
          '            END'
          #9#9'  , 0))'
          #9',DCI.MoedaNegociadaSimbolo'
          #9',CTA.MoedaNegociadaValorCotacao'
          #9',DCI.QuantidadeComercial'
          '    FROM duimp.capas_itens AS DCI'
          '    JOIN Cybersoft_Cadastros.dbo.Incoterms AS ICT '
          #9#9'ON ICT.Codigo = DCI.IncotermCodigo'
          '    JOIN Cotacao AS CTA '
          
            #9#9'ON CTA.VersaoId = DCI.VersaoId AND CTA.MoedaNegociadaSimbolo =' +
            ' DCI.MoedaNegociadaSimbolo'
          '    JOIN FreteSeguro AS CFS '
          #9#9'ON CFS.VersaoId = DCI.VersaoId'
          '    WHERE DCI.VersaoId = @VersaoId'
          
            '    GROUP BY DCI.Id, DCI.MoedaNegociadaSimbolo, DCI.QuantidadeCo' +
            'mercial, '
          #9#9'CTA.MoedaNegociadaValorCotacao'
          ')'
          ',AcrescimosDeducoes AS ('
          '    SELECT DAD.CapaItemId'
          #9',DAD.Tipo'
          #9',DAD.MoedaNegociadaSimbolo'
          
            #9',MoedaNegociadaCotacao = duimp.ValorCotacao(SUM(DAD.ValorBRL), ' +
            'NULLIF(SUM(DAD.MoedaNegociadaValor), 0))'
          #9',MoedaNegociadaValor = SUM(DAD.MoedaNegociadaValor)'
          '    FROM duimp.acrescimos_deducoes AS DAD'
          #9'JOIN DuimpIncoterms AS DIM'
          #9#9'ON DIM.CapaItemId = DAD.CapaItemId'
          '    WHERE DAD.Tipo IN ('#39'ACRESCIMO'#39', '#39'DEDUCAO'#39')'
          '    GROUP BY DAD.CapaItemId, DAD.Tipo, DAD.MoedaNegociadaSimbolo'
          ')'
          ',DuimpItens AS ('
          #9'SELECT DIM.CapaItemId'
          #9',DIM.MoedaNegociadaValor'
          #9',MoedaNegociadaValorVlc ='
          #9' SUM(DIM.MoedaNegociadaValor)'
          #9#9'+ COALESCE(SUM(CASE '
          #9#9#9'WHEN DIM.MoedaNegociadaSimbolo = A.MoedaNegociadaSimbolo THEN'
          #9#9#9#9'A.MoedaNegociadaValor'
          #9#9#9'ELSE'
          
            #9#9#9#9'A.MoedaNegociadaValor * A.MoedaNegociadaCotacao / NULLIF(DIM' +
            '.MoedaNegociadaValorCotacao, 0)'
          #9#9#9'END)'
          #9#9'  , 0)'
          #9#9'- COALESCE(SUM(CASE '
          #9#9#9'WHEN DIM.MoedaNegociadaSimbolo = D.MoedaNegociadaSimbolo THEN'
          #9#9#9#9'D.MoedaNegociadaValor'
          #9#9#9'ELSE'
          
            #9#9#9#9'D.MoedaNegociadaValor * D.MoedaNegociadaCotacao / NULLIF(DIM' +
            '.MoedaNegociadaValorCotacao, 0)'
          #9#9#9'END)'
          #9#9'  , 0)'
          #9',DIM.MoedaNegociadaValorCotacao'
          #9',DIM.QuantidadeComercial'
          #9'FROM DuimpIncoterms AS DIM'
          #9'LEFT JOIN AcrescimosDeducoes AS A'
          #9#9' ON DIM.CapaItemId = A.CapaItemId'
          #9#9'AND A.Tipo = '#39'ACRESCIMO'#39
          #9'LEFT JOIN AcrescimosDeducoes AS D'
          #9#9' ON DIM.CapaItemId = D.CapaItemId '
          #9#9'AND D.Tipo = '#39'DEDUCAO'#39
          
            #9'GROUP BY DIM.CapaItemId, DIM.MoedaNegociadaValor, DIM.Quantidad' +
            'eComercial,'
          #9#9'DIM.MoedaNegociadaValorCotacao'
          ')'
          'UPDATE duimp.capas_itens'
          
            'SET IncotermValorBRL = DUI.MoedaNegociadaValor * DUI.MoedaNegoci' +
            'adaValorCotacao'
          
            ',IncotermValorVlcBRL = DUI.MoedaNegociadaValorVlc * DUI.MoedaNeg' +
            'ociadaValorCotacao'
          ',IncotermValorMoedaNegociada = DUI.MoedaNegociadaValor'
          ',IncotermValorMoedaNegociadaVlc = DUI.MoedaNegociadaValorVlc'
          
            ',IncotermValorUnitario = DUI.MoedaNegociadaValor / DUI.Quantidad' +
            'eComercial'
          
            ',IncotermValorUnitarioVlc = DUI.MoedaNegociadaValorVlc / DUI.Qua' +
            'ntidadeComercial'
          
            ',IncotermValorUnitarioBRL = DUI.MoedaNegociadaValor * DUI.MoedaN' +
            'egociadaValorCotacao / DUI.QuantidadeComercial'
          
            ',IncotermValorUnitarioVlcBRL = DUI.MoedaNegociadaValorVlc * DUI.' +
            'MoedaNegociadaValorCotacao / DUI.QuantidadeComercial'
          'FROM DuimpItens AS DUI'
          'JOIN duimp.capas_itens AS DCI'
          #9'ON DUI.CapaItemId = DCI.Id;')
      end
      item
        Name = 'IncreasedValue'
        SQL.Strings = (
          'DECLARE @VersaoId uniqueidentifier;'
          ''
          'SET @VersaoId = :VersaoId;'
          ''
          'WITH Tributos AS ('
          #9'SELECT ItemTributoCalculadoId = DTC.Id'
          #9',Majorado = '
          #9' SUM('
          #9#9'CASE'
          #9#9#9'WHEN DMC.TipoAliquota = '#39'AD_VALOREM'#39' OR DMC.TipoAliquota = '#39#39
          #9#9#9#9'THEN DVB.ARecolher'
          #9#9#9'ELSE DMC.ValorAliquotaEspecifica * DCI.QuantidadeComercial'
          #9#9'END)'
          #9'FROM duimp.versoes AS DUV'
          #9'JOIN duimp.tributos_calculados AS DTC'
          #9#9' ON DUV.Id = DTC.VersaoId'
          #9'JOIN duimp.capas_itens AS DCI'
          #9#9' ON DUV.Id = DCI.VersaoId'
          #9'JOIN duimp.itens_tributos AS DIT'
          #9#9' ON DCI.Id = DIT.CapaItemId'
          #9'JOIN duimp.itens_tributos_calculados AS DIC'
          #9#9' ON DTC.Tipo = DIC.Tipo'
          #9#9'AND DIT.Id = DIC.ItemTributoId'
          #9'JOIN duimp.itens_tributos_calculados_memorias_calculos AS DMC'
          #9#9' ON DIC.Id = DMC.ItemTributoCalculadoId'
          #9'JOIN duimp.itens_tributos_calculados_valores_brl AS DVB'
          #9#9' ON DMC.ItemTributoCalculadoId = DVB.ItemTributoCalculadoId'
          #9'WHERE DUV.Id = @VersaoId'
          #9'GROUP BY DTC.Id'
          ')'
          'UPDATE duimp.tributos_calculados_valores_brl'
          'SET Majorado = ISNULL(TRI.Majorado, 0)'
          'FROM duimp.tributos_calculados AS DTC'
          'JOIN duimp.tributos_calculados_valores_brl AS DVB'
          #9'ON DTC.Id = DVB.TributoCalculadoId'
          'LEFT OUTER JOIN Tributos AS TRI'
          #9'ON DTC.Id = TRI.ItemTributoCalculadoId'
          'WHERE DTC.VersaoId = @VersaoId;')
      end
      item
        Name = 'InvoiceItems'
        SQL.Strings = (
          'DECLARE @VersaoId uniqueidentifier;'
          ''
          'SET @VersaoId = :VersaoId;'
          ''
          'WITH Majorados AS ('
          #9'SELECT DISTINCT '
          #9' MAJ.Descricao'
          #9',MAJ.Modalidade'
          #9',MAJ.Entrada'
          #9',MAJ.Saida'
          #9',MAJ.Majorada'
          #9'FROM Cybersoft_Cadastros.dbo.Majoracao AS MAJ'
          #9'WHERE MAJ.Tipo = '#39'M'#39
          ')'
          ',DuimpItens AS ('
          #9'SELECT CapaItemId = DCI.Id'
          #9',DIC.Tipo'
          #9',NotaFiscalEntrada = '
          #9' CASE '
          #9#9'WHEN MAJ.Descricao IS NULL '
          #9#9#9'THEN DMC.ValorAliquota'
          #9#9'ELSE ISNULL(MAJ.Entrada, 0)'
          #9' END'
          #9',NotaFiscalSaida = '
          #9' CASE '
          #9#9'WHEN MAJ.Descricao IS NULL '
          #9#9#9'THEN DMC.ValorAliquota'
          #9#9'ELSE ISNULL(MAJ.Saida, 0)'
          #9' END'
          #9',NotaFiscalValor ='
          #9' CASE '
          #9#9'WHEN MAJ.Descricao IS NULL'
          #9#9#9'THEN DMC.ValorAliquotaEspecifica * DCI.QuantidadeComercial'
          #9#9'ELSE ISNULL((DMC.BaseCalculoBRL * MAJ.Entrada) / 100, 0)'
          #9' END'
          #9'FROM duimp.capas_itens AS DCI'
          #9'JOIN duimp.itens_tributos AS DIT'
          #9#9' ON DCI.Id = DIT.CapaItemId'
          #9'JOIN duimp.itens_tributos_calculados AS DIC'
          #9#9' ON DIT.Id = DIC.ItemTributoId'
          #9'JOIN duimp.itens_tributos_calculados_memorias_calculos AS DMC'
          #9#9' ON DIC.Id = DMC.ItemTributoCalculadoId'
          #9'JOIN duimp.modalidades AS MDL'
          #9#9' ON DCI.CaracterizacaoImportacaoIndicador = MDL.Id'
          #9'JOIN TiposProcesso AS TIP'
          #9#9' ON TIP.Codigo = MDL.TipoProcessoCodigo'
          #9'LEFT OUTER JOIN Majorados AS MAJ'
          #9#9' ON DIC.Tipo = MAJ.Descricao'
          #9#9'AND TIP.Codigo = MAJ.Modalidade'
          #9#9'AND DMC.ValorAliquota = MAJ.Majorada'
          #9'WHERE DCI.VersaoId = @VersaoId'
          ')'
          'INSERT INTO duimp.itens_notas_fiscais'
          'SELECT NEWID()'
          ',DCI.NotaFiscalEntrada'
          ',DCI.NotaFiscalSaida'
          ',DCI.Tipo'
          ',DCI.NotaFiscalValor'
          ',DCI.CapaItemId'
          'FROM DuimpItens AS DCI'
          'WHERE NOT EXISTS ('
          #9'SELECT 1'
          #9'FROM duimp.itens_notas_fiscais AS DNF'
          #9'WHERE DNF.Tipo = DCI.Tipo'
          #9'AND'#9'DNF.CapaItemId = DCI.CapaItemId'
          ');'
          ''
          'WITH Tributos AS ('
          #9'SELECT TributoCalculadoId = DTC.Id'
          #9',NotaFiscalValor = ISNULL(SUM(DNF.Valor), 0)'
          #9'FROM duimp.versoes AS DUV'
          #9'JOIN duimp.tributos_calculados AS DTC'
          #9#9' ON DUV.Id = DTC.VersaoId'
          #9'LEFT JOIN duimp.capas_itens AS DCI'
          #9#9' ON DUV.Id = DCI.VersaoId'
          #9'LEFT JOIN duimp.itens_notas_fiscais AS DNF'
          #9#9' ON DCI.Id = DNF.CapaItemId'
          #9#9'AND DTC.Tipo = DNF.Tipo'
          #9'WHERE DUV.Id = @VersaoId'
          #9'GROUP BY DTC.Id, DTC.Tipo'
          ')'
          'UPDATE duimp.tributos_calculados_valores_brl'
          'SET NotaFiscal = ISNULL(TRI.NotaFiscalValor, 0)'
          ',Diferenca = DVB.Majorado - ISNULL(TRI.NotaFiscalValor, 0)'
          'FROM duimp.tributos_calculados AS DTC'
          'JOIN duimp.tributos_calculados_valores_brl AS DVB'
          #9'ON DTC.Id = DVB.TributoCalculadoId'
          'LEFT JOIN Tributos AS TRI'
          #9'ON DTC.Id = TRI.TributoCalculadoId'
          'WHERE DTC.VersaoId = @VersaoId;')
      end
      item
        Name = 'UpdateDuimpCapa'
        SQL.Strings = (
          'DECLARE @VersaoId uniqueidentifier;'
          ''
          'SET @VersaoId = :VersaoId;'
          ''
          'WITH DuimpItens AS ('
          #9'SELECT DISTINCT TipoAplicacao'
          #9',CaracterizacaoImportacaoNI'
          #9'FROM duimp.capas_itens'
          #9'WHERE VersaoId = @VersaoId'
          ')'
          'UPDATE duimp.capas'
          'SET TipoAplicacao = DUC.TipoAplicacao'
          ',CaracterizacaoImportacaoNI = DUC.CaracterizacaoImportacaoNI'
          'FROM DuimpItens AS DUC;')
      end
      item
        Name = 'UpdateACVCouver'
        SQL.Strings = (
          'DECLARE @VersaoId uniqueidentifier;'
          ''
          'SET @VersaoId = :VersaoId;'
          ''
          'WITH Dolar AS ('
          #9'SELECT VersaoId = Id'
          
            #9',MoedaValorCotacao = duimp.ValorCotacao(SUM(ValorTotalLocalEmba' +
            'rqueBRL), NULLIF(SUM(ValorTotalLocalEmbarqueUSD), 1))'
          #9',MoedaSimbolo = '#39'USD'#39
          #9'FROM duimp.capas'
          #9'WHERE Id = @VersaoId'
          #9'GROUP BY Id'
          ')'
          ',Cotacao AS ('
          
            #9'SELECT MoedaNegociadaValorCotacao = duimp.ValorCotacao(SUM(Cond' +
            'icaoVendaValorBRL), NULLIF(SUM(CondicaoVendaValorMoedaNegociada)' +
            ', 1))'
          #9',MoedaNegociadaSimbolo'
          #9'FROM duimp.capas_itens'
          #9'WHERE VersaoId = @VersaoId'
          #9'GROUP BY MoedaNegociadaSimbolo'
          ')'
          ',Fobs AS ('
          #9'SELECT DCI.MoedaNegociadaSimbolo'
          
            #9#9',SUM(DCI.CondicaoVendaValorMoedaNegociadaVlc) AS MoedaNegociad' +
            'aValor'
          #9#9',CTA.MoedaNegociadaValorCotacao'
          #9'FROM duimp.capas_itens AS DCI'
          #9'JOIN Cotacao AS CTA '
          #9#9'ON CTA.MoedaNegociadaSimbolo = DCI.MoedaNegociadaSimbolo'
          #9'WHERE DCI.VersaoId = @VersaoId'
          
            #9'GROUP BY DCI.MoedaNegociadaSimbolo, CTA.MoedaNegociadaValorCota' +
            'cao'
          ')'
          ',FobAdicao AS ('
          #9'SELECT DOL.VersaoId'
          #9',MoedaNegociadaSimbolo = DOL.MoedaSimbolo'
          #9',MoedaNegociadaTipo = '#39'COM_VALORACAO'#39
          
            #9',MoedaNegociadaValor = SUM(FOB.MoedaNegociadaValor * FOB.MoedaN' +
            'egociadaValorCotacao / NULLIF(DOL.MoedaValorCotacao, 1))'
          #9',MoedaNegociadaValorCotacao = DOL.MoedaValorCotacao'
          
            #9',MoedaNegociadaValorBRL = SUM(FOB.MoedaNegociadaValor * FOB.Moe' +
            'daNegociadaValorCotacao / NULLIF(DOL.MoedaValorCotacao, 1)) * DO' +
            'L.MoedaValorCotacao'
          #9'FROM Fobs AS FOB'
          #9'CROSS JOIN Dolar AS DOL'
          #9'GROUP BY DOL.VersaoId, DOL.MoedaSimbolo, DOL.MoedaValorCotacao'
          ')'
          'SELECT *'
          'INTO #FobAdicao'
          'FROM FobAdicao;'
          ''
          'INSERT INTO duimp.valores_totais_fob_adicoes'
          'SELECT VersaoId'
          ',MoedaNegociadaSimbolo'
          ',MoedaNegociadaTipo'
          ',MoedaNegociadaValor'
          ',MoedaNegociadaValorCotacao'
          ',MoedaNegociadaValorBRL'
          'FROM #FobAdicao'
          'WHERE NOT EXISTS('
          #9'SELECT 1'
          #9'FROM duimp.valores_totais_fob_adicoes'
          #9'WHERE Id = VersaoId'
          #9'AND Tipo = MoedaNegociadaTipo'
          #9'AND Moeda = MoedaNegociadaSimbolo'
          ');'
          ''
          'UPDATE DUC'
          'SET FobAdicaoMoeda = ACV.MoedaNegociadaSimbolo'
          ',FobAdicaoTipo = ACV.MoedaNegociadaTipo'
          'FROM duimp.capas AS DUC'
          'INNER JOIN #FobAdicao AS ACV'
          #9'ON ACV.VersaoId = DUC.Id;'
          ''
          'DROP TABLE #FobAdicao;')
      end
      item
        Name = 'UpdateASVCouver'
        SQL.Strings = (
          'DECLARE @VersaoId uniqueidentifier;'
          ''
          'SET @VersaoId = :VersaoId;'
          ''
          'WITH Dolar AS ('
          #9'SELECT VersaoId = Id'
          
            #9',MoedaValorCotacao = duimp.ValorCotacao(SUM(ValorTotalLocalEmba' +
            'rqueBRL), NULLIF(SUM(ValorTotalLocalEmbarqueUSD), 1))'
          #9',MoedaSimbolo = '#39'USD'#39
          #9'FROM duimp.capas'
          #9'WHERE Id = @VersaoId'
          #9'GROUP BY Id'
          ')'
          ',Cotacao AS ('
          #9'SELECT VersaoId'
          
            #9',MoedaNegociadaValorCotacao = duimp.ValorCotacao(SUM(CondicaoVe' +
            'ndaValorBRL), NULLIF(SUM(CondicaoVendaValorMoedaNegociada), 0))'
          #9',MoedaNegociadaSimbolo'
          #9'FROM duimp.capas_itens'
          #9'WHERE VersaoId = @VersaoId'
          #9'GROUP BY VersaoId, MoedaNegociadaSimbolo'
          ')'
          ',Fobs AS ('
          #9'SELECT MoedaNegociadaSimbolo = DCI.MoedaNegociadaSimbolo'
          
            #9',MoedaNegociadaValor = SUM(DCI.CondicaoVendaValorMoedaNegociada' +
            ')'
          #9',MoedaNegociadaValorCotacao = CTA.MoedaNegociadaValorCotacao'
          #9'FROM duimp.capas_itens AS DCI'
          #9'JOIN Cotacao CTA'
          #9#9' ON CTA.VersaoId = DCI.VersaoId'
          #9#9'AND CTA.MoedaNegociadaSimbolo = DCI.MoedaNegociadaSimbolo'
          #9'WHERE DCI.VersaoId = @VersaoId'
          
            #9'GROUP BY DCI.MoedaNegociadaSimbolo, CTA.MoedaNegociadaValorCota' +
            'cao'
          ')'
          ',FobAdicao AS ('
          #9'SELECT DOL.VersaoId'
          #9',MoedaNegociadaSimbolo = DOL.MoedaSimbolo'
          #9',MoedaNegociadaTipo = '#39'SEM_VALORACAO'#39
          
            #9',MoedaNegociadaValor = SUM(FOB.MoedaNegociadaValor * FOB.MoedaN' +
            'egociadaValorCotacao / NULLIF(DOL.MoedaValorCotacao, 1))'
          #9',MoedaNegociadaValorCotacao = DOL.MoedaValorCotacao'
          
            #9',MoedaNegociadaValorBRL = SUM(FOB.MoedaNegociadaValor * FOB.Moe' +
            'daNegociadaValorCotacao / NULLIF(DOL.MoedaValorCotacao, 1)) * DO' +
            'L.MoedaValorCotacao'
          #9'FROM Fobs AS FOB'
          #9'CROSS JOIN Dolar AS DOL'
          #9'GROUP BY DOL.VersaoId, DOL.MoedaSimbolo, DOL.MoedaValorCotacao'
          ')'
          'INSERT INTO duimp.valores_totais_fob_adicoes'
          'SELECT ASV.VersaoId'
          ',ASV.MoedaNegociadaSimbolo'
          ',ASV.MoedaNegociadaTipo'
          ',ASV.MoedaNegociadaValor'
          ',ASV.MoedaNegociadaValorCotacao'
          ',ASV.MoedaNegociadaValorBRL'
          'FROM FobAdicao AS ASV'
          'WHERE NOT EXISTS ('
          #9'SELECT 1'
          #9'FROM duimp.valores_totais_fob_adicoes'
          #9'WHERE Id = ASV.VersaoId'
          #9'AND Tipo = ASV.MoedaNegociadaTipo'
          #9'AND Moeda = ASV.MoedaNegociadaSimbolo'
          ') AND EXISTS ('
          #9'SELECT 1'
          #9'FROM duimp.acrescimos_deducoes'
          #9'WHERE VersaoId = ASV.VersaoId'
          ');')
      end
      item
        Name = 'UpdateFCVCouver'
        SQL.Strings = (
          'DECLARE @VersaoId uniqueidentifier;'
          ''
          'SET @VersaoId = :VersaoId;'
          ''
          'WITH Dolar AS ('
          #9'SELECT VersaoId = Id'
          
            #9',MoedaValorCotacao = duimp.ValorCotacao(SUM(ValorTotalLocalEmba' +
            'rqueBRL), NULLIF(SUM(ValorTotalLocalEmbarqueUSD), 1))'
          #9',MoedaSimbolo = '#39'USD'#39
          #9'FROM duimp.capas'
          #9'WHERE Id = @VersaoId'
          #9'GROUP BY Id'
          ')'
          ',Cotacao AS ('
          
            #9'SELECT MoedaNegociadaValorCotacao = duimp.ValorCotacao(SUM(Cond' +
            'icaoVendaValorBRL), NULLIF(SUM(CondicaoVendaValorMoedaNegociada)' +
            ', 1))'
          #9',MoedaNegociadaSimbolo'
          #9'FROM duimp.capas_itens'
          #9'WHERE VersaoId = @VersaoId'
          #9'GROUP BY MoedaNegociadaSimbolo'
          ')'
          ',Fobs AS ('
          #9'SELECT DCI.MoedaNegociadaSimbolo'
          #9',SUM(DCI.IncotermValorMoedaNegociadaVlc) AS MoedaNegociadaValor'
          #9',CTA.MoedaNegociadaValorCotacao'
          #9'FROM duimp.capas_itens AS DCI'
          #9'JOIN Cotacao AS CTA '
          #9#9'ON CTA.MoedaNegociadaSimbolo = DCI.MoedaNegociadaSimbolo'
          #9'WHERE DCI.VersaoId = @VersaoId'
          
            #9'GROUP BY DCI.MoedaNegociadaSimbolo, CTA.MoedaNegociadaValorCota' +
            'cao'
          ')'
          ',Fob AS ('
          #9'SELECT DOL.VersaoId'
          #9',MoedaNegociadaSimbolo = DOL.MoedaSimbolo'
          #9',MoedaNegociadaTipo = '#39'COM_VALORACAO'#39
          
            #9',MoedaNegociadaValor = SUM(FOB.MoedaNegociadaValor * FOB.MoedaN' +
            'egociadaValorCotacao / NULLIF(DOL.MoedaValorCotacao, 1))'
          #9',MoedaNegociadaValorCotacao = DOL.MoedaValorCotacao'
          
            #9',MoedaNegociadaValorBRL = SUM(FOB.MoedaNegociadaValor * FOB.Moe' +
            'daNegociadaValorCotacao / NULLIF(DOL.MoedaValorCotacao, 1)) * DO' +
            'L.MoedaValorCotacao'
          #9'FROM Fobs AS FOB'
          #9'CROSS JOIN Dolar AS DOL'
          #9'GROUP BY DOL.VersaoId, DOL.MoedaSimbolo, DOL.MoedaValorCotacao'
          ')'
          'SELECT *'
          'INTO #FCV'
          'FROM Fob;'
          ''
          'INSERT INTO duimp.valores_totais_fob'
          'SELECT VersaoId'
          ',MoedaNegociadaSimbolo'
          ',MoedaNegociadaTipo'
          ',MoedaNegociadaValor'
          ',MoedaNegociadaValorCotacao'
          ',MoedaNegociadaValorBRL'
          'FROM #FCV'
          'WHERE NOT EXISTS('
          #9'SELECT 1'
          #9'FROM duimp.valores_totais_fob'
          #9'WHERE Id = VersaoId'
          #9'AND Tipo = MoedaNegociadaTipo'
          #9'AND Moeda = MoedaNegociadaSimbolo'
          ');'
          ''
          'UPDATE DUC'
          'SET FobMoeda = FCV.MoedaNegociadaSimbolo'
          ',FobTipo = FCV.MoedaNegociadaTipo'
          'FROM duimp.capas AS DUC'
          'INNER JOIN #FCV AS FCV'
          #9'ON FCV.VersaoId = DUC.Id;'
          ''
          'DROP TABLE #FCV;')
      end
      item
        Name = 'UpdateFSVCouver'
        SQL.Strings = (
          'DECLARE @VersaoId uniqueidentifier;'
          ''
          'SET @VersaoId = :VersaoId;'
          ''
          'WITH Dolar AS ('
          #9'SELECT VersaoId = Id'
          
            #9',MoedaValorCotacao = duimp.ValorCotacao(SUM(ValorTotalLocalEmba' +
            'rqueBRL), NULLIF(SUM(ValorTotalLocalEmbarqueUSD), 1))'
          #9',MoedaSimbolo = '#39'USD'#39
          #9'FROM duimp.capas'
          #9'WHERE Id = @VersaoId'
          #9'GROUP BY Id'
          ')'
          ',Cotacao AS ('
          #9'SELECT VersaoId'
          
            #9',MoedaNegociadaValorCotacao = duimp.ValorCotacao(SUM(CondicaoVe' +
            'ndaValorBRL), NULLIF(SUM(CondicaoVendaValorMoedaNegociada), 0))'
          #9',MoedaNegociadaSimbolo'
          #9'FROM duimp.capas_itens'
          #9'WHERE VersaoId = @VersaoId'
          #9'GROUP BY VersaoId, MoedaNegociadaSimbolo'
          ')'
          ',Fobs AS ('
          #9'SELECT MoedaNegociadaSimbolo = DCI.MoedaNegociadaSimbolo'
          #9',MoedaNegociadaValor = SUM(DCI.IncotermValorMoedaNegociada)'
          #9',MoedaNegociadaValorCotacao = CTA.MoedaNegociadaValorCotacao'
          #9'FROM duimp.capas_itens AS DCI'
          #9'JOIN Cotacao CTA'
          #9#9' ON CTA.VersaoId = DCI.VersaoId'
          #9#9'AND CTA.MoedaNegociadaSimbolo = DCI.MoedaNegociadaSimbolo'
          #9'WHERE DCI.VersaoId = @VersaoId'
          
            #9'GROUP BY DCI.MoedaNegociadaSimbolo, CTA.MoedaNegociadaValorCota' +
            'cao'
          ')'
          ',Fob AS ('
          #9'SELECT DOL.VersaoId'
          #9',MoedaNegociadaSimbolo = DOL.MoedaSimbolo'
          #9',MoedaNegociadaTipo = '#39'SEM_VALORACAO'#39
          
            #9',MoedaNegociadaValor = SUM(FOB.MoedaNegociadaValor * FOB.MoedaN' +
            'egociadaValorCotacao / NULLIF(DOL.MoedaValorCotacao, 1))'
          #9',MoedaNegociadaValorCotacao = DOL.MoedaValorCotacao'
          
            #9',MoedaNegociadaValorBRL = SUM(FOB.MoedaNegociadaValor * FOB.Moe' +
            'daNegociadaValorCotacao / NULLIF(DOL.MoedaValorCotacao, 1)) * DO' +
            'L.MoedaValorCotacao'
          #9'FROM Fobs AS FOB'
          #9'CROSS JOIN Dolar AS DOL'
          #9'GROUP BY DOL.VersaoId, DOL.MoedaSimbolo, DOL.MoedaValorCotacao'
          ')'
          'INSERT INTO duimp.valores_totais_fob'
          'SELECT FSV.VersaoId'
          ',FSV.MoedaNegociadaSimbolo'
          ',FSV.MoedaNegociadaTipo'
          ',FSV.MoedaNegociadaValor'
          ',FSV.MoedaNegociadaValorCotacao'
          ',FSV.MoedaNegociadaValorBRL'
          'FROM Fob AS FSV'
          'WHERE NOT EXISTS('
          #9'SELECT 1'
          #9'FROM duimp.valores_totais_fob'
          #9'WHERE Id = FSV.VersaoId'
          #9'AND Tipo = FSV.MoedaNegociadaTipo'
          #9'AND Moeda = FSV.MoedaNegociadaSimbolo'
          ') AND EXISTS ('
          #9'SELECT 1'
          #9'FROM duimp.acrescimos_deducoes'
          #9'WHERE VersaoId = FSV.VersaoId'
          ');')
      end
      item
        Name = 'UpdateVADCouver'
        SQL.Strings = (
          'DECLARE @VersaoId uniqueidentifier;'
          ''
          'SET @VersaoId = :VersaoId;'
          ''
          'WITH Dolar AS ('
          #9'SELECT VersaoId = Id'
          
            #9',MoedaValorCotacao = duimp.ValorCotacao(SUM(ValorTotalLocalEmba' +
            'rqueBRL), NULLIF(SUM(ValorTotalLocalEmbarqueUSD), 1))'
          #9',MoedaSimbolo = '#39'USD'#39
          #9'FROM duimp.capas'
          #9'WHERE Id = @VersaoId'
          #9'GROUP BY Id'
          ')'
          ',Cotacao AS ('
          #9'SELECT VersaoId'
          #9',MoedaNegociadaSimbolo'
          
            #9',MoedaNegociadaValorCotacao = duimp.ValorCotacao(SUM(CondicaoVe' +
            'ndaValorBRL), NULLIF(SUM(CondicaoVendaValorMoedaNegociada), 0))'
          #9'FROM duimp.capas_itens'
          #9'WHERE VersaoId = @VersaoId'
          #9'GROUP BY VersaoId, MoedaNegociadaSimbolo'
          ')'
          ',Acrescimos AS ('
          #9'SELECT DAD.MoedaNegociadaSimbolo'
          #9',MoedaNegociadaValor = SUM(DAD.MoedaNegociadaValor)'
          #9'FROM duimp.capas_itens AS DCI'
          #9'JOIN duimp.acrescimos_deducoes AS DAD'
          #9#9'ON DCI.Id = DAD.CapaItemId'
          #9'WHERE DCI.VersaoId = @VersaoId'
          #9'AND DAD.Tipo = '#39'ACRESCIMO'#39
          #9'GROUP BY DAD.MoedaNegociadaSimbolo'
          ')'
          ',Deducoes AS ('
          #9'SELECT DAD.MoedaNegociadaSimbolo'
          #9',MoedaNegociadaValor = SUM(DAD.MoedaNegociadaValor)'
          #9'FROM duimp.capas_itens AS DCI'
          #9'JOIN duimp.acrescimos_deducoes AS DAD'
          #9#9'ON DCI.Id = DAD.CapaItemId'
          #9'WHERE DCI.VersaoId = @VersaoId'
          #9'AND DAD.Tipo = '#39'DEDUCAO'#39
          #9'GROUP BY DAD.MoedaNegociadaSimbolo'
          ')'
          ',SaldosPorMoeda AS ('
          #9'SELECT C.MoedaNegociadaSimbolo'
          #9',MoedaNegociadaValorCotacao = C.MoedaNegociadaValorCotacao'
          
            #9',MoedaNegociadaValor = ISNULL(A.MoedaNegociadaValor, 0) - ISNUL' +
            'L(D.MoedaNegociadaValor, 0)'
          #9'FROM Cotacao C'
          #9'JOIN Acrescimos A'
          #9#9'ON A.MoedaNegociadaSimbolo = C.MoedaNegociadaSimbolo'
          #9'LEFT JOIN Deducoes D'
          #9#9'ON D.MoedaNegociadaSimbolo = C.MoedaNegociadaSimbolo'
          ')'
          ',ValoracaoAduaneira AS ('
          #9'SELECT VersaoId = @VersaoId'
          #9',MoedaNegociadaSimbolo = D.MoedaSimbolo'
          
            #9',MoedaNegociadaValor = SUM(S.MoedaNegociadaValor * S.MoedaNegoc' +
            'iadaValorCotacao / D.MoedaValorCotacao)'
          #9',D.MoedaValorCotacao'
          
            #9',MoedaNegociadaValorBRL = SUM(S.MoedaNegociadaValor * S.MoedaNe' +
            'gociadaValorCotacao)'
          #9'FROM SaldosPorMoeda S'
          #9'CROSS JOIN Dolar D'
          #9'GROUP BY D.MoedaSimbolo, D.MoedaValorCotacao'
          ')'
          'SELECT *'
          'INTO #ValoracaoAduaneira'
          'FROM ValoracaoAduaneira;'
          ''
          'INSERT INTO duimp.valores_totais_val_aduaneiras'
          'SELECT VersaoId'
          ',MoedaNegociadaSimbolo'
          ',MoedaNegociadaValor'
          ',MoedaValorCotacao'
          ',MoedaNegociadaValorBRL'
          'FROM #ValoracaoAduaneira'
          'WHERE NOT EXISTS('
          #9'SELECT 1'
          #9'FROM duimp.valores_totais_val_aduaneiras'
          #9'WHERE Id = VersaoId'
          #9'AND Moeda = MoedaNegociadaSimbolo'
          ');'
          ''
          'UPDATE DUC'
          'SET ValAduaneiraMoeda = VAD.MoedaNegociadaSimbolo'
          'FROM duimp.capas AS DUC'
          'INNER JOIN #ValoracaoAduaneira AS VAD'
          #9'ON VAD.VersaoId = DUC.Id;'
          ''
          'DROP TABLE #ValoracaoAduaneira;')
      end>
    Connection = damConnection.DBCliente
    ScriptOptions.BreakOnError = True
    ScriptOptions.CommandSeparator = '^'
    Params = <
      item
        Name = 'VersaoId'
        DataType = ftGuid
        ParamType = ptInput
      end>
    Macros = <>
    Left = 875
    Top = 16
  end
  object updDCI: TFDUpdateSQL
    Connection = damConnection.DBCliente
    InsertSQL.Strings = (
      'INSERT INTO duimp.capas_itens'
      '(Id, Adicao, Camex, CaracterizacaoImportacaoIndicador, '
      '  CaracterizacaoImportacaoNI, CondicaoVendaValorBRL, '
      '  CondicaoVendaValorVlcBRL, CondicaoVendaValorFreteBRL, '
      
        '  CondicaoVendaValorMoedaNegociada, CondicaoVendaValorMoedaNegoc' +
        'iadaVlc, '
      '  CondicaoVendaValorSeguroBRL, Dumping, FabricanteCodigo, '
      '  FabricanteCodigoPais, FabricanteNIOperador, FabricanteVersao, '
      '  ExportadorCodigo, ExportadorCodigoPais, ExportadorNIOperador, '
      '  ExportadorVersao, IncotermCodigo, IncotermValorBRL, '
      '  IncotermValorVlcBRL, IncotermValorMoedaNegociada, '
      '  IncotermValorMoedaNegociadaVlc, IncotermValorUnitario, '
      '  IncotermValorUnitarioVlc, MoedaNegociadaSimbolo, '
      
        '  NumeroItem, PesoLiquido, PesoLiquidoUnitario, ProdutoCodigo, P' +
        'rodutoDescricao, '
      '  ProdutoVersao, ProdutoNIResponsavel, QuantidadeComercial, '
      
        '  TipoAplicacao, UnidadeComercial, ValorUnitario, ValorUnitarioB' +
        'RL, VersaoId)'
      
        'VALUES (:NEW_Id, :NEW_Adicao, :NEW_Camex, :NEW_CaracterizacaoImp' +
        'ortacaoIndicador, '
      '  :NEW_CaracterizacaoImportacaoNI, :NEW_CondicaoVendaValorBRL, '
      
        '  :NEW_CondicaoVendaValorVlcBRL, :NEW_CondicaoVendaValorFreteBRL' +
        ', '
      
        '  :NEW_CondicaoVendaValorMoedaNegociada, :NEW_CondicaoVendaValor' +
        'MoedaNegociadaVlc, '
      
        '  :NEW_CondicaoVendaValorSeguroBRL, :NEW_Dumping, :NEW_Fabricant' +
        'eCodigo, '
      
        '  :NEW_FabricanteCodigoPais, :NEW_FabricanteNIOperador, :NEW_Fab' +
        'ricanteVersao, '
      
        '  :NEW_ExportadorCodigo, :NEW_ExportadorCodigoPais, :NEW_Exporta' +
        'dorNIOperador, '
      
        '  :NEW_ExportadorVersao, :NEW_IncotermCodigo, :NEW_IncotermValor' +
        'BRL, '
      '  :NEW_IncotermValorVlcBRL, :NEW_IncotermValorMoedaNegociada, '
      
        '  :NEW_IncotermValorMoedaNegociadaVlc, :NEW_IncotermValorUnitari' +
        'o, '
      '  :NEW_IncotermValorUnitarioVlc, :NEW_MoedaNegociadaSimbolo, '
      
        '  :NEW_NumeroItem, :NEW_PesoLiquido, :NEW_PesoLiquidoUnitario, :' +
        'NEW_ProdutoCodigo, :NEW_ProdutoDescricao, '
      
        '  :NEW_ProdutoVersao, :NEW_ProdutoNIResponsavel, :NEW_Quantidade' +
        'Comercial, '
      
        '  :NEW_TipoAplicacao, :NEW_UnidadeComercial, :NEW_ValorUnitario,' +
        ' :NEW_ValorUnitarioBRL, :NEW_VersaoId);'
      
        'SELECT Id, Adicao, Camex, CaracterizacaoImportacaoIndicador, Car' +
        'acterizacaoImportacaoNI, '
      
        '  CodigoFabricante, CondicaoVendaValorBRL, CondicaoVendaValorVlc' +
        'BRL, '
      '  CondicaoVendaValorFreteBRL, CondicaoVendaValorMoedaNegociada, '
      
        '  CondicaoVendaValorMoedaNegociadaVlc, CondicaoVendaValorSeguroB' +
        'RL, '
      
        '  Dumping, FabricanteCodigo, FabricanteCodigoPais, FabricanteNIO' +
        'perador, '
      '  FabricanteVersao, ExportadorCodigo, ExportadorCodigoPais, '
      '  ExportadorNIOperador, ExportadorVersao, IncotermCodigo, '
      
        '  IncotermValorBRL, IncotermValorVlcBRL, IncotermValorMoedaNegoc' +
        'iada, '
      
        '  IncotermValorMoedaNegociadaVlc, IncotermValorUnitario, Incoter' +
        'mValorUnitarioVlc, '
      
        '  MoedaNegociadaSimbolo, NumeroItem, PesoLiquido, PesoLiquidoUni' +
        'tario, '
      
        '  ProdutoCodigo, ProdutoDescricao, ProdutoVersao, ProdutoNIRespo' +
        'nsavel, '
      
        '  QuantidadeComercial, TipoAplicacao, UnidadeComercial, ValorUni' +
        'tario, ValorUnitarioBRL,'
      '  ValorUnitarioVlc, ValorUnitarioVlcBRL, VersaoId'
      'FROM duimp.capas_itens'
      'WHERE Id = :NEW_Id')
    ModifySQL.Strings = (
      'UPDATE duimp.capas_itens'
      
        'SET Id = :NEW_Id, Adicao = :NEW_Adicao, Camex = :NEW_Camex, Cara' +
        'cterizacaoImportacaoIndicador = :NEW_CaracterizacaoImportacaoInd' +
        'icador, '
      '  CaracterizacaoImportacaoNI = :NEW_CaracterizacaoImportacaoNI, '
      
        '  CondicaoVendaValorBRL = :NEW_CondicaoVendaValorBRL, CondicaoVe' +
        'ndaValorVlcBRL = :NEW_CondicaoVendaValorVlcBRL, '
      '  CondicaoVendaValorFreteBRL = :NEW_CondicaoVendaValorFreteBRL, '
      
        '  CondicaoVendaValorMoedaNegociada = :NEW_CondicaoVendaValorMoed' +
        'aNegociada, '
      
        '  CondicaoVendaValorMoedaNegociadaVlc = :NEW_CondicaoVendaValorM' +
        'oedaNegociadaVlc, '
      
        '  CondicaoVendaValorSeguroBRL = :NEW_CondicaoVendaValorSeguroBRL' +
        ', '
      
        '  Dumping = :NEW_Dumping, FabricanteCodigo = :NEW_FabricanteCodi' +
        'go, '
      
        '  FabricanteCodigoPais = :NEW_FabricanteCodigoPais, FabricanteNI' +
        'Operador = :NEW_FabricanteNIOperador, '
      
        '  FabricanteVersao = :NEW_FabricanteVersao, ExportadorCodigo = :' +
        'NEW_ExportadorCodigo, '
      
        '  ExportadorCodigoPais = :NEW_ExportadorCodigoPais, ExportadorNI' +
        'Operador = :NEW_ExportadorNIOperador, '
      
        '  ExportadorVersao = :NEW_ExportadorVersao, IncotermCodigo = :NE' +
        'W_IncotermCodigo, '
      
        '  IncotermValorBRL = :NEW_IncotermValorBRL, IncotermValorVlcBRL ' +
        '= :NEW_IncotermValorVlcBRL, '
      
        '  IncotermValorMoedaNegociada = :NEW_IncotermValorMoedaNegociada' +
        ', '
      
        '  IncotermValorMoedaNegociadaVlc = :NEW_IncotermValorMoedaNegoci' +
        'adaVlc, '
      
        '  IncotermValorUnitario = :NEW_IncotermValorUnitario, IncotermVa' +
        'lorUnitarioVlc = :NEW_IncotermValorUnitarioVlc, '
      
        '  MoedaNegociadaSimbolo = :NEW_MoedaNegociadaSimbolo, NumeroItem' +
        ' = :NEW_NumeroItem, '
      
        '  PesoLiquido = :NEW_PesoLiquido, PesoLiquidoUnitario = :NEW_Pes' +
        'oLiquidoUnitario, ProdutoCodigo = :NEW_ProdutoCodigo, '
      
        '  ProdutoDescricao = :NEW_ProdutoDescricao, ProdutoVersao = :NEW' +
        '_ProdutoVersao, '
      
        '  ProdutoNIResponsavel = :NEW_ProdutoNIResponsavel, QuantidadeCo' +
        'mercial = :NEW_QuantidadeComercial, '
      
        '  TipoAplicacao = :NEW_TipoAplicacao, UnidadeComercial = :NEW_Un' +
        'idadeComercial, '
      '  ValorUnitario = :NEW_ValorUnitario, VersaoId = :NEW_VersaoId,'
      '  ValorUnitarioBRL = :NEW_ValorUnitarioBRL'
      'WHERE Id = :OLD_Id;'
      
        'SELECT Id, Adicao, Camex, CaracterizacaoImportacaoIndicador, Car' +
        'acterizacaoImportacaoNI, '
      
        '  CodigoFabricante, CondicaoVendaValorBRL, CondicaoVendaValorVlc' +
        'BRL, '
      '  CondicaoVendaValorFreteBRL, CondicaoVendaValorMoedaNegociada, '
      
        '  CondicaoVendaValorMoedaNegociadaVlc, CondicaoVendaValorSeguroB' +
        'RL, '
      
        '  Dumping, FabricanteCodigo, FabricanteCodigoPais, FabricanteNIO' +
        'perador, '
      '  FabricanteVersao, ExportadorCodigo, ExportadorCodigoPais, '
      '  ExportadorNIOperador, ExportadorVersao, IncotermCodigo, '
      
        '  IncotermValorBRL, IncotermValorVlcBRL, IncotermValorMoedaNegoc' +
        'iada, '
      
        '  IncotermValorMoedaNegociadaVlc, IncotermValorUnitario, Incoter' +
        'mValorUnitarioVlc, '
      
        '  MoedaNegociadaSimbolo, NumeroItem, PesoLiquido, PesoLiquidoUni' +
        'tario, '
      
        '  ProdutoCodigo, ProdutoDescricao, ProdutoVersao, ProdutoNIRespo' +
        'nsavel, '
      
        '  QuantidadeComercial, TipoAplicacao, UnidadeComercial, ValorUni' +
        'tario, ValorUnitarioBRL,'
      '  ValorUnitarioVlc, ValorUnitarioVlcBRL, VersaoId'
      'FROM duimp.capas_itens'
      'WHERE Id = :NEW_Id')
    FetchRowSQL.Strings = (
      
        'SELECT Id, Adicao, Camex, CaracterizacaoImportacaoIndicador, Car' +
        'acterizacaoImportacaoNI, '
      
        '  CodigoFabricante, CondicaoVendaValorBRL, CondicaoVendaValorVlc' +
        'BRL, '
      '  CondicaoVendaValorFreteBRL, CondicaoVendaValorMoedaNegociada, '
      
        '  CondicaoVendaValorMoedaNegociadaVlc, CondicaoVendaValorSeguroB' +
        'RL, '
      
        '  Dumping, FabricanteCodigo, FabricanteCodigoPais, FabricanteNIO' +
        'perador, '
      '  FabricanteVersao, ExportadorCodigo, ExportadorCodigoPais, '
      '  ExportadorNIOperador, ExportadorVersao, IncotermCodigo, '
      
        '  IncotermValorBRL, IncotermValorVlcBRL, IncotermValorMoedaNegoc' +
        'iada, '
      
        '  IncotermValorMoedaNegociadaVlc, IncotermValorUnitario, Incoter' +
        'mValorUnitarioVlc, '
      
        '  MoedaNegociadaSimbolo, NumeroItem, PesoLiquido, PesoLiquidoUni' +
        'tario, '
      
        '  ProdutoCodigo, ProdutoDescricao, ProdutoVersao, ProdutoNIRespo' +
        'nsavel, '
      
        '  QuantidadeComercial, TipoAplicacao, UnidadeComercial, ValorUni' +
        'tario, ValorUnitarioBRL,'
      '  ValorUnitarioVlc, ValorUnitarioVlcBRL, VersaoId'
      'FROM duimp.capas_itens'
      'WHERE Id = :Id')
    Left = 146
    Top = 207
  end
  object qryDIA: TFDQuery
    OnNewRecord = qryDIANewRecord
    CachedUpdates = True
    IndexFieldNames = 'ItemTributoId'
    MasterSource = dsoDIT
    MasterFields = 'Id'
    DetailFields = 'ItemTributoId'
    Connection = damConnection.DBCliente
    UpdateOptions.AssignedValues = [uvCountUpdatedRecords]
    UpdateOptions.CountUpdatedRecords = False
    UpdateOptions.UpdateTableName = 'duimp.itens_tributos_aplicados'
    UpdateOptions.KeyFields = 'Id'
    UpdateObject = updDIA
    SQL.Strings = (
      'DECLARE @ItemTributoId uniqueidentifier;'
      ''
      'SET @ItemTributoId = :Id;'
      ''
      'SELECT DIA.Id'
      ',TributoCodigo = DIA.TributoCodigo'
      ',RegimeCodigo = DIA.RegimeCodigo'
      ',RegimeDescricao = RET.Descricao'
      ',FundamentoCodigo = DIA.FundamentoCodigo'
      ',FundamentoDescricao = FUL.Descricao'
      ',DIA.ItemTributoId'
      'FROM duimp.itens_tributos_aplicados AS DIA'
      'LEFT OUTER JOIN Cybersoft_Cadastros.dbo.RegimeTributacao AS RET'
      #9'ON RET.Codigo = DIA.RegimeCodigo'
      'LEFT OUTER JOIN Cybersoft_Cadastros.dbo.FundamentoLegal AS FUL'
      #9'ON FUL.Codigo = DIA.FundamentoCodigo'
      'WHERE DIA.ItemTributoId = @ItemTributoId;')
    Left = 24
    Top = 399
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDIAId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 38
    end
    object qryDIATributoCodigo: TStringField
      DisplayLabel = 'Tributo'
      FieldName = 'TributoCodigo'
      Origin = 'TributoCodigo'
      Required = True
      Size = 11
    end
    object qryDIARegimeCodigo: TIntegerField
      FieldName = 'RegimeCodigo'
      Origin = 'RegimeCodigo'
      Required = True
      Visible = False
    end
    object qryDIARegimeDescricao: TStringField
      DisplayLabel = 'Regime de Tributa'#231#227'o'
      FieldName = 'RegimeDescricao'
      ProviderFlags = [pfInWhere, pfHidden]
      Size = 35
    end
    object qryDIAFundamentoCodigo: TIntegerField
      FieldName = 'FundamentoCodigo'
      Origin = 'FundamentoCodigo'
      Required = True
      Visible = False
    end
    object qryDIAFundamentoDescricao: TStringField
      DisplayLabel = 'Fundamento'
      DisplayWidth = 35
      FieldName = 'FundamentoDescricao'
      Origin = 'FundamentoDescricao'
      Size = 8000
    end
    object qryDIAItemTributoId: TGuidField
      FieldName = 'ItemTributoId'
      Origin = 'ItemTributoId'
      Required = True
      Visible = False
      Size = 38
    end
  end
  object dsoDIA: TDataSource
    DataSet = qryDIA
    Left = 86
    Top = 399
  end
  object qryDAA: TFDQuery
    OnNewRecord = qryDAANewRecord
    CachedUpdates = True
    IndexFieldNames = 'ItemTributoAplicadoId'
    MasterSource = dsoDIA
    MasterFields = 'Id'
    DetailFields = 'ItemTributoAplicadoId'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.itens_tributos_aplicados_atributos'
    UpdateOptions.KeyFields = 'Id'
    SQL.Strings = (
      'DECLARE @ItemTributoId uniqueidentifier;'
      ''
      'SET @ItemTributoId = :Id;'
      ''
      'SELECT DAA.Id'
      ',DAA.Codigo'
      ',DAA.Valor'
      ',DAA.ItemTributoAplicadoId'
      'FROM duimp.itens_tributos_aplicados_atributos AS DAA'
      'WHERE DAA.Id = @ItemTributoId;')
    Left = 494
    Top = 16
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Size = 38
        Value = Null
      end>
    object qryDAAId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 38
    end
    object qryDAACodigo: TStringField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      Required = True
      Size = 14
    end
    object qryDAAValor: TStringField
      FieldName = 'Valor'
      Origin = 'Valor'
      Required = True
      Size = 8000
    end
    object qryDAAItemTributoAplicadoIdId: TGuidField
      FieldName = 'ItemTributoAplicadoId'
      Origin = 'ItemTributoAplicadoId'
      Required = True
      Visible = False
      Size = 38
    end
  end
  object dsoDAA: TDataSource
    DataSet = qryDAA
    Left = 556
    Top = 16
  end
  object updDIA: TFDUpdateSQL
    Connection = damConnection.DBCliente
    InsertSQL.Strings = (
      'INSERT INTO duimp.itens_tributos_aplicados'
      '(Id, TributoCodigo, RegimeCodigo, FundamentoCodigo, '
      '  ItemTributoId)'
      
        'VALUES (:NEW_Id, :NEW_TributoCodigo, :NEW_RegimeCodigo, :NEW_Fun' +
        'damentoCodigo, '
      '  :NEW_ItemTributoId);'
      
        'SELECT Id, TributoCodigo, RegimeCodigo, FundamentoCodigo, ItemTr' +
        'ibutoId'
      'FROM duimp.itens_tributos_aplicados'
      'WHERE Id = :NEW_Id')
    FetchRowSQL.Strings = (
      
        'SELECT Id, TributoCodigo, RegimeCodigo, FundamentoCodigo, ItemTr' +
        'ibutoId'
      'FROM duimp.itens_tributos_aplicados'
      'WHERE Id = :Id')
    Left = 146
    Top = 399
  end
  object qryASV: TFDQuery
    MasterSource = dsoDUV
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @VersaoId uniqueidentifier;'
      ''
      'SET @VersaoId = :Id;'
      ''
      'WITH Cotacao AS ('
      #9'SELECT VersaoId'
      
        #9',MoedaNegociadaValorCotacao = duimp.ValorCotacao(SUM(CondicaoVe' +
        'ndaValorBRL), NULLIF(SUM(CondicaoVendaValorMoedaNegociada), 0))'
      #9',MoedaNegociadaSimbolo'
      #9'FROM duimp.capas_itens'
      #9'WHERE VersaoId = @VersaoId'
      #9'GROUP BY VersaoId, MoedaNegociadaSimbolo'
      ')'
      ',Fobs AS ('
      #9'SELECT MoedaNegociadaSimbolo = DCI.MoedaNegociadaSimbolo'
      
        #9',MoedaNegociadaValor = SUM(DCI.CondicaoVendaValorMoedaNegociada' +
        ')'
      #9',MoedaNegociadaValorCotacao = CTA.MoedaNegociadaValorCotacao'
      #9'FROM duimp.capas_itens AS DCI'
      #9'JOIN Cotacao CTA'
      #9#9' ON CTA.VersaoId = DCI.VersaoId'
      #9#9'AND CTA.MoedaNegociadaSimbolo = DCI.MoedaNegociadaSimbolo'
      #9'WHERE DCI.VersaoId = @VersaoId'
      
        #9'GROUP BY DCI.MoedaNegociadaSimbolo, CTA.MoedaNegociadaValorCota' +
        'cao'
      ')'
      
        'SELECT MoedaNegociadaId = CAST(ROW_NUMBER() OVER (ORDER BY FOB.M' +
        'oedaNegociadaSimbolo) AS int)'
      ',MoedaNegociadaSimbolo = FOB.MoedaNegociadaSimbolo'
      ',MoedaNegociadaValor = FOB.MoedaNegociadaValor'
      ',MoedaNegociadaValorCotacao = FOB.MoedaNegociadaValorCotacao'
      'FROM Fobs AS FOB;')
    Left = 378
    Top = 271
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryASVMoedaNegociadaId: TIntegerField
      FieldName = 'MoedaNegociadaId'
      Origin = 'MoedaNegociadaId'
      ReadOnly = True
      Visible = False
    end
    object qryASVMoedaNegociadaSimbolo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Moeda'
      DisplayWidth = 4
      FieldName = 'MoedaNegociadaSimbolo'
      Origin = 'MoedaNegociada'
      Required = True
      Size = 3
    end
    object qryASVMoedaNegociadaValor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'MoedaNegociadaValor'
      Origin = 'MoedaNegociadaValor'
      ReadOnly = True
      DisplayFormat = ',0.0000;-,0.0000'
    end
    object qryASVMoedaNegociadaValorCotacao: TFloatField
      DisplayLabel = 'Cota'#231#227'o'
      DisplayWidth = 7
      FieldName = 'MoedaNegociadaValorCotacao'
      Origin = 'MoedaNegociadaValorCotacao'
      ReadOnly = True
      DisplayFormat = ',0.0000;-,0.0000'
    end
    object qryASVMoedaNegociadaValorBRL: TFloatField
      DefaultExpression = 'MoedaNegociadaValor * MoedaNegociadaValorCotacao'
      DisplayLabel = 'Valor (BRL)'
      FieldKind = fkInternalCalc
      FieldName = 'MoedaNegociadaValorBRL'
      Origin = 'Valor'
      ReadOnly = True
      DisplayFormat = ',0.0000;-,0.0000'
    end
  end
  object dsoASV: TDataSource
    DataSet = qryASV
    Left = 434
    Top = 271
  end
  object qryDTC: TFDQuery
    OnNewRecord = qryDTCNewRecord
    CachedUpdates = True
    MasterSource = dsoDUV
    MasterFields = 'Id'
    DetailFields = 'VersaoId'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.tributos_calculados'
    UpdateOptions.KeyFields = 'Id'
    SQL.Strings = (
      'DECLARE @VersaoId uniqueidentifier;'
      ''
      'SET @VersaoId = :Id;'
      ''
      'SELECT DTC.Id'
      ',DTC.Tipo'
      ',DTC.VersaoId'
      'FROM duimp.tributos_calculados AS DTC'
      'WHERE DTC.VersaoId = @VersaoId;')
    Left = 496
    Top = 143
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDTCId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      Required = True
      Visible = False
      Size = 38
    end
    object qryDTCTipo: TStringField
      DisplayLabel = 'C'#225'lculo dos Tributos'
      FieldName = 'Tipo'
      Origin = 'Tipo'
      Required = True
      Size = 17
    end
    object qryDTCVersaoId: TGuidField
      FieldName = 'VersaoId'
      Origin = 'VersaoId'
      Required = True
      Visible = False
      Size = 38
    end
  end
  object dsoDTC: TDataSource
    DataSet = qryDTC
    Left = 558
    Top = 143
  end
  object qryDTV: TFDQuery
    OnNewRecord = qryDTVNewRecord
    CachedUpdates = True
    IndexFieldNames = 'TributoCalculadoId;Id'
    MasterSource = dsoDTC
    MasterFields = 'Id'
    DetailFields = 'TributoCalculadoId'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.tributos_calculados_valores_brl'
    UpdateOptions.KeyFields = 'Id'
    SQL.Strings = (
      'DECLARE @TributoCalculadoId uniqueidentifier;'
      ''
      'SET @TributoCalculadoId = :Id;'
      ''
      'SELECT DTV.Id'
      ',DTV.Calculado'
      ',DTV.AReduzir'
      ',DTV.Devido'
      ',DTV.Suspenso'
      ',DTV.ARecolher'
      ',DTV.Recolhido'
      ',DTV.Majorado'
      ',DTV.Diferenca'
      ',DTV.TributoCalculadoId'
      'FROM duimp.tributos_calculados_valores_brl AS DTV'
      'WHERE DTV.TributoCalculadoId = @TributoCalculadoId;')
    Left = 746
    Top = 335
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDTVId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 38
    end
    object qryDTVCalculado: TFloatField
      FieldName = 'Calculado'
      Origin = 'Calculado'
      Required = True
    end
    object qryDTVAReduzir: TFloatField
      FieldName = 'AReduzir'
      Origin = 'AReduzir'
      Required = True
    end
    object qryDTVDevido: TFloatField
      FieldName = 'Devido'
      Origin = 'Devido'
      Required = True
    end
    object qryDTVSuspenso: TFloatField
      FieldName = 'Suspenso'
      Origin = 'Suspenso'
      Required = True
    end
    object qryDTVARecolher: TFloatField
      FieldName = 'ARecolher'
      Origin = 'ARecolher'
      Required = True
    end
    object qryDTVRecolhido: TFloatField
      FieldName = 'Recolhido'
      Origin = 'Recolhido'
      Required = True
    end
    object qryDTVMajorado: TFloatField
      FieldName = 'Majorado'
      Origin = 'Majorado'
      Required = True
    end
    object qryDTVDiferenca: TFloatField
      FieldName = 'Diferenca'
    end
    object qryDTVTributoCalculadoId: TGuidField
      FieldName = 'TributoCalculadoId'
      Origin = 'TributoCalculadoId'
      Required = True
      Visible = False
      Size = 38
    end
  end
  object dsoDTV: TDataSource
    DataSet = qryDTVSel
    Left = 558
    Top = 207
  end
  object qryDTVSel: TFDQuery
    MasterSource = dsoDUV
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'DECLARE @VersaoId uniqueidentifier;'
      ''
      'SET @VersaoId = :Id;'
      ''
      'SELECT DTV.Id'
      ',DTC.Tipo'
      ',DTV.Calculado'
      ',DTV.AReduzir'
      ',DTV.Devido'
      ',DTV.Suspenso'
      ',DTV.ARecolher'
      ',DTV.Recolhido'
      ',DTV.Majorado'
      ',DTV.Diferenca'
      ',DTV.NotaFiscal'
      ',DTV.TributoCalculadoId'
      ',DTC.VersaoId'
      'FROM duimp.tributos_calculados AS DTC'
      'JOIN duimp.tributos_calculados_valores_brl AS DTV'
      #9'ON DTC.Id = DTV.TributoCalculadoId'
      'WHERE DTC.VersaoId = @VersaoId;')
    Left = 496
    Top = 207
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDTVSelId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      Required = True
      Visible = False
      Size = 38
    end
    object qryDTVSelTipo: TStringField
      FieldName = 'Tipo'
      Origin = 'Tipo'
      Required = True
      Visible = False
      Size = 17
    end
    object qryDTVSelCalculado: TFloatField
      FieldName = 'Calculado'
      Origin = 'Calculado'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDTVSelAReduzir: TFloatField
      DisplayLabel = 'A Reduzir'
      FieldName = 'AReduzir'
      Origin = 'AReduzir'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDTVSelDevido: TFloatField
      FieldName = 'Devido'
      Origin = 'Devido'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDTVSelSuspenso: TFloatField
      FieldName = 'Suspenso'
      Origin = 'Suspenso'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDTVSelARecolher: TFloatField
      DisplayLabel = 'A Recolher'
      FieldName = 'ARecolher'
      Origin = 'ARecolher'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDTVSelRecolhido: TFloatField
      FieldName = 'Recolhido'
      Origin = 'Recolhido'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDTVSelMajorado: TFloatField
      FieldName = 'Majorado'
      Origin = 'Majorado'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDTVSelNotaFiscal: TFloatField
      DisplayLabel = 'Nota Fiscal'
      FieldName = 'NotaFiscal'
      Origin = 'NotaFiscal'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDTVSelDiferenca: TFloatField
      DisplayLabel = 'Diferen'#231'a'
      FieldName = 'Diferenca'
      Origin = 'Diferenca'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDTVSelTributoCalculadoId: TGuidField
      FieldName = 'TributoCalculadoId'
      Origin = 'TributoCalculadoId'
      Required = True
      Visible = False
      Size = 38
    end
    object qryDTVSelVersaoId: TGuidField
      FieldName = 'VersaoId'
      Origin = 'VersaoId'
      Required = True
      Visible = False
      Size = 38
    end
  end
  object qryDIC: TFDQuery
    OnNewRecord = qryDICNewRecord
    CachedUpdates = True
    IndexFieldNames = 'ItemTributoId'
    MasterSource = dsoDIT
    MasterFields = 'Id'
    DetailFields = 'ItemTributoId'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.itens_tributos_calculados'
    UpdateOptions.KeyFields = 'Id'
    SQL.Strings = (
      'DECLARE @ItemTributoId uniqueidentifier;'
      ''
      'SET @ItemTributoId = :Id;'
      ''
      'SELECT DIC.Id'
      ',DIC.Tipo'
      ',DIC.ItemTributoId'
      'FROM duimp.itens_tributos_calculados AS DIC'
      'WHERE DIC.ItemTributoId = @ItemTributoId;')
    Left = 378
    Top = 335
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDICId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 38
    end
    object qryDICTipo: TStringField
      DisplayLabel = 'Tributo'
      FieldName = 'Tipo'
      Origin = 'Tipo'
      Required = True
      Size = 17
    end
    object qryDICItemTributoId: TGuidField
      FieldName = 'ItemTributoId'
      Origin = 'ItemTributoId'
      Required = True
      Visible = False
      Size = 38
    end
  end
  object dsoDIC: TDataSource
    DataSet = qryDIC
    Left = 434
    Top = 335
  end
  object qryDVB: TFDQuery
    OnNewRecord = qryDVBNewRecord
    CachedUpdates = True
    IndexFieldNames = 'ItemTributoCalculadoId;Id'
    MasterSource = dsoDIC
    MasterFields = 'Id'
    DetailFields = 'ItemTributoCalculadoId'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.itens_tributos_calculados_valores_brl'
    UpdateOptions.KeyFields = 'Id'
    SQL.Strings = (
      'DECLARE @ItemTributoCalculadoId uniqueidentifier;'
      ''
      'SET @ItemTributoCalculadoId = :Id;'
      ''
      'SELECT DVB.Id'
      ',DVB.Calculado'
      ',DVB.AReduzir'
      ',DVB.Devido'
      ',DVB.Suspenso'
      ',DVB.ARecolher'
      ',DVB.OriginalDevido'
      ',DVB.CalculadoPagProporcional'
      ',DVB.ItemTributoCalculadoId'
      'FROM duimp.itens_tributos_calculados_valores_brl AS DVB'
      'WHERE DVB.Id = @ItemTributoCalculadoId;')
    Left = 378
    Top = 399
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDVBId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object qryDVBCalculado: TFloatField
      FieldName = 'Calculado'
      Origin = 'Calculado'
      Required = True
    end
    object qryDVBAReduzir: TFloatField
      FieldName = 'AReduzir'
      Origin = 'AReduzir'
      Required = True
    end
    object qryDVBDevido: TFloatField
      FieldName = 'Devido'
      Origin = 'Devido'
      Required = True
    end
    object qryDVBSuspenso: TFloatField
      FieldName = 'Suspenso'
      Origin = 'Suspenso'
      Required = True
    end
    object qryDVBARecolher: TFloatField
      FieldName = 'ARecolher'
      Origin = 'ARecolher'
      Required = True
    end
    object qryDVBOriginalDevido: TFloatField
      FieldName = 'OriginalDevido'
      Origin = 'OriginalDevido'
      Required = True
    end
    object qryDVBCalculadoPagProporcional: TFloatField
      FieldName = 'CalculadoPagProporcional'
      Origin = 'CalculadoPagProporcional'
      Required = True
    end
    object qryDVBItemTributoCalculadoId: TGuidField
      FieldName = 'ItemTributoCalculadoId'
      Origin = 'ItemTributoCalculadoId'
      Required = True
      Size = 38
    end
  end
  object dsoDVB: TDataSource
    DataSet = qryDVB
    Left = 434
    Top = 399
  end
  object qryDMC: TFDQuery
    OnNewRecord = qryDMCNewRecord
    CachedUpdates = True
    IndexFieldNames = 'ItemTributoCalculadoId;Id'
    MasterSource = dsoDIC
    MasterFields = 'Id'
    DetailFields = 'ItemTributoCalculadoId'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.itens_tributos_calculados_memorias_calculos'
    UpdateOptions.KeyFields = 'Id'
    SQL.Strings = (
      'DECLARE @ItemTributoCalculadoId uniqueidentifier;'
      ''
      'SET @ItemTributoCalculadoId = :Id;'
      ''
      'SELECT DMC.Id'
      ',DMC.CodigoFundamentoLegalNormal'
      ',DMC.BaseCalculoBRL'
      ',DMC.BaseCalculoEspecificaBRL'
      ',DMC.BaseCalculoReduzidaBRL'
      ',DMC.PercentualReducaoBaseCalculo'
      ',DMC.TipoAliquota'
      ',DMC.PercentualReducaoAliquotaReduzida'
      ',DMC.ValorAliquota'
      ',DMC.ValorAliquotaEspecifica'
      ',DMC.ValorAliquotaReduzida'
      ',DMC.Normal'
      ',DMC.Tributado'
      ',DMC.PercentualPagamento'
      ',DMC.ItemTributoCalculadoId'
      'FROM duimp.itens_tributos_calculados_memorias_calculos AS DMC'
      'WHERE DMC.ItemTributoCalculadoId = @ItemTributoCalculadoId;')
    Left = 496
    Top = 399
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Size = 38
        Value = Null
      end>
    object qryDMCId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object qryDMCCodigoFundamentoLegalNormal: TIntegerField
      FieldName = 'CodigoFundamentoLegalNormal'
      Origin = 'CodigoFundamentoLegalNormal'
      Required = True
    end
    object qryDMCBaseCalculoBRL: TFloatField
      FieldName = 'BaseCalculoBRL'
      Origin = 'BaseCalculoBRL'
      Required = True
    end
    object qryDMCBaseCalculoEspecificaBRL: TFloatField
      FieldName = 'BaseCalculoEspecificaBRL'
      Origin = 'BaseCalculoEspecificaBRL'
      Required = True
    end
    object qryDMCBaseCalculoReduzidaBRL: TFloatField
      FieldName = 'BaseCalculoReduzidaBRL'
      Origin = 'BaseCalculoReduzidaBRL'
      Required = True
    end
    object qryDMCPercentualReducaoBaseCalculo: TFloatField
      FieldName = 'PercentualReducaoBaseCalculo'
      Origin = 'PercentualReducaoBaseCalculo'
      Required = True
    end
    object qryDMCTipoAliquota: TStringField
      FieldName = 'TipoAliquota'
      Origin = 'TipoAliquota'
      Required = True
      Size = 10
    end
    object qryDMCPercentualReducaoAliquotaReduzida: TFloatField
      FieldName = 'PercentualReducaoAliquotaReduzida'
      Origin = 'PercentualReducaoAliquotaReduzida'
      Required = True
    end
    object qryDMCValorAliquota: TFloatField
      FieldName = 'ValorAliquota'
      Origin = 'ValorAliquota'
      Required = True
    end
    object qryDMCValorAliquotaEspecifica: TFloatField
      FieldName = 'ValorAliquotaEspecifica'
      Origin = 'ValorAliquotaEspecifica'
      Required = True
    end
    object qryDMCValorAliquotaReduzida: TFloatField
      FieldName = 'ValorAliquotaReduzida'
      Origin = 'ValorAliquotaReduzida'
      Required = True
    end
    object qryDMCNormal: TFloatField
      FieldName = 'Normal'
      Origin = 'Normal'
      Required = True
    end
    object qryDMCTributado: TBooleanField
      FieldName = 'Tributado'
      Origin = 'Tributado'
      Required = True
    end
    object qryDMCPercentualPagamento: TFloatField
      FieldName = 'PercentualPagamento'
      Origin = 'PercentualPagamento'
      Required = True
    end
    object qryDMCItemTributoCalculadoId: TGuidField
      FieldName = 'ItemTributoCalculadoId'
      Origin = 'ItemTributoCalculadoId'
      Required = True
      Size = 38
    end
  end
  object dsoDMC: TDataSource
    DataSet = qryDMC
    Left = 558
    Top = 399
  end
  object qryDICSel: TFDQuery
    IndexFieldNames = 'ItemTributoId;Id'
    MasterSource = dsoDIT
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @ItemTributoId uniqueidentifier;'
      ''
      'SET @ItemTributoId = :Id;'
      ''
      'SELECT DIC.Id'
      ',DMC.CodigoFundamentoLegalNormal'
      ',DescricaoFundamentoLegalNormal = FUL.Descricao'
      ',DMC.BaseCalculoBRL'
      ',DMC.BaseCalculoEspecificaBRL'
      ',DMC.BaseCalculoReduzidaBRL'
      ',DMC.PercentualReducaoBaseCalculo'
      ',DMC.TipoAliquota'
      ',DMC.PercentualReducaoAliquotaReduzida'
      ',DMC.ValorAliquota'
      ',DMC.ValorAliquotaEspecifica'
      ',DMC.ValorAliquotaReduzida'
      ',DMC.Normal'
      ',DMC.Tributado'
      ',DMC.PercentualPagamento'
      ',DVB.Calculado'
      ',DVB.AReduzir'
      ',DVB.Devido'
      ',DVB.Suspenso'
      ',DVB.ARecolher'
      ',DVB.OriginalDevido'
      ',DVB.CalculadoPagProporcional'
      ',DIC.ItemTributoId'
      'FROM duimp.itens_tributos_calculados AS DIC'
      'JOIN duimp.itens_tributos_calculados_memorias_calculos AS DMC'
      #9'ON DIC.Id = DMC.ItemTributoCalculadoId'
      'JOIN duimp.itens_tributos_calculados_valores_brl AS DVB'
      #9'ON DIC.Id = DVB.ItemTributoCalculadoId'
      'LEFT JOIN Cybersoft_Cadastros.dbo.FundamentoLegal AS FUL'
      #9'ON FUL.Codigo = DMC.CodigoFundamentoLegalNormal'
      'WHERE DIC.ItemTributoId = @ItemTributoId;')
    Left = 616
    Top = 399
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Size = 38
        Value = Null
      end>
    object qryDICSelId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      Required = True
      Visible = False
      Size = 38
    end
    object qryDICSelCodigoFundamentoLegalNormal: TIntegerField
      FieldName = 'CodigoFundamentoLegalNormal'
      Origin = 'CodigoFundamentoLegalNormal'
      Required = True
      Visible = False
    end
    object qryDICSelDescricaoFundamentoLegalNormal: TStringField
      DisplayLabel = 'Fundamento legal normal'
      DisplayWidth = 20
      FieldName = 'DescricaoFundamentoLegalNormal'
      Origin = 'DescricaoFundamentoLegalNormal'
      Size = 8000
    end
    object qryDICSelBaseCalculoBRL: TFloatField
      DisplayLabel = 'Base de C'#225'lculo (R$)'
      FieldName = 'BaseCalculoBRL'
      Origin = 'BaseCalculoBRL'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDICSelBaseCalculoEspecificaBRL: TFloatField
      FieldName = 'BaseCalculoEspecificaBRL'
      Origin = 'BaseCalculoEspecificaBRL'
      Required = True
      Visible = False
    end
    object qryDICSelBaseCalculoReduzidaBRL: TFloatField
      FieldName = 'BaseCalculoReduzidaBRL'
      Origin = 'BaseCalculoReduzidaBRL'
      Required = True
      Visible = False
    end
    object qryDICSelPercentualReducaoBaseCalculo: TFloatField
      FieldName = 'PercentualReducaoBaseCalculo'
      Origin = 'PercentualReducaoBaseCalculo'
      Required = True
      Visible = False
    end
    object qryDICSelTipoAliquota: TStringField
      DisplayLabel = 'Tipo de Al'#237'quota'
      FieldName = 'TipoAliquota'
      Origin = 'TipoAliquota'
      Required = True
      Size = 10
    end
    object qryDICSelPercentualReducaoAliquotaReduzida: TFloatField
      FieldName = 'PercentualReducaoAliquotaReduzida'
      Origin = 'PercentualReducaoAliquotaReduzida'
      Required = True
      Visible = False
    end
    object qryDICSelValorAliquota: TFloatField
      DisplayLabel = 'Percentual (%)'
      FieldName = 'ValorAliquota'
      Origin = 'ValorAliquota'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDICSelValorAliquotaEspecifica: TFloatField
      FieldName = 'ValorAliquotaEspecifica'
      Origin = 'ValorAliquotaEspecifica'
      Required = True
      Visible = False
    end
    object qryDICSelValorAliquotaReduzida: TFloatField
      FieldName = 'ValorAliquotaReduzida'
      Origin = 'ValorAliquotaReduzida'
      Required = True
      Visible = False
    end
    object qryDICSelNormal: TFloatField
      DisplayLabel = 'Valor calculado (R$)'
      FieldName = 'Normal'
      Origin = 'Normal'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDICSelTributado: TBooleanField
      FieldName = 'Tributado'
      Origin = 'Tributado'
      Required = True
      Visible = False
    end
    object qryDICSelPercentualPagamento: TFloatField
      FieldName = 'PercentualPagamento'
      Origin = 'PercentualPagamento'
      Required = True
      Visible = False
    end
    object qryDICSelCalculado: TFloatField
      FieldName = 'Calculado'
      Origin = 'Calculado'
      Required = True
      Visible = False
    end
    object qryDICSelAReduzir: TFloatField
      FieldName = 'AReduzir'
      Origin = 'AReduzir'
      Required = True
      Visible = False
    end
    object qryDICSelDevido: TFloatField
      DisplayLabel = 'Valor devido (R$)'
      FieldName = 'Devido'
      Origin = 'Devido'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDICSelSuspenso: TFloatField
      FieldName = 'Suspenso'
      Origin = 'Suspenso'
      Required = True
      Visible = False
    end
    object qryDICSelARecolher: TFloatField
      DisplayLabel = 'Valor a recolher (R$)'
      FieldName = 'ARecolher'
      Origin = 'ARecolher'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDICSelOriginalDevido: TFloatField
      FieldName = 'OriginalDevido'
      Origin = 'OriginalDevido'
      Required = True
      Visible = False
    end
    object qryDICSelCalculadoPagProporcional: TFloatField
      FieldName = 'CalculadoPagProporcional'
      Origin = 'CalculadoPagProporcional'
      Required = True
      Visible = False
    end
    object qryDICSelItemTributoId: TGuidField
      FieldName = 'ItemTributoId'
      Origin = 'ItemTributoId'
      Required = True
      Visible = False
      Size = 38
    end
  end
  object dsoDICSel: TDataSource
    DataSet = qryDICSel
    Left = 680
    Top = 399
  end
  object dsoDUV: TDataSource
    DataSet = qryDUV
    OnStateChange = dsoStateChange
    OnDataChange = dsoDataChange
    Left = 88
    Top = 80
  end
  object qryMOD: TFDQuery
    IndexFieldNames = 'CaracterizacaoImportacaoIndicador'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'SELECT ModalidadeCodigo = TIP.Codigo'
      ',ModalidadeDescricao = TIP.Descricao'
      ',CaracterizacaoImportacaoIndicador = MDL.Id'
      'FROM TiposProcesso AS TIP'
      'JOIN duimp.modalidades AS MDL'
      #9'ON TIP.Codigo = MDL.TipoProcessoCodigo;')
    Left = 746
    Top = 207
    object qryMODModalidadeCodigo: TIntegerField
      FieldName = 'ModalidadeCodigo'
      Origin = 'ModalidadeCodigo'
      Required = True
    end
    object qryMODModalidadeDescricao: TStringField
      FieldName = 'ModalidadeDescricao'
      Origin = 'ModalidadeDescricao'
      Size = 30
    end
    object qryMODCaracterizacaoImportacaoIndicador: TStringField
      FieldName = 'CaracterizacaoImportacaoIndicador'
      Origin = 'CaracterizacaoImportacaoIndicador'
      Size = 28
    end
  end
  object qryDRR: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'Id'
    MasterSource = dsoDUV
    MasterFields = 'Id'
    DetailFields = 'Id'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.resultados_analises_riscos'
    UpdateOptions.KeyFields = 'Id'
    UpdateObject = updDRR
    SQL.Strings = (
      'DECLARE @VersaoId uniqueidentifier;'
      ''
      'SET @VersaoId = :Id;'
      ''
      'SELECT DRA.Id'
      ',DRA.CanalConsolidado'
      ',CAC.Exibicao'
      ',CAC.Valor'
      'FROM duimp.resultados_analises_riscos AS DRA'
      'JOIN duimp.canais_consolidados AS CAC'
      #9'ON CAC.Id = DRA.CanalConsolidado'
      'WHERE DRA.Id = @VersaoId;')
    Left = 203
    Top = 207
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDRRId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object qryDRRExibicao: TStringField
      FieldName = 'Exibicao'
      Origin = 'Exibicao'
      Size = 30
    end
    object qryDRRCanalConsolidado: TStringField
      FieldName = 'CanalConsolidado'
      Origin = 'CanalConsolidado'
      Required = True
      Size = 8
    end
    object qryDRRValor: TStringField
      FieldName = 'Valor'
      Origin = 'Valor'
      Size = 8
    end
  end
  object dsoDRR: TDataSource
    DataSet = qryDRR
    Left = 265
    Top = 207
  end
  object qryDRA: TFDQuery
    OnNewRecord = qryDRANewRecord
    CachedUpdates = True
    IndexFieldNames = 'ResultadoAnaliseRiscoId'
    MasterSource = dsoDRR
    MasterFields = 'Id'
    DetailFields = 'ResultadoAnaliseRiscoId'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.resultados_anuentes'
    UpdateOptions.KeyFields = 'Id'
    SQL.Strings = (
      'DECLARE @ResultadoAnaliseRiscoId uniqueidentifier;'
      ''
      'SET @ResultadoAnaliseRiscoId = :Id;'
      ''
      'SELECT DRA.Id'
      ',DRA.Orgao'
      ',DRA.Resultado'
      ',DRA.ResultadoAnaliseRiscoId'
      'FROM duimp.resultados_anuentes AS DRA'
      'WHERE DRA.ResultadoAnaliseRiscoId = @ResultadoAnaliseRiscoId;')
    Left = 616
    Top = 271
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDRAId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object qryDRAOrgao: TStringField
      FieldName = 'Orgao'
      Origin = 'Orgao'
      Required = True
      Size = 30
    end
    object qryDRAResultado: TStringField
      FieldName = 'Resultado'
      Origin = 'Resultado'
      Required = True
      Size = 60
    end
    object qryDRAResultadoAnaliseRiscoId: TGuidField
      FieldName = 'ResultadoAnaliseRiscoId'
      Origin = 'ResultadoAnaliseRiscoId'
      Required = True
      Size = 38
    end
  end
  object qryRFB: TFDQuery
    OnNewRecord = qryRFBNewRecord
    CachedUpdates = True
    IndexFieldNames = 'ResultadoAnaliseRiscoId'
    MasterSource = dsoDRR
    MasterFields = 'Id'
    DetailFields = 'ResultadoAnaliseRiscoId'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.resultados_rfb'
    UpdateOptions.KeyFields = 'Id'
    SQL.Strings = (
      'DECLARE @ResultadoAnaliseRiscoId uniqueidentifier;'
      ''
      'SET @ResultadoAnaliseRiscoId = :Id;'
      ''
      'SELECT RFB.Id'
      ',RFB.Orgao'
      ',RFB.Resultado'
      ',RFB.ResultadoAnaliseRiscoId'
      'FROM duimp.resultados_rfb AS RFB'
      'WHERE RFB.ResultadoAnaliseRiscoId = @ResultadoAnaliseRiscoId;')
    Left = 616
    Top = 335
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Size = 38
        Value = Null
      end>
    object qryRFBId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object qryRFBOrgao: TStringField
      FieldName = 'Orgao'
      Origin = 'Orgao'
      Required = True
      Size = 30
    end
    object qryRFBResultado: TStringField
      FieldName = 'Resultado'
      Origin = 'Resultado'
      Required = True
      Size = 60
    end
    object qryRFBResultadoAnaliseRiscoId: TGuidField
      FieldName = 'ResultadoAnaliseRiscoId'
      Origin = 'ResultadoAnaliseRiscoId'
      Required = True
      Size = 38
    end
  end
  object dsoDRA: TDataSource
    DataSet = qryDRA
    Left = 680
    Top = 271
  end
  object dsoRFB: TDataSource
    DataSet = qryRFB
    Left = 680
    Top = 335
  end
  object qryMDS: TFDQuery
    IndexFieldNames = 'VersaoId'
    MasterSource = dsoDUV
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @VersaoId uniqueidentifier;'
      ''
      'SET @VersaoId = :Id;'
      ''
      'WITH ModalidadesCTE AS ('
      #9'SELECT DISTINCT TIP.Codigo, TIP.Descricao'
      #9'FROM duimp.capas_itens AS DCI'
      #9'JOIN duimp.modalidades AS MDL'
      #9#9'ON DCI.CaracterizacaoImportacaoIndicador = MDL.Id'
      #9'JOIN TiposProcesso AS TIP'
      #9#9'ON TIP.Codigo = MDL.TipoProcessoCodigo'
      #9'WHERE DCI.VersaoId = @VersaoId'
      ')'
      'SELECT VersaoId = @VersaoId'
      ',ModalidadeCodigos = STUFF(('
      #9'SELECT '#39'; '#39' + CAST(Codigo AS varchar)'
      #9'FROM ModalidadesCTE'
      #9'FOR XML PATH('#39#39'), TYPE'
      ').value('#39'.'#39', '#39'varchar(max)'#39'), 1, 2, '#39#39')'
      ',Modalidades = STUFF(('
      #9'SELECT '#39'; '#39' + CAST(Descricao AS varchar)'
      #9'FROM ModalidadesCTE'
      #9'FOR XML PATH('#39#39'), TYPE'
      ').value('#39'.'#39', '#39'varchar(max)'#39'), 1, 2, '#39#39');')
    Left = 378
    Top = 16
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryMDSVersaoId: TGuidField
      FieldName = 'VersaoId'
      Origin = 'VersaoId'
      ReadOnly = True
      Size = 38
    end
    object qryMDSModalidadeCodigos: TMemoField
      FieldName = 'ModalidadeCodigos'
      Origin = 'ModalidadeCodigos'
      ReadOnly = True
      BlobType = ftMemo
      Size = 2147483647
    end
    object qryMDSModalidades: TMemoField
      FieldName = 'Modalidades'
      Origin = 'Modalidades'
      ReadOnly = True
      BlobType = ftMemo
      Size = 2147483647
    end
  end
  object dsoMDS: TDataSource
    DataSet = qryMDS
    Left = 434
    Top = 16
  end
  object qryADV: TFDQuery
    MasterSource = dsoDUV
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @VersaoId uniqueidentifier;'
      ''
      'SET @VersaoId = :Id;'
      ''
      'WITH Cotacao AS ('
      #9'SELECT VersaoId'
      #9',MoedaNegociadaSimbolo'
      #9',MoedaNegociadaValorCotacao = '
      
        #9' duimp.ValorCotacao(SUM(CondicaoVendaValorBRL), NULLIF(SUM(Cond' +
        'icaoVendaValorMoedaNegociada), 0))'
      #9'FROM duimp.capas_itens'
      #9'WHERE VersaoId = @VersaoId'
      #9'GROUP BY VersaoId, MoedaNegociadaSimbolo'
      ')'
      ',Acrescimos AS ('
      #9'SELECT DAD.MoedaNegociadaSimbolo'
      #9',MoedaNegociadaValor = SUM(DAD.MoedaNegociadaValor)'
      #9'FROM duimp.capas_itens AS DCI'
      #9'JOIN duimp.acrescimos_deducoes AS DAD'
      #9#9'ON DCI.Id = DAD.CapaItemId'
      #9'WHERE DCI.VersaoId = @VersaoId'
      #9'AND DAD.Tipo = '#39'ACRESCIMO'#39
      #9'GROUP BY DAD.MoedaNegociadaSimbolo'
      ')'
      ',Deducoes AS ('
      #9'SELECT DAD.MoedaNegociadaSimbolo'
      #9',MoedaNegociadaValor = SUM(DAD.MoedaNegociadaValor)'
      #9'FROM duimp.capas_itens AS DCI'
      #9'JOIN duimp.acrescimos_deducoes AS DAD'
      #9#9'ON DCI.Id = DAD.CapaItemId'
      #9'WHERE DCI.VersaoId = @VersaoId'
      #9'AND DAD.Tipo = '#39'DEDUCAO'#39
      #9'GROUP BY DAD.MoedaNegociadaSimbolo'
      ')'
      ',SaldosPorMoeda AS ('
      #9'SELECT C.MoedaNegociadaSimbolo'
      #9',MoedaNegociadaValorCotacao = C.MoedaNegociadaValorCotacao'
      
        #9',MoedaNegociadaValor = ISNULL(A.MoedaNegociadaValor, 0) - ISNUL' +
        'L(D.MoedaNegociadaValor, 0)'
      #9'FROM Cotacao C'
      #9'JOIN Acrescimos A'
      #9#9'ON A.MoedaNegociadaSimbolo = C.MoedaNegociadaSimbolo'
      #9'LEFT JOIN Deducoes D'
      #9#9'ON D.MoedaNegociadaSimbolo = C.MoedaNegociadaSimbolo'
      ')'
      
        'SELECT MoedaNegociadaId = CAST(ROW_NUMBER() OVER (ORDER BY Moeda' +
        'NegociadaSimbolo) AS int)'
      ',MoedaNegociadaSimbolo'
      ',MoedaNegociadaValor'
      ',MoedaNegociadaValorCotacao'
      'FROM SaldosPorMoeda;')
    Left = 494
    Top = 80
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryADVMoedaNegociadaId: TIntegerField
      FieldName = 'MoedaNegociadaId'
      Origin = 'MoedaNegociadaId'
      ReadOnly = True
      Visible = False
    end
    object qryADVMoedaNegociadaSimbolo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Moeda'
      DisplayWidth = 4
      FieldName = 'MoedaNegociadaSimbolo'
      Origin = 'MoedaNegociada'
      Required = True
      Size = 3
    end
    object qryADVMoedaNegociadaValor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'MoedaNegociadaValor'
      Origin = 'MoedaNegociadaValor'
      ReadOnly = True
      DisplayFormat = ',0.0000;-,0.0000'
    end
    object qryADVMoedaNegociadaValorCotacao: TFloatField
      DisplayLabel = 'Cota'#231#227'o'
      DisplayWidth = 7
      FieldName = 'MoedaNegociadaValorCotacao'
      Origin = 'MoedaNegociadaValorCotacao'
      ReadOnly = True
      DisplayFormat = ',0.0000;-,0.0000'
    end
    object qryADVMoedaNegociadaValorBRL: TFloatField
      DefaultExpression = 'MoedaNegociadaValor * MoedaNegociadaValorCotacao'
      DisplayLabel = 'Valor (BRL)'
      FieldKind = fkInternalCalc
      FieldName = 'MoedaNegociadaValorBRL'
      Origin = 'Valor'
      ReadOnly = True
      DisplayFormat = ',0.0000;-,0.0000'
    end
  end
  object dsoADV: TDataSource
    DataSet = qryADV
    Left = 556
    Top = 80
  end
  object qryProd: TFDQuery
    Connection = damConnection.DBCliente
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    SQL.Strings = (
      'SELECT PRO.Codigo'
      
        ',Nome = IIF(CHARINDEX('#39'<{'#39', PRO.Descricao_Reduzida) > 0, SUBSTRI' +
        'NG(PRO.Descricao_Reduzida, 0, CHARINDEX('#39'<{'#39', PRO.Descricao_Redu' +
        'zida) -1), PRO.Descricao_Reduzida)'
      'FROM Produtos AS PRO'
      'WHERE PRO.Codigo = :ProdutoCodigoInterno;')
    Left = 746
    Top = 16
    ParamData = <
      item
        Name = 'PRODUTOCODIGOINTERNO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryProdCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdNome: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'Nome'
      Origin = 'Nome'
      ReadOnly = True
      Size = 60
    end
  end
  object sptProd: TFDScript
    SQLScripts = <
      item
        Name = 'root'
        SQL.Strings = (
          '@Duimp')
      end
      item
        Name = 'Duimp'
        SQL.Strings = (
          'UPDATE Produtos'
          'SET Codigo_DUIMP = NULL'
          'WHERE Codigo_DUIMP = :ProdutoCodigo;'
          ''
          'UPDATE Produtos'
          'SET Codigo_DUIMP = :ProdutoCodigo'
          'WHERE Codigo = :ProdutoCodigoInterno;')
      end>
    Connection = damConnection.DBCliente
    ScriptOptions.BreakOnError = True
    ScriptOptions.CommandSeparator = '^'
    Params = <
      item
        Name = 'ProdutoCodigo'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ProdutoCodigoInterno'
        DataType = ftInteger
        ParamType = ptInput
      end>
    Macros = <>
    Left = 875
    Top = 80
  end
  object qryDPG: TFDQuery
    OnNewRecord = qryDPGNewRecord
    CachedUpdates = True
    IndexFieldNames = 'DuimpId;Id'
    MasterSource = dsoDUI
    MasterFields = 'Id'
    DetailFields = 'DuimpId'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.pagamentos'
    UpdateOptions.KeyFields = 'Id'
    SQL.Strings = (
      'DECLARE @DuimpId uniqueidentifier;'
      ''
      'SET @DuimpId = :Id;'
      ''
      'SELECT DPG.Id'
      ',DPG.Agencia'
      ',DPG.Banco'
      ',DPG.CodigoReceita'
      ',DPG.Conta'
      ',DPG.DataPagamento'
      ',DPG.Tributo'
      ',DPG.Valor'
      ',DPG.VersaoOrigem'
      ',DPG.DuimpId'
      'FROM duimp.pagamentos AS DPG'
      'WHERE DPG.DuimpId = @DuimpId;')
    Left = 496
    Top = 335
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDPGId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 38
    end
    object qryDPGAgencia: TStringField
      FieldName = 'Agencia'
      Origin = 'Agencia'
      Required = True
      Size = 4
    end
    object qryDPGBanco: TStringField
      FieldName = 'Banco'
      Origin = 'Banco'
      Required = True
      Size = 3
    end
    object qryDPGCodigoReceita: TStringField
      FieldName = 'CodigoReceita'
      Origin = 'CodigoReceita'
      Required = True
      Size = 4
    end
    object qryDPGConta: TStringField
      FieldName = 'Conta'
      Origin = 'Conta'
      Required = True
      Size = 5
    end
    object qryDPGDataPagamento: TSQLTimeStampField
      FieldName = 'DataPagamento'
      Origin = 'DataPagamento'
      Required = True
    end
    object qryDPGTributo: TStringField
      FieldName = 'Tributo'
      Origin = 'Tributo'
      Required = True
      Size = 17
    end
    object qryDPGValor: TFloatField
      FieldName = 'Valor'
      Origin = 'Valor'
      Required = True
    end
    object qryDPGVersaoOrigem: TIntegerField
      FieldName = 'VersaoOrigem'
      Origin = 'VersaoOrigem'
      Required = True
      Visible = False
    end
    object qryDPGDuimpId: TGuidField
      FieldName = 'DuimpId'
      Origin = 'DuimpId'
      Required = True
      Visible = False
      Size = 38
    end
  end
  object dsoDPG: TDataSource
    DataSet = qryDPG
    Left = 558
    Top = 335
  end
  object qryDPJ: TFDQuery
    OnNewRecord = qryDPJNewRecord
    CachedUpdates = True
    IndexFieldNames = 'Id'
    MasterSource = dsoDPG
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.pagamentos_juros'
    UpdateOptions.KeyFields = 'Id'
    SQL.Strings = (
      'DECLARE @PagamentoId uniqueidentifier;'
      ''
      'SET @PagamentoId = :Id;'
      ''
      'SELECT DPJ.Id'
      ',DPJ.CodigoReceita'
      ',DPJ.Valor'
      ',DPJ.DataPagamentoJuros'
      ',DPJ.BancoJuros'
      ',DPJ.AgenciaJuros'
      ',DPJ.ContaJuros'
      'FROM duimp.pagamentos_juros AS DPJ'
      'WHERE DPJ.Id = @PagamentoId;')
    Left = 746
    Top = 271
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Size = 38
        Value = Null
      end>
    object qryDPJId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object qryDPJCodigoReceita: TStringField
      FieldName = 'CodigoReceita'
      Origin = 'CodigoReceita'
      Required = True
      Size = 4
    end
    object qryDPJValor: TFloatField
      FieldName = 'Valor'
      Origin = 'Valor'
      Required = True
    end
    object qryDPJDataPagamentoJuros: TSQLTimeStampField
      FieldName = 'DataPagamentoJuros'
      Origin = 'DataPagamentoJuros'
      Required = True
    end
    object qryDPJBancoJuros: TStringField
      FieldName = 'BancoJuros'
      Origin = 'BancoJuros'
      Required = True
      Size = 3
    end
    object qryDPJAgenciaJuros: TStringField
      FieldName = 'AgenciaJuros'
      Origin = 'AgenciaJuros'
      Required = True
      Size = 4
    end
    object qryDPJContaJuros: TStringField
      FieldName = 'ContaJuros'
      Origin = 'ContaJuros'
      Required = True
      Size = 5
    end
  end
  object qryDPGSel: TFDQuery
    IndexFieldNames = 'DuimpId;ModalidadeDescricao;Tributo'
    MasterSource = dsoDUI
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @DuimpId uniqueidentifier;'
      ''
      'SET @DuimpId = :Id;'
      ''
      'DECLARE @Classification TABLE'
      '('
      #9' CodigoReceita varchar(8)'
      #9',CodigoCF varchar(15)'
      #9',DescricaoCF varchar(60)'
      #9',TipoCF char(1)'
      #9',CustoCF bit'
      #9',Custo_SeletivoCF bit'
      #9',Custo_EntradaCF bit'
      #9',Custo_OutrosCF bit'
      #9',NivelCF smallint'
      #9',Modalidade smallint'
      ');'
      ''
      'DECLARE @UseCybersoft bit = ('
      #9'SELECT TOP 1 Compartilhar_Classificacao '
      #9'FROM Configuracao'
      ');'
      ''
      'IF @UseCybersoft = 1'
      'BEGIN'
      #9'INSERT INTO @Classification'
      #9'SELECT CF.Codigo_RFB'
      #9',CF.Codigo'
      #9',CF.Descricao'
      #9',CF.Tipo'
      #9',ISNULL(CF.Custo, 0)'
      #9',ISNULL(CF.Custo_Seletivo, 0)'
      #9',ISNULL(CF.Custo_Entrada, 0)'
      #9',ISNULL(CF.Custo_Outros, 0)'
      #9',CF.Nivel'
      #9',CF.Modalidade_Importacao'
      #9'FROM Cybersoft_Cadastros.dbo.ClassificacaoFinanceira AS CF'
      #9'WHERE CF.Codigo_RFB IS NOT NULL;'
      'END'
      'ELSE'
      'BEGIN'
      #9'INSERT INTO @Classification'
      #9'SELECT CF.Codigo_RFB'
      #9',CF.Codigo'
      #9',CF.Descricao'
      #9',CF.Tipo'
      #9',ISNULL(CF.Custo, 0)'
      #9',ISNULL(CF.Custo_Seletivo, 0)'
      #9',ISNULL(CF.Custo_Entrada, 0)'
      #9',ISNULL(CF.Custo_Outros, 0)'
      #9',CF.Nivel'
      #9',CF.Modalidade_Importacao'
      #9'FROM ClassificacaoFinanceira AS CF'
      #9'WHERE CF.Codigo_RFB IS NOT NULL;'
      'END;'
      ''
      'WITH Modalidades AS ('
      #9'SELECT DUV.DuimpId'
      #9',ModalidadeCodigo = TIP.Codigo'
      #9',ModalidadeDescricao = TIP.Descricao'
      #9'FROM duimp.capas_itens AS DCI'
      #9'JOIN duimp.modalidades AS MDL'
      #9#9'ON DCI.CaracterizacaoImportacaoIndicador = MDL.Id'
      #9'JOIN duimp.versoes AS DUV'
      #9#9'ON DUV.Id = DCI.VersaoId'
      #9'JOIN TiposProcesso AS TIP'
      #9#9'ON TIP.Codigo = MDL.TipoProcessoCodigo'
      #9'WHERE DUV.DuimpId = @DuimpId'
      #9'GROUP BY DUV.DuimpId, TIP.Codigo, TIP.Descricao'
      ')'
      ',DPGMax AS ('
      #9'SELECT DuimpId'
      #9',VersaoOrigem = MAX(VersaoOrigem)'
      #9'FROM duimp.pagamentos'
      #9'WHERE DuimpId = @DuimpId'
      #9'GROUP BY DuimpId'
      ')'
      ',Pagamentos AS ('
      #9'SELECT DPG.Id'
      #9',DPG.Agencia'
      #9',DPG.Banco'
      #9',DPG.CodigoReceita'
      #9',DPG.Conta'
      #9',DPG.DataPagamento'
      #9',DPG.Tributo'
      #9',DPG.Valor'
      #9',DPG.VersaoOrigem'
      #9',DPG.DuimpId'
      #9'FROM duimp.pagamentos AS DPG'
      #9'JOIN DPGMax AS M'
      #9#9' ON M.DuimpId = DPG.DuimpId'
      #9#9'AND M.VersaoOrigem = DPG.VersaoOrigem'
      #9'WHERE DPG.DuimpId = @DuimpId'
      ')'
      'SELECT PAG.Id'
      ',PAG.Agencia'
      ',PAG.Banco'
      ',CF.CodigoCF'
      ',CF.CustoCF'
      ',CF.Custo_EntradaCF'
      ',CF.Custo_OutrosCF'
      ',CF.Custo_SeletivoCF'
      ',DescricaoCF'
      ',CF.NivelCF'
      ',CF.TipoCF'
      ',PAG.CodigoReceita'
      ',PAG.Conta'
      ',PAG.DataPagamento'
      ',MLD.ModalidadeCodigo'
      ',MLD.ModalidadeDescricao'
      ',PAG.Tributo'
      ',PAG.Valor'
      ',PAG.VersaoOrigem'
      ',PAG.DuimpId'
      'FROM Modalidades AS MLD'
      'FULL OUTER JOIN Pagamentos AS PAG'
      #9' ON MLD.DuimpId = PAG.DuimpId'
      'LEFT JOIN @Classification AS CF'
      #9' ON CF.CodigoReceita = PAG.CodigoReceita'
      #9'AND CF.Modalidade = MLD.ModalidadeCodigo;')
    Left = 616
    Top = 143
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDPGSelId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      Required = True
      Visible = False
      Size = 38
    end
    object qryDPGSelAgencia: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Ag'#234'ncia'
      DisplayWidth = 10
      FieldName = 'Agencia'
      Origin = 'Agencia'
      Required = True
      Size = 4
    end
    object qryDPGSelBanco: TStringField
      Alignment = taRightJustify
      DisplayWidth = 10
      FieldName = 'Banco'
      Origin = 'Banco'
      Required = True
      Size = 3
    end
    object qryDPGSelCodigoCF: TStringField
      Alignment = taCenter
      DisplayLabel = 'Classifica'#231#227'o'
      DisplayWidth = 11
      FieldName = 'CodigoCF'
      Origin = 'CodigoCF'
      Size = 15
    end
    object qryDPGSelCustoCF: TBooleanField
      FieldName = 'CustoCF'
      Origin = 'CustoCF'
      Visible = False
    end
    object qryDPGSelCusto_EntradaCF: TBooleanField
      FieldName = 'Custo_EntradaCF'
      Origin = 'Custo_EntradaCF'
      Visible = False
    end
    object qryDPGSelCusto_OutrosCF: TBooleanField
      FieldName = 'Custo_OutrosCF'
      Origin = 'Custo_OutrosCF'
      Visible = False
    end
    object qryDPGSelCusto_SeletivoCF: TBooleanField
      FieldName = 'Custo_SeletivoCF'
      Origin = 'Custo_SeletivoCF'
      Visible = False
    end
    object qryDPGSelDescricaoCF: TStringField
      DisplayLabel = 'Descri'#231#227'o da Classifica'#231#227'o'
      DisplayWidth = 50
      FieldName = 'DescricaoCF'
      Origin = 'DescricaoCF'
      Size = 60
    end
    object qryDPGSelNivelCF: TSmallintField
      FieldName = 'NivelCF'
      Origin = 'NivelCF'
      Visible = False
    end
    object qryDPGSelTipoCF: TStringField
      FieldName = 'TipoCF'
      Origin = 'ClassificacaoTipo'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDPGSelCodigoReceita: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo da Receita'
      DisplayWidth = 10
      FieldName = 'CodigoReceita'
      Origin = 'CodigoReceita'
      Required = True
      Size = 4
    end
    object qryDPGSelConta: TStringField
      Alignment = taRightJustify
      DisplayWidth = 10
      FieldName = 'Conta'
      Origin = 'Conta'
      Required = True
      Size = 5
    end
    object qryDPGSelDataPagamento: TSQLTimeStampField
      Alignment = taCenter
      DisplayLabel = 'Data'
      DisplayWidth = 18
      FieldName = 'DataPagamento'
      Origin = 'DataPagamento'
      Required = True
    end
    object qryDPGSelTributo: TStringField
      FieldName = 'Tributo'
      Origin = 'Tributo'
      Required = True
      Visible = False
      Size = 17
    end
    object qryDPGSelModalidadeDescricao: TStringField
      DisplayLabel = 'Modalidade'
      DisplayWidth = 20
      FieldName = 'ModalidadeDescricao'
      Origin = 'ModalidadeDescricao'
      Size = 30
    end
    object qryDPGSelModalidadeCodigo: TIntegerField
      FieldName = 'ModalidadeCodigo'
      Origin = 'ModalidadeCodigo'
      Visible = False
    end
    object qryDPGSelValor: TFloatField
      DisplayWidth = 15
      FieldName = 'Valor'
      Origin = 'Valor'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDPGSelVersaoOrigem: TIntegerField
      FieldName = 'VersaoOrigem'
      Origin = 'VersaoOrigem'
      Required = True
      Visible = False
    end
    object qryDPGSelDuimpId: TGuidField
      FieldName = 'DuimpId'
      Origin = 'DuimpId'
      Required = True
      Visible = False
      Size = 38
    end
  end
  object dsoDPGSel: TDataSource
    DataSet = qryDPGSel
    Left = 680
    Top = 143
  end
  object qryDIE: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'Id'
    MasterSource = dsoDCI
    MasterFields = 'Id'
    DetailFields = 'Id'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.itens_exportadores'
    UpdateOptions.KeyFields = 'Id'
    UpdateObject = updDIE
    SQL.Strings = (
      'DECLARE @CapaItemId uniqueidentifier;'
      ''
      'SET @CapaItemId = :Id;'
      ''
      'SELECT OPE.Id'
      ',FRN.Bairro'
      ',FRN.CEP'
      ',OPE.Codigo'
      ',CodigoInterno = FRN.Codigo'
      ',FRN.Email'
      ',FRN.Estado'
      ',FRN.Municipio'
      ',OPE.NIOperador'
      ',FRN.Nome'
      ',OPE.PaisCodigo'
      ',FRN.Rua'
      ',FRN.Rua_Numero'
      ',OPE.Versao'
      'FROM duimp.itens_exportadores AS OPE'
      'LEFT OUTER JOIN Fornecedores AS FRN'
      #9'ON OPE.Codigo = FRN.Codigo_DUIMP'
      'WHERE OPE.Id = @CapaItemId;')
    Left = 203
    Top = 335
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDIEId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object qryDIEBairro: TStringField
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Size = 40
    end
    object qryDIECEP: TStringField
      Tag = 1
      FieldName = 'CEP'
      Origin = 'CEP'
      ProviderFlags = [pfInWhere]
      Size = 8
    end
    object qryDIECodigo: TStringField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      Required = True
      Size = 35
    end
    object qryDIECodigoInterno: TIntegerField
      FieldName = 'CodigoInterno'
      Origin = 'CodigoInterno'
      OnChange = qryOpeCodigoInternoChange
    end
    object qryDIEEmail: TStringField
      Tag = 1
      FieldName = 'Email'
      Origin = 'Email'
      ProviderFlags = [pfInWhere]
      Size = 200
    end
    object qryDIEEstado: TStringField
      FieldName = 'Estado'
      Origin = 'Estado'
      Size = 2
    end
    object qryDIEMunicipio: TStringField
      Tag = 1
      FieldName = 'Municipio'
      Origin = 'Municipio'
      ProviderFlags = [pfInWhere]
    end
    object qryDIENIOperador: TStringField
      FieldName = 'NIOperador'
      Origin = 'NIOperador'
      Required = True
      Size = 11
    end
    object qryDIENome: TStringField
      Tag = 1
      FieldName = 'Nome'
      Origin = 'Nome'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object qryDIEPaisCodigo: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PaisCodigo'
      Origin = 'PaisCodigo'
      Required = True
      Size = 2
    end
    object qryDIERua: TStringField
      Tag = 1
      FieldName = 'Rua'
      Origin = 'Rua'
      ProviderFlags = [pfInWhere]
      Size = 40
    end
    object qryDIERua_Numero: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'Rua_Numero'
      Origin = 'Rua_Numero'
      Size = 10
    end
    object qryDIEVersao: TIntegerField
      FieldName = 'Versao'
      Origin = 'Versao'
      Required = True
    end
  end
  object dsoDIE: TDataSource
    DataSet = qryDIE
    OnStateChange = dsoStateChange
    OnDataChange = dsoDataChange
    Left = 265
    Top = 335
  end
  object qryDIF: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'Id'
    MasterSource = dsoDCI
    MasterFields = 'Id'
    DetailFields = 'Id'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.itens_fabricantes'
    UpdateOptions.KeyFields = 'Id'
    UpdateObject = updDIF
    SQL.Strings = (
      'DECLARE @CapaItemId uniqueidentifier;'
      ''
      'SET @CapaItemId = :Id;'
      ''
      'SELECT OPE.Id'
      ',FRN.Bairro'
      ',FRN.CEP'
      ',OPE.Codigo'
      ',CodigoInterno = FRN.Codigo'
      ',FRN.Email'
      ',FRN.Estado'
      ',FRN.Municipio'
      ',OPE.NIOperador'
      ',FRN.Nome'
      ',OPE.PaisCodigo'
      ',FRN.Rua'
      ',FRN.Rua_Numero'
      ',OPE.Versao'
      'FROM duimp.itens_fabricantes AS OPE'
      'LEFT OUTER JOIN Fornecedores AS FRN'
      #9'ON OPE.Codigo = FRN.Codigo_DUIMP'
      'WHERE OPE.Id = @CapaItemId;')
    Left = 203
    Top = 270
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Size = 38
        Value = Null
      end>
    object qryDIFId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object qryDIFBairro: TStringField
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Size = 40
    end
    object qryDIFCEP: TStringField
      Tag = 1
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 8
    end
    object qryDIFCodigo: TStringField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      Required = True
      Size = 35
    end
    object qryDIFCodigoInterno: TIntegerField
      FieldName = 'CodigoInterno'
      Origin = 'CodigoInterno'
      OnChange = qryOpeCodigoInternoChange
    end
    object qryDIFEmail: TStringField
      Tag = 1
      FieldName = 'Email'
      Origin = 'Email'
      Size = 200
    end
    object qryDIFEstado: TStringField
      FieldName = 'Estado'
      Origin = 'Estado'
      Size = 2
    end
    object qryDIFMunicipio: TStringField
      Tag = 1
      FieldName = 'Municipio'
      Origin = 'Municipio'
    end
    object qryDIFNIOperador: TStringField
      FieldName = 'NIOperador'
      Origin = 'NIOperador'
      Required = True
      Size = 11
    end
    object qryDIFNome: TStringField
      Tag = 1
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 60
    end
    object qryDIFPaisCodigo: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PaisCodigo'
      Origin = 'PaisCodigo'
      Required = True
      Size = 2
    end
    object qryDIFRua: TStringField
      Tag = 1
      FieldName = 'Rua'
      Origin = 'Rua'
      Size = 40
    end
    object qryDIFRua_Numero: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'Rua_Numero'
      Origin = 'Rua_Numero'
      Size = 10
    end
    object qryDIFVersao: TIntegerField
      FieldName = 'Versao'
      Origin = 'Versao'
      Required = True
    end
  end
  object dsoDIF: TDataSource
    DataSet = qryDIF
    OnStateChange = dsoStateChange
    OnDataChange = dsoDataChange
    Left = 265
    Top = 270
  end
  object updDIE: TFDUpdateSQL
    Connection = damConnection.DBCliente
    InsertSQL.Strings = (
      'INSERT INTO duimp.itens_exportadores'
      '(Id, Codigo, NIOperador, PaisCodigo, Versao)'
      
        'VALUES (:NEW_Id, :NEW_Codigo, :NEW_NIOperador, :NEW_PaisCodigo, ' +
        ':NEW_Versao);'
      'SELECT Id, Codigo, NIOperador, PaisCodigo, Versao'
      'FROM duimp.itens_exportadores'
      'WHERE Id = :NEW_Id')
    FetchRowSQL.Strings = (
      'SELECT Id, Codigo, NIOperador, PaisCodigo, Versao'
      'FROM duimp.itens_exportadores'
      'WHERE Id = :Id')
    Left = 325
    Top = 335
  end
  object updDIF: TFDUpdateSQL
    Connection = damConnection.DBCliente
    InsertSQL.Strings = (
      'INSERT INTO duimp.itens_fabricantes'
      '(Id, Codigo, NIOperador, PaisCodigo, Versao)'
      
        'VALUES (:NEW_Id, :NEW_Codigo, :NEW_NIOperador, :NEW_PaisCodigo, ' +
        ':NEW_Versao);'
      'SELECT Id, Codigo, NIOperador, PaisCodigo, Versao'
      'FROM duimp.itens_fabricantes'
      'WHERE Id = :NEW_Id')
    FetchRowSQL.Strings = (
      'SELECT Id, Codigo, NIOperador, PaisCodigo, Versao'
      'FROM duimp.itens_fabricantes'
      'WHERE Id = :Id')
    Left = 325
    Top = 270
  end
  object sptFRN: TFDScript
    SQLScripts = <
      item
        Name = 'root'
        SQL.Strings = (
          '@Duimp')
      end
      item
        Name = 'Duimp'
        SQL.Strings = (
          'UPDATE Fornecedores'
          'SET Codigo_DUIMP = NULL'
          'WHERE Codigo_DUIMP = :Codigo;'
          ''
          'UPDATE Fornecedores'
          'SET Codigo_DUIMP = :Codigo'
          'WHERE Codigo = :CodigoInterno;')
      end>
    Connection = damConnection.DBCliente
    ScriptOptions.BreakOnError = True
    ScriptOptions.CommandSeparator = '^'
    Params = <
      item
        Name = 'Codigo'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CodigoInterno'
        DataType = ftInteger
        ParamType = ptInput
      end>
    Macros = <>
    Left = 875
    Top = 143
  end
  object qryEXP: TFDQuery
    MasterSource = dsoDUV
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @VersaoId uniqueidentifier;'
      ''
      'SET @VersaoId = :Id;'
      ''
      'SELECT DISTINCT DCI.Adicao'
      ',FRN.Bairro'
      ',OPE.Codigo'
      ',FRN.CEP'
      ',FRN.Email'
      ',FRN.Estado'
      ',FRN.Municipio'
      ',OPE.NIOperador'
      ',FRN.Nome'
      ',OPE.PaisCodigo'
      ',FRN.Rua'
      ',FRN.Rua_Numero'
      ',OPE.Versao'
      'FROM duimp.versoes AS DUV'
      'JOIN duimp.capas_itens AS DCI'
      #9'ON DUV.Id = DCI.VersaoId'
      'JOIN duimp.itens_exportadores AS OPE'
      #9'ON DCI.Id = OPE.Id'
      'LEFT OUTER JOIN Fornecedores AS FRN'
      #9'ON OPE.Codigo = FRN.Codigo_DUIMP'
      'WHERE DUV.Id = @VersaoId;')
    Left = 616
    Top = 80
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryEXPAdicao: TIntegerField
      DisplayLabel = 'Adi'#231#227'o'
      DisplayWidth = 6
      FieldName = 'Adicao'
      Origin = 'Adicao'
      Required = True
      DisplayFormat = '000'
    end
    object qryEXPBairro: TStringField
      DisplayWidth = 14
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Size = 40
    end
    object qryEXPCodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 6
      FieldName = 'Codigo'
      Origin = 'Codigo'
      Required = True
      Size = 35
    end
    object qryEXPCEP: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 8
    end
    object qryEXPEmail: TStringField
      DisplayWidth = 14
      FieldName = 'Email'
      Origin = 'Email'
      Size = 200
    end
    object qryEXPEstado: TStringField
      DisplayWidth = 6
      FieldName = 'Estado'
      Origin = 'Estado'
      Size = 2
    end
    object qryEXPMunicipio: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 14
      FieldName = 'Municipio'
      Origin = 'Municipio'
    end
    object qryEXPNIOperador: TStringField
      DisplayLabel = 'N'#250'mero de Identifica'#231#227'o'
      DisplayWidth = 17
      FieldName = 'NIOperador'
      Origin = 'NIOperador'
      Required = True
      Size = 11
    end
    object qryEXPNome: TStringField
      DisplayWidth = 14
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 60
    end
    object qryEXPPaisCodigo: TStringField
      DisplayLabel = 'Pa'#237's'
      DisplayWidth = 5
      FieldName = 'PaisCodigo'
      Origin = 'PaisCodigo'
      Required = True
      Size = 2
    end
    object qryEXPRua: TStringField
      DisplayWidth = 14
      FieldName = 'Rua'
      Origin = 'Rua'
      Size = 40
    end
    object qryEXPRua_Numero: TStringField
      DisplayLabel = 'N'#250'mero'
      DisplayWidth = 8
      FieldName = 'Rua_Numero'
      Origin = 'Rua_Numero'
      Size = 10
    end
    object qryEXPVersao: TIntegerField
      DisplayLabel = 'Vers'#227'o'
      DisplayWidth = 6
      FieldName = 'Versao'
      Origin = 'Versao'
      Required = True
    end
  end
  object dsoEXP: TDataSource
    DataSet = qryEXP
    Left = 680
    Top = 80
  end
  object qryFAB: TFDQuery
    MasterSource = dsoDUV
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @VersaoId uniqueidentifier;'
      ''
      'SET @VersaoId = :Id;'
      ''
      'SELECT DISTINCT DCI.Adicao'
      ',OPE.Codigo'
      ',FRN.Bairro'
      ',FRN.CEP'
      ',FRN.Email'
      ',FRN.Estado'
      ',FRN.Municipio'
      ',OPE.NIOperador'
      ',FRN.Nome'
      ',OPE.PaisCodigo'
      ',FRN.Rua'
      ',FRN.Rua_Numero'
      ',OPE.Versao'
      'FROM duimp.versoes AS DUV'
      'JOIN duimp.capas_itens AS DCI'
      #9'ON DUV.Id = DCI.VersaoId'
      'JOIN duimp.itens_fabricantes AS OPE'
      #9'ON DCI.Id = OPE.Id'
      'LEFT OUTER JOIN Fornecedores AS FRN'
      #9'ON OPE.Codigo = FRN.Codigo_DUIMP'
      'WHERE DUV.Id = @VersaoId;')
    Left = 616
    Top = 207
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryFABAdicao: TIntegerField
      DisplayLabel = 'Adi'#231#227'o'
      DisplayWidth = 6
      FieldName = 'Adicao'
      Origin = 'Adicao'
      Required = True
      DisplayFormat = '000'
    end
    object qryFABBairro: TStringField
      DisplayWidth = 14
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Size = 40
    end
    object qryFABCodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 6
      FieldName = 'Codigo'
      Origin = 'Codigo'
      Required = True
      Size = 35
    end
    object qryFABCEP: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 8
    end
    object qryFABEmail: TStringField
      DisplayWidth = 14
      FieldName = 'Email'
      Origin = 'Email'
      Size = 200
    end
    object qryFABEstado: TStringField
      DisplayWidth = 6
      FieldName = 'Estado'
      Origin = 'Estado'
      Size = 2
    end
    object qryFABMunicipio: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 14
      FieldName = 'Municipio'
      Origin = 'Municipio'
    end
    object qryFABNIOperador: TStringField
      DisplayLabel = 'N'#250'mero de Identifica'#231#227'o'
      DisplayWidth = 17
      FieldName = 'NIOperador'
      Origin = 'NIOperador'
      Required = True
      Size = 11
    end
    object qryFABNome: TStringField
      DisplayWidth = 14
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 60
    end
    object qryFABPaisCodigo: TStringField
      DisplayLabel = 'Pa'#237's'
      DisplayWidth = 5
      FieldName = 'PaisCodigo'
      Origin = 'PaisCodigo'
      Required = True
      Size = 2
    end
    object qryFABRua: TStringField
      DisplayWidth = 14
      FieldName = 'Rua'
      Origin = 'Rua'
      Size = 40
    end
    object qryFABRua_Numero: TStringField
      DisplayLabel = 'N'#250'mero'
      DisplayWidth = 8
      FieldName = 'Rua_Numero'
      Origin = 'Rua_Numero'
      Size = 10
    end
    object qryFABVersao: TIntegerField
      DisplayLabel = 'Vers'#227'o'
      DisplayWidth = 6
      FieldName = 'Versao'
      Origin = 'Versao'
      Required = True
    end
  end
  object dsoFAB: TDataSource
    DataSet = qryFAB
    Left = 680
    Top = 207
  end
  object qryLFR: TFDQuery
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @Codigo int;'
      ''
      'SET @Codigo = :Codigo;'
      ''
      'SELECT CodigoInterno = FRN.Codigo'
      ',FRN.CEP'
      ',FRN.Email'
      ',FRN.Municipio'
      ',FRN.Nome'
      ',FRN.Rua'
      'FROM Fornecedores AS FRN'
      'WHERE FRN.Codigo = @Codigo;')
    Left = 746
    Top = 399
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryLFRCodigoInterno: TIntegerField
      FieldName = 'CodigoInterno'
      Origin = 'ID'
      Required = True
    end
    object qryLFRCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 8
    end
    object qryLFREmail: TStringField
      FieldName = 'Email'
      Origin = 'Email'
      Size = 200
    end
    object qryLFRMunicipio: TStringField
      FieldName = 'Municipio'
      Origin = 'Municipio'
    end
    object qryLFRNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 60
    end
    object qryLFRRua: TStringField
      FieldName = 'Rua'
      Origin = 'Rua'
      Size = 40
    end
  end
  object qryPRO: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'ProdutoCodigo'
    MasterSource = dsoDCI
    MasterFields = 'ProdutoCodigo'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'Produtos'
    UpdateOptions.KeyFields = 'ProdutoCodigoInterno'
    UpdateObject = updPRO
    SQL.Strings = (
      'DECLARE @ProdutoCodigo int;'
      ''
      'SET @ProdutoCodigo = :ProdutoCodigo;'
      ''
      'SELECT ProdutoCodigoInterno = PRO.Codigo'
      ',ProdutoCodigo = PRO.Codigo_DUIMP'
      
        ',Descricao = IIF(CHARINDEX('#39'<{'#39', PRO.Descricao) > 0, SUBSTRING(P' +
        'RO.Descricao, 0, CHARINDEX('#39'<{'#39', PRO.Descricao) -1), PRO.Descric' +
        'ao)'
      ',PRO.Descricao_Reduzida'
      ',PRO.Unidade'
      ',PRO.NCM'
      ',PRO.Tipo_Item'
      ',PRO.Aliquota_II'
      ',PRO.Aliquota_IPI'
      ',PRO.Aliquota_PIS'
      ',PRO.Aliquota_COFINS'
      ',PRO.Valor_II'
      ',PRO.Valor_IPI'
      ',PRO.Valor_PIS'
      ',PRO.Valor_COFINS'
      ',PRO.Reducao_II'
      ',PRO.Reducao_IPI'
      ',PRO.Reducao_PIS'
      ',PRO.Reducao_COFINS'
      ',PRO.ICMS_Reducao'
      ',PRO.PIS_Nota'
      ',PRO.PIS_NotaSaida'
      ',PRO.COFINS_Nota'
      ',PRO.COFINS_NotaSaida'
      ',PRO.Codigo_Fabricante'
      ',FornecedorCodigo = PRO.Fornecedor'
      ',Fornecedor = FRN.Codigo_DUIMP'
      ',PRO.Peso_Liquido'
      ',PRO.Tabela_CAMEX'
      ',Modalidade ='
      ' CASE WHEN PRO.Origem = '#39'I'#39' THEN '#39'IMPORTACAO'#39
      '      WHEN PRO.Origem = '#39'N'#39' THEN '#39'EXPORTACAO'#39
      '      ELSE '#39'IMPORTACAO'#39
      ' END'
      ',ModalidadeCodigo = Modalidade'
      'FROM Produtos AS PRO'
      'LEFT JOIN Fornecedores AS FRN'
      #9'ON PRO.Fornecedor = FRN.Codigo'
      'WHERE PRO.Codigo_DUIMP = @ProdutoCodigo;')
    Left = 203
    Top = 399
    ParamData = <
      item
        Name = 'PRODUTOCODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPROProdutoCodigoInterno: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ProdutoCodigoInterno'
      Origin = 'ProdutoCodigoInterno'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryPRODescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Size = 5000
    end
    object qryPRODescricao_Reduzida: TStringField
      FieldName = 'Descricao_Reduzida'
      Origin = 'Descricao_Reduzida'
      Size = 60
    end
    object qryPROUnidade: TStringField
      FieldName = 'Unidade'
      Origin = 'Unidade'
      Size = 3
    end
    object qryPRONCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 10
    end
    object qryPROTipo_Item: TSmallintField
      FieldName = 'Tipo_Item'
      Origin = 'Tipo_Item'
    end
    object qryPROAliquota_II: TFloatField
      FieldName = 'Aliquota_II'
      Origin = 'Aliquota_II'
    end
    object qryPROAliquota_IPI: TFloatField
      FieldName = 'Aliquota_IPI'
      Origin = 'Aliquota_IPI'
    end
    object qryPROAliquota_PIS: TFloatField
      FieldName = 'Aliquota_PIS'
      Origin = 'Aliquota_PIS'
    end
    object qryPROAliquota_COFINS: TFloatField
      FieldName = 'Aliquota_COFINS'
      Origin = 'Aliquota_COFINS'
    end
    object qryPROValor_II: TCurrencyField
      FieldName = 'Valor_II'
      Origin = 'Valor_II'
    end
    object qryPROValor_IPI: TFloatField
      FieldName = 'Valor_IPI'
      Origin = 'Valor_IPI'
    end
    object qryPROValor_PIS: TCurrencyField
      FieldName = 'Valor_PIS'
      Origin = 'Valor_PIS'
    end
    object qryPROValor_COFINS: TCurrencyField
      FieldName = 'Valor_COFINS'
      Origin = 'Valor_COFINS'
    end
    object qryPROReducao_II: TFloatField
      FieldName = 'Reducao_II'
      Origin = 'Reducao_II'
    end
    object qryPROReducao_IPI: TFloatField
      FieldName = 'Reducao_IPI'
      Origin = 'Reducao_IPI'
    end
    object qryPROReducao_PIS: TFloatField
      FieldName = 'Reducao_PIS'
      Origin = 'Reducao_PIS'
    end
    object qryPROReducao_COFINS: TFloatField
      FieldName = 'Reducao_COFINS'
      Origin = 'Reducao_COFINS'
    end
    object qryPROICMS_Reducao: TFloatField
      FieldName = 'ICMS_Reducao'
      Origin = 'ICMS_Reducao'
    end
    object qryPROPIS_Nota: TFloatField
      FieldName = 'PIS_Nota'
      Origin = 'PIS_Nota'
    end
    object qryPROPIS_NotaSaida: TFloatField
      FieldName = 'PIS_NotaSaida'
      Origin = 'PIS_NotaSaida'
    end
    object qryPROCOFINS_Nota: TFloatField
      FieldName = 'COFINS_Nota'
      Origin = 'COFINS_Nota'
    end
    object qryPROCOFINS_NotaSaida: TFloatField
      FieldName = 'COFINS_NotaSaida'
      Origin = 'COFINS_NotaSaida'
    end
    object qryPROCodigo_Fabricante: TStringField
      FieldName = 'Codigo_Fabricante'
      Origin = 'Codigo_Fabricante'
    end
    object qryPROPeso_Liquido: TFloatField
      FieldName = 'Peso_Liquido'
      Origin = 'Peso_Liquido'
    end
    object qryPROFornecedorCodigo: TIntegerField
      FieldName = 'FornecedorCodigo'
      Origin = 'FornecedorCodigo'
    end
    object qryPROFornecedor: TStringField
      FieldName = 'Fornecedor'
      Origin = 'Fornecedor'
      Size = 35
    end
    object qryPROTabela_CAMEX: TBooleanField
      FieldName = 'Tabela_CAMEX'
      Origin = 'Tabela_CAMEX'
    end
    object qryPROModalidade: TStringField
      FieldName = 'Modalidade'
      Origin = 'Modalidade'
      Size = 10
    end
    object qryPROModalidadeCodigo: TSmallintField
      FieldName = 'ModalidadeCodigo'
      Origin = 'ModalidadeCodigo'
    end
    object qryPROProdutoCodigo: TIntegerField
      FieldName = 'ProdutoCodigo'
      Origin = 'ProdutoCodigo'
      Required = True
    end
  end
  object dsoPRO: TDataSource
    DataSet = qryPRO
    OnStateChange = dsoStateChange
    OnDataChange = dsoDataChange
    Left = 265
    Top = 399
  end
  object updPRO: TFDUpdateSQL
    Connection = damConnection.DBCliente
    InsertSQL.Strings = (
      'SET ANSI_WARNINGS OFF;'
      ''
      'DECLARE @Custo_Seletivo bit;'
      'DECLARE @ProdutoCodigoInterno int;'
      'DECLARE @ClasseEnquadra_IPI char(1);'
      'DECLARE @Fornecedor int;'
      ''
      'SET @ProdutoCodigoInterno  = CASE '
      
        '    WHEN :NEW_ProdutoCodigoInterno IS NULL OR :NEW_ProdutoCodigo' +
        'Interno <= 0 '
      '        THEN ('
      '            SELECT ISNULL(MAX(Codigo), 0) + 1'
      '            FROM Produtos'
      '        )'
      '    ELSE :NEW_ProdutoCodigoInterno'
      'END;'
      ''
      'SET @ClasseEnquadra_IPI = ('
      #9'SELECT TOP 1 Classe'
      #9'FROM Cybersoft_Cadastros.dbo.ClasseIPI'
      #9'WHERE Valor_IPI = :Valor_IPI'
      ');'
      ''
      'SET @Custo_Seletivo = CAST('
      #9'('
      #9#9'SELECT DISTINCT 1'
      #9#9'FROM Cybersoft_Cadastros.dbo.Majoracao AS MAJ'
      #9#9'WHERE MAJ.Tipo = '#39'M'#39
      #9#9'AND MAJ.Descricao = '#39'COFINS'#39
      #9#9'AND MAJ.Modalidade = :NEW_ModalidadeCodigo'
      #9#9'AND MAJ.Majorada = :NEW_Aliquota_COFINS'
      #9') AS BIT'
      ');'
      ''
      'SET @Fornecedor = ('
      #9'SELECT TOP 1 Codigo'
      #9'FROM Fornecedores'
      #9'WHERE Codigo_DUIMP = :NEW_Fornecedor'
      ');'
      ''
      'MERGE INTO Produtos AS TARGET'
      'USING (SELECT'
      '        @ProdutoCodigoInterno AS Codigo'
      '       ,:NEW_Descricao AS Descricao'
      '       ,:NEW_Descricao_Reduzida AS Descricao_Reduzida'
      '       ,@ClasseEnquadra_IPI AS ClasseEnquadra_IPI'
      '       ,:NEW_Unidade AS Unidade'
      '       ,:NEW_NCM AS NCM'
      '       ,:NEW_Tipo_Item AS Tipo_Item'
      '       ,1 AS Quantidade_Unidade'
      '       ,1 AS Quantidade_Volumes'
      '       ,0 AS Desativado'
      '       ,:NEW_Aliquota_II AS Aliquota_II'
      '       ,:NEW_Aliquota_IPI AS Aliquota_IPI'
      '       ,:NEW_Aliquota_PIS AS Aliquota_PIS'
      '       ,:NEW_Aliquota_COFINS AS Aliquota_COFINS'
      '       ,:NEW_Valor_II AS Valor_II'
      '       ,:NEW_Valor_IPI AS Valor_IPI'
      '       ,:NEW_Valor_PIS AS Valor_PIS'
      '       ,:NEW_Valor_COFINS AS Valor_COFINS'
      '       ,:NEW_Reducao_II AS Reducao_II'
      '       ,:NEW_Reducao_IPI AS Reducao_IPI'
      '       ,:NEW_Reducao_PIS AS Reducao_PIS'
      '       ,:NEW_Reducao_COFINS AS Reducao_COFINS'
      '       ,0 AS Acordo_TarifarioII'
      '       ,:NEW_ICMS_Reducao AS ICMS_Reducao'
      '       ,:NEW_PIS_Nota AS PIS_Nota'
      '       ,:NEW_PIS_NotaSaida AS PIS_NotaSaida'
      '       ,:NEW_COFINS_Nota AS COFINS_Nota'
      '       ,:NEW_COFINS_NotaSaida AS COFINS_NotaSaida'
      '       ,@Custo_Seletivo AS Custo_Seletivo'
      '       ,:NEW_Codigo_Fabricante AS Codigo_Fabricante'
      '       ,@Fornecedor AS Fornecedor'
      '       ,@Fornecedor AS Fabricante'
      '       ,1 AS Escala_Relevante'
      '       ,:NEW_Peso_Liquido AS Peso_Liquido'
      '       ,:NEW_Tabela_CAMEX AS Tabela_CAMEX'
      '       ,0 AS Estoque_Disponivel'
      '       ,0 AS Estoque_Terceiros'
      
        '       ,REPLACE(SUBSTRING(:NEW_Modalidade, 1, 1), '#39'E'#39', '#39'N'#39') AS O' +
        'rigem'
      '       ,:NEW_ModalidadeCodigo AS Modalidade'
      '       ,:NEW_ProdutoCodigo AS Codigo_DUIMP'
      '      ) AS SOURCE'
      'ON TARGET.Codigo = SOURCE.Codigo'
      ''
      'WHEN MATCHED THEN'
      '    UPDATE SET'
      '        TARGET.Descricao = SOURCE.Descricao'
      '       ,TARGET.Descricao_Reduzida = SOURCE.Descricao_Reduzida'
      '       ,TARGET.ClasseEnquadra_IPI = SOURCE.ClasseEnquadra_IPI'
      '       ,TARGET.Unidade = SOURCE.Unidade'
      '       ,TARGET.Unidade_Origem = SOURCE.Unidade'
      '       ,TARGET.NCM = SOURCE.NCM'
      '       ,TARGET.Tipo_Item = SOURCE.Tipo_Item'
      '       ,TARGET.Quantidade_Unidade = SOURCE.Quantidade_Unidade'
      '       ,TARGET.Quantidade_Volumes = SOURCE.Quantidade_Volumes'
      '       ,TARGET.Desativado = SOURCE.Desativado'
      '       ,TARGET.Aliquota_II = SOURCE.Aliquota_II'
      '       ,TARGET.Aliquota_IPI = SOURCE.Aliquota_IPI'
      '       ,TARGET.Aliquota_PIS = SOURCE.Aliquota_PIS'
      '       ,TARGET.Aliquota_COFINS = SOURCE.Aliquota_COFINS'
      '       ,TARGET.Valor_II = SOURCE.Valor_II'
      '       ,TARGET.Valor_IPI = SOURCE.Valor_IPI'
      '       ,TARGET.Valor_PIS = SOURCE.Valor_PIS'
      '       ,TARGET.Valor_COFINS = SOURCE.Valor_COFINS'
      '       ,TARGET.Reducao_II = SOURCE.Reducao_II'
      '       ,TARGET.Reducao_IPI = SOURCE.Reducao_IPI'
      '       ,TARGET.Reducao_PIS = SOURCE.Reducao_PIS'
      '       ,TARGET.Reducao_COFINS = SOURCE.Reducao_COFINS'
      '       ,TARGET.Acordo_TarifarioII = SOURCE.Acordo_TarifarioII'
      '       ,TARGET.ICMS_Reducao = SOURCE.ICMS_Reducao'
      '       ,TARGET.PIS_Nota = SOURCE.PIS_Nota'
      '       ,TARGET.PIS_NotaSaida = SOURCE.PIS_NotaSaida'
      '       ,TARGET.COFINS_Nota = SOURCE.COFINS_Nota'
      '       ,TARGET.COFINS_NotaSaida = SOURCE.COFINS_NotaSaida'
      '       ,TARGET.Custo_Seletivo = SOURCE.Custo_Seletivo'
      '       ,TARGET.Codigo_Fabricante = SOURCE.Codigo_Fabricante'
      '       ,TARGET.Fornecedor = SOURCE.Fornecedor'
      '       ,TARGET.Fabricante = SOURCE.Fabricante'
      '       ,TARGET.Escala_Relevante = SOURCE.Escala_Relevante'
      '       ,TARGET.Peso_Liquido = SOURCE.Peso_Liquido'
      '       ,TARGET.Tabela_CAMEX = SOURCE.Tabela_CAMEX'
      '       ,TARGET.Estoque_Disponivel = SOURCE.Estoque_Disponivel'
      '       ,TARGET.Estoque_Terceiros = SOURCE.Estoque_Terceiros'
      '       ,TARGET.Origem = SOURCE.Origem'
      '       ,TARGET.Modalidade = SOURCE.Modalidade'
      '       ,TARGET.Codigo_DUIMP = SOURCE.Codigo_DUIMP'
      ''
      'WHEN NOT MATCHED THEN'
      '    INSERT ('
      '        Codigo'
      '       ,Descricao'
      '       ,Descricao_Reduzida'
      '       ,ClasseEnquadra_IPI'
      '       ,Unidade'
      '       ,Unidade_Origem'
      '       ,NCM'
      '       ,Tipo_Item'
      '       ,Quantidade_Unidade'
      '       ,Quantidade_Volumes'
      '       ,Desativado'
      '       ,Aliquota_II'
      '       ,Aliquota_IPI'
      '       ,Aliquota_PIS'
      '       ,Aliquota_COFINS'
      '       ,Valor_II'
      '       ,Valor_IPI'
      '       ,Valor_PIS'
      '       ,Valor_COFINS'
      '       ,Reducao_II'
      '       ,Reducao_IPI'
      '       ,Reducao_PIS'
      '       ,Reducao_COFINS'
      '       ,Acordo_TarifarioII'
      '       ,ICMS_Reducao'
      '       ,PIS_Nota'
      '       ,PIS_NotaSaida'
      '       ,COFINS_Nota'
      '       ,COFINS_NotaSaida'
      '       ,Custo_Seletivo'
      '       ,Codigo_Fabricante'
      '       ,Fornecedor'
      '       ,Fabricante'
      '       ,Escala_Relevante'
      '       ,Peso_Liquido'
      '       ,Tabela_CAMEX'
      '       ,Estoque_Disponivel'
      '       ,Estoque_Terceiros'
      '       ,Origem'
      '       ,Modalidade'
      '       ,Codigo_DUIMP'
      '    )'
      '    VALUES ('
      '        SOURCE.Codigo'
      '       ,SOURCE.Descricao'
      '       ,SOURCE.Descricao_Reduzida'
      '       ,SOURCE.ClasseEnquadra_IPI'
      '       ,SOURCE.Unidade'
      '       ,SOURCE.Unidade'
      '       ,SOURCE.NCM'
      '       ,SOURCE.Tipo_Item'
      '       ,SOURCE.Quantidade_Unidade'
      '       ,SOURCE.Quantidade_Volumes'
      '       ,SOURCE.Desativado'
      '       ,SOURCE.Aliquota_II'
      '       ,SOURCE.Aliquota_IPI'
      '       ,SOURCE.Aliquota_PIS'
      '       ,SOURCE.Aliquota_COFINS'
      '       ,SOURCE.Valor_II'
      '       ,SOURCE.Valor_IPI'
      '       ,SOURCE.Valor_PIS'
      '       ,SOURCE.Valor_COFINS'
      '       ,SOURCE.Reducao_II'
      '       ,SOURCE.Reducao_IPI'
      '       ,SOURCE.Reducao_PIS'
      '       ,SOURCE.Reducao_COFINS'
      '       ,SOURCE.Acordo_TarifarioII'
      '       ,SOURCE.ICMS_Reducao'
      '       ,SOURCE.PIS_Nota'
      '       ,SOURCE.PIS_NotaSaida'
      '       ,SOURCE.COFINS_Nota'
      '       ,SOURCE.COFINS_NotaSaida'
      '       ,SOURCE.Custo_Seletivo'
      '       ,SOURCE.Codigo_Fabricante'
      '       ,SOURCE.Fornecedor'
      '       ,SOURCE.Fabricante'
      '       ,SOURCE.Escala_Relevante'
      '       ,SOURCE.Peso_Liquido'
      '       ,SOURCE.Tabela_CAMEX'
      '       ,SOURCE.Estoque_Disponivel'
      '       ,SOURCE.Estoque_Terceiros'
      '       ,SOURCE.Origem'
      '       ,SOURCE.Modalidade'
      '       ,SOURCE.Codigo_DUIMP'
      '    );'
      ''
      'SET ANSI_WARNINGS ON;'
      ''
      'SELECT ProdutoCodigoInterno = PRO.Codigo'
      ',ProdutoCodigo = PRO.Codigo_DUIMP'
      
        ',Descricao = IIF(CHARINDEX('#39'<{'#39', PRO.Descricao) > 0, SUBSTRING(P' +
        'RO.Descricao, 0, CHARINDEX('#39'<{'#39', PRO.Descricao) -1), PRO.Descric' +
        'ao)'
      ',PRO.Descricao_Reduzida'
      ',PRO.Unidade'
      ',PRO.NCM'
      ',PRO.Tipo_Item'
      ',PRO.Aliquota_II'
      ',PRO.Aliquota_IPI'
      ',PRO.Aliquota_PIS'
      ',PRO.Aliquota_COFINS'
      ',PRO.Valor_II'
      ',PRO.Valor_IPI'
      ',PRO.Valor_PIS'
      ',PRO.Valor_COFINS'
      ',PRO.Reducao_II'
      ',PRO.Reducao_IPI'
      ',PRO.Reducao_PIS'
      ',PRO.Reducao_COFINS'
      ',PRO.ICMS_Reducao'
      ',PRO.PIS_Nota'
      ',PRO.PIS_NotaSaida'
      ',PRO.COFINS_Nota'
      ',PRO.COFINS_NotaSaida'
      ',PRO.Codigo_Fabricante'
      ',FornecedorCodigo = PRO.Fornecedor'
      ',Fornecedor = FRN.Codigo_DUIMP'
      ',PRO.Peso_Liquido'
      ',PRO.Tabela_CAMEX'
      ',Modalidade ='
      ' CASE WHEN PRO.Origem = '#39'I'#39' THEN '#39'IMPORTACAO'#39
      '      WHEN PRO.Origem = '#39'N'#39' THEN '#39'EXPORTACAO'#39
      '      ELSE '#39'IMPORTACAO'#39
      ' END'
      ',ModalidadeCodigo = Modalidade'
      'FROM Produtos AS PRO'
      'LEFT JOIN Fornecedores AS FRN'
      #9'ON PRO.Fornecedor = FRN.Codigo'
      'WHERE PRO.Codigo = @ProdutoCodigoInterno;')
    FetchRowSQL.Strings = (
      'SELECT ProdutoCodigoInterno = PRO.Codigo'
      ',ProdutoCodigo = PRO.Codigo_DUIMP'
      
        ',Descricao = IIF(CHARINDEX('#39'<{'#39', PRO.Descricao) > 0, SUBSTRING(P' +
        'RO.Descricao, 0, CHARINDEX('#39'<{'#39', PRO.Descricao) -1), PRO.Descric' +
        'ao)'
      ',PRO.Descricao_Reduzida'
      ',PRO.Unidade'
      ',PRO.NCM'
      ',PRO.Tipo_Item'
      ',PRO.Aliquota_II'
      ',PRO.Aliquota_IPI'
      ',PRO.Aliquota_PIS'
      ',PRO.Aliquota_COFINS'
      ',PRO.Valor_II'
      ',PRO.Valor_IPI'
      ',PRO.Valor_PIS'
      ',PRO.Valor_COFINS'
      ',PRO.Reducao_II'
      ',PRO.Reducao_IPI'
      ',PRO.Reducao_PIS'
      ',PRO.Reducao_COFINS'
      ',PRO.ICMS_Reducao'
      ',PRO.PIS_Nota'
      ',PRO.PIS_NotaSaida'
      ',PRO.COFINS_Nota'
      ',PRO.COFINS_NotaSaida'
      ',PRO.Codigo_Fabricante'
      ',FornecedorCodigo = PRO.Fornecedor'
      ',Fornecedor = FRN.Codigo_DUIMP'
      ',PRO.Peso_Liquido'
      ',PRO.Tabela_CAMEX'
      ',Modalidade ='
      ' CASE WHEN PRO.Origem = '#39'I'#39' THEN '#39'IMPORTACAO'#39
      '      WHEN PRO.Origem = '#39'N'#39' THEN '#39'EXPORTACAO'#39
      '      ELSE '#39'IMPORTACAO'#39
      ' END'
      ',ModalidadeCodigo = Modalidade'
      'FROM Produtos AS PRO'
      'LEFT JOIN Fornecedores AS FRN'
      #9'ON PRO.Fornecedor = FRN.Codigo'
      'WHERE PRO.Codigo_DUIMP = :ProdutoCodigo;')
    Left = 323
    Top = 399
  end
  object qryATS: TFDQuery
    CachedUpdates = True
    MasterSource = dsoPRO
    MasterFields = 'ProdutoCodigoInterno;NCM;Modalidade'
    DetailFields = 'ProdutoCodigoInterno;ncm;modalidade'
    Connection = damConnection.DBCliente
    FetchOptions.AssignedValues = [evCache]
    UpdateOptions.UpdateTableName = 'ProdutosAtributos'
    UpdateOptions.KeyFields = 'ProdutoCodigoInterno;ncm;atributo'
    UpdateObject = updATS
    SQL.Strings = (
      'DECLARE @ProdutoCodigoInterno int;'
      'DECLARE @NCM varchar(8);'
      'DECLARE @Modalidade varchar(20);'
      ''
      'SET @ProdutoCodigoInterno = :ProdutoCodigoInterno;'
      'SET @NCM = :NCM;'
      'SET @Modalidade = :Modalidade;'
      ''
      'SELECT Atributo = ANC.Codigo'
      ',NomeApresentacao = ANC.Nome_Apresentacao'
      ',Nome = ANC.Nome_Atributo'
      ',OrientacaoPreenchimento = ANC.Orientacao_Preenchimento'
      ',FormaPreenchimento = ANC.Forma_Preenchimento'
      ',Modalidade = ANC.Modalidade_Operacao'
      ',Multivalorado = ANC.Multivalorado'
      ',ProdutoCodigoInterno = @ProdutoCodigoInterno'
      ',NCM = NAT.NCM'
      ',Valor = PAT.Valor'
      'FROM Cybersoft_Cadastros.dbo.AtributosNCM AS ANC'
      'JOIN NCMAtributos AS NAT'
      #9' ON ANC.Codigo = NAT.Atributo'
      #9'AND NAT.NCM = @NCM'
      'LEFT JOIN ProdutosAtributos AS PAT'
      #9' ON ANC.Codigo = PAT.Atributo'
      #9'AND PAT.Codigo_Mercadoria = @ProdutoCodigoInterno'
      #9'AND PAT.NCM = NAT.NCM'
      'LEFT JOIN Produtos AS PRO'
      #9' ON PRO.Codigo = PAT.Codigo_Mercadoria'
      #9'AND PRO.NCM = PAT.NCM'
      'WHERE SOUNDEX(ANC.Modalidade_Operacao) = SOUNDEX(@Modalidade)'
      'AND NOT ('
      #9'ANC.Obrigatorio = 0'
      #9'AND (PAT.Valor IS NULL OR LTRIM(RTRIM(PAT.Valor)) = '#39#39')'
      ');')
    Left = 203
    Top = 143
    ParamData = <
      item
        Name = 'PRODUTOCODIGOINTERNO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NCM'
        DataType = ftString
        ParamType = ptInput
        Size = 10
        Value = Null
      end
      item
        Name = 'MODALIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 10
        Value = Null
      end>
    object qryATSProdutoCodigoInterno: TIntegerField
      FieldName = 'ProdutoCodigoInterno'
      Origin = 'ProdutoCodigoInterno'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object qryATSncm: TStringField
      DisplayLabel = 'NCM'
      FieldName = 'ncm'
      Origin = 'ncm'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
      Size = 8
    end
    object qryATSatributo: TStringField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 8
      FieldName = 'atributo'
      Origin = 'atributo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 25
    end
    object qryATSnomeApresentacao: TStringField
      DisplayLabel = 'Atributo'
      DisplayWidth = 20
      FieldName = 'nomeApresentacao'
      Origin = 'nomeApresentacao'
      Size = 40
    end
    object qryATSnome: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 40
      FieldName = 'nome'
      Origin = 'nome'
      Size = 200
    end
    object qryATSorientacaoPreenchimento: TStringField
      DisplayLabel = 'Orienta'#231#227'o de Preenchimento'
      FieldName = 'orientacaoPreenchimento'
      Origin = 'orientacaoPreenchimento'
      Visible = False
      Size = 200
    end
    object qryATSFormaPreenchimento: TStringField
      FieldName = 'formaPreenchimento'
      Origin = 'formaPreenchimento'
      Visible = False
    end
    object qryATSModalidade: TStringField
      FieldName = 'modalidade'
      Origin = 'modalidade'
      Visible = False
    end
    object qryATSMultivalorado: TBooleanField
      DisplayLabel = 'Multivalorado'
      FieldName = 'multivalorado'
      Origin = 'Multivalorado'
      Visible = False
    end
    object qryATSValor: TStringField
      DisplayLabel = 'Valor'
      DisplayWidth = 25
      FieldName = 'valor'
      Origin = 'valor'
      OnGetText = qryATSValorGetText
      Size = 100
    end
  end
  object dsoATS: TDataSource
    DataSet = qryATS
    Left = 265
    Top = 143
  end
  object updATS: TFDUpdateSQL
    Connection = damConnection.DBCliente
    ModifySQL.Strings = (
      'MERGE INTO ProdutosAtributos AS TARGET'
      'USING (SELECT '
      '           :NEW_ProdutoCodigoInterno AS Codigo_Mercadoria,'
      '           :NEW_NCM AS NCM,'
      '           :NEW_Atributo AS Atributo,'
      '           :NEW_Valor AS Valor) AS SOURCE'
      'ON TARGET.Codigo_Mercadoria = SOURCE.Codigo_Mercadoria'
      '   AND TARGET.NCM = SOURCE.NCM'
      '   AND TARGET.Atributo = SOURCE.Atributo'
      'WHEN MATCHED THEN'
      '    UPDATE SET Valor = SOURCE.Valor'
      'WHEN NOT MATCHED THEN'
      '    INSERT (Codigo_Mercadoria, NCM, Atributo, Valor)'
      
        '    VALUES (SOURCE.Codigo_Mercadoria, SOURCE.NCM, SOURCE.Atribut' +
        'o, SOURCE.Valor);')
    FetchRowSQL.Strings = (
      
        'SELECT ProdutoCodigoInterno = Codigo_Mercadoria, NCM, Atributo, ' +
        'Valor'
      'FROM ProdutosAtributos'
      'WHERE Codigo_Mercadoria = :ProdutoCodigoInterno'
      'AND NCM = :NCM'
      'AND Atributo = :Atributo;')
    Left = 323
    Top = 143
  end
  object qryDOM: TFDQuery
    IndexFieldNames = 'Atributo;Codigo'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @NCM varchar(8);'
      ''
      'SET @NCM = :NCM;'
      ''
      'SELECT Atributo = DAT.Atributo'
      ',Codigo = DAT.Codigo'
      ',Descricao = DAT.Descricao'
      'FROM Cybersoft_Cadastros.dbo.AtributosNCM AS ANC'
      'JOIN NCMAtributos AS NAT'
      #9'ON ANC.Codigo = NAT.Atributo'
      'JOIN Cybersoft_Cadastros.dbo.DominiosAtt AS DAT'
      #9'ON ANC.Codigo = DAT.Atributo'
      'WHERE NAT.NCM = @NCM;')
    Left = 818
    Top = 80
    ParamData = <
      item
        Name = 'NCM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryDOMAtributo: TStringField
      FieldName = 'Atributo'
      Origin = 'Atributo'
    end
    object qryDOMCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      Required = True
    end
    object qryDOMDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Size = 100
    end
  end
  object qryDPR: TFDQuery
    MasterSource = dsoDUV
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @VersaoId uniqueidentifier;'
      ''
      'SET @VersaoId = :Id;'
      ''
      '-- ========================='
      '-- CAPA + ITENS BASE'
      '-- ========================='
      'WITH DuimpCapas AS ('
      '    SELECT Id AS VersaoId'
      #9',FobMoeda AS MoedaSimbolo'
      
        #9',duimp.ValorCotacao(ValorTotalLocalEmbarqueBRL, ValorTotalLocal' +
        'EmbarqueUSD) AS MoedaCotacao'
      '    FROM duimp.capas'
      '    WHERE Id = @VersaoId'
      '),'
      'CapasItens AS ('
      '    SELECT Id AS CapaItemId'
      #9',VersaoId'
      #9',IncotermValorUnitario = ValorUnitario'
      #9',IncotermValorUnitarioVlc = ValorUnitarioVlc'
      
        #9',duimp.ValorCotacao(CondicaoVendaValorBRL, CondicaoVendaValorMo' +
        'edaNegociada) AS MoedaNegociadaCotacao'
      '    FROM duimp.capas_itens'
      '    WHERE VersaoId = @VersaoId'
      '),'
      'CapasItensValores AS ('
      '    SELECT DCI.CapaItemId'
      #9',DCP.MoedaSimbolo AS MoedaNegociadaSimbolo'
      
        #9',duimp.CotacaoValor(DCP.MoedaCotacao, DCI.MoedaNegociadaCotacao' +
        ') AS MoedaNegociadaCotacao'
      
        #9',DCI.IncotermValorUnitario    * duimp.CotacaoValor(DCP.MoedaCot' +
        'acao, DCI.MoedaNegociadaCotacao) AS ValorUnitario'
      
        #9',DCI.IncotermValorUnitarioVlc * duimp.CotacaoValor(DCP.MoedaCot' +
        'acao, DCI.MoedaNegociadaCotacao) AS ValorUnitarioVlc'
      '    FROM CapasItens DCI'
      '    JOIN DuimpCapas DCP ON DCP.VersaoId = DCI.VersaoId'
      '),'
      'Unidades AS ('
      #9'SELECT Codigo = ('
      #9#9'SELECT TOP 1 Codigo'
      #9#9'FROM Cybersoft_Cadastros.dbo.UnidadeMedida'
      #9#9'WHERE SOUNDEX(Descricao) = SOUNDEX(UNM.Descricao)'
      #9')'
      #9',Descricao'
      #9'FROM Cybersoft_Cadastros.dbo.UnidadeMedida AS UNM'
      #9'GROUP BY Descricao'
      '),'
      '-- ========================='
      '-- BASE '#218'NICA DE TRIBUTOS'
      '-- ========================='
      'TributosBase AS ('
      '    SELECT DCI.Id AS CapaItemId'
      #9',DUI.Numero AS Numero_Declaracao'
      #9',ADI.Registro'
      #9',DCI.Adicao'
      #9',DCI.NumeroItem'
      #9',DCI.ProdutoCodigo'
      #9',DCI.ProdutoVersao'
      #9',DCI.ProdutoDescricao'
      #9',PRO.Codigo AS ProdutoCodigoInterno'
      #9',DMO.TipoProcessoCodigo AS ModalidadeCodigo'
      #9',UnidadeComercialCodigo = UNI.Codigo'
      #9',DCI.UnidadeComercial'
      #9',DCI.QuantidadeComercial'
      #9',DCI.PesoLiquidoUnitario'
      #9',DCI.ValorUnitarioVlc AS ValorUnitario'
      #9',DCI.ValorUnitarioVlcBRL AS ValorUnitarioBRL'
      #9',CIV.MoedaNegociadaSimbolo AS FobMoedaSimbolo'
      #9',CIV.MoedaNegociadaCotacao AS FobMoedaCotacao'
      #9',CIV.ValorUnitarioVlc AS FobValorUnitario'
      #9',CIV.ValorUnitario AS FobValorUnitarioSemVlc'
      #9',DCI.Camex'
      #9',DCI.Dumping'
      #9',DMC.TipoAliquota'
      #9',DCI.IncotermCodigo'
      #9',INF.Tipo'
      #9',INF.PercentualEntrada'
      #9',INF.PercentualSaida'
      #9',DMC.Normal'
      #9',DMC.ValorAliquota'
      #9',DMC.ValorAliquotaReduzida'
      #9',VB.Devido'
      #9',VB.ARecolher'
      '    FROM duimp.capas_itens DCI'
      '    JOIN duimp.modalidades DMO'
      '        ON DMO.Id = DCI.CaracterizacaoImportacaoIndicador'
      '    JOIN duimp.versoes DUV'
      '        ON DUV.Id = DCI.VersaoId'
      '    JOIN duimp.duimps DUI'
      '        ON DUI.Id = DUV.DuimpId'
      '    JOIN duimp.itens_notas_fiscais INF'
      '        ON INF.CapaItemId = DCI.Id'
      '    JOIN duimp.itens_tributos DIT'
      '        ON DIT.CapaItemId = DCI.Id'
      '    JOIN duimp.itens_tributos_calculados DIC'
      '        ON DIC.ItemTributoId = DIT.Id'
      '       AND INF.Tipo = DIC.Tipo'
      '    JOIN duimp.itens_tributos_calculados_memorias_calculos DMC'
      '        ON DIC.Id = DMC.ItemTributoCalculadoId'
      '    JOIN duimp.itens_tributos_calculados_valores_brl VB'
      '        ON DIC.Id = VB.ItemTributoCalculadoId'
      '    JOIN CapasItensValores CIV'
      '        ON CIV.CapaItemId = DCI.Id'
      '    LEFT JOIN Produtos PRO'
      '        ON DCI.ProdutoCodigo = PRO.Codigo_DUIMP'
      '    LEFT JOIN Adicoes ADI'
      '        ON ADI.DI = DUI.Numero'
      '       AND ADI.Sequencia = DCI.NumeroItem'
      #9'LEFT JOIN Unidades AS UNI'
      #9#9' ON SOUNDEX(UNI.Descricao) = SOUNDEX(DCI.UnidadeComercial)'
      '    WHERE DCI.VersaoId = @VersaoId'
      ')'
      '-- ========================='
      '-- AGREGA'#199#195'O FINAL'
      '-- ========================='
      'SELECT CapaItemId AS Id'
      ',Numero_Declaracao'
      ',Registro'
      ',Adicao'
      ',NumeroItem'
      ',ProdutoCodigo'
      ',ProdutoVersao'
      ',ProdutoDescricao'
      ',ProdutoCodigoInterno'
      ',ModalidadeCodigo'
      ',UnidadeComercialCodigo'
      ',UnidadeComercial'
      ',QuantidadeComercial'
      ',PesoLiquidoUnitario'
      ',ValorUnitario'
      ',ValorUnitarioBRL'
      ',FobMoedaSimbolo'
      ',FobMoedaCotacao'
      ',FobValorUnitario'
      ',FobValorUnitarioSemVlc'
      ',Camex'
      ',Dumping'
      ',TipoAliquota'
      ',IncotermCodigo'
      ',-- Aliquotas'
      
        ' MAX(CASE WHEN Tipo = '#39'II'#39'     THEN ValorAliquota END) AS Aliquo' +
        'taII'
      
        ',MAX(CASE WHEN Tipo = '#39'IPI'#39'    THEN ValorAliquota END) AS Aliquo' +
        'taIPI'
      
        ',MAX(CASE WHEN Tipo = '#39'PIS'#39'    THEN ValorAliquota END) AS Aliquo' +
        'taPIS'
      
        ',MAX(CASE WHEN Tipo = '#39'COFINS'#39' THEN ValorAliquota END) AS Aliquo' +
        'taCOFINS'
      
        ',MAX(CASE WHEN Tipo = '#39'CIDE'#39'   THEN ValorAliquota END) AS Aliquo' +
        'taCIDE'
      ',-- Aliquotas Reduzidas'
      
        ' MAX(CASE WHEN Tipo = '#39'II'#39'     THEN ValorAliquotaReduzida END) A' +
        'S AliquotaReduzidaII'
      
        ',MAX(CASE WHEN Tipo = '#39'IPI'#39'    THEN ValorAliquotaReduzida END) A' +
        'S AliquotaReduzidaIPI'
      
        ',MAX(CASE WHEN Tipo = '#39'PIS'#39'    THEN ValorAliquotaReduzida END) A' +
        'S AliquotaReduzidaPIS'
      
        ',MAX(CASE WHEN Tipo = '#39'COFINS'#39' THEN ValorAliquotaReduzida END) A' +
        'S AliquotaReduzidaCOFINS'
      
        ',MAX(CASE WHEN Tipo = '#39'CIDE'#39'   THEN ValorAliquotaReduzida END) A' +
        'S AliquotaReduzidaCIDE'
      ',-- Percentuais Entrada'
      
        ' MAX(CASE WHEN Tipo = '#39'II'#39'     THEN PercentualEntrada END) AS Al' +
        'iquotaEntradaII'
      
        ',MAX(CASE WHEN Tipo = '#39'IPI'#39'    THEN PercentualEntrada END) AS Al' +
        'iquotaEntradaIPI'
      
        ',MAX(CASE WHEN Tipo = '#39'PIS'#39'    THEN PercentualEntrada END) AS Al' +
        'iquotaEntradaPIS'
      
        ',MAX(CASE WHEN Tipo = '#39'COFINS'#39' THEN PercentualEntrada END) AS Al' +
        'iquotaEntradaCOFINS'
      
        ',MAX(CASE WHEN Tipo = '#39'CIDE'#39'   THEN PercentualEntrada END) AS Al' +
        'iquotaEntradaCIDE'
      ',-- Percentuais Sa'#237'da'
      
        ' MAX(CASE WHEN Tipo = '#39'II'#39'     THEN PercentualSaida END) AS Aliq' +
        'uotaSaidaII'
      
        ',MAX(CASE WHEN Tipo = '#39'IPI'#39'    THEN PercentualSaida END) AS Aliq' +
        'uotaSaidaIPI'
      
        ',MAX(CASE WHEN Tipo = '#39'PIS'#39'    THEN PercentualSaida END) AS Aliq' +
        'uotaSaidaPIS'
      
        ',MAX(CASE WHEN Tipo = '#39'COFINS'#39' THEN PercentualSaida END) AS Aliq' +
        'uotaSaidaCOFINS'
      
        ',MAX(CASE WHEN Tipo = '#39'CIDE'#39'   THEN PercentualSaida END) AS Aliq' +
        'uotaSaidaCIDE'
      ',-- Valores'
      ' MAX(CASE WHEN Tipo = '#39'II'#39'     THEN Normal END) AS ValorII'
      ',MAX(CASE WHEN Tipo = '#39'IPI'#39'    THEN Normal END) AS ValorIPI'
      ',MAX(CASE WHEN Tipo = '#39'PIS'#39'    THEN Normal END) AS ValorPIS'
      ',MAX(CASE WHEN Tipo = '#39'COFINS'#39' THEN Normal END) AS ValorCOFINS'
      ',MAX(CASE WHEN Tipo = '#39'CIDE'#39'   THEN Normal END) AS ValorCIDE'
      ',-- Devido'
      ' MAX(CASE WHEN Tipo = '#39'II'#39'     THEN Devido END) AS ValorDevidoII'
      
        ',MAX(CASE WHEN Tipo = '#39'IPI'#39'    THEN Devido END) AS ValorDevidoIP' +
        'I'
      
        ',MAX(CASE WHEN Tipo = '#39'PIS'#39'    THEN Devido END) AS ValorDevidoPI' +
        'S'
      
        ',MAX(CASE WHEN Tipo = '#39'COFINS'#39' THEN Devido END) AS ValorDevidoCO' +
        'FINS'
      
        ',MAX(CASE WHEN Tipo = '#39'CIDE'#39'   THEN Devido END) AS ValorDevidoCI' +
        'DE'
      ',-- A Recolher'
      
        ' MAX(CASE WHEN Tipo = '#39'II'#39'     THEN ARecolher END) AS ValorAReco' +
        'lherII'
      
        ',MAX(CASE WHEN Tipo = '#39'IPI'#39'    THEN ARecolher END) AS ValorAReco' +
        'lherIPI'
      
        ',MAX(CASE WHEN Tipo = '#39'PIS'#39'    THEN ARecolher END) AS ValorAReco' +
        'lherPIS'
      
        ',MAX(CASE WHEN Tipo = '#39'COFINS'#39' THEN ARecolher END) AS ValorAReco' +
        'lherCOFINS'
      
        ',MAX(CASE WHEN Tipo = '#39'CIDE'#39'   THEN ARecolher END) AS ValorAReco' +
        'lherCIDE'
      'FROM TributosBase'
      'GROUP BY CapaItemId'
      ',Numero_Declaracao'
      ',Registro'
      ',Adicao'
      ',NumeroItem'
      ',ProdutoCodigo'
      ',ProdutoVersao'
      ',ProdutoDescricao'
      ',ProdutoCodigoInterno'
      ',ModalidadeCodigo'
      ',UnidadeComercialCodigo'
      ',UnidadeComercial'
      ',QuantidadeComercial'
      ',PesoLiquidoUnitario'
      ',ValorUnitario'
      ',ValorUnitarioBRL'
      ',FobMoedaSimbolo'
      ',FobMoedaCotacao'
      ',FobValorUnitario'
      ',FobValorUnitarioSemVlc'
      ',Camex'
      ',Dumping'
      ',TipoAliquota'
      ',IncotermCodigo;')
    Left = 616
    Top = 16
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDPRId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      Required = True
      Size = 38
    end
    object qryDPRNumero_Declaracao: TStringField
      FieldName = 'Numero_Declaracao'
      Origin = 'Numero_Declaracao'
      Required = True
      Size = 15
    end
    object qryDPRRegistro: TLargeintField
      FieldName = 'Registro'
      Origin = 'Registro'
    end
    object qryDPRAdicao: TIntegerField
      FieldName = 'Adicao'
      Origin = 'Adicao'
      Required = True
    end
    object qryDPRNumeroItem: TIntegerField
      FieldName = 'NumeroItem'
      Origin = 'NumeroItem'
      Required = True
    end
    object qryDPRProdutoCodigo: TIntegerField
      FieldName = 'ProdutoCodigo'
      Origin = 'ProdutoCodigo'
      Required = True
    end
    object qryDPRProdutoVersao: TIntegerField
      FieldName = 'ProdutoVersao'
      Origin = 'ProdutoVersao'
      Required = True
    end
    object qryDPRProdutoDescricao: TStringField
      FieldName = 'ProdutoDescricao'
      Origin = 'ProdutoDescricao'
      Size = 4000
    end
    object qryDPRProdutoCodigoInterno: TIntegerField
      FieldName = 'ProdutoCodigoInterno'
      Origin = 'ProdutoCodigoInterno'
      ReadOnly = True
    end
    object qryDPRModalidadeCodigo: TIntegerField
      FieldName = 'ModalidadeCodigo'
      Origin = 'ModalidadeCodigo'
      Required = True
    end
    object qryDPRUnidadeComercialCodigo: TStringField
      FieldName = 'UnidadeComercialCodigo'
      Origin = 'UnidadeComercialCodigo'
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
    object qryDPRUnidadeComercial: TStringField
      FieldName = 'UnidadeComercial'
      Origin = 'UnidadeComercial'
      Required = True
    end
    object qryDPRQuantidadeComercial: TFloatField
      FieldName = 'QuantidadeComercial'
      Origin = 'QuantidadeComercial'
      Required = True
    end
    object qryDPRPesoLiquidoUnitario: TFloatField
      FieldName = 'PesoLiquidoUnitario'
      Origin = 'PesoLiquidoUnitario'
      Required = True
    end
    object qryDPRValorUnitario: TFloatField
      FieldName = 'ValorUnitario'
      Origin = 'ValorUnitario'
      ReadOnly = True
      Required = True
    end
    object qryDPRValorUnitarioBRL: TFloatField
      FieldName = 'ValorUnitarioBRL'
      Origin = 'ValorUnitarioBRL'
      ReadOnly = True
      Required = True
    end
    object qryDPRFobMoedaSimbolo: TStringField
      FieldName = 'FobMoedaSimbolo'
      Origin = 'FobMoedaSimbolo'
      Size = 3
    end
    object qryDPRFobMoedaCotacao: TFloatField
      FieldName = 'FobMoedaCotacao'
      Origin = 'FobMoedaCotacao'
      ReadOnly = True
    end
    object qryDPRFobValorUnitario: TFloatField
      FieldName = 'FobValorUnitario'
      Origin = 'FobValorUnitario'
      ReadOnly = True
    end
    object qryDPRFobValorUnitarioSemVlc: TFloatField
      FieldName = 'FobValorUnitarioSemVlc'
      Origin = 'FobValorUnitarioSemVlc'
      ReadOnly = True
    end
    object qryDPRCamex: TBooleanField
      FieldName = 'Camex'
      Origin = 'Camex'
      Required = True
    end
    object qryDPRDumping: TBooleanField
      FieldName = 'Dumping'
      Origin = 'Dumping'
      Required = True
    end
    object qryDPRTipoAliquota: TStringField
      FieldName = 'TipoAliquota'
      Origin = 'TipoAliquota'
      Required = True
      Size = 10
    end
    object qryDPRIncotermCodigo: TStringField
      FieldName = 'IncotermCodigo'
      Origin = 'IncotermCodigo'
      Required = True
      Size = 10
    end
    object qryDPRAliquotaII: TFloatField
      FieldName = 'AliquotaII'
      Origin = 'AliquotaII'
      ReadOnly = True
    end
    object qryDPRAliquotaIPI: TFloatField
      FieldName = 'AliquotaIPI'
      Origin = 'AliquotaIPI'
      ReadOnly = True
    end
    object qryDPRAliquotaPIS: TFloatField
      FieldName = 'AliquotaPIS'
      Origin = 'AliquotaPIS'
      ReadOnly = True
    end
    object qryDPRAliquotaCOFINS: TFloatField
      FieldName = 'AliquotaCOFINS'
      Origin = 'AliquotaCOFINS'
      ReadOnly = True
    end
    object qryDPRAliquotaCIDE: TFloatField
      FieldName = 'AliquotaCIDE'
      Origin = 'AliquotaCIDE'
      ReadOnly = True
      Required = True
    end
    object qryDPRAliquotaEntradaII: TFloatField
      FieldName = 'AliquotaEntradaII'
      Origin = 'AliquotaEntradaII'
      ReadOnly = True
    end
    object qryDPRAliquotaEntradaIPI: TFloatField
      FieldName = 'AliquotaEntradaIPI'
      Origin = 'AliquotaEntradaIPI'
      ReadOnly = True
    end
    object qryDPRAliquotaEntradaPIS: TFloatField
      FieldName = 'AliquotaEntradaPIS'
      Origin = 'AliquotaEntradaPIS'
      ReadOnly = True
    end
    object qryDPRAliquotaEntradaCOFINS: TFloatField
      FieldName = 'AliquotaEntradaCOFINS'
      Origin = 'AliquotaEntradaCOFINS'
      ReadOnly = True
    end
    object qryDPRAliquotaEntradaCIDE: TFloatField
      FieldName = 'AliquotaEntradaCIDE'
      Origin = 'AliquotaEntradaCIDE'
      ReadOnly = True
      Required = True
    end
    object qryDPRAliquotaSaidaII: TFloatField
      FieldName = 'AliquotaSaidaII'
      Origin = 'AliquotaSaidaII'
      ReadOnly = True
    end
    object qryDPRAliquotaSaidaIPI: TFloatField
      FieldName = 'AliquotaSaidaIPI'
      Origin = 'AliquotaSaidaIPI'
      ReadOnly = True
    end
    object qryDPRAliquotaSaidaPIS: TFloatField
      FieldName = 'AliquotaSaidaPIS'
      Origin = 'AliquotaSaidaPIS'
      ReadOnly = True
    end
    object qryDPRAliquotaSaidaCOFINS: TFloatField
      FieldName = 'AliquotaSaidaCOFINS'
      Origin = 'AliquotaSaidaCOFINS'
      ReadOnly = True
    end
    object qryDPRAliquotaSaidaCIDE: TFloatField
      FieldName = 'AliquotaSaidaCIDE'
      Origin = 'AliquotaSaidaCIDE'
      ReadOnly = True
      Required = True
    end
    object qryDPRValorII: TFloatField
      FieldName = 'ValorII'
      Origin = 'ValorII'
      ReadOnly = True
    end
    object qryDPRValorIPI: TFloatField
      FieldName = 'ValorIPI'
      Origin = 'ValorIPI'
      ReadOnly = True
    end
    object qryDPRValorPIS: TFloatField
      FieldName = 'ValorPIS'
      Origin = 'ValorPIS'
      ReadOnly = True
    end
    object qryDPRValorCIDE: TFloatField
      FieldName = 'ValorCIDE'
      Origin = 'ValorCIDE'
      ReadOnly = True
      Required = True
    end
    object qryDPRValorCOFINS: TFloatField
      FieldName = 'ValorCOFINS'
      Origin = 'ValorCOFINS'
      ReadOnly = True
    end
    object qryDPRAliquotaReduzidaII: TFloatField
      FieldName = 'AliquotaReduzidaII'
      Origin = 'AliquotaReduzidaII'
      ReadOnly = True
    end
    object qryDPRAliquotaReduzidaIPI: TFloatField
      FieldName = 'AliquotaReduzidaIPI'
      Origin = 'AliquotaReduzidaIPI'
      ReadOnly = True
    end
    object qryDPRAliquotaReduzidaPIS: TFloatField
      FieldName = 'AliquotaReduzidaPIS'
      Origin = 'AliquotaReduzidaPIS'
      ReadOnly = True
    end
    object qryDPRAliquotaReduzidaCOFINS: TFloatField
      FieldName = 'AliquotaReduzidaCOFINS'
      Origin = 'AliquotaReduzidaCOFINS'
      ReadOnly = True
    end
    object qryDPRAliquotaReduzidaCIDE: TFloatField
      FieldName = 'AliquotaReduzidaCIDE'
      Origin = 'AliquotaReduzidaCIDE'
      ReadOnly = True
      Required = True
    end
    object qryDPRValorDevidoII: TFloatField
      FieldName = 'ValorDevidoII'
      Origin = 'ValorDevidoII'
      ReadOnly = True
    end
    object qryDPRValorDevidoIPI: TFloatField
      FieldName = 'ValorDevidoIPI'
      Origin = 'ValorDevidoIPI'
      ReadOnly = True
    end
    object qryDPRValorDevidoPIS: TFloatField
      FieldName = 'ValorDevidoPIS'
      Origin = 'ValorDevidoPIS'
      ReadOnly = True
    end
    object qryDPRValorDevidoCOFINS: TFloatField
      FieldName = 'ValorDevidoCOFINS'
      Origin = 'ValorDevidoCOFINS'
      ReadOnly = True
    end
    object qryDPRValorDevidoCIDE: TFloatField
      FieldName = 'ValorDevidoCIDE'
      Origin = 'ValorDevidoCIDE'
      ReadOnly = True
      Required = True
    end
    object qryDPRValorARecolherII: TFloatField
      FieldName = 'ValorARecolherII'
      Origin = 'ValorARecolherII'
      ReadOnly = True
    end
    object qryDPRValorARecolherIPI: TFloatField
      FieldName = 'ValorARecolherIPI'
      Origin = 'ValorARecolherIPI'
      ReadOnly = True
    end
    object qryDPRValorARecolherPIS: TFloatField
      FieldName = 'ValorARecolherPIS'
      Origin = 'ValorARecolherPIS'
      ReadOnly = True
    end
    object qryDPRValorARecolherCOFINS: TFloatField
      FieldName = 'ValorARecolherCOFINS'
      Origin = 'ValorARecolherCOFINS'
      ReadOnly = True
    end
    object qryDPRValorARecolherCIDE: TFloatField
      FieldName = 'ValorARecolherCIDE'
      Origin = 'ValorARecolherCIDE'
      ReadOnly = True
      Required = True
    end
  end
  object dsoDPR: TDataSource
    DataSet = qryDPR
    Left = 678
    Top = 16
  end
  object updDCR: TFDUpdateSQL
    Connection = damConnection.DBCliente
    InsertSQL.Strings = (
      'INSERT INTO duimp.capas'
      '(Id, CaracterizacaoImportacaoNI, DataRegistro, '
      '  ImportadorNI, ImportadorTipo, IncentivoFiscalCodigo, '
      '  InformacaoComplementar, SituacaoDuimp, TipoAplicacao, '
      '  UFDesembaraco, UFImportacao, ValorTotalLocalEmbarqueBRL, '
      '  ValorTotalLocalEmbarqueUSD)'
      
        'VALUES (:NEW_Id, :NEW_CaracterizacaoImportacaoNI, :NEW_DataRegis' +
        'tro, '
      
        '  :NEW_ImportadorNI, :NEW_ImportadorTipo, :NEW_IncentivoFiscalCo' +
        'digo, '
      
        '  :NEW_InformacaoComplementar, :NEW_SituacaoDuimp, :NEW_TipoApli' +
        'cacao, '
      
        '  :NEW_UFDesembaraco, :NEW_UFImportacao, :NEW_ValorTotalLocalEmb' +
        'arqueBRL, '
      '  :NEW_ValorTotalLocalEmbarqueUSD);'
      
        'SELECT CaracterizacaoImportacaoNI, DataRegistro, FobAdicaoMoeda,' +
        ' FobAdicaoTipo, '
      
        '  FobMoeda, FobTipo, ValAduaneiraMoeda, ImportadorNI, Importador' +
        'Tipo, '
      '  IncentivoFiscalCodigo, InformacaoComplementar, SituacaoDuimp, '
      
        '  TipoAplicacao, UFDesembaraco, UFImportacao, ValorTotalLocalEmb' +
        'arqueBRL, '
      '  ValorTotalLocalEmbarqueUSD'
      'FROM duimp.capas'
      'WHERE Id = :NEW_Id')
    ModifySQL.Strings = (
      'UPDATE duimp.capas'
      
        'SET Id = :NEW_Id, CaracterizacaoImportacaoNI = :NEW_Caracterizac' +
        'aoImportacaoNI, '
      
        '  DataRegistro = :NEW_DataRegistro, ImportadorNI = :NEW_Importad' +
        'orNI, '
      
        '  ImportadorTipo = :NEW_ImportadorTipo, IncentivoFiscalCodigo = ' +
        ':NEW_IncentivoFiscalCodigo, '
      
        '  InformacaoComplementar = :NEW_InformacaoComplementar, Situacao' +
        'Duimp = :NEW_SituacaoDuimp, '
      
        '  TipoAplicacao = :NEW_TipoAplicacao, UFDesembaraco = :NEW_UFDes' +
        'embaraco, '
      
        '  UFImportacao = :NEW_UFImportacao, ValorTotalLocalEmbarqueBRL =' +
        ' :NEW_ValorTotalLocalEmbarqueBRL, '
      '  ValorTotalLocalEmbarqueUSD = :NEW_ValorTotalLocalEmbarqueUSD'
      'WHERE Id = :OLD_Id;'
      
        'SELECT CaracterizacaoImportacaoNI, DataRegistro, FobAdicaoMoeda,' +
        ' FobAdicaoTipo, '
      
        '  FobMoeda, FobTipo, ValAduaneiraMoeda, ImportadorNI, Importador' +
        'Tipo, '
      '  IncentivoFiscalCodigo, InformacaoComplementar, SituacaoDuimp, '
      
        '  TipoAplicacao, UFDesembaraco, UFImportacao, ValorTotalLocalEmb' +
        'arqueBRL, '
      '  ValorTotalLocalEmbarqueUSD'
      'FROM duimp.capas'
      'WHERE Id = :NEW_Id')
    FetchRowSQL.Strings = (
      
        'SELECT Id, CaracterizacaoImportacaoNI, DataRegistro, FobAdicaoMo' +
        'eda, '
      
        '  FobAdicaoTipo, FobMoeda, FobTipo, ValAduaneiraMoeda, Importado' +
        'rNI, '
      
        '  ImportadorTipo, IncentivoFiscalCodigo, InformacaoComplementar,' +
        ' '
      '  SituacaoDuimp, TipoAplicacao, UFDesembaraco, UFImportacao, '
      '  ValorTotalLocalEmbarqueBRL, ValorTotalLocalEmbarqueUSD'
      'FROM duimp.capas'
      'WHERE Id = :Id')
    Left = 146
    Top = 143
  end
  object qryCAC: TFDQuery
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'SELECT Id'
      ',Exibicao'
      ',Valor'
      'FROM duimp.canais_consolidados')
    Left = 818
    Top = 16
    object qryCACId: TStringField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object qryCACExibicao: TStringField
      FieldName = 'Exibicao'
      Origin = 'Exibicao'
      Required = True
      Size = 30
    end
    object qryCACValor: TStringField
      FieldName = 'Valor'
      Origin = 'Valor'
      Required = True
      Size = 8
    end
  end
  object updDRR: TFDUpdateSQL
    Connection = damConnection.DBCliente
    InsertSQL.Strings = (
      'INSERT INTO duimp.resultados_analises_riscos'
      '(Id, CanalConsolidado)'
      'VALUES (:NEW_Id, :NEW_CanalConsolidado);'
      'SELECT Id, CanalConsolidado'
      'FROM duimp.resultados_analises_riscos'
      'WHERE Id = :NEW_Id')
    ModifySQL.Strings = (
      'UPDATE duimp.resultados_analises_riscos'
      'SET Id = :NEW_Id, CanalConsolidado = :NEW_CanalConsolidado'
      'WHERE Id = :OLD_Id;'
      'SELECT Id, CanalConsolidado'
      'FROM duimp.resultados_analises_riscos'
      'WHERE Id = :NEW_Id')
    FetchRowSQL.Strings = (
      'SELECT Id, CanalConsolidado'
      'FROM duimp.resultados_analises_riscos'
      'WHERE Id = :Id')
    Left = 323
    Top = 207
  end
  object qryProc: TFDQuery
    BeforePost = DataSetBeforePost
    CachedUpdates = True
    MasterSource = dsoDUV
    MasterFields = 'ProcessoNumero'
    DetailFields = 'Processo'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'SELECT PDO.Processo'
      ',PDO.Numero_Declaracao'
      ',PDO.Processo_Mestre'
      ',PDO.Tipo'
      ',PDO.Data_RegistroDeclaracao'
      ',PDO.Data_DesembaracoDeclaracao'
      ',PDO.Incentivo_Fiscal'
      ',PDO.Tipo_Mercadoria'
      ',PDO.Local_DesembaracoCodigo'
      ',PDO.UF_Desembaraco'
      ',PDO.UF_Importacao'
      ',PDO.Cliente'
      ',PDO.Reducao_PIS'
      ',PDO.Reducao_COFINS'
      ',PDO.Remover_Valoracao'
      ',PDO.DA'
      ',PDO.Admissao_Temporaria'
      ',PDO.Suspensao_Impostos'
      ',PDO.Entreposto'
      ',PDO.Remover_FreteNacBC'
      ',PDO.Fob_Adicoes'
      ',PDO.Fob_MEAdicoes'
      ',PDO.FOB'
      ',PDO.FOB_ME'
      ',PDO.Moeda_FOB'
      ',PDO.Taxa_FOB'
      ',PDO.Frete'
      ',PDO.Frete_ME'
      ',PDO.Moeda_Frete'
      ',PDO.Taxa_Frete'
      ',PDO.Seguro'
      ',PDO.Seguro_ME'
      ',PDO.Moeda_Seguro'
      ',PDO.Taxa_Seguro'
      ',PDO.Quantidade'
      ',PDO.Quantidade_Digitada'
      ',PDO.Quantidade_Liberada'
      ',PDO.Peso_Liquido'
      ',PDO.II'
      ',PDO.Valor_PIS'
      ',PDO.Valor_IPI'
      ',PDO.Valor_PIS2'
      ',PDO.Valor_COFINS'
      ',PDO.Valor_COFINS2'
      ',PDO.Ad_Valorem'
      ',PDO.Modalidade_Importacao'
      ',PDO.Canal_SISCOMEX'
      ',PDO.Via_Transporte'
      ',PDO.Processo_Abertura'
      ',PDO.Bloqueado'
      ',PDO.Courrier'
      ',PDO.Desativado'
      ',PDO.Taxa_SISCOMEX'
      ',PDO.AFRMM'
      ',PDO.TUP'
      ',PDO.Banco'
      ',PDO.Incoterms'
      'FROM ProcessosDocumentos AS PDO'
      'WHERE PDO.Processo = :ProcessoNumero;')
    Left = 496
    Top = 463
    ParamData = <
      item
        Name = 'PROCESSONUMERO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryProcProcesso: TStringField
      FieldName = 'Processo'
      Origin = 'Processo'
      Required = True
      Size = 15
    end
    object qryProcNumero_Declaracao: TStringField
      FieldName = 'Numero_Declaracao'
      Origin = 'Numero_Declaracao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object qryProcProcesso_Mestre: TStringField
      FieldName = 'Processo_Mestre'
      Origin = 'Processo_Mestre'
      Size = 15
    end
    object qryProcTipo: TStringField
      FieldName = 'Tipo'
      Origin = 'Tipo'
      FixedChar = True
      Size = 15
    end
    object qryProcData_RegistroDeclaracao: TSQLTimeStampField
      FieldName = 'Data_RegistroDeclaracao'
      Origin = 'Data_RegistroDeclaracao'
    end
    object qryProcData_DesembaracoDeclaracao: TSQLTimeStampField
      FieldName = 'Data_DesembaracoDeclaracao'
      Origin = 'Data_DesembaracoDeclaracao'
    end
    object qryProcIncentivo_Fiscal: TStringField
      FieldName = 'Incentivo_Fiscal'
      Origin = 'Incentivo_Fiscal'
      Required = True
      Size = 15
    end
    object qryProcTipo_Mercadoria: TIntegerField
      DisplayLabel = 'Tipo de Mercadoria'
      FieldName = 'Tipo_Mercadoria'
      Origin = 'Tipo_Mercadoria'
      Required = True
    end
    object qryProcLocal_DesembaracoCodigo: TIntegerField
      FieldName = 'Local_DesembaracoCodigo'
      Origin = 'Local_DesembaracoCodigo'
    end
    object qryProcUF_Desembaraco: TStringField
      DisplayLabel = 'UF de Desembara'#231'o'
      FieldName = 'UF_Desembaraco'
      Origin = 'UF_Desembaraco'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryProcUF_Importacao: TStringField
      FieldName = 'UF_Importacao'
      Origin = 'UF_Importacao'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryProcCliente: TIntegerField
      FieldName = 'Cliente'
      Origin = 'Cliente'
    end
    object qryProcReducao_PIS: TFloatField
      FieldName = 'Reducao_PIS'
      Origin = 'Reducao_PIS'
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryProcReducao_COFINS: TFloatField
      FieldName = 'Reducao_COFINS'
      Origin = 'Reducao_COFINS'
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryProcRemover_Valoracao: TBooleanField
      FieldName = 'Remover_Valoracao'
      Origin = 'Remover_Valoracao'
    end
    object qryProcDA: TBooleanField
      FieldName = 'DA'
      Origin = 'DA'
    end
    object qryProcAdmissao_Temporaria: TBooleanField
      FieldName = 'Admissao_Temporaria'
      Origin = 'Admissao_Temporaria'
    end
    object qryProcSuspensao_Impostos: TBooleanField
      FieldName = 'Suspensao_Impostos'
      Origin = 'Suspensao_Impostos'
    end
    object qryProcEntreposto: TBooleanField
      FieldName = 'Entreposto'
      Origin = 'Entreposto'
    end
    object qryProcRemover_FreteNacBC: TBooleanField
      FieldName = 'Remover_FreteNacBC'
      Origin = 'Remover_FreteNacBC'
    end
    object qryProcFob: TCurrencyField
      FieldName = 'Fob'
      Origin = 'FOB'
    end
    object qryProcFob_Adicoes: TCurrencyField
      FieldName = 'Fob_Adicoes'
      Origin = 'Fob_Adicoes'
    end
    object qryProcFOB_ME: TCurrencyField
      FieldName = 'FOB_ME'
      Origin = 'FOB_ME'
    end
    object qryProcFob_MEAdicoes: TCurrencyField
      FieldName = 'Fob_MEAdicoes'
      Origin = 'Fob_MEAdicoes'
    end
    object qryProcMoeda_FOB: TSmallintField
      FieldName = 'Moeda_FOB'
      Origin = 'Moeda_FOB'
    end
    object qryProcTaxa_FOB: TFloatField
      FieldName = 'Taxa_FOB'
      Origin = 'Taxa_FOB'
    end
    object qryProcFrete: TCurrencyField
      FieldName = 'Frete'
      Origin = 'Frete'
    end
    object qryProcFrete_ME: TCurrencyField
      FieldName = 'Frete_ME'
      Origin = 'Frete_ME'
    end
    object qryProcMoeda_Frete: TSmallintField
      FieldName = 'Moeda_Frete'
      Origin = 'Moeda_Frete'
    end
    object qryProcTaxa_Frete: TFloatField
      FieldName = 'Taxa_Frete'
      Origin = 'Taxa_Frete'
    end
    object qryProcSeguro: TCurrencyField
      FieldName = 'Seguro'
      Origin = 'Seguro'
    end
    object qryProcSeguro_ME: TCurrencyField
      FieldName = 'Seguro_ME'
      Origin = 'Seguro_ME'
    end
    object qryProcMoeda_Seguro: TSmallintField
      FieldName = 'Moeda_Seguro'
      Origin = 'Moeda_Seguro'
    end
    object qryProcTaxa_Seguro: TFloatField
      FieldName = 'Taxa_Seguro'
      Origin = 'Taxa_Seguro'
    end
    object qryProcQuantidade: TFloatField
      FieldName = 'Quantidade'
      Origin = 'Quantidade'
    end
    object qryProcQuantidade_Digitada: TFloatField
      FieldName = 'Quantidade_Digitada'
      Origin = 'Quantidade_Digitada'
    end
    object qryProcQuantidade_Liberada: TFloatField
      FieldName = 'Quantidade_Liberada'
      Origin = 'Quantidade_Liberada'
    end
    object qryProcPeso_Liquido: TFloatField
      FieldName = 'Peso_Liquido'
      Origin = 'Peso_Liquido'
    end
    object qryProcII: TCurrencyField
      FieldName = 'II'
      Origin = 'II'
    end
    object qryProcValor_PIS: TCurrencyField
      FieldName = 'Valor_PIS'
      Origin = 'Valor_PIS'
    end
    object qryProcValor_IPI: TCurrencyField
      FieldName = 'Valor_IPI'
      Origin = 'Valor_IPI'
    end
    object qryProcValor_PIS2: TCurrencyField
      FieldName = 'Valor_PIS2'
      Origin = 'Valor_PIS2'
    end
    object qryProcValor_COFINS: TCurrencyField
      FieldName = 'Valor_COFINS'
      Origin = 'Valor_COFINS'
    end
    object qryProcValor_COFINS2: TCurrencyField
      FieldName = 'Valor_COFINS2'
      Origin = 'Valor_COFINS2'
    end
    object qryProcAd_Valorem: TCurrencyField
      FieldName = 'Ad_Valorem'
      Origin = 'Ad_Valorem'
    end
    object qryProcModalidade_Importacao: TSmallintField
      FieldName = 'Modalidade_Importacao'
      Origin = 'Modalidade_Importacao'
    end
    object qryProcCanal_SISCOMEX: TStringField
      FieldName = 'Canal_SISCOMEX'
      Origin = 'Canal_SISCOMEX'
      FixedChar = True
      Size = 2
    end
    object qryProcVia_Transporte: TSmallintField
      FieldName = 'Via_Transporte'
      Origin = 'Via_Transporte'
    end
    object qryProcProcesso_Abertura: TSQLTimeStampField
      FieldName = 'Processo_Abertura'
      Origin = 'Processo_Abertura'
    end
    object qryProcBloqueado: TBooleanField
      FieldName = 'Bloqueado'
      Origin = 'Bloqueado'
    end
    object qryProcCourrier: TBooleanField
      FieldName = 'Courrier'
      Origin = 'Courrier'
    end
    object qryProcDesativado: TBooleanField
      FieldName = 'Desativado'
      Origin = 'Desativado'
    end
    object qryProcTaxa_SISCOMEX: TCurrencyField
      FieldName = 'Taxa_SISCOMEX'
      Origin = 'Taxa_SISCOMEX'
    end
    object qryProcAFRMM: TCurrencyField
      FieldName = 'AFRMM'
      Origin = 'AFRMM'
    end
    object qryProcTUP: TCurrencyField
      FieldName = 'TUP'
      Origin = 'TUP'
    end
    object qryProcBanco: TSmallintField
      FieldName = 'Banco'
      Origin = 'Banco'
    end
    object qryProcIncoterms: TStringField
      FieldName = 'Incoterms'
      Origin = 'Incoterms'
      FixedChar = True
      Size = 3
    end
  end
  object qryIFI: TFDQuery
    IndexFieldNames = 'Nome'
    Connection = damConnection.DBCadastro
    SQL.Strings = (
      'SELECT IFI.Codigo'
      ',IFI.Nome'
      'FROM IncentivosFiscais AS IFI')
    Left = 378
    Top = 463
    object qryIFICodigo: TSmallintField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      Required = True
    end
    object qryIFINome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 15
    end
  end
  object dsoIFI: TDataSource
    DataSet = qryIFI
    Left = 434
    Top = 463
  end
  object qryDUI: TFDQuery
    OnNewRecord = qryDUINewRecord
    CachedUpdates = True
    IndexFieldNames = 'Id'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.duimps'
    UpdateOptions.KeyFields = 'Id'
    SQL.Strings = (
      'DECLARE @Numero varchar(15);'
      ''
      'SET @Numero = :Numero;'
      ''
      'SELECT DUI.Id'
      ',DUI.AdmissaoTemporaria'
      ',DUI.ChaveAcesso'
      ',DUI.DesembaracoAduaneiro'
      ',DUI.EntrepostoAduaneiro'
      ',DUI.Numero'
      ',DUI.ProcessoNumeroVinculado'
      ',DUI.RemoverFreteTerrirtorioNacionalBCImpostos'
      ',DUI.RemoverValoracaoNoValorFob'
      ',DUI.SuspensaoImpostos'
      'FROM duimp.duimps AS DUI'
      'WHERE DUI.Numero = @Numero;')
    Left = 24
    Top = 16
    ParamData = <
      item
        Name = 'NUMERO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryDUIId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object qryDUIAdmissaoTemporaria: TBooleanField
      FieldName = 'AdmissaoTemporaria'
      Origin = 'AdmissaoTemporaria'
      Required = True
    end
    object qryDUIChaveAcesso: TStringField
      FieldName = 'ChaveAcesso'
      Origin = 'ChaveAcesso'
      Size = 14
    end
    object qryDUIDesembaracoAduaneiro: TBooleanField
      FieldName = 'DesembaracoAduaneiro'
      Origin = 'DesembaracoAduaneiro'
      Required = True
    end
    object qryDUIEntrepostoAduaneiro: TBooleanField
      FieldName = 'EntrepostoAduaneiro'
      Origin = 'EntrepostoAduaneiro'
      Required = True
    end
    object qryDUINumero: TStringField
      FieldName = 'Numero'
      Origin = 'Numero'
      Required = True
      Size = 15
    end
    object qryDUIProcessoNumeroVinculado: TStringField
      FieldName = 'ProcessoNumeroVinculado'
      Origin = 'ProcessoNumeroVinculado'
      Size = 15
    end
    object qryDUIRemoverFreteTerrirtorioNacionalBCImpostos: TBooleanField
      FieldName = 'RemoverFreteTerrirtorioNacionalBCImpostos'
      Origin = 'RemoverFreteTerrirtorioNacionalBCImpostos'
      Required = True
    end
    object qryDUIRemoverValoracaoNoValorFob: TBooleanField
      FieldName = 'RemoverValoracaoNoValorFob'
      Origin = 'RemoverValoracaoNoValorFob'
      Required = True
      OnChange = qryDUIRemoverValoracaoNoValorFobChange
    end
    object qryDUISuspensaoImpostos: TBooleanField
      FieldName = 'SuspensaoImpostos'
      Origin = 'SuspensaoImpostos'
      Required = True
    end
  end
  object qryDUV: TFDQuery
    OnNewRecord = qryDUVNewRecord
    CachedUpdates = True
    IndexFieldNames = 'DuimpId'
    MasterSource = dsoDUI
    MasterFields = 'Id'
    DetailFields = 'DuimpId'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'duimp.versoes'
    UpdateOptions.KeyFields = 'Id'
    SQL.Strings = (
      'DECLARE @DuimpId uniqueidentifier;'
      ''
      'SET @DuimpId = :Id;'
      ''
      'WITH DuimpMax AS ('
      #9'SELECT DuimpId = DUI.Id'
      #9',DUI.Numero'
      #9',Versao = MAX(DUV.Versao)'
      #9'FROM duimp.duimps AS DUI'
      #9'JOIN duimp.versoes AS DUV'
      #9#9' ON DUI.Id = DUV.DuimpId'
      #9'WHERE DUI.Id = @DuimpId'
      #9'GROUP BY DUI.Id, DUI.Numero'
      ')'
      'SELECT DUV.Id'
      ',DUI.Numero'
      ',DUV.ProcessoNumero'
      ',DUV.Versao'
      ',DUV.DuimpId'
      'FROM DuimpMax AS DUI'
      'JOIN duimp.versoes AS DUV'
      #9' ON DUI.DuimpId = DUV.DuimpId'
      #9'AND DUI.Versao = DUV.Versao;')
    Left = 24
    Top = 80
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryDUVId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object qryDUVNumero: TStringField
      FieldName = 'Numero'
      Origin = 'Numero'
      Size = 15
    end
    object qryDUVProcessoNumero: TStringField
      FieldName = 'ProcessoNumero'
      Origin = 'ProcessoNumero'
      Size = 15
    end
    object qryDUVVersao: TIntegerField
      FieldName = 'Versao'
      Origin = 'Versao'
      Required = True
    end
    object qryDUVDuimpId: TGuidField
      FieldName = 'DuimpId'
      Origin = 'DuimpId'
      Required = True
      Size = 38
    end
  end
  object qryMOE: TFDQuery
    Connection = damConnection.DBCadastro
    SQL.Strings = (
      'SELECT MOE.Codigo'
      ',MOE.Nome'
      ',MOE.Simbolo'
      ',MOE.Pais'
      ',MOE.Tipo'
      'FROM Moedas AS MOE')
    Left = 818
    Top = 143
    object qryMOECodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      Required = True
    end
    object qryMOENome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 30
    end
    object qryMOESimbolo: TStringField
      FieldName = 'Simbolo'
      Origin = 'Simbolo'
      Size = 10
    end
    object qryMOEPais: TStringField
      FieldName = 'Pais'
      Origin = 'Pais'
      Size = 30
    end
    object qryMOETipo: TStringField
      FieldName = 'Tipo'
      Origin = 'Tipo'
      Size = 1
    end
  end
  object qryUFD: TFDQuery
    IndexFieldNames = 'Estado'
    Connection = damConnection.DBCadastro
    SQL.Strings = (
      'SELECT UF = EST.Codigo'
      ',Estado = EST.Nome'
      'FROM Estados AS EST')
    Left = 203
    Top = 80
    object qryUFDUF: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object qryUFDEstado: TStringField
      DisplayWidth = 20
      FieldName = 'Estado'
      Origin = 'Estado'
      Required = True
      Size = 30
    end
  end
  object dsoUFD: TDataSource
    DataSet = qryUFD
    OnStateChange = dsoStateChange
    Left = 265
    Top = 80
  end
  object qryUFI: TFDQuery
    IndexFieldNames = 'Estado'
    Connection = damConnection.DBCadastro
    SQL.Strings = (
      'SELECT UF = EST.Codigo'
      ',Estado = EST.Nome'
      'FROM Estados AS EST')
    Left = 203
    Top = 16
    object qryUFIUF: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object qryUFIEstado: TStringField
      DisplayWidth = 20
      FieldName = 'Estado'
      Origin = 'Estado'
      Required = True
      Size = 30
    end
  end
  object dsoUFI: TDataSource
    DataSet = qryUFI
    OnStateChange = dsoStateChange
    Left = 265
    Top = 16
  end
  object qryVTA: TFDQuery
    MasterSource = dsoDUV
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @VersaoId uniqueidentifier;'
      ''
      'SET @VersaoId = :Id;'
      ''
      'SELECT VTA.Id'
      ',VTA.Moeda'
      ',VTA.Tipo'
      ',VTA.ValorTotal'
      ',VTA.Cotacao'
      ',VTA.ValorTotalBRL'
      'FROM duimp.valores_totais_fob_adicoes AS VTA'
      'WHERE VTA.Id = @VersaoId;')
    Left = 496
    Top = 527
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryVTAId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      Required = True
      Size = 38
    end
    object qryVTAMoeda: TStringField
      FieldName = 'Moeda'
      Origin = 'Moeda'
      Required = True
      Size = 3
    end
    object qryVTATipo: TStringField
      FieldName = 'Tipo'
      Origin = 'Tipo'
      Required = True
      Size = 13
    end
    object qryVTAValorTotal: TFloatField
      FieldName = 'ValorTotal'
      Origin = 'ValorTotal'
      Required = True
    end
    object qryVTACotacao: TFloatField
      FieldName = 'Cotacao'
      Origin = 'Cotacao'
      Required = True
    end
    object qryVTAValorTotalBRL: TFloatField
      FieldName = 'ValorTotalBRL'
      Origin = 'ValorTotalBRL'
      Required = True
    end
  end
  object dsoVTA: TDataSource
    DataSet = qryVTA
    Left = 558
    Top = 527
  end
  object qryVTF: TFDQuery
    MasterSource = dsoDUV
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @VersaoId uniqueidentifier;'
      ''
      'SET @VersaoId = :Id;'
      ''
      'SELECT VTF.Id'
      ',VTF.Moeda'
      ',VTF.Tipo'
      ',VTF.ValorTotal'
      ',VTF.Cotacao'
      ',VTF.ValorTotalBRL'
      'FROM duimp.valores_totais_fob AS VTF'
      'WHERE VTF.Id = @VersaoId;')
    Left = 616
    Top = 527
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryVTFId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      Required = True
      Size = 38
    end
    object qryVTFMoeda: TStringField
      FieldName = 'Moeda'
      Origin = 'Moeda'
      Required = True
      Size = 3
    end
    object qryVTFTipo: TStringField
      FieldName = 'Tipo'
      Origin = 'Tipo'
      Required = True
      Size = 13
    end
    object qryVTFValorTotal: TFloatField
      FieldName = 'ValorTotal'
      Origin = 'ValorTotal'
      Required = True
    end
    object qryVTFCotacao: TFloatField
      FieldName = 'Cotacao'
      Origin = 'Cotacao'
      Required = True
    end
    object qryVTFValorTotalBRL: TFloatField
      FieldName = 'ValorTotalBRL'
      Origin = 'ValorTotalBRL'
      Required = True
    end
  end
  object dsoVTF: TDataSource
    DataSet = qryVTF
    Left = 680
    Top = 527
  end
  object dsoProc: TDataSource
    DataSet = qryProc
    OnStateChange = dsoStateChange
    OnDataChange = dsoDataChange
    Left = 558
    Top = 463
  end
  object qryITR: TFDQuery
    MasterSource = dsoDCI
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @CapaItemId uniqueidentifier;'
      ''
      'SET @CapaItemId = :Id;'
      ''
      '-- ========================='
      '-- CAPA + ITENS BASE'
      '-- ========================='
      'WITH CapasItens AS ('
      '    SELECT Id AS CapaItemId'
      #9',VersaoId'
      #9',IncotermValorUnitario = ValorUnitario'
      #9',IncotermValorUnitarioVlc = ValorUnitarioVlc'
      
        #9',duimp.ValorCotacao(CondicaoVendaValorBRL, CondicaoVendaValorMo' +
        'edaNegociada) AS MoedaNegociadaCotacao'
      '    FROM duimp.capas_itens'
      '    WHERE Id = @CapaItemId'
      '),'
      'DuimpCapas AS ('
      '    SELECT Id AS VersaoId'
      #9',FobMoeda AS MoedaSimbolo'
      
        #9',duimp.ValorCotacao(ValorTotalLocalEmbarqueBRL, ValorTotalLocal' +
        'EmbarqueUSD) AS MoedaCotacao'
      '    FROM duimp.capas AS DCP'
      #9'JOIN CapasItens AS DCI'
      #9#9' ON DCI.CapaItemId = @CapaItemId'
      '    WHERE DCI.VersaoId = DCP.Id'
      '),'
      'CapasItensValores AS ('
      '    SELECT DCI.CapaItemId'
      #9',DCP.MoedaSimbolo AS MoedaNegociadaSimbolo'
      
        #9',duimp.CotacaoValor(DCP.MoedaCotacao, DCI.MoedaNegociadaCotacao' +
        ') AS MoedaNegociadaCotacao'
      
        #9',DCI.IncotermValorUnitario    * duimp.CotacaoValor(DCP.MoedaCot' +
        'acao, DCI.MoedaNegociadaCotacao) AS ValorUnitario'
      
        #9',DCI.IncotermValorUnitarioVlc * duimp.CotacaoValor(DCP.MoedaCot' +
        'acao, DCI.MoedaNegociadaCotacao) AS ValorUnitarioVlc'
      '    FROM CapasItens DCI'
      '    JOIN DuimpCapas DCP ON DCP.VersaoId = DCI.VersaoId'
      '),'
      'Unidades AS ('
      #9'SELECT Codigo = ('
      #9#9'SELECT TOP 1 Codigo'
      #9#9'FROM Cybersoft_Cadastros.dbo.UnidadeMedida'
      #9#9'WHERE SOUNDEX(Descricao) = SOUNDEX(UNM.Descricao)'
      #9')'
      #9',Descricao'
      #9'FROM Cybersoft_Cadastros.dbo.UnidadeMedida AS UNM'
      #9'GROUP BY Descricao'
      '),'
      '-- ========================='
      '-- BASE '#218'NICA DE TRIBUTOS'
      '-- ========================='
      'TributosBase AS ('
      '    SELECT DCI.Id AS CapaItemId'
      #9',DUI.Numero AS Numero_Declaracao'
      #9',ADI.Registro'
      #9',DCI.Adicao'
      #9',DCI.NumeroItem'
      #9',DCI.ProdutoCodigo'
      #9',DCI.ProdutoVersao'
      #9',DCI.ProdutoDescricao'
      #9',PRO.Codigo AS ProdutoCodigoInterno'
      #9',DMO.TipoProcessoCodigo AS ModalidadeCodigo'
      #9',UnidadeComercialCodigo = UNI.Codigo'
      #9',DCI.UnidadeComercial'
      #9',DCI.QuantidadeComercial'
      #9',DCI.PesoLiquidoUnitario'
      #9',DCI.ValorUnitarioVlc AS ValorUnitario'
      #9',DCI.ValorUnitarioVlcBRL AS ValorUnitarioBRL'
      #9',CIV.MoedaNegociadaSimbolo AS FobMoedaSimbolo'
      #9',CIV.MoedaNegociadaCotacao AS FobMoedaCotacao'
      #9',CIV.ValorUnitarioVlc AS FobValorUnitario'
      #9',CIV.ValorUnitario AS FobValorUnitarioSemVlc'
      #9',DCI.Camex'
      #9',DCI.Dumping'
      #9',DMC.TipoAliquota'
      #9',DCI.IncotermCodigo'
      #9',INF.Tipo'
      #9',INF.PercentualEntrada'
      #9',INF.PercentualSaida'
      #9',DMC.Normal'
      #9',DMC.ValorAliquota'
      #9',DMC.ValorAliquotaReduzida'
      #9',VB.Devido'
      #9',VB.ARecolher'
      '    FROM duimp.capas_itens DCI'
      '    JOIN duimp.modalidades DMO'
      '        ON DMO.Id = DCI.CaracterizacaoImportacaoIndicador'
      '    JOIN duimp.versoes DUV'
      '        ON DUV.Id = DCI.VersaoId'
      '    JOIN duimp.duimps DUI'
      '        ON DUI.Id = DUV.DuimpId'
      '    JOIN duimp.itens_notas_fiscais INF'
      '        ON INF.CapaItemId = DCI.Id'
      '    JOIN duimp.itens_tributos DIT'
      '        ON DIT.CapaItemId = DCI.Id'
      '    JOIN duimp.itens_tributos_calculados DIC'
      '        ON DIC.ItemTributoId = DIT.Id'
      '       AND INF.Tipo = DIC.Tipo'
      '    JOIN duimp.itens_tributos_calculados_memorias_calculos DMC'
      '        ON DIC.Id = DMC.ItemTributoCalculadoId'
      '    JOIN duimp.itens_tributos_calculados_valores_brl VB'
      '        ON DIC.Id = VB.ItemTributoCalculadoId'
      '    JOIN CapasItensValores CIV'
      '        ON CIV.CapaItemId = DCI.Id'
      '    LEFT JOIN Produtos PRO'
      '        ON DCI.ProdutoCodigo = PRO.Codigo_DUIMP'
      '    LEFT JOIN Adicoes ADI'
      '        ON ADI.DI = DUI.Numero'
      '       AND ADI.Sequencia = DCI.NumeroItem'
      '    LEFT JOIN Unidades AS UNI'
      
        '        ON SOUNDEX(UNI.Descricao) = SOUNDEX(DCI.UnidadeComercial' +
        ')'
      '    WHERE DCI.Id = @CapaItemId'
      ')'
      '-- ========================='
      '-- AGREGA'#199#195'O FINAL (substitui todos os PIVOTs)'
      '-- ========================='
      'SELECT CapaItemId AS Id'
      ',Numero_Declaracao'
      ',Registro'
      ',Adicao'
      ',NumeroItem'
      ',ProdutoCodigo'
      ',ProdutoVersao'
      ',ProdutoDescricao'
      ',ProdutoCodigoInterno'
      ',ModalidadeCodigo  '
      ',UnidadeComercialCodigo'
      ',UnidadeComercial'
      ',QuantidadeComercial'
      ',PesoLiquidoUnitario'
      ',ValorUnitario'
      ',ValorUnitarioBRL'
      ',FobMoedaSimbolo'
      ',FobMoedaCotacao'
      ',FobValorUnitario'
      ',FobValorUnitarioSemVlc'
      ',Camex'
      ',Dumping'
      ',TipoAliquota'
      ',IncotermCodigo'
      ',-- Aliquotas'
      
        ' MAX(CASE WHEN Tipo = '#39'II'#39'     THEN ValorAliquota END) AS Aliquo' +
        'taII'
      
        ',MAX(CASE WHEN Tipo = '#39'IPI'#39'    THEN ValorAliquota END) AS Aliquo' +
        'taIPI'
      
        ',MAX(CASE WHEN Tipo = '#39'PIS'#39'    THEN ValorAliquota END) AS Aliquo' +
        'taPIS'
      
        ',MAX(CASE WHEN Tipo = '#39'COFINS'#39' THEN ValorAliquota END) AS Aliquo' +
        'taCOFINS'
      
        ',MAX(CASE WHEN Tipo = '#39'CIDE'#39'   THEN ValorAliquota END) AS Aliquo' +
        'taCIDE'
      ',-- Aliquotas Reduzidas'
      
        ' MAX(CASE WHEN Tipo = '#39'II'#39'     THEN ValorAliquotaReduzida END) A' +
        'S AliquotaReduzidaII'
      
        ',MAX(CASE WHEN Tipo = '#39'IPI'#39'    THEN ValorAliquotaReduzida END) A' +
        'S AliquotaReduzidaIPI'
      
        ',MAX(CASE WHEN Tipo = '#39'PIS'#39'    THEN ValorAliquotaReduzida END) A' +
        'S AliquotaReduzidaPIS'
      
        ',MAX(CASE WHEN Tipo = '#39'COFINS'#39' THEN ValorAliquotaReduzida END) A' +
        'S AliquotaReduzidaCOFINS'
      
        ',MAX(CASE WHEN Tipo = '#39'CIDE'#39'   THEN ValorAliquotaReduzida END) A' +
        'S AliquotaReduzidaCIDE'
      ',-- Percentuais Entrada'
      
        ' MAX(CASE WHEN Tipo = '#39'II'#39'     THEN PercentualEntrada END) AS Al' +
        'iquotaEntradaII'
      
        ',MAX(CASE WHEN Tipo = '#39'IPI'#39'    THEN PercentualEntrada END) AS Al' +
        'iquotaEntradaIPI'
      
        ',MAX(CASE WHEN Tipo = '#39'PIS'#39'    THEN PercentualEntrada END) AS Al' +
        'iquotaEntradaPIS'
      
        ',MAX(CASE WHEN Tipo = '#39'COFINS'#39' THEN PercentualEntrada END) AS Al' +
        'iquotaEntradaCOFINS'
      
        ',MAX(CASE WHEN Tipo = '#39'CIDE'#39'   THEN PercentualEntrada END) AS Al' +
        'iquotaEntradaCIDE'
      ',-- Percentuais Sa'#237'da'
      
        ' MAX(CASE WHEN Tipo = '#39'II'#39'     THEN PercentualSaida END) AS Aliq' +
        'uotaSaidaII'
      
        ',MAX(CASE WHEN Tipo = '#39'IPI'#39'    THEN PercentualSaida END) AS Aliq' +
        'uotaSaidaIPI'
      
        ',MAX(CASE WHEN Tipo = '#39'PIS'#39'    THEN PercentualSaida END) AS Aliq' +
        'uotaSaidaPIS'
      
        ',MAX(CASE WHEN Tipo = '#39'COFINS'#39' THEN PercentualSaida END) AS Aliq' +
        'uotaSaidaCOFINS'
      
        ',MAX(CASE WHEN Tipo = '#39'CIDE'#39'   THEN PercentualSaida END) AS Aliq' +
        'uotaSaidaCIDE'
      ',-- Valores'
      ' MAX(CASE WHEN Tipo = '#39'II'#39'     THEN Normal END) AS ValorII'
      ',MAX(CASE WHEN Tipo = '#39'IPI'#39'    THEN Normal END) AS ValorIPI'
      ',MAX(CASE WHEN Tipo = '#39'PIS'#39'    THEN Normal END) AS ValorPIS'
      ',MAX(CASE WHEN Tipo = '#39'COFINS'#39' THEN Normal END) AS ValorCOFINS'
      ',MAX(CASE WHEN Tipo = '#39'CIDE'#39'   THEN Normal END) AS ValorCIDE'
      ',-- Devido'
      ' MAX(CASE WHEN Tipo = '#39'II'#39'     THEN Devido END) AS ValorDevidoII'
      
        ',MAX(CASE WHEN Tipo = '#39'IPI'#39'    THEN Devido END) AS ValorDevidoIP' +
        'I'
      
        ',MAX(CASE WHEN Tipo = '#39'PIS'#39'    THEN Devido END) AS ValorDevidoPI' +
        'S'
      
        ',MAX(CASE WHEN Tipo = '#39'COFINS'#39' THEN Devido END) AS ValorDevidoCO' +
        'FINS'
      
        ',MAX(CASE WHEN Tipo = '#39'CIDE'#39'   THEN Devido END) AS ValorDevidoCI' +
        'DE'
      ',-- A Recolher'
      
        ' MAX(CASE WHEN Tipo = '#39'II'#39'     THEN ARecolher END) AS ValorAReco' +
        'lherII'
      
        ',MAX(CASE WHEN Tipo = '#39'IPI'#39'    THEN ARecolher END) AS ValorAReco' +
        'lherIPI'
      
        ',MAX(CASE WHEN Tipo = '#39'PIS'#39'    THEN ARecolher END) AS ValorAReco' +
        'lherPIS'
      
        ',MAX(CASE WHEN Tipo = '#39'COFINS'#39' THEN ARecolher END) AS ValorAReco' +
        'lherCOFINS'
      
        ',MAX(CASE WHEN Tipo = '#39'CIDE'#39'   THEN ARecolher END) AS ValorAReco' +
        'lherCIDE'
      'FROM TributosBase'
      'GROUP BY CapaItemId'
      ',Numero_Declaracao'
      ',Registro'
      ',Adicao'
      ',NumeroItem'
      ',ProdutoCodigo'
      ',ProdutoVersao'
      ',ProdutoDescricao'
      ',ProdutoCodigoInterno'
      ',ModalidadeCodigo  '
      ',UnidadeComercialCodigo'
      ',UnidadeComercial'
      ',QuantidadeComercial'
      ',PesoLiquidoUnitario'
      ',ValorUnitario'
      ',ValorUnitarioBRL'
      ',FobMoedaSimbolo'
      ',FobMoedaCotacao'
      ',FobValorUnitario'
      ',FobValorUnitarioSemVlc'
      ',Camex'
      ',Dumping'
      ',TipoAliquota'
      ',IncotermCodigo;')
    Left = 616
    Top = 463
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryITRId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      Required = True
      Size = 38
    end
    object qryITRNumero_Declaracao: TStringField
      FieldName = 'Numero_Declaracao'
      Origin = 'Numero_Declaracao'
      Required = True
      Size = 15
    end
    object qryITRRegistro: TLargeintField
      FieldName = 'Registro'
      Origin = 'Registro'
    end
    object qryITRAdicao: TIntegerField
      FieldName = 'Adicao'
      Origin = 'Adicao'
      Required = True
    end
    object qryITRNumeroItem: TIntegerField
      FieldName = 'NumeroItem'
      Origin = 'NumeroItem'
      Required = True
    end
    object qryITRProdutoCodigo: TIntegerField
      FieldName = 'ProdutoCodigo'
      Origin = 'ProdutoCodigo'
      Required = True
    end
    object qryITRProdutoVersao: TIntegerField
      FieldName = 'ProdutoVersao'
      Origin = 'ProdutoVersao'
      Required = True
    end
    object qryITRProdutoDescricao: TStringField
      FieldName = 'ProdutoDescricao'
      Origin = 'ProdutoDescricao'
      Size = 4000
    end
    object qryITRProdutoCodigoInterno: TIntegerField
      FieldName = 'ProdutoCodigoInterno'
      Origin = 'ProdutoCodigoInterno'
      ReadOnly = True
    end
    object qryITRModalidadeCodigo: TIntegerField
      FieldName = 'ModalidadeCodigo'
      Origin = 'ModalidadeCodigo'
      Required = True
    end
    object qryITRUnidadeComercialCodigo: TStringField
      FieldName = 'UnidadeComercialCodigo'
      Origin = 'UnidadeComercialCodigo'
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
    object qryITRUnidadeComercial: TStringField
      FieldName = 'UnidadeComercial'
      Origin = 'UnidadeComercial'
      Required = True
    end
    object qryITRQuantidadeComercial: TFloatField
      FieldName = 'QuantidadeComercial'
      Origin = 'QuantidadeComercial'
      Required = True
    end
    object qryITRPesoLiquidoUnitario: TFloatField
      FieldName = 'PesoLiquidoUnitario'
      Origin = 'PesoLiquidoUnitario'
      Required = True
    end
    object qryITRValorUnitario: TFloatField
      FieldName = 'ValorUnitario'
      Origin = 'ValorUnitario'
      Required = True
    end
    object qryITRValorUnitarioBRL: TFloatField
      FieldName = 'ValorUnitarioBRL'
      Origin = 'ValorUnitarioBRL'
      ReadOnly = True
      Required = True
    end
    object qryITRFobMoedaSimbolo: TStringField
      FieldName = 'FobMoedaSimbolo'
      Origin = 'FobMoedaSimbolo'
      Size = 3
    end
    object qryITRFobMoedaCotacao: TFloatField
      FieldName = 'FobMoedaCotacao'
      Origin = 'FobMoedaCotacao'
      ReadOnly = True
    end
    object qryITRFobValorUnitario: TFloatField
      FieldName = 'FobValorUnitario'
      Origin = 'FobValorUnitario'
      ReadOnly = True
    end
    object qryITRFobValorUnitarioSemVlc: TFloatField
      FieldName = 'FobValorUnitarioSemVlc'
      Origin = 'FobValorUnitarioSemVlc'
      ReadOnly = True
    end
    object qryITRCamex: TBooleanField
      FieldName = 'Camex'
      Origin = 'Camex'
      Required = True
    end
    object qryITRDumping: TBooleanField
      FieldName = 'Dumping'
      Origin = 'Dumping'
      Required = True
    end
    object qryITRTipoAliquota: TStringField
      FieldName = 'TipoAliquota'
      Origin = 'TipoAliquota'
      Required = True
      Size = 10
    end
    object qryITRIncotermCodigo: TStringField
      FieldName = 'IncotermCodigo'
      Origin = 'IncotermCodigo'
      Required = True
      Size = 10
    end
    object qryITRAliquotaII: TFloatField
      FieldName = 'AliquotaII'
      Origin = 'AliquotaII'
      ReadOnly = True
    end
    object qryITRAliquotaIPI: TFloatField
      FieldName = 'AliquotaIPI'
      Origin = 'AliquotaIPI'
      ReadOnly = True
    end
    object qryITRAliquotaPIS: TFloatField
      FieldName = 'AliquotaPIS'
      Origin = 'AliquotaPIS'
      ReadOnly = True
    end
    object qryITRAliquotaCOFINS: TFloatField
      FieldName = 'AliquotaCOFINS'
      Origin = 'AliquotaCOFINS'
      ReadOnly = True
    end
    object qryITRAliquotaCIDE: TFloatField
      FieldName = 'AliquotaCIDE'
      Origin = 'AliquotaCIDE'
      ReadOnly = True
      Required = True
    end
    object qryITRAliquotaEntradaII: TFloatField
      FieldName = 'AliquotaEntradaII'
      Origin = 'AliquotaEntradaII'
      ReadOnly = True
    end
    object qryITRAliquotaEntradaIPI: TFloatField
      FieldName = 'AliquotaEntradaIPI'
      Origin = 'AliquotaEntradaIPI'
      ReadOnly = True
    end
    object qryITRAliquotaEntradaPIS: TFloatField
      FieldName = 'AliquotaEntradaPIS'
      Origin = 'AliquotaEntradaPIS'
      ReadOnly = True
    end
    object qryITRAliquotaEntradaCOFINS: TFloatField
      FieldName = 'AliquotaEntradaCOFINS'
      Origin = 'AliquotaEntradaCOFINS'
      ReadOnly = True
    end
    object qryITRAliquotaEntradaCIDE: TFloatField
      FieldName = 'AliquotaEntradaCIDE'
      Origin = 'AliquotaEntradaCIDE'
      ReadOnly = True
      Required = True
    end
    object qryITRAliquotaSaidaII: TFloatField
      FieldName = 'AliquotaSaidaII'
      Origin = 'AliquotaSaidaII'
      ReadOnly = True
    end
    object qryITRAliquotaSaidaIPI: TFloatField
      FieldName = 'AliquotaSaidaIPI'
      Origin = 'AliquotaSaidaIPI'
      ReadOnly = True
    end
    object qryITRAliquotaSaidaPIS: TFloatField
      FieldName = 'AliquotaSaidaPIS'
      Origin = 'AliquotaSaidaPIS'
      ReadOnly = True
    end
    object qryITRAliquotaSaidaCOFINS: TFloatField
      FieldName = 'AliquotaSaidaCOFINS'
      Origin = 'AliquotaSaidaCOFINS'
      ReadOnly = True
    end
    object qryITRAliquotaSaidaCIDE: TFloatField
      FieldName = 'AliquotaSaidaCIDE'
      Origin = 'AliquotaSaidaCIDE'
      ReadOnly = True
      Required = True
    end
    object qryITRValorII: TFloatField
      FieldName = 'ValorII'
      Origin = 'ValorII'
      ReadOnly = True
    end
    object qryITRValorIPI: TFloatField
      FieldName = 'ValorIPI'
      Origin = 'ValorIPI'
      ReadOnly = True
    end
    object qryITRValorPIS: TFloatField
      FieldName = 'ValorPIS'
      Origin = 'ValorPIS'
      ReadOnly = True
    end
    object qryITRValorCOFINS: TFloatField
      FieldName = 'ValorCOFINS'
      Origin = 'ValorCOFINS'
      ReadOnly = True
    end
    object qryITRValorCIDE: TFloatField
      FieldName = 'ValorCIDE'
      Origin = 'ValorCIDE'
      ReadOnly = True
      Required = True
    end
    object qryITRAliquotaReduzidaII: TFloatField
      FieldName = 'AliquotaReduzidaII'
      Origin = 'AliquotaReduzidaII'
      ReadOnly = True
    end
    object qryITRAliquotaReduzidaIPI: TFloatField
      FieldName = 'AliquotaReduzidaIPI'
      Origin = 'AliquotaReduzidaIPI'
      ReadOnly = True
    end
    object qryITRAliquotaReduzidaPIS: TFloatField
      FieldName = 'AliquotaReduzidaPIS'
      Origin = 'AliquotaReduzidaPIS'
      ReadOnly = True
    end
    object qryITRAliquotaReduzidaCOFINS: TFloatField
      FieldName = 'AliquotaReduzidaCOFINS'
      Origin = 'AliquotaReduzidaCOFINS'
      ReadOnly = True
    end
    object qryITRAliquotaReduzidaCIDE: TFloatField
      FieldName = 'AliquotaReduzidaCIDE'
      Origin = 'AliquotaReduzidaCIDE'
      ReadOnly = True
      Required = True
    end
    object qryITRValorDevidoII: TFloatField
      FieldName = 'ValorDevidoII'
      Origin = 'ValorDevidoII'
      ReadOnly = True
    end
    object qryITRValorDevidoIPI: TFloatField
      FieldName = 'ValorDevidoIPI'
      Origin = 'ValorDevidoIPI'
      ReadOnly = True
    end
    object qryITRValorDevidoPIS: TFloatField
      FieldName = 'ValorDevidoPIS'
      Origin = 'ValorDevidoPIS'
      ReadOnly = True
    end
    object qryITRValorDevidoCOFINS: TFloatField
      FieldName = 'ValorDevidoCOFINS'
      Origin = 'ValorDevidoCOFINS'
      ReadOnly = True
    end
    object qryITRValorDevidoCIDE: TFloatField
      FieldName = 'ValorDevidoCIDE'
      Origin = 'ValorDevidoCIDE'
      ReadOnly = True
      Required = True
    end
    object qryITRValorARecolherII: TFloatField
      FieldName = 'ValorARecolherII'
      Origin = 'ValorARecolherII'
      ReadOnly = True
    end
    object qryITRValorARecolherIPI: TFloatField
      FieldName = 'ValorARecolherIPI'
      Origin = 'ValorARecolherIPI'
      ReadOnly = True
    end
    object qryITRValorARecolherPIS: TFloatField
      FieldName = 'ValorARecolherPIS'
      Origin = 'ValorARecolherPIS'
      ReadOnly = True
    end
    object qryITRValorARecolherCOFINS: TFloatField
      FieldName = 'ValorARecolherCOFINS'
      Origin = 'ValorARecolherCOFINS'
      ReadOnly = True
    end
    object qryITRValorARecolherCIDE: TFloatField
      FieldName = 'ValorARecolherCIDE'
      Origin = 'ValorARecolherCIDE'
      ReadOnly = True
      Required = True
    end
  end
  object qryICMS: TFDQuery
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'SELECT ICM.UF'
      ',ICM.Reducao_ICMS'
      'FROM ICMS ICM'
      'WHERE UF = :UF')
    Left = 818
    Top = 207
    ParamData = <
      item
        Name = 'UF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryICMSUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      FixedChar = True
      Size = 10
    end
    object qryICMSReducao_ICMS: TFloatField
      FieldName = 'Reducao_ICMS'
      Origin = 'Reducao_ICMS'
    end
  end
  object qryCON: TFDQuery
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'SELECT CONF.Linha'
      ',CONF.Processo_Numero'
      ',CONF.Processo_DigitosAno'
      ',CONF.SISCOMEX_MascaraPO'
      ',CONF.SISCOMEX_MascaraItem'
      ',CONF.SISCOMEX_MascaraPOFech'
      ',CONF.SISCOMEX_MascaraItemFech'
      ',CONF.SISCOMEX_MascaraReferencia'
      ',CONF.SISCOMEX_MascaraPosicao'
      ',CONF.SISCOMEX_Orgao'
      ',CONF.SISCOMEX_Documento'
      ',CONF.SISCOMEX_CentroCusto'
      ',CONF.Ramo_Atividade'
      ',CONF.Processo_ImportarFechado'
      'FROM Configuracao AS CONF')
    Left = 818
    Top = 271
    object qryCONLinha: TSmallintField
      FieldName = 'Linha'
      Origin = 'Linha'
      Required = True
    end
    object qryCONProcesso_Numero: TStringField
      FieldName = 'Processo_Numero'
      Origin = 'Processo_Numero'
      Size = 3
    end
    object qryCONProcesso_DigitosAno: TSmallintField
      FieldName = 'Processo_DigitosAno'
      Origin = 'Processo_DigitosAno'
    end
    object qryCONSISCOMEX_MascaraPO: TStringField
      FieldName = 'SISCOMEX_MascaraPO'
      Origin = 'SISCOMEX_MascaraPO'
      Size = 15
    end
    object qryCONSISCOMEX_MascaraItem: TStringField
      FieldName = 'SISCOMEX_MascaraItem'
      Origin = 'SISCOMEX_MascaraItem'
      Size = 15
    end
    object qryCONSISCOMEX_MascaraPOFech: TStringField
      FieldName = 'SISCOMEX_MascaraPOFech'
      Origin = 'SISCOMEX_MascaraPOFech'
      Size = 15
    end
    object qryCONSISCOMEX_MascaraItemFech: TStringField
      FieldName = 'SISCOMEX_MascaraItemFech'
      Origin = 'SISCOMEX_MascaraItemFech'
      Size = 15
    end
    object qryCONSISCOMEX_MascaraReferencia: TStringField
      FieldName = 'SISCOMEX_MascaraReferencia'
      Origin = 'SISCOMEX_MascaraReferencia'
      Size = 15
    end
    object qryCONSISCOMEX_MascaraPosicao: TSmallintField
      FieldName = 'SISCOMEX_MascaraPosicao'
      Origin = 'SISCOMEX_MascaraPosicao'
    end
    object qryCONSISCOMEX_Orgao: TStringField
      FieldName = 'SISCOMEX_Orgao'
      Origin = 'SISCOMEX_Orgao'
      Size = 10
    end
    object qryCONSISCOMEX_Documento: TStringField
      FieldName = 'SISCOMEX_Documento'
      Origin = 'SISCOMEX_Documento'
      Size = 10
    end
    object qryCONSISCOMEX_CentroCusto: TStringField
      FieldName = 'SISCOMEX_CentroCusto'
      Origin = 'SISCOMEX_CentroCusto'
      Size = 10
    end
    object qryCONRamo_Atividade: TSmallintField
      FieldName = 'Ramo_Atividade'
      Origin = 'Ramo_Atividade'
    end
    object qryCONProcesso_ImportarFechado: TBooleanField
      FieldName = 'Processo_ImportarFechado'
      Origin = 'Processo_ImportarFechado'
    end
  end
  object dsoITR: TDataSource
    DataSet = qryITR
    Left = 680
    Top = 463
  end
  object qryFRN: TFDQuery
    CachedUpdates = True
    MasterSource = dsoDPR
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'Fornecedores'
    UpdateOptions.KeyFields = 'Codigo'
    UpdateObject = updFRN
    SQL.Strings = (
      'DECLARE @CapaItemId uniqueidentifier;'
      ''
      'SET @CapaItemId = :Id;'
      ''
      'SELECT DISTINCT DCI.Id'
      ',FRN.Codigo'
      ',OPE.Codigo AS Codigo_DUIMP'
      ',FRN.Bairro'
      ',FRN.CEP'
      ',FRN.Email'
      ',FRN.Estado'
      ',FRN.Municipio_Codigo'
      ',FRN.Municipio'
      ',OPE.NIOperador'
      ',FRN.Nome'
      ',FRN.Nome_Fantasia'
      ',OPE.PaisCodigo'
      ',Pais = PAI.Codigo'
      ',FRN.Rua'
      ',FRN.Rua_Numero'
      ',FRN.Indicador_IE'
      ',FRN.Ramo_Atividade'
      ',FRN.Isento'
      ',FRN.Ativo'
      ',OPE.Versao'
      'FROM duimp.capas_itens AS DCI'
      'JOIN duimp.itens_exportadores AS OPE'
      #9'ON DCI.Id = OPE.Id'
      'LEFT JOIN Fornecedores AS FRN'
      #9'ON OPE.Codigo = FRN.Codigo_DUIMP'
      'LEFT JOIN Cybersoft_Cadastros.dbo.Paises AS PAI'
      #9'ON PAI.Sigla = OPE.PaisCodigo'
      'WHERE DCI.Id = @CapaItemId;')
    Left = 24
    Top = 463
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryFRNId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      Required = True
      Size = 38
    end
    object qryFRNCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFRNCodigo_DUIMP: TStringField
      FieldName = 'Codigo_DUIMP'
      Origin = 'Codigo_DUIMP'
      Required = True
      Size = 35
    end
    object qryFRNBairro: TStringField
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Size = 40
    end
    object qryFRNCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 8
    end
    object qryFRNEmail: TStringField
      FieldName = 'Email'
      Origin = 'Email'
      Size = 200
    end
    object qryFRNEstado: TStringField
      FieldName = 'Estado'
      Origin = 'Estado'
      Size = 2
    end
    object qryFRNMunicipio_Codigo: TIntegerField
      FieldName = 'Municipio_Codigo'
      Origin = 'Municipio_Codigo'
    end
    object qryFRNMunicipio: TStringField
      FieldName = 'Municipio'
      Origin = 'Municipio'
    end
    object qryFRNNIOperador: TStringField
      FieldName = 'NIOperador'
      Origin = 'NIOperador'
      Required = True
      Size = 11
    end
    object qryFRNNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 60
    end
    object qryFRNNome_Fantasia: TStringField
      FieldName = 'Nome_Fantasia'
      Origin = 'Nome_Fantasia'
      Size = 60
    end
    object qryFRNPaisCodigo: TStringField
      FieldName = 'PaisCodigo'
      Origin = 'PaisCodigo'
      Required = True
      Size = 2
    end
    object qryFRNPais: TStringField
      FieldName = 'Pais'
      Origin = 'Pais'
      FixedChar = True
      Size = 4
    end
    object qryFRNRua: TStringField
      FieldName = 'Rua'
      Origin = 'Rua'
      Size = 40
    end
    object qryFRNRua_Numero: TStringField
      FieldName = 'Rua_Numero'
      Origin = 'Rua_Numero'
      Size = 10
    end
    object qryFRNVersao: TIntegerField
      FieldName = 'Versao'
      Origin = 'Versao'
      Required = True
    end
    object qryFRNIndicador_IE: TStringField
      FieldName = 'Indicador_IE'
      Origin = 'Indicador_IE'
      Size = 1
    end
    object qryFRNRamo_Atividade: TIntegerField
      FieldName = 'Ramo_Atividade'
      Origin = 'Ramo_Atividade'
    end
    object qryFRNIsento: TBooleanField
      FieldName = 'Isento'
      Origin = 'Isento'
    end
    object qryFRNAtivo: TBooleanField
      FieldName = 'Ativo'
      Origin = 'Ativo'
    end
  end
  object dsoFRN: TDataSource
    DataSet = qryFRN
    OnStateChange = dsoStateChange
    OnDataChange = dsoDataChange
    Left = 86
    Top = 463
  end
  object updFRN: TFDUpdateSQL
    Connection = damConnection.DBCliente
    InsertSQL.Strings = (
      'DECLARE @FornecedorCodigo int;'
      ''
      'SET @FornecedorCodigo = CASE '
      '    WHEN :NEW_Codigo IS NULL OR :NEW_Codigo <= 0 '
      '        THEN ('
      '            SELECT ISNULL(MAX(Codigo), 0) + 1'
      '            FROM Fornecedores'
      '        )'
      '    ELSE :NEW_Codigo'
      'END;'
      ''
      'MERGE INTO Fornecedores AS TARGET'
      'USING ('
      '    SELECT @FornecedorCodigo AS Codigo'
      #9',:NEW_Nome AS Nome'
      #9',:NEW_Nome AS Nome_Fantasia'
      #9',:NEW_Rua AS Rua'
      #9',:NEW_Rua_Numero AS Rua_Numero'
      #9',:NEW_Bairro AS Bairro'
      #9',9999999 AS Municipio_Codigo'
      #9',:NEW_Municipio AS Municipio'
      #9','#39'EX'#39' AS Estado'
      #9',:NEW_Pais AS Pais'
      #9',:NEW_CEP AS CEP'
      #9',:NEW_Email AS Email'
      #9',:NEW_Codigo_DUIMP AS Codigo_DUIMP'
      #9',:NEW_NIOperador AS Ident_Operador'
      #9',9 AS Indicador_IE'
      #9',:NEW_Ramo_Atividade AS Ramo_Atividade'
      #9',CAST(1 AS BIT) AS Isento'
      #9',CAST(1 AS BIT) AS Ativo'
      ') AS SOURCE'
      'ON TARGET.Codigo = SOURCE.Codigo'
      ''
      'WHEN MATCHED THEN'
      '    UPDATE SET'
      '     TARGET.Codigo_DUIMP = SOURCE.Codigo_DUIMP'
      #9',TARGET.Nome = SOURCE.Nome'
      #9',TARGET.Nome_Fantasia = SOURCE.Nome_Fantasia'
      #9',TARGET.Rua = SOURCE.Rua'
      #9',TARGET.Rua_Numero = SOURCE.Rua_Numero'
      #9',TARGET.Bairro = SOURCE.Bairro'
      #9',TARGET.Municipio_Codigo = SOURCE.Municipio_Codigo'
      #9',TARGET.Municipio = SOURCE.Municipio'
      #9',TARGET.Estado = SOURCE.Estado'
      #9',TARGET.Pais = SOURCE.Pais'
      #9',TARGET.CEP = SOURCE.CEP'
      #9',TARGET.Email = SOURCE.Email'
      #9',TARGET.Ident_Operador = SOURCE.Ident_Operador'
      #9',TARGET.Indicador_IE = SOURCE.Indicador_IE'
      #9',TARGET.Ramo_Atividade = SOURCE.Ramo_Atividade'
      #9',TARGET.Isento = SOURCE.Isento'
      #9',TARGET.Ativo = SOURCE.Ativo'
      ''
      'WHEN NOT MATCHED THEN'
      '    INSERT (Codigo'
      '           ,Nome'
      '           ,Nome_Fantasia'
      '           ,Rua'
      '           ,Rua_Numero'
      '           ,Bairro'
      '           ,Municipio_Codigo'
      '           ,Municipio'
      '           ,Estado'
      '           ,Pais'
      '           ,CEP'
      '           ,Email'
      '           ,Codigo_DUIMP'
      '           ,Ident_Operador'
      '           ,Indicador_IE'
      '           ,Isento'
      '           ,Ativo)'
      '    VALUES (SOURCE.Codigo'
      '           ,SOURCE.Nome'
      '           ,SOURCE.Nome_Fantasia'
      '           ,SOURCE.Rua'
      '           ,SOURCE.Rua_Numero'
      '           ,SOURCE.Bairro'
      '           ,SOURCE.Municipio_Codigo'
      '           ,SOURCE.Municipio'
      '           ,SOURCE.Estado'
      '           ,SOURCE.Pais'
      '           ,SOURCE.CEP'
      '           ,SOURCE.Email'
      '           ,SOURCE.Codigo_DUIMP'
      '           ,SOURCE.Ident_Operador'
      '           ,SOURCE.Indicador_IE'
      '           ,SOURCE.Isento'
      '           ,SOURCE.Ativo);'
      ''
      'SELECT DISTINCT DCI.Id'
      ',FRN.Codigo'
      ',OPE.Codigo AS Codigo_DUIMP'
      ',FRN.Bairro'
      ',FRN.CEP'
      ',FRN.Email'
      ',FRN.Estado'
      ',FRN.Municipio_Codigo'
      ',FRN.Municipio'
      ',OPE.NIOperador'
      ',FRN.Nome'
      ',FRN.Nome_Fantasia'
      ',OPE.PaisCodigo'
      ',Pais = PAI.Codigo'
      ',FRN.Rua'
      ',FRN.Rua_Numero'
      ',FRN.Indicador_IE'
      ',FRN.Ramo_Atividade'
      ',FRN.Isento'
      ',FRN.Ativo'
      ',OPE.Versao'
      'FROM duimp.capas_itens AS DCI'
      'JOIN duimp.itens_exportadores AS OPE'
      #9'ON DCI.Id = OPE.Id'
      'LEFT JOIN Fornecedores AS FRN'
      #9'ON OPE.Codigo = FRN.Codigo_DUIMP'
      'LEFT JOIN Cybersoft_Cadastros.dbo.Paises AS PAI'
      #9'ON PAI.Sigla = OPE.PaisCodigo'
      'WHERE FRN.Codigo = @FornecedorCodigo;')
    FetchRowSQL.Strings = (
      'SELECT DISTINCT DCI.Id'
      ',FRN.Codigo'
      ',OPE.Codigo AS Codigo_DUIMP'
      ',FRN.Bairro'
      ',FRN.CEP'
      ',FRN.Email'
      ',FRN.Estado'
      ',FRN.Municipio_Codigo'
      ',FRN.Municipio'
      ',OPE.NIOperador'
      ',FRN.Nome'
      ',FRN.Nome_Fantasia'
      ',OPE.PaisCodigo'
      ',Pais = PAI.Codigo'
      ',FRN.Rua'
      ',FRN.Rua_Numero'
      ',FRN.Indicador_IE'
      ',FRN.Ramo_Atividade'
      ',FRN.Isento'
      ',FRN.Ativo'
      ',OPE.Versao'
      'FROM duimp.capas_itens AS DCI'
      'JOIN duimp.itens_exportadores AS OPE'
      #9'ON DCI.Id = OPE.Id'
      'LEFT JOIN Fornecedores AS FRN'
      #9'ON OPE.Codigo = FRN.Codigo_DUIMP'
      'LEFT JOIN Cybersoft_Cadastros.dbo.Paises AS PAI'
      #9'ON PAI.Sigla = OPE.PaisCodigo'
      'WHERE FRN.Codigo = :Codigo')
    Left = 146
    Top = 463
  end
  object qryPRS: TFDQuery
    MasterSource = dsoDUI
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @DuimpId uniqueidentifier;'
      ''
      'SET @DuimpId = :Id;'
      ''
      'SELECT DISTINCT DUV.ProcessoNumero'
      'FROM duimp.versoes AS DUV'
      'WHERE DUV.DuimpId = @DuimpId'
      'AND DUV.ProcessoNumero IS NOT NULL;')
    Left = 378
    Top = 527
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryPRSProcessoNumero: TStringField
      FieldName = 'ProcessoNumero'
      Origin = 'ProcessoNumero'
      Size = 15
    end
  end
  object dsoPRS: TDataSource
    DataSet = qryPRS
    Left = 434
    Top = 527
  end
  object qryTCV: TFDQuery
    MasterSource = dsoDUV
    MasterFields = 'Id'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @VersaoId uniqueidentifier;'
      ''
      'SET @VersaoId = :Id;'
      ''
      'SELECT DTV.Id'
      ',DTC.Tipo'
      ',DTV.Calculado'
      ',DTV.AReduzir'
      ',DTV.Devido'
      ',DTV.Suspenso'
      ',DTV.ARecolher'
      ',DTV.Recolhido'
      ',DTV.Majorado'
      ',DTV.NotaFiscal'
      'FROM duimp.tributos_calculados_valores_brl AS DTV'
      'JOIN duimp.tributos_calculados AS DTC'
      #9'ON DTC.Id = DTV.TributoCalculadoId'
      'WHERE DTC.VersaoId = @VersaoId;')
    Left = 818
    Top = 335
    ParamData = <
      item
        Name = 'ID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    object qryTCVId: TGuidField
      FieldName = 'Id'
      Origin = 'Id'
      Required = True
      Size = 38
    end
    object qryTCVTipo: TStringField
      FieldName = 'Tipo'
      Origin = 'Tipo'
      Required = True
      Size = 17
    end
    object qryTCVCalculado: TFloatField
      FieldName = 'Calculado'
      Origin = 'Calculado'
      Required = True
    end
    object qryTCVAReduzir: TFloatField
      FieldName = 'AReduzir'
      Origin = 'AReduzir'
      Required = True
    end
    object qryTCVDevido: TFloatField
      FieldName = 'Devido'
      Origin = 'Devido'
      Required = True
    end
    object qryTCVSuspenso: TFloatField
      FieldName = 'Suspenso'
      Origin = 'Suspenso'
      Required = True
    end
    object qryTCVARecolher: TFloatField
      FieldName = 'ARecolher'
      Origin = 'ARecolher'
      Required = True
    end
    object qryTCVRecolhido: TFloatField
      FieldName = 'Recolhido'
      Origin = 'Recolhido'
      Required = True
    end
    object qryTCVMajorado: TFloatField
      FieldName = 'Majorado'
      Origin = 'Majorado'
      Required = True
    end
    object qryTCVNotaFiscal: TFloatField
      FieldName = 'NotaFiscal'
      Origin = 'NotaFiscal'
      Required = True
    end
  end
  object qryADI: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'Numero_Declaracao;NumeroItem'
    MasterSource = dsoDPR
    MasterFields = 'Numero_Declaracao;NumeroItem'
    DetailFields = 'Numero_Declaracao;NumeroItem'
    Connection = damConnection.DBCliente
    UpdateOptions.UpdateTableName = 'Adicoes'
    UpdateOptions.KeyFields = 'Registro'
    UpdateObject = updADI
    SQL.Strings = (
      'SELECT ADI.Registro'
      ',ADI.DI AS Numero_Declaracao'
      ',ADI.Adicao'
      ',ADI.Sequencia AS NumeroItem'
      ',ADI.Quantidade'
      ',ADI.Valor_Unitario'
      ',ADI.Valor_UnitarioReal'
      ',ADI.NCM'
      ',ExportadorCodigo = ADI.Exportador'
      ',Exportador = FRN.Codigo_DUIMP'
      ',ADI.Peso_Liquido'
      ',ADI.Lancado_Entrada'
      ',ADI.Lancado_Saida'
      ',ADI.Valor_PIS'
      ',ADI.Valor_COFINS'
      ',ADI.Dumping'
      ',ADI.Valor_SemAdValorem'
      ',ADI.Aliquota_ICMS'
      ',ADI.Lancado_Terceiros'
      ',ADI.Ordem'
      ',ADI.Pedido'
      ',ADI.CIDE_Aliquota'
      ',ADI.CIDE_ValorDevido'
      ',ADI.CIDE_ValorRecolher'
      ',ADI.Incoterm'
      'FROM Adicoes AS ADI'
      'LEFT JOIN Fornecedores AS FRN'
      #9'ON ADI.Exportador = FRN.Codigo'
      'WHERE ADI.Sequencia = :NumeroItem'
      'AND ADI.DI = :Numero_Declaracao;')
    Left = 203
    Top = 463
    ParamData = <
      item
        Name = 'NUMEROITEM'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NUMERO_DECLARACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
        Value = Null
      end>
    object qryADIRegistro: TLargeintField
      FieldName = 'Registro'
      Origin = 'Registro'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryADINumero_Declaracao: TStringField
      FieldName = 'Numero_Declaracao'
      Origin = 'Numero_Declaracao'
      Required = True
      Size = 15
    end
    object qryADIAdicao: TSmallintField
      FieldName = 'Adicao'
      Origin = 'Adicao'
      Required = True
    end
    object qryADINumeroItem: TSmallintField
      FieldName = 'NumeroItem'
      Origin = 'NumeroItem'
    end
    object qryADIQuantidade: TFloatField
      FieldName = 'Quantidade'
      Origin = 'Quantidade'
      Required = True
    end
    object qryADIValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      Origin = 'Valor_Unitario'
    end
    object qryADIValor_UnitarioReal: TFloatField
      FieldName = 'Valor_UnitarioReal'
      Origin = 'Valor_UnitarioReal'
    end
    object qryADINCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 8
    end
    object qryADIExportadorCodigo: TIntegerField
      FieldName = 'ExportadorCodigo'
      Origin = 'ExportadorCodigo'
    end
    object qryADIExportador: TStringField
      FieldName = 'Exportador'
      Origin = 'Exportador'
      Size = 35
    end
    object qryADIPeso_Liquido: TFloatField
      FieldName = 'Peso_Liquido'
      Origin = 'Peso_Liquido'
    end
    object qryADILancado_Entrada: TFloatField
      FieldName = 'Lancado_Entrada'
      Origin = 'Lancado_Entrada'
    end
    object qryADILancado_Saida: TFloatField
      FieldName = 'Lancado_Saida'
      Origin = 'Lancado_Saida'
    end
    object qryADIValor_PIS: TCurrencyField
      FieldName = 'Valor_PIS'
      Origin = 'Valor_PIS'
    end
    object qryADIValor_COFINS: TCurrencyField
      FieldName = 'Valor_COFINS'
      Origin = 'Valor_COFINS'
    end
    object qryADIDumping: TBooleanField
      FieldName = 'Dumping'
      Origin = 'Dumping'
    end
    object qryADIValor_SemAdValorem: TFloatField
      FieldName = 'Valor_SemAdValorem'
      Origin = 'Valor_SemAdValorem'
    end
    object qryADIOrdem: TIntegerField
      FieldName = 'Ordem'
      Origin = 'Ordem'
    end
    object qryADIPedido: TStringField
      FieldName = 'Pedido'
      Origin = 'Pedido'
      Size = 15
    end
    object qryADICIDE_Aliquota: TFloatField
      FieldName = 'CIDE_Aliquota'
      Origin = 'CIDE_Aliquota'
    end
    object qryADICIDE_ValorDevido: TCurrencyField
      FieldName = 'CIDE_ValorDevido'
      Origin = 'CIDE_ValorDevido'
    end
    object qryADICIDE_ValorRecolher: TCurrencyField
      FieldName = 'CIDE_ValorRecolher'
      Origin = 'CIDE_ValorRecolher'
    end
    object qryADIIncoterm: TStringField
      FieldName = 'Incoterm'
      Origin = 'Incoterm'
      FixedChar = True
      Size = 3
    end
  end
  object dsoADI: TDataSource
    DataSet = qryADI
    OnStateChange = dsoStateChange
    OnDataChange = dsoDataChange
    Left = 265
    Top = 463
  end
  object updADI: TFDUpdateSQL
    Connection = damConnection.DBCliente
    InsertSQL.Strings = (
      'DECLARE @Registro int;'
      'DECLARE @Codigo_Mercadoria int;'
      'DECLARE @Fornecedor int;'
      ''
      'SET @Registro = CASE '
      '    WHEN :NEW_Registro IS NULL OR :NEW_Registro <= 0 '
      '        THEN ('
      '            SELECT ISNULL(MAX(Registro), 0) + 1'
      '            FROM Adicoes'
      '        )'
      '    ELSE :NEW_Registro'
      'END;'
      ''
      'SET @Codigo_Mercadoria = ('
      #9'SELECT TOP 1 PRO.Codigo'
      #9'FROM duimp.capas_itens AS DCI'
      #9'JOIN duimp.versoes AS DUV'
      #9#9'ON DUV.Id = DCI.VersaoId'
      #9'JOIN duimp.duimps AS DUI'
      #9#9'ON DUI.Id = DUV.DuimpId'
      #9'JOIN Produtos AS PRO'
      #9#9'ON DCI.ProdutoCodigo = PRO.Codigo_DUIMP'
      #9'WHERE DCI.NumeroItem = :NEW_NumeroItem'
      #9'AND DUI.Numero = :NEW_Numero_Declaracao'
      ');'
      ''
      'SET @Fornecedor = ('
      #9'SELECT TOP 1 Codigo'
      #9'FROM Fornecedores'
      #9'WHERE Codigo_DUIMP = :NEW_Exportador'
      ');'
      ''
      'MERGE INTO Adicoes AS TARGET'
      'USING ('
      #9'SELECT @Registro AS Registro'
      #9',:NEW_Numero_Declaracao AS Numero_Declaracao'
      #9',:NEW_Adicao AS Adicao'
      #9',:NEW_NumeroItem AS Sequencia'
      #9',:NEW_NumeroItem AS Sequencia_SISCOMEX'
      #9',@Codigo_Mercadoria AS Codigo_Mercadoria'
      #9',:NEW_Quantidade AS Quantidade'
      #9',:NEW_Valor_Unitario AS Valor_Unitario'
      #9',:NEW_Valor_UnitarioReal AS Valor_UnitarioReal'
      #9',:NEW_NCM AS NCM'
      #9',@Fornecedor AS Exportador'
      #9',:NEW_Peso_Liquido AS Peso_Liquido'
      #9',:NEW_Lancado_Entrada AS Lancado_Entrada'
      #9',0 AS Lancado_Saida'
      #9',:NEW_Valor_PIS AS Valor_PIS'
      #9',:NEW_Valor_COFINS AS Valor_COFINS'
      #9',:NEW_Dumping AS Dumping'
      #9',:NEW_Valor_SemAdValorem AS Valor_SemAdValorem'
      #9',0 AS Aliquota_ICMS'
      #9',0 AS Lancado_Terceiros'
      #9',:NEW_Ordem AS Ordem'
      #9',:NEW_Pedido AS Pedido'
      #9',0 AS Lucro'
      #9',:NEW_CIDE_Aliquota AS CIDE_Aliquota'
      #9',:NEW_CIDE_ValorDevido AS CIDE_ValorDevido'
      #9',:NEW_CIDE_ValorRecolher AS CIDE_ValorRecolher'
      #9',:NEW_Incoterm AS Incoterm'
      ') AS SOURCE'
      'ON TARGET.Registro = SOURCE.Registro'
      ''
      'WHEN MATCHED THEN'
      '  UPDATE SET'
      '      TARGET.Quantidade = SOURCE.Quantidade'
      '     ,TARGET.Valor_Unitario = SOURCE.Valor_Unitario'
      '     ,TARGET.Valor_UnitarioReal = SOURCE.Valor_UnitarioReal'
      '     ,TARGET.NCM = SOURCE.NCM'
      '     ,TARGET.Exportador = SOURCE.Exportador'
      '     ,TARGET.Peso_Liquido = SOURCE.Peso_Liquido'
      '     ,TARGET.Lancado_Entrada = SOURCE.Lancado_Entrada'
      '     ,TARGET.Lancado_Saida = SOURCE.Lancado_Saida'
      '     ,TARGET.Valor_PIS = SOURCE.Valor_PIS'
      '     ,TARGET.Valor_COFINS = SOURCE.Valor_COFINS'
      '     ,TARGET.Dumping = SOURCE.Dumping'
      '     ,TARGET.Valor_SemAdValorem = SOURCE.Valor_SemAdValorem'
      '     ,TARGET.Aliquota_ICMS = SOURCE.Aliquota_ICMS'
      '     ,TARGET.Lancado_Terceiros = SOURCE.Lancado_Terceiros'
      '     ,TARGET.Ordem = SOURCE.Ordem'
      '     ,TARGET.Pedido = SOURCE.Pedido'
      '     ,TARGET.Lucro = SOURCE.Lucro'
      '     ,TARGET.CIDE_Aliquota = SOURCE.CIDE_Aliquota'
      '     ,TARGET.CIDE_ValorDevido = SOURCE.CIDE_ValorDevido'
      '     ,TARGET.CIDE_ValorRecolher = SOURCE.CIDE_ValorRecolher'
      '     ,TARGET.Incoterm = SOURCE.Incoterm'
      ''
      'WHEN NOT MATCHED THEN'
      '  INSERT ('
      '      Registro'
      '     ,DI'
      '     ,Adicao'
      '     ,Sequencia'
      '     ,Sequencia_SISCOMEX'
      '     ,Codigo_Mercadoria'
      '     ,Quantidade'
      '     ,Valor_Unitario'
      '     ,Valor_UnitarioReal'
      '     ,NCM'
      '     ,Exportador'
      '     ,Peso_Liquido'
      '     ,Lancado_Entrada'
      '     ,Lancado_Saida'
      '     ,Valor_PIS'
      '     ,Valor_COFINS'
      '     ,Dumping'
      '     ,Valor_SemAdValorem'
      '     ,Aliquota_ICMS'
      '     ,Lancado_Terceiros'
      '     ,Ordem'
      '     ,Pedido'
      '     ,Lucro'
      '     ,CIDE_Aliquota'
      '     ,CIDE_ValorDevido'
      '     ,CIDE_ValorRecolher'
      '     ,Incoterm'
      '  )'
      '  VALUES ('
      '      SOURCE.Registro'
      '     ,SOURCE.Numero_Declaracao'
      '     ,SOURCE.Adicao'
      '     ,SOURCE.Sequencia'
      '     ,SOURCE.Sequencia_SISCOMEX'
      '     ,SOURCE.Codigo_Mercadoria'
      '     ,SOURCE.Quantidade'
      '     ,SOURCE.Valor_Unitario'
      '     ,SOURCE.Valor_UnitarioReal'
      '     ,SOURCE.NCM'
      '     ,SOURCE.Exportador'
      '     ,SOURCE.Peso_Liquido'
      '     ,SOURCE.Lancado_Entrada'
      '     ,SOURCE.Lancado_Saida'
      '     ,SOURCE.Valor_PIS'
      '     ,SOURCE.Valor_COFINS'
      '     ,SOURCE.Dumping'
      '     ,SOURCE.Valor_SemAdValorem'
      '     ,SOURCE.Aliquota_ICMS'
      '     ,SOURCE.Lancado_Terceiros'
      '     ,SOURCE.Ordem'
      '     ,SOURCE.Pedido'
      '     ,SOURCE.Lucro'
      '     ,SOURCE.CIDE_Aliquota'
      '     ,SOURCE.CIDE_ValorDevido'
      '     ,SOURCE.CIDE_ValorRecolher'
      '     ,SOURCE.Incoterm'
      '  );'
      ''
      'SELECT ADI.Registro'
      ',ADI.DI AS Numero_Declaracao'
      ',ADI.Adicao'
      ',ADI.Sequencia AS NumeroItem'
      ',ADI.Quantidade'
      ',ADI.Valor_Unitario'
      ',ADI.Valor_UnitarioReal'
      ',ADI.NCM'
      ',ExportadorCodigo = ADI.Exportador'
      ',Exportador = FRN.Codigo_DUIMP'
      ',ADI.Peso_Liquido'
      ',ADI.Lancado_Entrada'
      ',ADI.Lancado_Saida'
      ',ADI.Valor_PIS'
      ',ADI.Valor_COFINS'
      ',ADI.Dumping'
      ',ADI.Valor_SemAdValorem'
      ',ADI.Aliquota_ICMS'
      ',ADI.Lancado_Terceiros'
      ',ADI.Ordem'
      ',ADI.Pedido'
      ',ADI.CIDE_Aliquota'
      ',ADI.CIDE_ValorDevido'
      ',ADI.CIDE_ValorRecolher'
      ',ADI.Incoterm'
      'FROM Adicoes AS ADI'
      'LEFT JOIN Fornecedores AS FRN'
      #9'ON ADI.Exportador = FRN.Codigo'
      'WHERE ADI.Registro = @Registro;')
    FetchRowSQL.Strings = (
      'SELECT ADI.Registro'
      ',ADI.DI AS Numero_Declaracao'
      ',ADI.Adicao'
      ',ADI.Sequencia AS NumeroItem'
      ',ADI.Quantidade'
      ',ADI.Valor_Unitario'
      ',ADI.Valor_UnitarioReal'
      ',ADI.NCM'
      ',ExportadorCodigo = ADI.Exportador'
      ',Exportador = FRN.Codigo_DUIMP'
      ',ADI.Peso_Liquido'
      ',ADI.Lancado_Entrada'
      ',ADI.Lancado_Saida'
      ',ADI.Valor_PIS'
      ',ADI.Valor_COFINS'
      ',ADI.Dumping'
      ',ADI.Valor_SemAdValorem'
      ',ADI.Aliquota_ICMS'
      ',ADI.Lancado_Terceiros'
      ',ADI.Ordem'
      ',ADI.Pedido'
      ',ADI.CIDE_Aliquota'
      ',ADI.CIDE_ValorDevido'
      ',ADI.CIDE_ValorRecolher'
      ',ADI.Incoterm'
      'FROM Adicoes AS ADI'
      'LEFT JOIN Fornecedores AS FRN'
      #9'ON ADI.Exportador = FRN.Codigo'
      'WHERE ADI.Registro = :Registro;')
    Left = 323
    Top = 463
  end
  object sptPED: TFDScript
    SQLScripts = <
      item
        Name = 'root'
        SQL.Strings = (
          '@PedidosItensDel'
          '@PedidosUpd')
      end
      item
        Name = 'PedidosItensDel'
        SQL.Strings = (
          'DELETE FROM PedidosItens'
          'WHERE DI = :Numero_Declaracao'
          'AND Processo = :Processo')
      end
      item
        Name = 'PedidosUpd'
        SQL.Strings = (
          'UPDATE Pedidos'
          'SET Valor_TotalProdutos = 0'
          ',BCIPI                  = 0'
          ',Valor_TotalIPI         = 0'
          ',BCICMS                 = 0'
          ',Valor_ICMS             = 0'
          ',BCICMS_Substitutivo    = 0'
          ',ValorICMS_Substitutivo = 0'
          ',Valor_ICMSReducao      = 0'
          ',Total_Frete            = 0'
          ',Valor_Seguro           = 0'
          ',Valor_TotalNota        = 0'
          ',Valor_TotalMVA         = 0'
          ',Volume_PesoLiquido     = 0'
          ',Volume_PesoBruto       = 0'
          ',Valor_PIS              = 0'
          ',Valor_COFINS           = 0'
          ',Valor_PIS2             = 0'
          ',Valor_COFINS2          = 0'
          ',Valor_TotalII          = 0'
          ',Valor_OutrasDespesas   = 0'
          ',Valor_OutrasICMS       = 0'
          ',Valor_IsentasICMS      = 0'
          ',Valor_OutrasIPI        = 0'
          ',Valor_IsentasIPI       = 0'
          ',Valor_DUMPING          = 0'
          ',Valor_DespesasOutros   = 0'
          ',Valor_BCPIS            = 0'
          ',Total_Impostos         = 0'
          ',Valor_IRPJ             = 0'
          ',Valor_CSLL             = 0'
          ',Valor_Inventario       = 0'
          'WHERE DI = :Numero_Declaracao'
          'AND Processo = :Processo;')
      end>
    Connection = damConnection.DBCliente
    ScriptOptions.BreakOnError = True
    ScriptOptions.CommandSeparator = '^'
    Params = <
      item
        Name = 'Numero_Declaracao'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'Processo'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
    Macros = <>
    FetchOptions.AssignedValues = [evItems, evAutoClose, evAutoFetchAll]
    FetchOptions.AutoClose = False
    FetchOptions.Items = [fiBlobs, fiDetails]
    ResourceOptions.AssignedValues = [rvMacroCreate, rvMacroExpand, rvDirectExecute, rvPersistent]
    ResourceOptions.MacroCreate = False
    ResourceOptions.DirectExecute = True
    Left = 875
    Top = 207
  end
  object sptPGR: TFDScript
    SQLScripts = <
      item
        Name = 'root'
        SQL.Strings = (
          '@PagarReceberDel')
      end
      item
        Name = 'PagarReceberDel'
        SQL.Strings = (
          'DELETE FROM PagarReceber '
          'WHERE Fiscal = :Numero_Declaracao'
          'AND Tipo_Nota = '#39'CX'#39' '
          'AND ISNULL('
          '  (SELECT SUM(Valor) '
          '   FROM PagarReceberBaixas '
          '   WHERE PagarReceberBaixas.Numero = PagarReceber.Numero)'
          ',0) = 0')
      end>
    Connection = damConnection.DBCliente
    ScriptOptions.BreakOnError = True
    ScriptOptions.CommandSeparator = '^'
    Params = <
      item
        Name = 'Numero_Declaracao'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
    Macros = <>
    FetchOptions.AssignedValues = [evItems, evAutoClose, evAutoFetchAll]
    FetchOptions.AutoClose = False
    FetchOptions.Items = [fiBlobs, fiDetails]
    ResourceOptions.AssignedValues = [rvMacroCreate, rvMacroExpand, rvDirectExecute, rvPersistent]
    ResourceOptions.MacroCreate = False
    ResourceOptions.DirectExecute = True
    Left = 875
    Top = 271
  end
  object qryBXA: TFDQuery
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'SELECT COUNT(*) AS Baixados '
      'FROM PagarReceber '
      'WHERE Fiscal = :Numero_Declaracao'
      'AND Tipo_Nota = '#39'CX'#39
      'AND ISNULL('
      '  (SELECT SUM(Valor) '
      '   FROM PagarReceberBaixas '
      '   WHERE PagarReceberBaixas.Numero = PagarReceber.Numero)'
      ', 0) > 0')
    Left = 818
    Top = 399
    ParamData = <
      item
        Name = 'NUMERO_DECLARACAO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryBXABaixados: TIntegerField
      FieldName = 'Baixados'
      Origin = 'Baixados'
      ReadOnly = True
    end
  end
  object cmdPRIns: TFDCommand
    Connection = damConnection.DBCliente
    CommandText.Strings = (
      'DECLARE @Numero int;'
      ''
      'SET @Numero = ('
      '  SELECT ISNULL(MAX(Numero), 0) + 1 '
      '  FROM PagarReceber'
      ');'
      ''
      'SET ANSI_WARNINGS OFF;'
      ''
      'INSERT INTO PagarReceber'
      '(Numero'
      ',Classificacao'
      ',Orgao'
      ',Documento'
      ',Centro_Custo'
      ',Tipo'
      ',Data_Documento'
      ',Data_Vencimento'
      ',Numero_Documento'
      ',Processo'
      ',CustoConta'
      ',Custo_Seletivo'
      ',Custo_Entrada'
      ',Custo_Outros'
      ',Nivel'
      ',Fiscal'
      ',Tipo_Nota'
      ',Empresa'
      ',Filial'
      ',Multa'
      ',Juros'
      ',Desconto'
      ',Valor_Baixado'
      ',Valor_Documento'
      ',Valor_Parcela'
      ',Valor_Total'
      ',Valor_Operacao'
      ',Observacao)'
      'VALUES'
      '(@Numero'
      ',:CodigoCF'
      ',:SISCOMEX_Orgao'
      ',:SISCOMEX_Documento'
      ',:SISCOMEX_CentroCusto'
      ',:TipoCF'
      ',:Data_RegistroDeclaracao'
      ',:Data_RegistroDeclaracao'
      ',:Numero_Declaracao'
      ',:Processo'
      ',:CustoCF'
      ',:Custo_SeletivoCF'
      ',:Custo_EntradaCF'
      ',:Custo_OutrosCF'
      ',:NivelCF'
      ',:Numero_Declaracao'
      ','#39'CX'#39
      ',:Empresa'
      ',:Filial'
      ',:Multa'
      ',:Juros'
      ',:Desconto'
      ',:Valor_Baixado'
      ',:Valor_Documento'
      ',:Valor_Parcela'
      ',:Valor_Total'
      ',:Valor_Operacao'
      ',:Observacao);'
      ''
      'SET ANSI_WARNINGS ON;'
      ''
      'SET :Numero = @Numero;')
    ParamData = <
      item
        Name = 'CODIGOCF'
        ParamType = ptInput
      end
      item
        Name = 'SISCOMEX_ORGAO'
        ParamType = ptInput
      end
      item
        Name = 'SISCOMEX_DOCUMENTO'
        ParamType = ptInput
      end
      item
        Name = 'SISCOMEX_CENTROCUSTO'
        ParamType = ptInput
      end
      item
        Name = 'TIPOCF'
        ParamType = ptInput
      end
      item
        Name = 'DATA_REGISTRODECLARACAO'
        ParamType = ptInput
      end
      item
        Name = 'NUMERO_DECLARACAO'
        ParamType = ptInput
      end
      item
        Name = 'PROCESSO'
        ParamType = ptInput
      end
      item
        Name = 'CUSTOCF'
        ParamType = ptInput
      end
      item
        Name = 'CUSTO_SELETIVOCF'
        ParamType = ptInput
      end
      item
        Name = 'CUSTO_ENTRADACF'
        ParamType = ptInput
      end
      item
        Name = 'CUSTO_OUTROSCF'
        ParamType = ptInput
      end
      item
        Name = 'NIVELCF'
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        Name = 'MULTA'
        ParamType = ptInput
      end
      item
        Name = 'JUROS'
        ParamType = ptInput
      end
      item
        Name = 'DESCONTO'
        ParamType = ptInput
      end
      item
        Name = 'VALOR_BAIXADO'
        ParamType = ptInput
      end
      item
        Name = 'VALOR_DOCUMENTO'
        ParamType = ptInput
      end
      item
        Name = 'VALOR_PARCELA'
        ParamType = ptInput
      end
      item
        Name = 'VALOR_TOTAL'
        ParamType = ptInput
      end
      item
        Name = 'VALOR_OPERACAO'
        ParamType = ptInput
      end
      item
        Name = 'OBSERVACAO'
        ParamType = ptInput
      end
      item
        Name = 'NUMERO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    Left = 944
    Top = 16
  end
  object cmdPRUpd: TFDCommand
    Connection = damConnection.DBCliente
    CommandText.Strings = (
      'SET ANSI_WARNINGS OFF;'
      ''
      'UPDATE PagarReceber'
      'SET Baixa_Numero = :Baixa_Numero'
      ',Valor_Baixado = :Valor'
      ',Banco = :Banco'
      'WHERE Numero = :Numero;'
      ''
      'SET ANSI_WARNINGS ON;')
    ParamData = <
      item
        Name = 'BAIXA_NUMERO'
        ParamType = ptInput
      end
      item
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        Name = 'BANCO'
        ParamType = ptInput
      end
      item
        Name = 'NUMERO'
        ParamType = ptInput
      end>
    Left = 944
    Top = 80
  end
  object cmdPRBIns: TFDCommand
    Connection = damConnection.DBCliente
    CommandText.Strings = (
      'SET ANSI_WARNINGS OFF;'
      ''
      'DECLARE @Registro int;'
      ''
      'SET @Registro = ('
      '  SELECT ISNULL(MAX(Registro), 0) + 1 AS Registro'
      '  FROM PagarReceberBaixas'
      ');'
      ''
      'INSERT INTO PagarReceberBaixas'
      '(Registro'
      ',Numero'
      ',Data'
      ',Tipo'
      ',Valor'
      ',Banco'
      ',Forma_Tipo'
      ',Forma_TipoDocumento'
      ',Observacao'
      ',Banco_Conta)'
      'VALUES'
      '(@Registro'
      ',:Numero'
      ',:Data'
      ',:Tipo'
      ',:Valor'
      ',:Banco'
      ',:Forma_Tipo'
      ',:Forma_TipoDocumento'
      ',:Observacao'
      ',:Banco_Conta);'
      ''
      'SET :Registro = @Registro;'
      ''
      'SET ANSI_WARNINGS ON;')
    ParamData = <
      item
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        Name = 'BANCO'
        ParamType = ptInput
      end
      item
        Name = 'FORMA_TIPO'
        ParamType = ptInput
      end
      item
        Name = 'FORMA_TIPODOCUMENTO'
        ParamType = ptInput
      end
      item
        Name = 'OBSERVACAO'
        ParamType = ptInput
      end
      item
        Name = 'BANCO_CONTA'
        ParamType = ptInput
      end
      item
        Name = 'REGISTRO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    Left = 944
    Top = 143
  end
  object qryCFPis: TFDQuery
    IndexFieldNames = 'CodigoCF'
    MasterSource = dsoMCS
    MasterFields = 'SISCOMEX_ClassificacaoDifPIS'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @Classification TABLE'
      '('
      #9' CodigoReceita varchar(8)'
      #9',CodigoCF varchar(15)'
      #9',DescricaoCF varchar(60)'
      #9',TipoCF char(1)'
      #9',CustoCF bit'
      #9',Custo_SeletivoCF bit'
      #9',Custo_EntradaCF bit'
      #9',Custo_OutrosCF bit'
      #9',NivelCF smallint'
      ');'
      ''
      'IF EXISTS('
      #9'SELECT Linha'
      #9'FROM Configuracao'
      #9'WHERE Compartilhar_Classificacao = 1'
      ')'
      'BEGIN'
      #9'INSERT INTO @Classification'
      #9'SELECT CF.Codigo_RFB'
      #9',CF.Codigo'
      #9',CF.Descricao'
      #9',CF.Tipo'
      #9',ISNULL(CF.Custo, 0)'
      #9',ISNULL(CF.Custo_Seletivo, 0)'
      #9',ISNULL(CF.Custo_Entrada, 0)'
      #9',ISNULL(CF.Custo_Outros, 0)'
      #9',CF.Nivel'
      #9'FROM Cybersoft_Cadastros.dbo.ClassificacaoFinanceira AS CF'
      #9'WHERE CF.Codigo_RFB IS NOT NULL;'
      'END'
      'ELSE'
      'BEGIN'
      #9'INSERT INTO @Classification'
      #9'SELECT CF.Codigo_RFB'
      #9',CF.Codigo'
      #9',CF.Descricao'#9
      #9',CF.Tipo'
      #9',ISNULL(CF.Custo, 0)'
      #9',ISNULL(CF.Custo_Seletivo, 0)'
      #9',ISNULL(CF.Custo_Entrada, 0)'
      #9',ISNULL(CF.Custo_Outros, 0)'
      #9',CF.Nivel'
      #9'FROM ClassificacaoFinanceira AS CF'
      #9'WHERE CF.Codigo_RFB IS NOT NULL;'
      'END;'
      ''
      'SELECT * '
      'FROM @Classification AS CL'
      'WHERE CL.CodigoCF = :SISCOMEX_ClassificacaoDifPIS;')
    Left = 818
    Top = 463
    ParamData = <
      item
        Name = 'SISCOMEX_CLASSIFICACAODIFPIS'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryCFPisCodigoReceita: TStringField
      FieldName = 'CodigoReceita'
      Origin = 'CodigoReceita'
      Size = 8
    end
    object qryCFPisCodigoCF: TStringField
      FieldName = 'CodigoCF'
      Origin = 'CodigoCF'
      Size = 15
    end
    object qryCFPisDescricaoCF: TStringField
      FieldName = 'DescricaoCF'
      Origin = 'DescricaoCF'
      Size = 60
    end
    object qryCFPisTipoCF: TStringField
      FieldName = 'TipoCF'
      Origin = 'TipoCF'
      FixedChar = True
      Size = 1
    end
    object qryCFPisCustoCF: TBooleanField
      FieldName = 'CustoCF'
      Origin = 'CustoCF'
    end
    object qryCFPisCusto_SeletivoCF: TBooleanField
      FieldName = 'Custo_SeletivoCF'
      Origin = 'Custo_SeletivoCF'
    end
    object qryCFPisCusto_EntradaCF: TBooleanField
      FieldName = 'Custo_EntradaCF'
      Origin = 'Custo_EntradaCF'
    end
    object qryCFPisCusto_OutrosCF: TBooleanField
      FieldName = 'Custo_OutrosCF'
      Origin = 'Custo_OutrosCF'
    end
    object qryCFPisNivelCF: TSmallintField
      FieldName = 'NivelCF'
      Origin = 'NivelCF'
    end
  end
  object qryMCS: TFDQuery
    IndexFieldNames = 'Codigo'
    MasterSource = dsoMDS
    MasterFields = 'ModalidadeCodigos'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'SELECT TPR.Codigo'
      ',TPR.Descricao'
      ',TPR.SISCOMEX_Orgao'
      ',TPR.SISCOMEX_Documento'
      ',TPR.SISCOMEX_CentroCusto'
      ',TPR.SISCOMEX_ClassificacaoDifPIS'
      ',TPR.SISCOMEX_ClassificacaoDifCOFINS'
      ',TPR.Classificacao_AFRMM'
      ',TPR.Classificacao_TUP'
      'FROM TiposProcesso AS TPR'
      'WHERE TPR.Codigo = :ModalidadeCodigos;')
    Left = 378
    Top = 591
    ParamData = <
      item
        Name = 'MODALIDADECODIGOS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryMCSCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      Required = True
    end
    object qryMCSDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Size = 30
    end
    object qryMCSSISCOMEX_Orgao: TStringField
      FieldName = 'SISCOMEX_Orgao'
      Origin = 'SISCOMEX_Orgao'
      Size = 10
    end
    object qryMCSSISCOMEX_Documento: TStringField
      FieldName = 'SISCOMEX_Documento'
      Origin = 'SISCOMEX_Documento'
      Size = 10
    end
    object qryMCSSISCOMEX_CentroCusto: TStringField
      FieldName = 'SISCOMEX_CentroCusto'
      Origin = 'SISCOMEX_CentroCusto'
      Size = 10
    end
    object qryMCSSISCOMEX_ClassificacaoDifPIS: TStringField
      FieldName = 'SISCOMEX_ClassificacaoDifPIS'
      Origin = 'SISCOMEX_ClassificacaoDifPIS'
      Size = 15
    end
    object qryMCSSISCOMEX_ClassificacaoDifCOFINS: TStringField
      FieldName = 'SISCOMEX_ClassificacaoDifCOFINS'
      Origin = 'SISCOMEX_ClassificacaoDifCOFINS'
      Size = 15
    end
    object qryMCSClassificacao_AFRMM: TStringField
      FieldName = 'Classificacao_AFRMM'
      Origin = 'Classificacao_AFRMM'
      Size = 15
    end
    object qryMCSClassificacao_TUP: TStringField
      FieldName = 'Classificacao_TUP'
      Origin = 'Classificacao_TUP'
      Size = 15
    end
  end
  object dsoMCS: TDataSource
    DataSet = qryMCS
    Left = 434
    Top = 591
  end
  object qryCFCofins: TFDQuery
    IndexFieldNames = 'CodigoCF'
    MasterSource = dsoMCS
    MasterFields = 'SISCOMEX_ClassificacaoDifCOFINS'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @Classification TABLE'
      '('
      #9' CodigoReceita varchar(8)'
      #9',CodigoCF varchar(15)'
      #9',DescricaoCF varchar(60)'
      #9',TipoCF char(1)'
      #9',CustoCF bit'
      #9',Custo_SeletivoCF bit'
      #9',Custo_EntradaCF bit'
      #9',Custo_OutrosCF bit'
      #9',NivelCF smallint'
      ');'
      ''
      'IF EXISTS('
      #9'SELECT Linha'
      #9'FROM Configuracao'
      #9'WHERE Compartilhar_Classificacao = 1'
      ')'
      'BEGIN'
      #9'INSERT INTO @Classification'
      #9'SELECT CF.Codigo_RFB'
      #9',CF.Codigo'
      #9',CF.Descricao'
      #9',CF.Tipo'
      #9',ISNULL(CF.Custo, 0)'
      #9',ISNULL(CF.Custo_Seletivo, 0)'
      #9',ISNULL(CF.Custo_Entrada, 0)'
      #9',ISNULL(CF.Custo_Outros, 0)'
      #9',CF.Nivel'
      #9'FROM Cybersoft_Cadastros.dbo.ClassificacaoFinanceira AS CF'
      #9'WHERE CF.Codigo_RFB IS NOT NULL;'
      'END'
      'ELSE'
      'BEGIN'
      #9'INSERT INTO @Classification'
      #9'SELECT CF.Codigo_RFB'
      #9',CF.Codigo'
      #9',CF.Descricao'#9
      #9',CF.Tipo'
      #9',ISNULL(CF.Custo, 0)'
      #9',ISNULL(CF.Custo_Seletivo, 0)'
      #9',ISNULL(CF.Custo_Entrada, 0)'
      #9',ISNULL(CF.Custo_Outros, 0)'
      #9',CF.Nivel'
      #9'FROM ClassificacaoFinanceira AS CF'
      #9'WHERE CF.Codigo_RFB IS NOT NULL;'
      'END;'
      ''
      'SELECT * '
      'FROM @Classification AS CL'
      'WHERE CL.CodigoCF = :SISCOMEX_ClassificacaoDifCOFINS;')
    Left = 746
    Top = 463
    ParamData = <
      item
        Name = 'SISCOMEX_CLASSIFICACAODIFCOFINS'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryCFCofinsCodigoReceita: TStringField
      FieldName = 'CodigoReceita'
      Origin = 'CodigoReceita'
      Size = 8
    end
    object qryCFCofinsCodigoCF: TStringField
      FieldName = 'CodigoCF'
      Origin = 'CodigoCF'
      Size = 15
    end
    object qryCFCofinsDescricaoCF: TStringField
      FieldName = 'DescricaoCF'
      Origin = 'DescricaoCF'
      Size = 60
    end
    object qryCFCofinsTipoCF: TStringField
      FieldName = 'TipoCF'
      Origin = 'TipoCF'
      FixedChar = True
      Size = 1
    end
    object qryCFCofinsCustoCF: TBooleanField
      FieldName = 'CustoCF'
      Origin = 'CustoCF'
    end
    object qryCFCofinsCusto_SeletivoCF: TBooleanField
      FieldName = 'Custo_SeletivoCF'
      Origin = 'Custo_SeletivoCF'
    end
    object qryCFCofinsCusto_EntradaCF: TBooleanField
      FieldName = 'Custo_EntradaCF'
      Origin = 'Custo_EntradaCF'
    end
    object qryCFCofinsCusto_OutrosCF: TBooleanField
      FieldName = 'Custo_OutrosCF'
      Origin = 'Custo_OutrosCF'
    end
    object qryCFCofinsNivelCF: TSmallintField
      FieldName = 'NivelCF'
      Origin = 'NivelCF'
    end
  end
  object qryCFAfrmm: TFDQuery
    IndexFieldNames = 'CodigoCF'
    MasterSource = dsoMCS
    MasterFields = 'Classificacao_AFRMM'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @Classification TABLE '
      '('
      #9' CodigoReceita varchar(8)'
      #9',CodigoCF varchar(15)'
      #9',DescricaoCF varchar(60)'
      #9',TipoCF char(1)'
      #9',CustoCF bit'
      #9',Custo_SeletivoCF bit'
      #9',Custo_EntradaCF bit'
      #9',Custo_OutrosCF bit'
      #9',NivelCF smallint'
      ');'
      ''
      'IF EXISTS('
      #9'SELECT Linha'
      #9'FROM Configuracao'
      #9'WHERE Compartilhar_Classificacao = 1'
      ')'
      'BEGIN'
      #9'INSERT INTO @Classification'
      #9'SELECT CF.Codigo_RFB'
      #9',CF.Codigo'
      #9',CF.Descricao'
      #9',CF.Tipo'
      #9',ISNULL(CF.Custo, 0)'
      #9',ISNULL(CF.Custo_Seletivo, 0)'
      #9',ISNULL(CF.Custo_Entrada, 0)'
      #9',ISNULL(CF.Custo_Outros, 0)'
      #9',CF.Nivel'
      #9'FROM Cybersoft_Cadastros.dbo.ClassificacaoFinanceira AS CF;'
      'END'
      'ELSE'
      'BEGIN'
      #9'INSERT INTO @Classification'
      #9'SELECT CF.Codigo_RFB'
      #9',CF.Codigo'
      #9',CF.Descricao'#9
      #9',CF.Tipo'
      #9',ISNULL(CF.Custo, 0)'
      #9',ISNULL(CF.Custo_Seletivo, 0)'
      #9',ISNULL(CF.Custo_Entrada, 0)'
      #9',ISNULL(CF.Custo_Outros, 0)'
      #9',CF.Nivel'
      #9'FROM ClassificacaoFinanceira AS CF;'
      'END;'
      ''
      'SELECT * '
      'FROM @Classification AS CL'
      'WHERE CL.CodigoCF = :Classificacao_AFRMM;')
    Left = 746
    Top = 527
    ParamData = <
      item
        Name = 'CLASSIFICACAO_AFRMM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryCFAfrmmCodigoReceita: TStringField
      FieldName = 'CodigoReceita'
      Origin = 'CodigoReceita'
      Size = 8
    end
    object qryCFAfrmmCodigoCF: TStringField
      FieldName = 'CodigoCF'
      Origin = 'CodigoCF'
      Size = 15
    end
    object qryCFAfrmmDescricaoCF: TStringField
      FieldName = 'DescricaoCF'
      Origin = 'DescricaoCF'
      Size = 60
    end
    object qryCFAfrmmTipoCF: TStringField
      FieldName = 'TipoCF'
      Origin = 'TipoCF'
      FixedChar = True
      Size = 1
    end
    object qryCFAfrmmCustoCF: TBooleanField
      FieldName = 'CustoCF'
      Origin = 'CustoCF'
    end
    object qryCFAfrmmCusto_SeletivoCF: TBooleanField
      FieldName = 'Custo_SeletivoCF'
      Origin = 'Custo_SeletivoCF'
    end
    object qryCFAfrmmCusto_EntradaCF: TBooleanField
      FieldName = 'Custo_EntradaCF'
      Origin = 'Custo_EntradaCF'
    end
    object qryCFAfrmmCusto_OutrosCF: TBooleanField
      FieldName = 'Custo_OutrosCF'
      Origin = 'Custo_OutrosCF'
    end
    object qryCFAfrmmNivelCF: TSmallintField
      FieldName = 'NivelCF'
      Origin = 'NivelCF'
    end
  end
  object qryCFTup: TFDQuery
    IndexFieldNames = 'CodigoCF'
    MasterSource = dsoMCS
    MasterFields = 'Classificacao_TUP'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @Classification TABLE '
      '('
      #9' CodigoReceita varchar(8)'
      #9',CodigoCF varchar(15)'
      #9',DescricaoCF varchar(60)'
      #9',TipoCF char(1)'
      #9',CustoCF bit'
      #9',Custo_SeletivoCF bit'
      #9',Custo_EntradaCF bit'
      #9',Custo_OutrosCF bit'
      #9',NivelCF smallint'
      ');'
      ''
      'IF EXISTS('
      #9'SELECT Linha'
      #9'FROM Configuracao'
      #9'WHERE Compartilhar_Classificacao = 1'
      ')'
      'BEGIN'
      #9'INSERT INTO @Classification'
      #9'SELECT CF.Codigo_RFB'
      #9',CF.Codigo'
      #9',CF.Descricao'
      #9',CF.Tipo'
      #9',ISNULL(CF.Custo, 0)'
      #9',ISNULL(CF.Custo_Seletivo, 0)'
      #9',ISNULL(CF.Custo_Entrada, 0)'
      #9',ISNULL(CF.Custo_Outros, 0)'
      #9',CF.Nivel'
      #9'FROM Cybersoft_Cadastros.dbo.ClassificacaoFinanceira AS CF;'
      'END'
      'ELSE'
      'BEGIN'
      #9'INSERT INTO @Classification'
      #9'SELECT CF.Codigo_RFB'
      #9',CF.Codigo'
      #9',CF.Descricao'#9
      #9',CF.Tipo'
      #9',ISNULL(CF.Custo, 0)'
      #9',ISNULL(CF.Custo_Seletivo, 0)'
      #9',ISNULL(CF.Custo_Entrada, 0)'
      #9',ISNULL(CF.Custo_Outros, 0)'
      #9',CF.Nivel'
      #9'FROM ClassificacaoFinanceira AS CF;'
      'END;'
      ''
      'SELECT * '
      'FROM @Classification AS CL'
      'WHERE CL.CodigoCF = :Classificacao_TUP;')
    Left = 818
    Top = 527
    ParamData = <
      item
        Name = 'CLASSIFICACAO_TUP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryCFTupCodigoReceita: TStringField
      FieldName = 'CodigoReceita'
      Origin = 'CodigoReceita'
      Size = 8
    end
    object qryCFTupCodigoCF: TStringField
      FieldName = 'CodigoCF'
      Origin = 'CodigoCF'
      Size = 15
    end
    object qryCFTupDescricaoCF: TStringField
      FieldName = 'DescricaoCF'
      Origin = 'DescricaoCF'
      Size = 60
    end
    object qryCFTupTipoCF: TStringField
      FieldName = 'TipoCF'
      Origin = 'TipoCF'
      FixedChar = True
      Size = 1
    end
    object qryCFTupCustoCF: TBooleanField
      FieldName = 'CustoCF'
      Origin = 'CustoCF'
    end
    object qryCFTupCusto_SeletivoCF: TBooleanField
      FieldName = 'Custo_SeletivoCF'
      Origin = 'Custo_SeletivoCF'
    end
    object qryCFTupCusto_EntradaCF: TBooleanField
      FieldName = 'Custo_EntradaCF'
      Origin = 'Custo_EntradaCF'
    end
    object qryCFTupCusto_OutrosCF: TBooleanField
      FieldName = 'Custo_OutrosCF'
      Origin = 'Custo_OutrosCF'
    end
    object qryCFTupNivelCF: TSmallintField
      FieldName = 'NivelCF'
      Origin = 'NivelCF'
    end
  end
  object cmdCOT: TFDCommand
    Connection = damConnection.DBCadastro
    CommandText.Strings = (
      'MERGE INTO Cotacao AS TARGET'
      'USING ('
      '    SELECT '
      '        :Moeda  AS Moeda,'
      '        :Data   AS Data,'
      '        :Valor  AS Valor'
      ') AS SOURCE'
      'ON (TARGET.Moeda = SOURCE.Moeda AND TARGET.Data = SOURCE.Data)'
      ''
      'WHEN MATCHED THEN'
      '    UPDATE SET '
      '        TARGET.Valor = SOURCE.Valor'
      ''
      'WHEN NOT MATCHED THEN'
      '    INSERT (Moeda, Data, Valor)'
      '    VALUES (SOURCE.Moeda, SOURCE.Data, SOURCE.Valor);')
    ParamData = <
      item
        Name = 'MOEDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end>
    Left = 944
    Top = 207
  end
  object cmdDVDel: TFDCommand
    Connection = damConnection.DBCliente
    CommandText.Strings = (
      'DELETE DUV'
      'FROM duimp.versoes AS DUV'
      'WHERE DUV.Id = :VersaoId'
      'AND NOT EXISTS ('
      '    SELECT 1'
      '    FROM ProcessosDocumentos AS PDO'
      '    WHERE PDO.Numero_Declaracao = DUV.ProcessoNumero'
      ');')
    ParamData = <
      item
        Name = 'VERSAOID'
        DataType = ftGuid
        ParamType = ptInput
        Value = Null
      end>
    Left = 944
    Top = 271
  end
  object qryVNF: TFDQuery
    MasterSource = dsoDUV
    MasterFields = 'ProcessoNumero'
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'DECLARE @Processo varchar(15);'
      ''
      'SET @Processo = :ProcessoNumero;'
      ''
      'WITH Condicoes AS ('
      '    SELECT '
      '        -- Condi'#231#227'o 1: existe em NotasFiscais ou NotasItens'
      '        CASE '
      
        '            WHEN EXISTS (SELECT 1 FROM NotasFiscais WHERE Proces' +
        'so = @Processo)'
      
        '              OR EXISTS (SELECT 1 FROM NotasItens WHERE Processo' +
        ' = @Processo)'
      '            THEN CAST(1 AS bit) ELSE CAST(0 AS bit)'
      '        END AS C1,'
      ''
      '        -- Condi'#231#227'o 2: flag de configura'#231#227'o'
      
        '        CAST((SELECT TOP 1 Processo_ImportarFechado FROM Configu' +
        'racao) AS bit) AS C2'
      ')'
      'SELECT '
      
        '    IIF(C1 = 1 AND C2 = 0, CAST(0 AS bit), CAST(1 AS bit)) AS Nf' +
        'OrPi'
      'FROM Condicoes;')
    Left = 496
    Top = 591
    ParamData = <
      item
        Name = 'PROCESSONUMERO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryVNFNfOrPi: TBooleanField
      FieldName = 'NfOrPi'
      Origin = 'NfOrPi'
      ReadOnly = True
    end
  end
  object dsoVNF: TDataSource
    DataSet = qryVNF
    OnStateChange = dsoStateChange
    OnDataChange = dsoDataChange
    Left = 558
    Top = 591
  end
end
