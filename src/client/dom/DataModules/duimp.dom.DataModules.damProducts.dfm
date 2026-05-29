inherited damProducts: TdamProducts
  Height = 375
  Width = 337
  object qryPRO: TFDQuery
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'SELECT ProdId = PRO.Codigo'
      ',PRO.NCM'
      ',Produto   = Red.ReduzidaFinal'
      ',Descricao = LEFT(Rem.DescricaoFinal, 3700)      '
      ',Modalidade = '
      ' CASE WHEN PRO.Origem = '#39'I'#39' THEN '#39'IMPORTACAO'#39
      '      WHEN PRO.Origem = '#39'N'#39' THEN '#39'EXPORTACAO'#39
      ' END'
      'FROM Produtos PRO'
      ''
      '-- 1) Normaliza'#231#227'o da descri'#231#227'o reduzida'
      'CROSS APPLY ('
      '    SELECT'
      '        ReduzidaLen = LEN(PRO.Descricao_Reduzida)'
      ') LenCalc'
      ''
      '-- 2) Separa'#231#227'o da reduzida (100) e excedente'
      'CROSS APPLY ('
      '    SELECT'
      '        ReduzidaFinal ='
      '            CASE'
      '                WHEN LenCalc.ReduzidaLen > 100'
      '                THEN LEFT(PRO.Descricao_Reduzida, 100)'
      '                ELSE PRO.Descricao_Reduzida'
      '            END,'
      '        Excedente ='
      '            CASE'
      '                WHEN LenCalc.ReduzidaLen > 100'
      
        '                THEN SUBSTRING(PRO.Descricao_Reduzida, 101, LenC' +
        'alc.ReduzidaLen)'
      '                ELSE '#39#39
      '            END'
      ') Red'
      ''
      '-- 3) Montagem da descri'#231#227'o base'
      'CROSS APPLY ('
      '    SELECT'
      '        DescricaoBase = LTRIM(RTRIM('
      '            CASE'
      '                WHEN Red.Excedente <> '#39#39
      '                THEN Red.Excedente + '#39' '#39' + PRO.Descricao'
      '                ELSE PRO.Descricao'
      '            END'
      '        ))'
      ') DescBase'
      ''
      '-- 4) Remo'#231#227'o da descri'#231#227'o reduzida do in'#237'cio'
      'CROSS APPLY ('
      '    SELECT'
      '        DescricaoFinal = LTRIM(RTRIM('
      '            CASE'
      
        '                WHEN LEFT(DescBase.DescricaoBase, LEN(Red.Reduzi' +
        'daFinal)) = Red.ReduzidaFinal'
      '                THEN SUBSTRING('
      '                        DescBase.DescricaoBase,'
      '                        LEN(Red.ReduzidaFinal) + 1,'
      '                        LEN(DescBase.DescricaoBase)'
      '                     )'
      '                ELSE DescBase.DescricaoBase'
      '            END'
      '        ))'
      ') Rem'
      ''
      'WHERE PRO.Codigo_DUIMP IS NULL'
      'AND PRO.Origem IN ('#39'I'#39', '#39'N'#39')'
      'AND ISNULL(PRO.Servico, 0) = 0 '
      'AND ISNULL(PRO.Desativado, 0) = 0'
      'AND ISNULL(PRO.NCM, '#39#39') <> '#39'00000000'#39
      'AND (PRO.NaoSincPSiscomex = 0 OR PRO.NaoSincPSiscomex IS NULL)'
      'AND NOT EXISTS ('
      '    SELECT 1'
      '    FROM duimp.export_products'
      '    WHERE ProductId = PRO.Codigo'
      ');')
    Left = 24
    Top = 16
    object qryPROProdId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ProdId'
      Origin = 'ProdId'
      Required = True
    end
    object qryPRONCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 10
    end
    object qryPROModalidade: TStringField
      DisplayWidth = 11
      FieldName = 'Modalidade'
      Origin = 'Modalidade'
      ReadOnly = True
      Size = 10
    end
    object qryPROProduto: TStringField
      FieldName = 'Produto'
      Origin = 'Produto'
      ReadOnly = True
      Size = 60
    end
    object qryPRODescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 60
      FieldName = 'Descricao'
      Origin = 'Descricao'
      ReadOnly = True
      Size = 3700
    end
  end
  object dsoPRO: TDataSource
    DataSet = qryPRO
    OnStateChange = dsoStateChange
    OnDataChange = dsoDataChange
    Left = 96
    Top = 16
  end
  object qryEPR: TFDQuery
    OnCalcFields = qryEPRCalcFields
    Connection = damConnection.DBCliente
    UpdateObject = updEPR
    SQL.Strings = (
      'SELECT prodId = PRO.Codigo'
      ',PRO.ncm'
      ',denominacao   = Red.ReduzidaFinal'
      ',descricao = LEFT(Rem.DescricaoFinal, 3700)'
      ',situacao = '#39'ATIVADO'#39
      ',Modalidade = '
      ' CASE WHEN PRO.Origem = '#39'I'#39' THEN '#39'IMPORTACAO'#39
      '      WHEN PRO.Origem = '#39'N'#39' THEN '#39'EXPORTACAO'#39
      ' END'
      ',codigoProduto = PRO.Codigo_DUIMP'
      ',PRO.NaoSincPSiscomex'
      ',codigoFabricante = PRO.Codigo_Fabricante'
      'FROM Produtos PRO'
      ''
      '-- 1) Normaliza'#231#227'o da descri'#231#227'o reduzida'
      'CROSS APPLY ('
      '    SELECT'
      '        ReduzidaLen = LEN(PRO.Descricao_Reduzida)'
      ') LenCalc'
      ''
      '-- 2) Separa'#231#227'o da reduzida (100) e excedente'
      'CROSS APPLY ('
      '    SELECT'
      '        ReduzidaFinal ='
      '            CASE'
      '                WHEN LenCalc.ReduzidaLen > 100'
      '                THEN LEFT(PRO.Descricao_Reduzida, 100)'
      '                ELSE PRO.Descricao_Reduzida'
      '            END,'
      '        Excedente ='
      '            CASE'
      '                WHEN LenCalc.ReduzidaLen > 100'
      
        '                THEN SUBSTRING(PRO.Descricao_Reduzida, 101, LenC' +
        'alc.ReduzidaLen)'
      '                ELSE '#39#39
      '            END'
      ') Red'
      ''
      '-- 3) Montagem da descri'#231#227'o base'
      'CROSS APPLY ('
      '    SELECT'
      '        DescricaoBase = LTRIM(RTRIM('
      '            CASE'
      '                WHEN Red.Excedente <> '#39#39
      '                THEN Red.Excedente + '#39' '#39' + PRO.Descricao'
      '                ELSE PRO.Descricao'
      '            END'
      '        ))'
      ') DescBase'
      ''
      '-- 4) Remo'#231#227'o da descri'#231#227'o reduzida do in'#237'cio'
      'CROSS APPLY ('
      '    SELECT'
      '        DescricaoFinal = LTRIM(RTRIM('
      '            CASE'
      
        '                WHEN LEFT(DescBase.DescricaoBase, LEN(Red.Reduzi' +
        'daFinal)) = Red.ReduzidaFinal'
      '                THEN SUBSTRING('
      '                        DescBase.DescricaoBase,'
      '                        LEN(Red.ReduzidaFinal) + 1,'
      '                        LEN(DescBase.DescricaoBase)'
      '                     )'
      '                ELSE DescBase.DescricaoBase'
      '            END'
      '        ))'
      ') Rem'
      ''
      'WHERE PRO.Origem IN ('#39'I'#39', '#39'N'#39')'
      'AND ISNULL(PRO.Servico, 0) = 0 '
      'AND ISNULL(PRO.Desativado, 0) = 0'
      'AND ISNULL(PRO.NCM, '#39#39') <> '#39'00000000'#39
      'AND (PRO.NaoSincPSiscomex = 0 OR PRO.NaoSincPSiscomex IS NULL)'
      'AND EXISTS ('
      '    SELECT 1'
      '    FROM duimp.export_products'
      '    WHERE ProductId = PRO.Codigo'
      ');')
    Left = 24
    Top = 88
    object qryEPRprodId: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo'
      FieldName = 'prodId'
      Origin = 'prodId'
      Required = True
    end
    object qryEPRNCM: TStringField
      DisplayLabel = 'NCM'
      DisplayWidth = 7
      FieldName = 'ncm'
      Origin = 'ncm'
      EditMask = '0000\.99\.99;0;_'
      Size = 10
    end
    object qryEPRdenominacao: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'denominacao'
      Origin = 'denominacao'
      ReadOnly = True
      Size = 60
    end
    object qryEPRdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 60
      FieldName = 'descricao'
      Origin = 'descricao'
      ReadOnly = True
      Size = 3700
    end
    object qryEPRsituacao: TStringField
      Tag = 1
      FieldName = 'situacao'
      Origin = 'situacao'
      ReadOnly = True
      Required = True
      Visible = False
      Size = 7
    end
    object qryEPRmodalidade: TStringField
      DisplayWidth = 11
      FieldName = 'modalidade'
      Origin = 'modalidade'
      ReadOnly = True
      Size = 10
    end
    object qryEPRcpfCnpjRaiz: TStringField
      Tag = 1
      FieldKind = fkInternalCalc
      FieldName = 'cpfCnpjRaiz'
      Origin = 'cpfCnpjRaiz'
      Visible = False
      Size = 14
    end
    object qryEPRcodigoProduto: TIntegerField
      Tag = 1
      FieldName = 'codigoProduto'
      Origin = 'codigoProduto'
      Visible = False
    end
    object qryEPRcodigoFabricante: TStringField
      Tag = 1
      FieldName = 'codigoFabricante'
      Origin = 'codigoFabricante'
    end
    object qryEPRNaoSincPSiscomex: TBooleanField
      Tag = 1
      FieldName = 'NaoSincPSiscomex'
      Origin = 'NaoSincPSiscomex'
      Required = True
      Visible = False
    end
    object qryEPRmsg: TStringField
      Tag = 1
      DisplayLabel = 'Mensagem'
      FieldKind = fkCalculated
      FieldName = 'msg'
      Visible = False
      Size = 1000
      Calculated = True
    end
  end
  object dsoEPR: TDataSource
    DataSet = qryEPR
    OnStateChange = dsoStateChange
    OnDataChange = dsoDataChange
    Left = 96
    Top = 88
  end
  object EPRInsOrDel: TFDCommand
    Connection = damConnection.DBCliente
    CommandText.Strings = (
      'MERGE [duimp].[export_products] AS TARGET'
      'USING ('
      '    SELECT '
      '        T.C.value('#39'.'#39', '#39'INT'#39') AS ProductId'
      '    FROM ('
      
        '        SELECT CAST('#39'<i>'#39' + REPLACE(:Products, '#39','#39', '#39'</i><i>'#39') +' +
        ' '#39'</i>'#39' AS XML) AS XmlData'
      '    ) AS X'
      '    CROSS APPLY XmlData.nodes('#39'/i'#39') AS T(C)'
      ') AS SOURCE'
      'ON TARGET.ProductId = SOURCE.ProductId'
      ''
      'WHEN MATCHED THEN'
      '    DELETE'
      ''
      'WHEN NOT MATCHED THEN'
      '    INSERT (Id, ProductId)'
      '    VALUES (NEWID(), SOURCE.ProductId);')
    ParamData = <
      item
        Name = 'PRODUCTS'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    Left = 184
    Top = 16
  end
  object qryATT: TFDQuery
    CachedUpdates = True
    MasterSource = dsoEPR
    MasterFields = 'ProdId;NCM;Modalidade'
    Connection = damConnection.DBCliente
    UpdateObject = updPAT
    SQL.Strings = (
      'SELECT prodId = CAST(:ProdId AS int)'
      ',ncm = NAT.NCM'
      ',atributo = ANC.Codigo'
      ',nomeApresentacao = ANC.Nome_Apresentacao'
      ',nome = ANC.Nome_Atributo'
      ',orientacaoPreenchimento = ANC.Orientacao_Preenchimento'
      ',formaPreenchimento = ANC.Forma_Preenchimento'
      ',valor = PAT.Valor'
      ',modalidade = ANC.Modalidade_Operacao'
      ',multivalorado = ANC.Multivalorado'
      ',obrigatorio = ANC.Obrigatorio'
      'FROM [Cybersoft_Cadastros].[dbo].[AtributosNCM] AS ANC'
      'INNER JOIN NCMAtributos AS NAT'
      'ON ANC.Codigo = NAT.Atributo'
      'AND NAT.NCM = :NCM'
      'LEFT JOIN ProdutosAtributos AS PAT'
      'ON ANC.Codigo = PAT.Atributo'
      'AND PAT.Codigo_Mercadoria = :ProdId'
      'AND PAT.NCM = NAT.NCM'
      'LEFT JOIN Produtos AS PRO'
      'ON PRO.Codigo = PAT.Codigo_Mercadoria'
      'AND PRO.NCM = PAT.NCM'
      'WHERE SOUNDEX(ANC.Modalidade_Operacao) = SOUNDEX(:Modalidade);')
    Left = 24
    Top = 160
    ParamData = <
      item
        Name = 'PRODID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NCM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'MODALIDADE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryATTProdId: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod.Pro'
      FieldName = 'prodId'
      Origin = 'codigo'
      Visible = False
    end
    object qryATTNcm: TStringField
      Tag = 1
      DisplayLabel = 'NCM'
      FieldName = 'ncm'
      Origin = 'ncm'
      Visible = False
      Size = 8
    end
    object qryATTAtributo: TStringField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 8
      FieldName = 'atributo'
      Origin = 'atributo'
      Size = 25
    end
    object qryATTNomeApresentacao: TStringField
      Tag = 1
      DisplayLabel = 'Atributo'
      DisplayWidth = 20
      FieldName = 'nomeApresentacao'
      Origin = 'nomeApresentacao'
      Visible = False
      Size = 40
    end
    object qryATTNome: TStringField
      Tag = 1
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 40
      FieldName = 'nome'
      Origin = 'nome'
      Visible = False
      Size = 200
    end
    object qryATTorientacaoPreenchimento: TStringField
      Tag = 1
      DisplayLabel = 'Orienta'#231#227'o de Preenchimento'
      FieldName = 'orientacaoPreenchimento'
      Origin = 'orientacaoPreenchimento'
      Visible = False
      Size = 200
    end
    object qryATTformaPreenchimento: TStringField
      Tag = 1
      FieldName = 'formaPreenchimento'
      Origin = 'formaPreenchimento'
      Visible = False
    end
    object qryATTvalor: TStringField
      DisplayLabel = 'Valor'
      DisplayWidth = 25
      FieldName = 'valor'
      Origin = 'valor'
      OnGetText = qryATTvalorGetText
      Size = 100
    end
    object qryATTmodalidade: TStringField
      Tag = 1
      FieldName = 'modalidade'
      Origin = 'modalidade'
      Visible = False
    end
    object qryATTmultivalorado: TBooleanField
      Tag = 1
      FieldName = 'multivalorado'
      Origin = 'multivalorado'
      Visible = False
    end
    object qryATTobrigatorio: TBooleanField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Obrigat'#243'rio'
      DisplayWidth = 6
      FieldName = 'obrigatorio'
      Origin = 'obrigatorio'
      Required = True
    end
  end
  object dsoATT: TDataSource
    DataSet = qryATT
    OnStateChange = dsoStateChange
    OnDataChange = dsoDataChange
    Left = 96
    Top = 160
  end
  object qryDOM: TFDQuery
    IndexFieldNames = 'atributo;codigo'
    MasterSource = dsoATT
    MasterFields = 'atributo'
    Connection = damConnection.DBCadastro
    SQL.Strings = (
      'SELECT atributo = DAT.Atributo'
      ',codigo = DAT.Codigo'
      ',descricao = DAT.Descricao'
      'FROM DominiosAtt AS DAT'
      'WHERE DAT.Atributo = :atributo')
    Left = 24
    Top = 232
    ParamData = <
      item
        Name = 'ATRIBUTO'
        DataType = ftString
        ParamType = ptInput
        Size = 25
        Value = Null
      end>
    object qryDOMatributo: TStringField
      FieldName = 'atributo'
      Origin = 'atributo'
      Visible = False
    end
    object qryDOMcodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 12
      FieldName = 'codigo'
      Origin = 'Codigo'
    end
    object qryDOMdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 40
      FieldName = 'descricao'
      Origin = 'Descricao'
      Size = 100
    end
  end
  object dsoDOM: TDataSource
    DataSet = qryDOM
    OnStateChange = dsoStateChange
    OnDataChange = dsoDataChange
    Left = 96
    Top = 232
  end
  object updPAT: TFDUpdateSQL
    Connection = damConnection.DBCliente
    ModifySQL.Strings = (
      'MERGE INTO ProdutosAtributos AS TARGET'
      'USING ('
      '    SELECT '
      '        :OLD_prodId AS Codigo_Mercadoria,'
      '        :OLD_ncm               AS NCM,'
      '        :OLD_atributo          AS Atributo,'
      '        :NEW_valor             AS Valor'
      ') AS SOURCE'
      'ON '
      '    TARGET.Codigo_Mercadoria = SOURCE.Codigo_Mercadoria'
      'AND TARGET.NCM               = SOURCE.NCM'
      'AND TARGET.Atributo          = SOURCE.Atributo'
      ''
      'WHEN MATCHED THEN'
      '    UPDATE SET'
      '        TARGET.Valor = SOURCE.Valor'
      ''
      'WHEN NOT MATCHED THEN'
      '    INSERT ('
      '        Codigo_Mercadoria,'
      '        NCM,'
      '        Atributo,'
      '        Valor'
      '    )'
      '    VALUES ('
      '        SOURCE.Codigo_Mercadoria,'
      '        SOURCE.NCM,'
      '        SOURCE.Atributo,'
      '        SOURCE.Valor'
      '    );')
    Left = 184
    Top = 160
  end
  object qryATD: TFDQuery
    Connection = damConnection.DBCadastro
    SQL.Strings = (
      'SELECT atributo = DAT.Atributo'
      ',codigo = DAT.Codigo'
      ',descricao = DAT.Descricao'
      'FROM DominiosAtt AS DAT;')
    Left = 184
    Top = 232
  end
  object qryFAB: TFDQuery
    MasterSource = dsoEPR
    MasterFields = 'ProdId'
    Connection = damConnection.DBCliente
    UpdateObject = updFAB
    SQL.Strings = (
      'SELECT prodId = PRO.Codigo'
      ',codigoInterno = PRO.Fabricante'
      ',nome = FAB.Nome'
      ',logradouro = FAB.Rua'
      ',nomeCidade = FAB.Municipio'
      ',codigoPais = PAI.Sigla'
      ',cep = FAB.CEP'
      ',email = FAB.Email'
      ',codigoDuimp = FAB.Codigo_DUIMP        '
      ',cnpj = FAB.CNPJ'
      'FROM Produtos AS PRO'
      'INNER JOIN Fabricantes AS FAB'
      '    ON FAB.Codigo = PRO.Fabricante'
      'LEFT JOIN Cybersoft_Cadastros.dbo.Paises AS PAI'
      '    ON PAI.Codigo = FAB.Pais'
      'WHERE PRO.Origem IN ('#39'I'#39', '#39'N'#39')'
      'AND ISNULL(PRO.Servico, 0) = 0'
      'AND ISNULL(PRO.Desativado, 0) = 0'
      'AND ISNULL(PRO.NCM, '#39#39') <> '#39'00000000'#39
      'AND PRO.Codigo = :ProdId;')
    Left = 24
    Top = 304
    ParamData = <
      item
        Name = 'PRODID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryFABprodId: TIntegerField
      Tag = 1
      FieldName = 'prodId'
      Origin = 'prodId'
      Required = True
    end
    object qryFABcodigoInterno: TIntegerField
      FieldName = 'codigoInterno'
      Origin = 'codigoInterno'
    end
    object qryFABnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object qryFABlogradouro: TStringField
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Size = 40
    end
    object qryFABnomeCidade: TStringField
      FieldName = 'nomeCidade'
      Origin = 'nomeCidade'
    end
    object qryFABcodigoPais: TStringField
      Tag = 1
      FieldName = 'codigoPais'
      Origin = 'codigoPais'
      FixedChar = True
      Size = 2
    end
    object qryFABcep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      Size = 8
    end
    object qryFABemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 200
    end
    object qryFABcodigoDuimp: TStringField
      Tag = 1
      FieldName = 'codigoDuimp'
      Origin = 'codigoDuimp'
      Size = 35
    end
    object qryFABcnpj: TStringField
      Tag = 1
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Size = 14
    end
  end
  object dsoFAB: TDataSource
    DataSet = qryFAB
    Left = 96
    Top = 304
  end
  object updEPR: TFDUpdateSQL
    Connection = damConnection.DBCliente
    ModifySQL.Strings = (
      'UPDATE Produtos'
      'SET NaoSincPSiscomex = :NEW_NaoSincPSiscomex'
      ',Codigo_DUIMP = :NEW_codigoProduto'
      'WHERE Codigo = :OLD_prodId;'
      ''
      
        'IF (:NEW_codigoProduto IS NOT NULL AND :NEW_NaoSincPSiscomex = 1' +
        ')'
      'BEGIN'
      #9'DELETE FROM duimp.export_products'
      #9'WHERE ProductId = :OLD_prodId;'
      'END;')
    Left = 184
    Top = 88
  end
  object mtbFPR: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 272
    Top = 16
    object mtbFPRCodigoOperadorEstrangeiro: TStringField
      FieldName = 'codigoOperadorEstrangeiro'
      Size = 35
    end
    object mtbFPRcpfCnpjFabricante: TStringField
      FieldName = 'cpfCnpjFabricante'
      Size = 8
    end
    object mtbFPRConhecido: TBooleanField
      FieldName = 'conhecido'
    end
    object mtbFPRCodigoProduto: TIntegerField
      FieldName = 'codigoProduto'
    end
    object mtbFPRCodigoPais: TStringField
      FieldName = 'codigoPais'
      Size = 2
    end
  end
  object updFAB: TFDUpdateSQL
    Connection = damConnection.DBCliente
    ModifySQL.Strings = (
      'UPDATE Fabricantes'
      'SET Codigo_DUIMP = :NEW_codigoDuimp'
      'WHERE Codigo = :OLD_codigoInterno')
    Left = 184
    Top = 304
  end
end
