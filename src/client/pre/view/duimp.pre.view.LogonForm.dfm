inherited frmLogon: TfrmLogon
  Position = poDesktopCenter
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 13
  inherited lclDef: TdxLayoutControl
    inherited labInfor02: TcxLabel
    end
    inherited btnConnect: TcxButton
      Left = 245
      Top = 198
      TabOrder = 13
      ExplicitLeft = 245
      ExplicitTop = 198
    end
    inherited edtUserName: TcxDBTextEdit
      Top = 119
      TabOrder = 10
      ExplicitTop = 119
    end
    inherited edtPassword: TcxDBTextEdit
      Top = 146
      TabOrder = 11
      ExplicitTop = 146
    end
    object edtCompanyName: TcxDBButtonEdit [11]
      Left = 177
      Top = 173
      DataBinding.DataField = 'CompanyName'
      DataBinding.DataSource = damUserAuth.dsoLGN
      Properties.Buttons = <
        item
          ImageIndex = 2
          Kind = bkGlyph
          LeftAlignment = True
        end
        item
          Action = actCompanies
          Default = True
          Kind = bkGlyph
        end>
      Properties.Images = iglImages
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.StyleController = escDef
      Style.TransparentBorder = False
      TabOrder = 12
      Width = 229
    end
    object edtConnectionName: TcxDBTextEdit [12]
      Left = 177
      Top = 94
      DataBinding.DataField = 'ConnectionName'
      DataBinding.DataSource = damUserAuth.dsoCON
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.StyleController = escDef
      Style.TransparentBorder = False
      TabOrder = 9
      Width = 229
    end
    object btnOptions: TcxButton [13]
      Left = 331
      Top = 198
      Width = 75
      Height = 25
      Action = actOptions
      TabOrder = 14
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      ItemIndex = 3
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      ItemIndex = 4
    end
    inherited lesSpace2: TdxLayoutEmptySpaceItem
      SizeOptions.Height = 22
    end
    inherited loibtnConnect: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      Index = 0
    end
    inherited loiedtUserName: TdxLayoutItem
      Index = 1
    end
    inherited loiedtPassword: TdxLayoutItem
      Index = 2
    end
    object loiedtCompanyName: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = '&Dom'#237'nio:'
      CaptionOptions.Width = 150
      Control = edtCompanyName
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object loiedtConnectionName: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = '&Conex'#227'o:'
      CaptionOptions.Width = 150
      Control = edtConnectionName
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object loibtnOptions: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahRight
      AlignVert = avClient
      CaptionOptions.Visible = False
      Control = btnOptions
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      LayoutDirection = ldHorizontal
      Index = 4
    end
  end
  inherited llfMain: TdxLayoutLookAndFeelList
    Left = 44
    inherited lsfMain: TdxLayoutSkinLookAndFeel
      PixelsPerInch = 96
    end
  end
  inherited sclMain: TdxSkinController
    Left = 72
  end
  inherited decDef: TcxDefaultEditStyleController
    Left = 44
    PixelsPerInch = 96
  end
  inherited lfcDef: TcxLookAndFeelController
    Left = 16
  end
  inherited aclDef: TActionList
    Left = 16
    object actOptions: TAction
      Category = 'Authentication'
      Caption = '&Op'#231#245'es'
      ImageIndex = 1
      OnExecute = actOptionsExecute
    end
    object actCompanies: TAction
      Category = 'Authentication'
      Caption = 'Empresas'
      ImageIndex = 3
      OnExecute = actCompaniesExecute
    end
  end
  inherited iglImages: TcxImageList
    FormatVersion = 1
    DesignInfo = 14352484
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000393939FF393939FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000393939FF393939FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000393939FF393939FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000393939FF393939FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000393939FF393939FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000393939FF393939FF393939FF393939FF3939
          39FF393939FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000393939FF393939FF393939FF393939FF3939
          39FF393939FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000393939FF393939FF393939FF393939FF3939
          39FF393939FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000393939FF393939FF393939FF393939FF3939
          39FF393939FF0000000000000000000000000000000000000000000000000000
          00000000000000000000393939FF393939FF393939FF393939FF393939FF3939
          39FF393939FF393939FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000393939FF393939FF00000000000000003939
          39FF393939FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000393939FF393939FF00000000000000003939
          39FF393939FF0000000000000000000000000000000000000000000000000000
          00000000000000000000000000007D7D7DFF6C6C6CFF00000000000000007D7D
          7DFF6C6C6CFF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        FileName = 'C:\Users\Wesley\Pictures\connect_10x16.png'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000003A744558745469746C650056657273696F6E3B50726F64
          7563743B53657474696E673B50726F706572743B437573746F6D697A3B446573
          69676E3B4974656D84696C47000000A849444154785ECDD2B10DC2301005D048
          2E328667803D90D8C31D45068001180706A0F61A88024A64098BCF3FF423A114
          D8600A8AA7D35DE4CB9D930E4093677239ACF08DFF68F0D33BB84E9CE828E7E9
          F34F56C814A91F29CF350D3AB358EFDD72B39B33264567F55283ACC3A08102DD
          29282FAE10ED4D3A7C2308940FA506BDC60D04DA925784EAB3B70D6C678D0DF2
          5AC913544FCD1334DD01B9D29F56F515AAD8B8942CBED61F5E89CA6AC14F6632
          0000000049454E44AE426082}
        FileName = 'Office 2013\Support\Version_16x16.png'
        Keywords = 'Support;Version'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
          00097048597300000EC300000EC301C76FA8640000006649444154384FC58CC1
          0980400C04D3A0ED58804D5882DF7BDA5D64C30AA20B1B1FE2C03CCCB8179F30
          2D7B2A993D6A0C993D6A0C993D6A0C993D6A0C993D6A0C99FB8C3112F2D3730E
          9CFCFDC93DAA817C60DED6BCFAE656A8D0BD152A746F850ADDDBDF441CCF4F0D
          68DD6BCB630000000049454E44AE426082}
        FileName = 'C:\Users\Wesley\Pictures\rede_16x16.png'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000026744558745469746C650046696E643B426172733B5269
          62626F6E3B5374616E646172643B536561726368BB659C080000005B49444154
          785EB592C10900310804AFC16B630B4955E9CEE0C129C124FB303EC6C72A2388
          8F88186FEBF24372232F8843CE2E3F094004A81168B882F594B89D834940868F
          7D1384ED1C140BFC801FF50283BEB2734FA025415E3000FE3DA38A41B3014A00
          00000049454E44AE426082}
        FileName = 'Office 2013\Find\Find_16x16.png'
        Keywords = 'Find;Find'
      end>
  end
  inherited escDef: TcxEditStyleController
    Left = 72
    PixelsPerInch = 96
  end
  inherited lczMaster: TcxLocalizer
    Left = 128
  end
end
