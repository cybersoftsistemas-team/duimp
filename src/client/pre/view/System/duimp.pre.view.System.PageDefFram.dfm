object fraPageDef: TfraPageDef
  Left = 0
  Top = 0
  Width = 576
  Height = 402
  TabOrder = 0
  object lclPageDef: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 576
    Height = 402
    Align = alClient
    ParentBackground = True
    TabOrder = 0
    Transparent = True
    LayoutLookAndFeel = lsfMain
    object labTitle: TcxLabel
      Left = 12
      Top = 12
      Caption = 'labTitle'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -21
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.StyleController = escDef
      Style.IsFontAssigned = True
      Transparent = True
    end
    object ltgPageDef_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avTop
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lsiTitle: TdxLayoutSeparatorItem
      Parent = ltgPageDef_Root
      CaptionOptions.Text = 'Separator'
      Index = 1
    end
    object loiTitle: TdxLayoutItem
      Parent = ltgPageDef_Root
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      Control = labTitle
      ControlOptions.OriginalHeight = 29
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object aclActionList: TActionList
    Images = iglImageList
    Left = 420
    Top = 16
  end
  object iglImageList: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 1049080
  end
  object decDef: TcxDefaultEditStyleController
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    StyleReadOnly.LookAndFeel.NativeStyle = False
    Left = 448
    Top = 16
    PixelsPerInch = 96
  end
  object escDef: TcxEditStyleController
    Left = 476
    Top = 16
    PixelsPerInch = 96
  end
  object lczMaster: TcxLocalizer
    Left = 532
    Top = 16
  end
  object lfcDef: TcxLookAndFeelController
    NativeStyle = False
    ScrollbarMode = sbmHybrid
    SkinName = 'Office2019Colorful'
    Left = 420
    Top = 44
  end
  object llfMain: TdxLayoutLookAndFeelList
    Left = 448
    Top = 44
    object lsfMain: TdxLayoutSkinLookAndFeel
      PixelsPerInch = 96
    end
  end
  object sclMain: TdxSkinController
    NativeStyle = False
    ScrollbarMode = sbmHybrid
    SkinName = 'Office2019Colorful'
    FormCorners = fcSmallRounded
    ShowFormShadow = bTrue
    Left = 476
    Top = 44
  end
end
