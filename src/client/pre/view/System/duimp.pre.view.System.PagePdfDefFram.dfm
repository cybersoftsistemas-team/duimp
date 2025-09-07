inherited fraPagePdfDef: TfraPagePdfDef
  inherited lclPageDef: TdxLayoutControl
    inherited labTitle: TcxLabel
      ExplicitWidth = 248
    end
    object cbxDatabase: TcxLookupComboBox [1]
      Left = 366
      Top = 15
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'database_id'
      Properties.ListColumns = <
        item
          FieldName = 'name'
        end>
      Properties.ListOptions.ShowHeader = False
      TabOrder = 4
      Width = 167
    end
    object btnRefresh: TcxButton [2]
      Left = 540
      Top = 18
      Width = 24
      Height = 20
      Action = actRefresh
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000001974455874536F6674776172650041646F626520496D616765526561
        647971C9653C00000027744558745469746C6500526566726573683B52657065
        61743B426172733B526962626F6E3B52656C6F6164CD4DF6E9000000B1494441
        54785EC593B10D02310C454162001688D8E0FA1BC2A2A3A14F895241CF128C40
        7B5DE86E1F96301FE947F249761A4EA2784DBEF3EC28C946557F623D81DC5F8D
        040AA8E04D2AD7126B42C1165C80064C608C047B2094DC40060792C16C24C913
        9C5920A683CD0723290B0137A941107A92CCBCB66CB1399230F3E8875FC1F5F9
        D8F59AD8F12A83EC8C1F1ED30A0A83190C8EC04AC4BB8504A62671AEF16424E1
        431A9B24E048C97A4FF9FFBFF103FFEC875AFFDCA9F30000000049454E44AE42
        6082}
      PaintStyle = bpsGlyph
      TabOrder = 5
    end
    inherited ltgPageDef_Root: TdxLayoutGroup
      ItemIndex = 1
    end
    inherited lsiTitle: TdxLayoutSeparatorItem
      Visible = False
    end
    inherited loiTitle: TdxLayoutItem
      Parent = lagTitle
      Visible = False
    end
    object loiDatabase: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avBottom
      SizeOptions.AssignedValues = [sovSizableHorz]
      SizeOptions.SizableHorz = True
      SizeOptions.Width = 266
      CaptionOptions.Text = 'Banco do Cliente:'
      Control = cbxDatabase
      ControlOptions.OriginalHeight = 23
      ControlOptions.OriginalWidth = 177
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lagTitle: TdxLayoutAutoCreatedGroup
      Parent = ltgPageDef_Root
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object loiRefresh: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avBottom
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = True
      SizeOptions.SizableVert = True
      SizeOptions.Height = 8
      SizeOptions.Width = 24
      CaptionOptions.Text = 'Refresh'
      CaptionOptions.Visible = False
      Control = btnRefresh
      ControlOptions.OriginalHeight = 20
      ControlOptions.OriginalWidth = 24
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = lagTitle
      AlignVert = avCenter
      CaptionOptions.Text = 'New Group'
      Visible = False
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
  end
  inherited aclActionList: TActionList
    Left = 16
    object actRefresh: TAction
      Caption = 'Refresh'
      ImageIndex = 0
    end
  end
  inherited iglImageList: TcxImageList
    FormatVersion = 1
    DesignInfo = 1048676
    ImageInfo = <
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000027744558745469746C6500526566726573683B52657065
          61743B426172733B526962626F6E3B52656C6F6164CD4DF6E9000000B1494441
          54785EC593B10D02310C454162001688D8E0FA1BC2A2A3A14F895241CF128C40
          7B5DE86E1F96301FE947F249761A4EA2784DBEF3EC28C946557F623D81DC5F8D
          040AA8E04D2AD7126B42C1165C80064C608C047B2094DC40060792C16C24C913
          9C5920A683CD0723290B0137A941107A92CCBCB66CB1399230F3E8875FC1F5F9
          D8F59AD8F12A83EC8C1F1ED30A0A83190C8EC04AC4BB8504A62671AEF16424E1
          431A9B24E048C97A4FF9FFBFF103FFEC875AFFDCA9F30000000049454E44AE42
          6082}
        FileName = 'Office 2013\Actions\Refresh_16x16.png'
        Keywords = 'Actions;Refresh'
      end>
  end
  inherited decDef: TcxDefaultEditStyleController
    Left = 44
    PixelsPerInch = 96
  end
  inherited escDef: TcxEditStyleController
    Left = 72
    PixelsPerInch = 96
  end
  inherited lczMaster: TcxLocalizer
    Left = 128
  end
  inherited lfcDef: TcxLookAndFeelController
    Left = 16
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
end
