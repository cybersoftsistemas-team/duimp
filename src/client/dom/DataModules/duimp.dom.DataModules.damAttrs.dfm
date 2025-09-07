inherited damAttrs: TdamAttrs
  Height = 248
  Width = 89
  object cmdNCMIns: TFDCommand
    Connection = damConnection.DBCliente
    FetchOptions.AssignedValues = [evAutoClose]
    FetchOptions.AutoClose = False
    CommandKind = skInsert
    CommandText.Strings = (
      'SET ANSI_WARNINGS OFF;'
      ''
      'DECLARE @Custo_Seletivo bit;'
      ''
      'SET @Custo_Seletivo = CAST('
      #9'('
      #9#9'SELECT DISTINCT 1'
      #9#9'FROM Cybersoft_Cadastros.dbo.Majoracao AS MAJ'
      #9#9'WHERE MAJ.Tipo = '#39'M'#39
      #9#9'AND MAJ.Descricao = '#39'COFINS'#39
      #9#9'AND MAJ.Modalidade = :Modalidade'
      #9#9'AND MAJ.Majorada = :COFINS'
      #9') AS BIT'
      ');'
      ''
      'MERGE INTO NCM AS TARGET'
      'USING ('
      '    SELECT :NCM AS NCM'
      #9',:Produto AS Produto'
      #9',:Unidade AS Unidade'
      #9',:CodigoTrib_TabA AS CodigoTrib_TabA'
      #9',:CodigoTrib_TabA2 AS CodigoTrib_TabA2'
      #9',:CodigoTrib_TabA3 AS CodigoTrib_TabA3'
      #9',:Genero AS Genero'
      #9',:ICMS_Reducao AS ICMS_Reducao'
      #9',:II AS II'
      #9',:IPI AS IPI'
      #9',:PIS AS PIS'
      #9',:PIS_Nota AS PIS_Nota'
      #9',:PIS_NotaSaida AS PIS_NotaSaida'
      #9',:COFINS AS COFINS'
      #9',:COFINS_Nota AS COFINS_Nota'
      #9',:COFINS_NotaSaida AS COFINS_NotaSaida'
      #9',@Custo_Seletivo AS Custo_Seletivo'
      ') AS SOURCE'
      'ON TARGET.NCM = SOURCE.NCM'
      ''
      'WHEN MATCHED THEN'
      '    UPDATE '
      #9'SET TARGET.Produto = SOURCE.Produto'
      #9',TARGET.Unidade = SOURCE.Unidade'
      #9',TARGET.CodigoTrib_TabA = SOURCE.CodigoTrib_TabA'
      #9',TARGET.CodigoTrib_TabA2 = SOURCE.CodigoTrib_TabA2'
      #9',TARGET.CodigoTrib_TabA3 = SOURCE.CodigoTrib_TabA3'
      #9',TARGET.Genero = SOURCE.Genero'
      #9',TARGET.ICMS_Reducao = SOURCE.ICMS_Reducao'
      #9',TARGET.II = SOURCE.II'
      #9',TARGET.IPI = SOURCE.IPI'
      #9',TARGET.PIS = SOURCE.PIS'
      #9',TARGET.PIS_Nota = SOURCE.PIS_Nota'
      #9',TARGET.PIS_NotaSaida = SOURCE.PIS_NotaSaida'
      #9',TARGET.COFINS = SOURCE.COFINS'
      #9',TARGET.COFINS_Nota = SOURCE.COFINS_Nota'
      #9',TARGET.COFINS_NotaSaida = SOURCE.COFINS_NotaSaida'
      #9',TARGET.Custo_Seletivo = SOURCE.Custo_Seletivo'
      ''
      'WHEN NOT MATCHED THEN'
      '    INSERT '
      #9'(NCM'
      #9',Produto'
      #9',Unidade'
      #9',CodigoTrib_TabA'
      #9',CodigoTrib_TabA2'
      #9',CodigoTrib_TabA3'
      #9',Genero'
      #9',ICMS_Reducao'
      #9',II'
      #9',IPI'
      #9',PIS'
      #9',PIS_Nota'
      #9',PIS_NotaSaida'
      #9',COFINS'
      #9',COFINS_Nota'
      #9',COFINS_NotaSaida'
      #9',Custo_Seletivo)'
      '    VALUES '
      #9'(SOURCE.NCM'
      #9',SOURCE.Produto'
      #9',SOURCE.Unidade'
      #9',SOURCE.CodigoTrib_TabA'
      #9',SOURCE.CodigoTrib_TabA2'
      #9',SOURCE.CodigoTrib_TabA3'
      #9',SOURCE.Genero'
      #9',SOURCE.ICMS_Reducao'
      #9',SOURCE.II'
      #9',SOURCE.IPI'
      #9',SOURCE.PIS'
      #9',SOURCE.PIS_Nota'
      #9',SOURCE.PIS_NotaSaida'
      #9',SOURCE.COFINS'
      #9',SOURCE.COFINS_Nota'
      #9',SOURCE.COFINS_NotaSaida'
      #9',SOURCE.Custo_Seletivo);'
      ''
      'SET ANSI_WARNINGS ON;')
    ParamData = <
      item
        Name = 'MODALIDADE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COFINS'
        DataType = ftFloat
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
        Name = 'PRODUTO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'UNIDADE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGOTRIB_TABA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGOTRIB_TABA2'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGOTRIB_TABA3'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'GENERO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ICMS_REDUCAO'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'II'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IPI'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PIS'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PIS_NOTA'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PIS_NOTASAIDA'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COFINS_NOTA'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COFINS_NOTASAIDA'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end>
    Left = 27
    Top = 16
  end
  object cmdATSIns: TFDCommand
    Connection = damConnection.DBCadastro
    FetchOptions.AssignedValues = [evAutoClose]
    FetchOptions.AutoClose = False
    CommandKind = skInsert
    CommandText.Strings = (
      'INSERT INTO AtributosNCM '
      'SELECT :Codigo'
      ',:Nome_Apresentacao'
      ',:Nome_Atributo'
      ',:Orientacao_Preenchimento'
      ',:Forma_Preenchimento'
      ',:Modalidade_Operacao'
      ',:Multivalorado'
      ',:Obrigatorio'
      'WHERE NOT EXISTS ('
      '    SELECT 1 FROM AtributosNCM'
      '    WHERE Codigo = :Codigo'
      ');')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOME_APRESENTACAO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOME_ATRIBUTO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ORIENTACAO_PREENCHIMENTO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FORMA_PREENCHIMENTO'
        ParamType = ptInput
      end
      item
        Name = 'MODALIDADE_OPERACAO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'MULTIVALORADO'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'OBRIGATORIO'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end>
    Left = 27
    Top = 72
  end
  object cmdDOMIns: TFDCommand
    Connection = damConnection.DBCadastro
    FetchOptions.AssignedValues = [evAutoClose]
    FetchOptions.AutoClose = False
    CommandKind = skInsert
    CommandText.Strings = (
      'INSERT INTO DominiosAtt'
      'SELECT :Atributo'
      ',:Codigo'
      ',:Descricao'
      'WHERE NOT EXISTS ('
      '    SELECT 1 FROM DominiosAtt'
      '    WHERE Atributo = :Atributo'
      '    AND Codigo = :Codigo'
      ');')
    ParamData = <
      item
        Name = 'ATRIBUTO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    Left = 27
    Top = 128
  end
  object cmdNATIns: TFDCommand
    Connection = damConnection.DBCliente
    FetchOptions.AssignedValues = [evAutoClose]
    FetchOptions.AutoClose = False
    UpdateOptions.UpdateTableName = 'NCMAtributos'
    UpdateOptions.KeyFields = 'Atributo;NCM'
    CommandKind = skInsert
    CommandText.Strings = (
      'INSERT INTO NCMAtributos'
      'SELECT :NCM'
      ',:Atributo'
      'WHERE NOT EXISTS ('
      '    SELECT 1 FROM NCMAtributos'
      '    WHERE NCM = :NCM'
      '    AND Atributo = :Atributo'
      ');')
    ParamData = <
      item
        Name = 'NCM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ATRIBUTO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    Left = 27
    Top = 184
  end
end
