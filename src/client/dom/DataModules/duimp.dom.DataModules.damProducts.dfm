inherited damProducts: TdamProducts
  Height = 158
  Width = 155
  object qryPRO: TFDQuery
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'SELECT PRO.Codigo'
      ',PRO.NCM'
      ',Produto   = Red.ReduzidaFinal'
      ',Descricao = LEFT(Rem.DescricaoFinal, 3700)'
      ',PRO.NaoSincPSiscomex'
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
      'WHERE PRO.Desativado = 0'
      'AND PRO.NCM IS NOT NULL'
      'AND TRIM(PRO.NCM) <> '#39#39
      'AND (PRO.NaoSincPSiscomex = 0 OR PRO.NaoSincPSiscomex IS NULL)'
      'AND NOT EXISTS ('
      '    SELECT 1'
      '    FROM duimp.export_products'
      '    WHERE ProductId = PRO.Codigo'
      ');')
    Left = 24
    Top = 16
    object qryPROCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      Origin = 'Codigo'
      Required = True
    end
    object qryPRONCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
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
    object qryPRONaoSincPSiscomex: TBooleanField
      FieldName = 'NaoSincPSiscomex'
      Origin = 'NaoSincPSiscomex'
      Required = True
      Visible = False
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
    Connection = damConnection.DBCliente
    SQL.Strings = (
      'SELECT PRO.Codigo'
      ',PRO.NCM'
      ',Produto   = Red.ReduzidaFinal'
      ',Descricao = LEFT(Rem.DescricaoFinal, 3700)'
      ',PRO.NaoSincPSiscomex'
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
      'WHERE PRO.Desativado = 0'
      'AND PRO.NCM IS NOT NULL'
      'AND TRIM(PRO.NCM) <> '#39#39
      'AND (PRO.NaoSincPSiscomex = 0 OR PRO.NaoSincPSiscomex IS NULL)'
      'AND EXISTS ('
      '    SELECT 1'
      '    FROM duimp.export_products'
      '    WHERE ProductId = PRO.Codigo'
      ');')
    Left = 24
    Top = 88
    object qryEPRCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      Origin = 'Codigo'
      Required = True
    end
    object qryEPRNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 10
    end
    object qryEPRProduto: TStringField
      FieldName = 'Produto'
      Origin = 'Produto'
      ReadOnly = True
      Size = 60
    end
    object qryEPRDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 60
      FieldName = 'Descricao'
      Origin = 'Descricao'
      ReadOnly = True
      Size = 3700
    end
    object qryEPRNaoSincPSiscomex: TBooleanField
      FieldName = 'NaoSincPSiscomex'
      Origin = 'NaoSincPSiscomex'
      Required = True
      Visible = False
    end
  end
  object dsoEPR: TDataSource
    DataSet = qryEPR
    Left = 96
    Top = 88
  end
end
