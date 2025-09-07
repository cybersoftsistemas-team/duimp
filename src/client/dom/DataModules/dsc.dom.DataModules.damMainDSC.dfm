inherited damMainDSC: TdamMainDSC
  Height = 88
  Width = 315
  object mtbDUC: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 26
    Top = 16
    object mtbDUCName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object mtbDUCHost: TStringField
      FieldName = 'Host'
      Size = 255
    end
    object mtbDUCPath: TStringField
      FieldName = 'Path'
      Size = 255
    end
    object mtbDUCPort: TIntegerField
      FieldName = 'Port'
    end
    object mtbDUCProtocol: TStringField
      FieldName = 'Protocol'
      Size = 10
    end
    object mtbDUCCertificateName: TStringField
      FieldName = 'CertificateName'
      Size = 255
    end
    object mtbDUCCertificatePassword: TStringField
      FieldName = 'CertificatePassword'
      Size = 255
    end
    object mtbDUCConnectionString: TStringField
      FieldName = 'ConnectionString'
      Size = 255
    end
  end
  object FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink
    Left = 211
    Top = 16
  end
  object dsoDUC: TDataSource
    DataSet = mtbDUC
    OnStateChange = dsoStateChange
    OnDataChange = dsoDataChange
    Left = 99
    Top = 16
  end
end
