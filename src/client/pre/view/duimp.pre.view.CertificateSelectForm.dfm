inherited frmCertificateSelect: TfrmCertificateSelect
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = ''
  ClientHeight = 396
  ClientWidth = 465
  StyleElements = [seFont, seClient, seBorder]
  OnActivate = dxFluentDesignFormActivate
  OnDestroy = dxFluentDesignFormDestroy
  ExplicitWidth = 481
  ExplicitHeight = 435
  TextHeight = 13
  inherited lclDef: TdxLayoutControl
    Width = 465
    Height = 396
    ExplicitWidth = 465
    ExplicitHeight = 396
    inherited btnWindowOk: TcxButton
      Left = 283
      Top = 351
      ExplicitLeft = 283
      ExplicitTop = 351
    end
    inherited btnWindowCancel: TcxButton
      Left = 364
      Top = 351
      TabOrder = 5
      ExplicitLeft = 364
      ExplicitTop = 351
    end
    object labInfo: TcxLabel [2]
      Left = 26
      Top = 0
      Caption = 'Selecionar um certificado para autentica'#231#227'o'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      Transparent = True
    end
    object labInfo02: TcxLabel [3]
      Left = 26
      Top = 40
      Caption = 
        'O site portalunico.siscomex.gov.br:443 precisa de suas credencia' +
        'is:'
      Style.HotTrack = False
      Style.TransparentBorder = False
      Transparent = True
    end
    object lstCer: TListView [4]
      Left = 27
      Top = 70
      Width = 411
      Height = 249
      BevelInner = bvNone
      BevelOuter = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      Columns = <
        item
          AutoSize = True
        end>
      OwnerDraw = True
      ReadOnly = True
      ShowColumnHeaders = False
      SmallImages = iglImages
      TabOrder = 7
      ViewStyle = vsReport
      OnDrawItem = lstCerDrawItem
      OnSelectItem = lstCerSelectItem
    end
    inherited lclDefGroup_Root: TdxLayoutGroup
      Offsets.Top = -10
    end
    inherited lagBtns: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup1
      Index = 4
    end
    inherited lsi1: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup1
      Visible = False
      Index = 3
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup1
      Offsets.Bottom = 16
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      Control = labInfo
      ControlOptions.OriginalHeight = 18
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      Offsets.Bottom = 10
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      Control = labInfo02
      ControlOptions.OriginalHeight = 13
      ControlOptions.OriginalWidth = 326
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = lclDefGroup_Root
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      Offsets.Bottom = 10
      Offsets.Left = 16
      Offsets.Right = 16
      ItemIndex = 2
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignVert = avClient
      Offsets.Bottom = 13
      CaptionOptions.Text = 'ListView1'
      CaptionOptions.Visible = False
      Control = lstCer
      ControlOptions.OriginalHeight = 146
      ControlOptions.OriginalWidth = 250
      Index = 2
    end
  end
  inherited llfMain: TdxLayoutLookAndFeelList
    Left = 60
    Top = 104
    inherited lsfMain: TdxLayoutSkinLookAndFeel
      PixelsPerInch = 96
    end
  end
  inherited sclMain: TdxSkinController
    Left = 88
    Top = 104
  end
  inherited decDef: TcxDefaultEditStyleController
    Left = 60
    Top = 76
    PixelsPerInch = 96
  end
  inherited lfcDef: TcxLookAndFeelController
    Left = 32
    Top = 104
  end
  inherited aclDef: TActionList
    Left = 32
    Top = 76
  end
  inherited iglImages: TcxImageList
    Height = 60
    FormatVersion = 1
    DesignInfo = 4980852
  end
  inherited escDef: TcxEditStyleController
    Left = 88
    Top = 76
    PixelsPerInch = 96
  end
  inherited lczMaster: TcxLocalizer
    Left = 144
    Top = 76
  end
end
