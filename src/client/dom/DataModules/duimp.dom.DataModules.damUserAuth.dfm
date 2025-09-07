inherited damUserAuth: TdamUserAuth
  Height = 209
  Width = 368
  object mtbCER: TFDMemTable
    BeforePost = DataSetBeforePost
    AfterPost = mtbCERAfterPost
    BeforeDelete = mtbCERBeforeDelete
    OnCalcFields = mtbCERCalcFields
    OnNewRecord = mtbCERNewRecord
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'Name'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 31
    Top = 16
    object mtbCERId: TGuidField
      FieldName = 'Id'
      Required = True
      Visible = False
      Size = 38
    end
    object mtbCERName: TStringField
      DisplayLabel = 'Nome da conex'#227'o'
      DisplayWidth = 130
      FieldName = 'Name'
      Required = True
      Size = 255
    end
    object mtbCERHost: TStringField
      DisplayLabel = 'URL base do servi'#231'o'
      DisplayWidth = 35
      FieldName = 'Host'
      Required = True
      Visible = False
      Size = 256
    end
    object mtbCERPath: TStringField
      DisplayLabel = 'Caminho de autentica'#231#227'o'
      FieldName = 'Path'
      Required = True
      Visible = False
      Size = 256
    end
    object mtbCERPort: TIntegerField
      DisplayLabel = 'Porta'
      FieldName = 'Port'
      Required = True
      Visible = False
    end
    object mtbCERProtocol: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'Protocol'
      Required = True
      Visible = False
      Size = 256
    end
    object mtbCERUrl: TStringField
      DisplayLabel = 'Conex'#227'o'
      FieldKind = fkCalculated
      FieldName = 'Url'
      Size = 255
      Calculated = True
    end
    object mtbCERCertificatePath: TStringField
      DisplayLabel = 'Arquivo PFX'
      FieldName = 'CertificatePath'
      Required = True
      Visible = False
      Size = 255
    end
    object mtbCERPassword: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'Password'
      Visible = False
      Size = 255
    end
    object mtbCERPreview: TStringField
      FieldKind = fkCalculated
      FieldName = 'Preview'
      Visible = False
      Size = 255
      Calculated = True
    end
    object mtbCERConnectionString: TStringField
      FieldName = 'ConnectionString'
      Visible = False
      OnChange = mtbCERConnectionStringChange
      Size = 255
    end
  end
  object dsoCER: TDataSource
    DataSet = mtbCER
    OnDataChange = dsoDataChange
    Left = 98
    Top = 16
  end
  object mtbLGN: TFDMemTable
    OnNewRecord = mtbLGNNewRecord
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 31
    Top = 144
    object mtbLGNId: TGuidField
      FieldName = 'Id'
      Size = 38
    end
    object mtbLGNCompanyId: TIntegerField
      FieldName = 'CompanyId'
    end
    object mtbLGNCompanyCNPJ: TStringField
      FieldName = 'CompanyCNPJ'
      Size = 14
    end
    object mtbLGNCompanyName: TStringField
      FieldName = 'CompanyName'
      Size = 255
    end
    object mtbLGNCompanyState: TStringField
      FieldName = 'CompanyState'
      Size = 2
    end
    object mtbLGNCompanyBranch: TIntegerField
      FieldName = 'CompanyBranch'
      Origin = 'Branch'
    end
    object mtbLGNDatabaseName: TStringField
      FieldName = 'DatabaseName'
      Size = 255
    end
    object mtbLGNPassword: TStringField
      FieldName = 'Password'
      Size = 255
    end
    object mtbLGNUserName: TStringField
      FieldName = 'UserName'
      Size = 255
    end
  end
  object dsoLGN: TDataSource
    DataSet = mtbLGN
    Left = 98
    Top = 144
  end
  object mtbCON: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 31
    Top = 79
    object mtbCONId: TGuidField
      FieldName = 'Id'
      Size = 38
    end
    object mtbCONConnectionName: TStringField
      FieldName = 'ConnectionName'
      Size = 255
    end
    object mtbCONConnectionString: TStringField
      FieldName = 'ConnectionString'
      Visible = False
      OnChange = mtbCERConnectionStringChange
      Size = 255
    end
  end
  object dsoCON: TDataSource
    DataSet = mtbCON
    Left = 98
    Top = 79
  end
  object conCadastro: TFDConnection
    Params.Strings = (
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 299
    Top = 16
  end
  object qryCMP: TFDQuery
    IndexFieldNames = 'ParentId;Name'
    Connection = conCadastro
    SQL.Strings = (
      'DECLARE @Companies TABLE ('
      '    CompanyId INT,'
      '    Name VARCHAR(255),'
      '    CNPJ VARCHAR(14),'
      '    Branch INT,'
      '    DatabaseName VARCHAR(255),'
      '    ParentId INT NULL,'
      '    ImageIndex INT,'
      '    State VARCHAR(2),'
      '    Desativada BIT'
      ');'
      ''
      'INSERT INTO @Companies '
      '('
      #9' CompanyId'
      #9',Name'
      #9',CNPJ'
      #9',Branch'
      #9',DatabaseName'
      #9',ParentId'
      #9',ImageIndex'
      #9',State'
      #9',Desativada'
      ')'
      'VALUES (0, '#39'Empresas'#39', NULL, 0, NULL, NULL, 0, NULL, 0);'
      ''
      'WITH Matrices AS ('
      '    SELECT CompanyId = Codigo'
      #9',Name = Razao_Social'
      #9',CNPJ'
      #9',Branch = ISNULL(Numero_Filial, 0)'
      #9',DatabaseName = Banco_Dados'
      #9',Estado'
      #9',RaizCNPJ = LEFT(CNPJ, 8)'
      #9',Desativada'
      '    FROM Empresas'
      '    WHERE Matriz_Filial = 1'
      '),'
      'Branches AS ('
      '    SELECT CompanyId = E.Codigo'
      #9',Name = E.Razao_Social'
      #9',E.CNPJ'
      #9',Branch = ISNULL(E.Numero_Filial, 0)'
      #9',DatabaseName = Banco_Dados'
      #9',E.Estado'
      #9',ParentId = M.CompanyId'
      #9',E.Desativada'
      '    FROM Empresas AS E'
      '    JOIN Matrices AS M'
      '        ON LEFT(E.CNPJ, 8) = M.RaizCNPJ'
      '    WHERE E.Matriz_Filial = 0'
      ')'
      ''
      'INSERT INTO @Companies '
      '('
      #9' CompanyId'
      #9',Name'
      #9',CNPJ'
      #9',Branch'
      #9',DatabaseName'
      #9',ParentId'
      #9',ImageIndex'
      #9',State'
      #9',Desativada'
      ')'
      ''
      'SELECT CompanyId'
      ',Name'
      ',CNPJ'
      ',Branch'
      ',DatabaseName'
      ',0'
      ',1'
      ',Estado'
      ',Desativada'
      'FROM Matrices'
      ''
      'UNION'
      ''
      'SELECT CompanyId'
      ',Name = CAST(Branch AS VARCHAR(18)) + '#39' - '#39' + Name'
      ',CNPJ'
      ',Branch'
      ',DatabaseName'
      ',ParentId'
      ',1'
      ',Estado'
      ',Desativada'
      'FROM Branches;'
      ''
      'SELECT * FROM @Companies;')
    Left = 160
    Top = 16
    object qryCMPCompanyId: TIntegerField
      FieldName = 'CompanyId'
      Origin = 'CompanyId'
    end
    object qryCMPName: TStringField
      FieldName = 'Name'
      Origin = 'Name'
      Size = 255
    end
    object qryCMPCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object qryCMPBranch: TIntegerField
      FieldName = 'Branch'
      Origin = 'Branch'
    end
    object qryCMPDatabaseName: TStringField
      FieldName = 'DatabaseName'
      Size = 255
    end
    object qryCMPParentId: TIntegerField
      FieldName = 'ParentId'
      Origin = 'ParentId'
    end
    object qryCMPImageIndex: TIntegerField
      FieldName = 'ImageIndex'
      Origin = 'ImageIndex'
    end
    object qryCMPState: TStringField
      FieldName = 'State'
      Size = 2
    end
    object qryCMPDesativada: TBooleanField
      FieldName = 'Desativada'
    end
  end
  object dsoCMP: TDataSource
    DataSet = qryCMP
    Left = 224
    Top = 16
  end
  object qryUSR: TFDQuery
    Connection = conCadastro
    SQL.Strings = (
      'DECLARE @UserName VARCHAR(255);'
      'DECLARE @Password VARCHAR(255);'
      ''
      'SET @UserName = :UserName;'
      'SET @Password = :Password;'
      ''
      
        'SELECT CAST((SELECT 1 FROM Usuarios WHERE Ativo = 1 AND Nome = @' +
        'UserName AND Chave COLLATE Latin1_General_CS_AS = @Password) AS ' +
        'BIT) AS [EXISTS];')
    Left = 160
    Top = 79
    ParamData = <
      item
        Name = 'USERNAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PASSWORD'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryUSREXISTS: TBooleanField
      FieldName = 'EXISTS'
      Origin = '[EXISTS]'
      ReadOnly = True
    end
  end
end
