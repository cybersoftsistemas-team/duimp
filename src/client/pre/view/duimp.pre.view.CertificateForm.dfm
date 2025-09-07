inherited frmCertificate: TfrmCertificate
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Certificado Siscomex'
  ClientHeight = 391
  ClientWidth = 460
  StyleElements = [seFont, seClient, seBorder]
  OnActivate = dxFluentDesignFormActivate
  OnClose = dxFluentDesignFormClose
  ExplicitWidth = 476
  ExplicitHeight = 430
  TextHeight = 13
  inherited lclDef: TdxLayoutControl
    Width = 460
    Height = 391
    OptionsImage.Images = iglImages
    ExplicitWidth = 460
    ExplicitHeight = 391
    inherited btnWindowOk: TcxButton
      Left = 294
      Top = 356
      TabOrder = 10
      ExplicitLeft = 294
      ExplicitTop = 356
    end
    inherited btnWindowCancel: TcxButton
      Left = 375
      Top = 356
      TabOrder = 11
      ExplicitLeft = 375
      ExplicitTop = 356
    end
    object edtHost: TcxDBTextEdit [2]
      Left = 159
      Top = 101
      DataBinding.DataField = 'Host'
      DataBinding.DataSource = damUserAuth.dsoCER
      Style.StyleController = escDef
      TabOrder = 4
      Width = 276
    end
    object edtPort: TcxDBSpinEdit [3]
      Left = 159
      Top = 155
      DataBinding.DataField = 'Port'
      DataBinding.DataSource = damUserAuth.dsoCER
      Properties.MaxValue = 99999.000000000000000000
      Style.StyleController = escDef
      TabOrder = 6
      Width = 112
    end
    object edtPath: TcxDBTextEdit [4]
      Left = 159
      Top = 128
      DataBinding.DataField = 'Path'
      DataBinding.DataSource = damUserAuth.dsoCER
      Style.StyleController = escDef
      TabOrder = 5
      Width = 276
    end
    object edtPreview: TcxDBTextEdit [5]
      Left = 63
      Top = 290
      DataBinding.DataField = 'Preview'
      DataBinding.DataSource = damUserAuth.dsoCER
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.StyleController = escDef
      TabOrder = 9
      Width = 387
    end
    object rgpProtocol: TcxDBRadioGroup [6]
      Left = 151
      Top = 182
      Alignment = alCenterCenter
      Ctl3D = False
      DataBinding.DataField = 'Protocol'
      DataBinding.DataSource = damUserAuth.dsoCER
      ParentBackground = False
      ParentColor = False
      ParentCtl3D = False
      Properties.Columns = 2
      Properties.ImmediatePost = True
      Properties.Items = <
        item
          Caption = 'H&TTPS'
          Value = 'https://'
        end
        item
          Caption = '&HTTP'
          Value = 'http://'
        end>
      Style.Color = 15790320
      Style.Edges = []
      Style.StyleController = escDef
      TabOrder = 7
      Transparent = True
      Height = 24
      Width = 141
    end
    object edtCertificatePath: TcxDBButtonEdit [7]
      Left = 159
      Top = 242
      DataBinding.DataField = 'CertificatePath'
      DataBinding.DataSource = damUserAuth.dsoCER
      Properties.Buttons = <
        item
          Default = True
          ImageIndex = 0
          Kind = bkGlyph
        end>
      Properties.Images = iglImages
      Properties.ReadOnly = True
      Properties.OnButtonClick = edtCertificatePathPropertiesButtonClick
      Style.StyleController = escDef
      TabOrder = 8
      Width = 276
    end
    object edtPassword: TcxDBButtonEdit [8]
      Left = 159
      Top = 269
      DataBinding.DataField = 'Password'
      DataBinding.DataSource = damUserAuth.dsoCER
      Properties.Buttons = <
        item
          Action = actPassword
          Default = True
          Kind = bkGlyph
        end>
      Properties.EchoMode = eemPassword
      Properties.Images = iglImages
      Style.StyleController = escDef
      TabOrder = 8
      Width = 112
    end
    object edtName: TcxDBTextEdit [9]
      Left = 10
      Top = 28
      DataBinding.DataField = 'Name'
      DataBinding.DataSource = damUserAuth.dsoCER
      Style.StyleController = escDef
      TabOrder = 3
      Width = 440
    end
    inherited lagBtns: TdxLayoutAutoCreatedGroup
      Index = 2
    end
    inherited lsi1: TdxLayoutSeparatorItem
      Index = 1
    end
    object loiedtHost: TdxLayoutItem
      Parent = ltg1
      CaptionOptions.Text = '&URL base do servi'#231'o:'
      Control = edtHost
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object ltg1: TdxLayoutGroup
      Parent = lclDefGroup_Root
      CaptionOptions.Text = 'Propriedades da conex'#227'o'
      Offsets.Top = 3
      Padding.AssignedValues = [lpavBottom, lpavLeft, lpavRight, lpavTop]
      Index = 3
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = ltg1
      AlignHorz = ahLeft
      CaptionOptions.Text = '&Porta:'
      Control = edtPort
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 112
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = ltg1
      CaptionOptions.Text = 'C&aminho de autentica'#231#227'o:'
      CaptionOptions.Width = 130
      Control = edtPath
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object ltg2: TdxLayoutGroup
      Parent = dxLayoutAutoCreatedGroup2
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object loi1: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignHorz = ahLeft
      AlignVert = avCenter
      CaptionOptions.Text = 'Protocolo:'
      CaptionOptions.Width = 120
      Index = 0
    end
    object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
      Parent = ltg1
      LayoutDirection = ldHorizontal
      Index = 3
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = lclDefGroup_Root
      Offsets.Top = 3
      CaptionOptions.Text = 'V&isualizar:'
      Control = edtPreview
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = ltg2
      CaptionOptions.Text = 'cxDBRadioGroup1'
      CaptionOptions.Visible = False
      Control = rgpProtocol
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 24
      ControlOptions.OriginalWidth = 141
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lsi2: TdxLayoutSeparatorItem
      Parent = ltg1
      Offsets.Bottom = 4
      Offsets.Top = 4
      CaptionOptions.ImageIndex = 3
      CaptionOptions.Text = 'Certificado'
      CaptionOptions.Visible = True
      Index = 4
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = ltg1
      CaptionOptions.Text = '&Arquivo PFX:'
      Control = edtCertificatePath
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = ltg1
      AlignHorz = ahLeft
      CaptionOptions.Text = '&Senha:'
      Control = edtPassword
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 112
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = lclDefGroup_Root
      CaptionOptions.Text = '&Nome da conex'#227'o:'
      CaptionOptions.Layout = clTop
      Control = edtName
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  inherited llfMain: TdxLayoutLookAndFeelList
    Left = 332
    inherited lsfMain: TdxLayoutSkinLookAndFeel
      PixelsPerInch = 96
    end
  end
  inherited sclMain: TdxSkinController
    Left = 360
  end
  inherited decDef: TcxDefaultEditStyleController
    Left = 332
    PixelsPerInch = 96
  end
  inherited lfcDef: TcxLookAndFeelController
    Left = 304
  end
  inherited aclDef: TActionList
    Left = 304
    object actPassword: TAction
      Caption = 'Action1'
      ImageIndex = 1
      OnExecute = actPasswordExecute
    end
  end
  inherited iglImages: TcxImageList
    FormatVersion = 1
    DesignInfo = 1048964
    ImageInfo = <
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000002B744558745469746C65004F70656E3B466F6C6465723B
          426172733B526962626F6E3B5374616E646172643B4C6F6164F1C3C463000000
          5549444154785ECDD3B10DC030104251166499CC70A3791EAF40E8229D14DB12
          8D8B57F23B20297241A0AA68B28E7614D00283C012D380E2801D0768E8BEC066
          30C743D30FF600DB600BC9D888646C4032B60BCEF402B098C2336E3A488C0000
          000049454E44AE426082}
        FileName = 'Office 2013\Actions\Open_16x16.png'
        Keywords = 'Actions;Open'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000000F744558745469746C650053686F773B4579653B49E307
          250000011A49444154785EB593BD4AC45010467D0D4BED7C00416C7C02DF465F
          4002018B9401114CCA341682C562639122922289420AED6DC4A08510D8247CDE
          534C931F1156070E5C66E67CBB9BDCDD92B4117F1FE079DEA1E3320C43F9BE0F
          72BD177ACC960210771C77711CAB2C4B354DA3BEEF81333D3163875DF34C3E72
          7C645926EAABED74FFF4AAD3AB078D8B1D76717091F71C9F755D9BACF3EB471D
          9FAD4073C52E0E2E01AB3CCF65C527231A4B85834B40DB759DF97CED5F05E0E0
          2E074C61361B70C38399FC8429CCCC473EC12560D7F15E55D5EC4334E831A3D8
          C5C1B5D7B81F0481D2341DBF46E06C323BC86F38E38BB49D2489A2285251145C
          1E0DC3009CE921668E5B767FBACA078E0BC7B3630D9CE931FB973FD3467C032A
          D008DD4D8C839F0000000049454E44AE426082}
        FileName = 'Office 2013\Actions\Show_16x16.png'
        Keywords = 'Actions;Show'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000001C744558745469746C6500486964653B52656D6F76653B
          44656C6574653B65796578098D2D0000017B49444154785EA593BD4AC3501480
          7D0D47DD7C00415C5C9C1441F4110A0A163707719442C54D90425121AEFE0C62
          91E22645424369D3DA88AD0ECE62A82D48A94D399E6F38432483D0031FB9B9F7
          7E27E7FE644244C62226BCA416FF456363E9946762824C2633AF9CE47239C966
          B320FADEA68FB1CAD6EA85CA52DF5C3EB3048038A5DC3B8E23B55A4DC2309428
          8A80367DD27B7B166437BD7E671598BCA0745CD715A2F11ECA71A129A9A30739
          B8F2A53F88A4DB6E224BEF35604A0707177946F90A82C064D9CE3FCACA7E5176
          9DB274BF0712362AC8D26D3D09C15C1C5C12143DCFC305BE9C2887758F4AC402
          079704FDE170683E6527CABC1F5EFB628183FB37016B4E94F7CE3D922726B8B1
          CD03CA4C905916CB331F79079704D3CAA7EFFBF8EC76A2CCC6B2C104737170ED
          186791ED9C494225AC99B2F9B2C9A55209F903277691CAE9B55B3BE76AB5CAE5
          91D16804B4E9437495823219BB485C4B64BDA6973A38A7E49596F203B4E9630C
          D1B004B11FE49FC4FEC6B1F8059D3DDDCB3DD09CBC0000000049454E44AE4260
          82}
        FileName = 'Office 2013\Actions\Hide_16x16.png'
        Keywords = 'Actions;Hide'
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000000205070A050D14200D1014200C0C0D100000
          0000000000000000000000000000000000000000000000000000000000002222
          2240222222402222224022222240243E527C3175AEFF698CA8FF64696FA02222
          2240222222402222224022222240222222400404040800000000000000009899
          9AFFB0B2B2FFB0B2B2FFAEB0B0FF90A3B2FF569FD1FF5CA7CDFF68879AFF7E88
          91FFA5A7A9FFB0B2B2FFB0B2B2FF8F9191FF111111200000000000000000B4B4
          B5FFE8E8E8FFEFEFEFFFF4F4F4FFE2E6E9FFA9C3DAFF5DA3D3FF4A9DCDFF5A89
          ABFFABB8C6FFE5E7E9FFE9E9E9FF9A9B9BFF111111200000000000000000B4B4
          B5FFEFEFEFFFE5E5E5FFEAEAEAFFF4F4F4FFEBEEF1FFB5CEE2FF63A6D5FF4A9F
          D1FF5F92B5FF7594AFFF7998B3FF60829EFF0B1013200000000000000000B5B5
          B6FFFDFDFDFFF5F5F5FFEAEAEAFFE3E3E3FFECECECFFF1F4F6FFBAD0E2FF5E9E
          CDFF50A9DAFF49A8E1FF5BB6E1FF63BBDCFF345F80C70305080C00000000B5B5
          B6FFFEFEFEFFFEFEFEFFFAFAFAFFF2F2F2FFDBDBDBFFBFBFBFFFCFD1D2FF7CA8
          CFFF83C4E5FF66C5FBFF427DAAFFA3D6E7FF4C7EA6FF04070A1000000000B5B5
          B6FFFFFFFFFFFEFEFEFFFDFDFDFFD9DADAFF7697A8FF3B95C2FF4C90B1FF4A86
          B3FF8AC7E5FF658BA7FFC4CFDCFF9EE2F4FF467CA4FF04070A1000000000B5B5
          B6FFF9F9F9FFEDEDEDFFC9CACAFFCFD3D4FF8DC0D5FF0984B9FF38ADDDFF3F9F
          D7FF3699E0FF8DD2F5FF8CD5EFFF4E88B1FF84A6BFE3090B0C0E00000000B4B4
          B5FFD6DADCFFD1D3D4FFF6F4F4FFF2EAE8FFADCDD9FF209FC9FF0B9BCDFF0993
          CBFF3794CDFF5A97CAFF528CBFFF557D9EFF0B1013200000000000000000C6C8
          C9FF9AADBAFFE4EBEEFFF9F4F3FFE5D1CEFFE5DDDDFFACD6E5FF61B3D2FF60B3
          D6FFB3DBEAFFE4EDF0FF9FAAAFFF8D9091FF121212200000000000000000EAEC
          EDFF88A4B6FFE4EBEEFFF9F3F2FFE7CFCBFFE7CFCBFFEBD6D4FFEBD8D5FFE7CF
          CBFFF6EDECFFE8EEF1FF647E8DFFCCD2D5FF1E1E1E2000000000000000005E60
          626A89A5B7FFE6ECEFFFFBF6F5FFEDDBD8FFEDDBD8FFF0E0DEFFF0E1DFFFEDDB
          D8FFF8F2F0FFE8EEF1FF617C8CFF565C5F7E0C0C0C0C0000000000000000080A
          0B1089A5B7FFE6EBEEFFECEFF1FFECEFF1FFEDEFF2FFECEFF2FFECEFF2FFECEF
          F2FFEDEFF2FFE4EBEFFF627D8EFF0B111430000000000000000000000000080A
          0B107E9CB0FF89A5B7FF89A5B7FF89A5B7FF89A5B7FF89A5B7FF89A5B7FF89A5
          B7FF89A5B7FF89A5B7FF4C6C80FF0B1114300000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        FileName = 'C:\Users\Wesley\Pictures\certificate.png'
      end>
  end
  inherited escDef: TcxEditStyleController
    Left = 360
    PixelsPerInch = 96
  end
  inherited lczMaster: TcxLocalizer
    Left = 416
  end
  object dlgCertificate: TOpenDialog
    Filter = 'Certificado do tipo|*.pfx'
    Left = 388
    Top = 44
  end
end
