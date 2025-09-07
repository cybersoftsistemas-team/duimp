inherited frmMainDSC: TfrmMainDSC
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Duimp Setup Config Editor'
  ClientHeight = 390
  ClientWidth = 469
  Position = poDesktopCenter
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 485
  ExplicitHeight = 429
  TextHeight = 13
  inherited lclDef: TdxLayoutControl
    Top = 21
    Width = 469
    Height = 369
    TabOrder = 1
    ExplicitWidth = 469
    ExplicitHeight = 370
    object pclMain: TcxPageControl [0]
      Left = 10
      Top = 10
      Width = 449
      Height = 318
      Color = 15790320
      ParentBackground = False
      ParentColor = False
      TabOrder = 3
      Properties.ActivePage = tshConnProp
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 316
      ClientRectLeft = 2
      ClientRectRight = 447
      ClientRectTop = 23
      object tshConnProp: TcxTabSheet
        Caption = 'Conex'#227'o Siscomex'
        ImageIndex = 0
        ExplicitHeight = 294
        object dxLayoutControl1: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 445
          Height = 293
          Align = alClient
          ParentBackground = True
          TabOrder = 0
          Transparent = True
          LayoutLookAndFeel = lsfMain
          ExplicitHeight = 294
          object edtName: TcxDBTextEdit
            Left = 179
            Top = 53
            DataBinding.DataField = 'Name'
            DataBinding.DataSource = damMainDSC.dsoDUC
            Style.HotTrack = False
            Style.TransparentBorder = False
            TabOrder = 1
            Width = 241
          end
          object edtHost: TcxDBTextEdit
            Left = 179
            Top = 78
            DataBinding.DataField = 'Host'
            DataBinding.DataSource = damMainDSC.dsoDUC
            Style.HotTrack = False
            Style.TransparentBorder = False
            TabOrder = 2
            Width = 241
          end
          object edtPath: TcxDBTextEdit
            Left = 179
            Top = 103
            DataBinding.DataField = 'Path'
            DataBinding.DataSource = damMainDSC.dsoDUC
            Style.HotTrack = False
            Style.TransparentBorder = False
            TabOrder = 3
            Width = 241
          end
          object cxDBTextEdit4: TcxDBTextEdit
            Left = 179
            Top = 128
            DataBinding.DataField = 'Port'
            DataBinding.DataSource = damMainDSC.dsoDUC
            Style.HotTrack = False
            Style.TransparentBorder = False
            TabOrder = 4
            Width = 65
          end
          object rgpProtocol: TcxDBRadioGroup
            Left = 171
            Top = 153
            Alignment = alCenterCenter
            Ctl3D = False
            DataBinding.DataField = 'Protocol'
            DataBinding.DataSource = damMainDSC.dsoDUC
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
            Style.LookAndFeel.NativeStyle = False
            Style.LookAndFeel.SkinName = 'Office2019Colorful'
            Style.StyleController = escDef
            Style.TransparentBorder = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.SkinName = 'Office2019Colorful'
            TabOrder = 5
            Transparent = True
            Height = 24
            Width = 161
          end
          object edtCertificateName: TcxDBTextEdit
            Left = 179
            Top = 203
            DataBinding.DataField = 'CertificateName'
            DataBinding.DataSource = damMainDSC.dsoDUC
            Style.HotTrack = False
            Style.TransparentBorder = False
            TabOrder = 6
            Width = 241
          end
          object edtCertificatePassword: TcxDBTextEdit
            Left = 179
            Top = 228
            DataBinding.DataField = 'CertificatePassword'
            DataBinding.DataSource = damMainDSC.dsoDUC
            Properties.EchoMode = eemPassword
            Properties.ShowPasswordRevealButton = True
            Style.HotTrack = False
            Style.TransparentBorder = False
            TabOrder = 7
            Width = 121
          end
          object dxLayoutControl1Group_Root: TdxLayoutGroup
            AlignHorz = ahParentManaged
            AlignVert = avParentManaged
            Hidden = True
            ShowBorder = False
            Index = -1
          end
          object dxLayoutItem1: TdxLayoutItem
            Parent = ltgProps
            CaptionOptions.Text = '&Nome da conex'#227'o:'
            Control = edtName
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object dxLayoutItem2: TdxLayoutItem
            Parent = ltgProps
            CaptionOptions.Text = '&URL base do servi'#231'o:'
            CaptionOptions.Width = 150
            Control = edtHost
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 1
          end
          object dxLayoutItem3: TdxLayoutItem
            Parent = ltgProps
            CaptionOptions.Text = '&Caminho de autentica'#231#227'o:'
            Control = edtPath
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 2
          end
          object dxLayoutItem4: TdxLayoutItem
            Parent = ltgProps
            AlignHorz = ahLeft
            SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
            SizeOptions.SizableHorz = False
            SizeOptions.SizableVert = False
            CaptionOptions.Text = '&Porta:'
            Control = cxDBTextEdit4
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 65
            ControlOptions.ShowBorder = False
            Index = 3
          end
          object ltgProps: TdxLayoutGroup
            Parent = dxLayoutControl1Group_Root
            AlignVert = avClient
            CaptionOptions.Text = 'Propriedades de Conex'#227'o:'
            Index = 0
          end
          object lsi1: TdxLayoutSeparatorItem
            Parent = ltgProps
            CaptionOptions.Text = 'Certificado'
            CaptionOptions.Visible = True
            Index = 5
          end
          object dxLayoutItem5: TdxLayoutItem
            Parent = dxLayoutAutoCreatedGroup2
            AlignHorz = ahLeft
            CaptionOptions.Text = 'Protocolo:'
            CaptionOptions.Visible = False
            Control = rgpProtocol
            ControlOptions.AutoColor = True
            ControlOptions.OriginalHeight = 24
            ControlOptions.OriginalWidth = 161
            ControlOptions.ShowBorder = False
            Index = 1
          end
          object dxLayoutLabeledItem1: TdxLayoutLabeledItem
            Parent = dxLayoutAutoCreatedGroup2
            AlignVert = avClient
            SizeOptions.Width = 140
            CaptionOptions.Text = 'Protocolo:'
            Index = 0
          end
          object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
            Parent = ltgProps
            LayoutDirection = ldHorizontal
            Index = 4
          end
          object dxLayoutItem6: TdxLayoutItem
            Parent = ltgProps
            CaptionOptions.Text = '&Arquivo PFX:'
            Control = edtCertificateName
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 6
          end
          object dxLayoutItem7: TdxLayoutItem
            Parent = ltgProps
            AlignHorz = ahLeft
            CaptionOptions.Text = '&Senha:'
            Control = edtCertificatePassword
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 7
          end
        end
      end
    end
    object btnWindowsApply: TcxButton [1]
      Left = 384
      Top = 334
      Width = 75
      Height = 25
      Action = actWindowsApply
      TabOrder = 7
    end
    object btnWindowsClose: TcxButton [2]
      Left = 303
      Top = 334
      Width = 75
      Height = 25
      Action = actWindowsClose
      Cancel = True
      TabOrder = 6
    end
    object btnWindowsOk: TcxButton [3]
      Left = 222
      Top = 334
      Width = 75
      Height = 25
      Action = actWindowsOk
      Default = True
      TabOrder = 5
    end
    object btnDatabase: TcxButton [4]
      Left = 10
      Top = 334
      Width = 95
      Height = 25
      Action = actDatabase
      TabOrder = 4
    end
    inherited lclDefGroup_Root: TdxLayoutGroup
      ItemIndex = 1
    end
    object loipclMain: TdxLayoutItem
      Parent = lclDefGroup_Root
      AlignVert = avClient
      CaptionOptions.Visible = False
      Control = pclMain
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 193
      ControlOptions.OriginalWidth = 289
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object loibtnWindowsApply: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahRight
      CaptionOptions.Visible = False
      Control = btnWindowsApply
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 2
    end
    object loibtnWindowsClose: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahRight
      AlignVert = avClient
      CaptionOptions.Visible = False
      Control = btnWindowsClose
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = lclDefGroup_Root
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object loibtnWindowsOk: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahRight
      CaptionOptions.Visible = False
      Control = btnWindowsOk
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 0
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignVert = avClient
      CaptionOptions.Visible = False
      Control = btnDatabase
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 95
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 3
    end
  end
  inherited llfMain: TdxLayoutLookAndFeelList
    Left = 151
    Top = 10
    inherited lsfMain: TdxLayoutSkinLookAndFeel
      PixelsPerInch = 96
    end
  end
  inherited sclMain: TdxSkinController
    Left = 179
    Top = 10
  end
  inherited decDef: TcxDefaultEditStyleController
    Left = 207
    Top = 10
    PixelsPerInch = 96
  end
  inherited lfcDef: TcxLookAndFeelController
    Left = 235
    Top = 10
  end
  inherited aclDef: TActionList
    Left = 263
    Top = 10
    object actWindowsApply: TAction
      Category = 'Windows'
      Caption = 'Aplicar'
      Enabled = False
    end
    object actWindowsClose: TAction
      Category = 'Windows'
      Caption = 'Fechar'
    end
    object actWindowsOk: TAction
      Category = 'Windows'
      Caption = 'Ok'
      Enabled = False
    end
    object actDatabase: TAction
      Caption = 'Banco de dados'
      Enabled = False
      OnExecute = actDatabaseExecute
    end
    object actOpenWorkspace: TAction
      Caption = 'Abrir Espa'#231'o de Trabalho...'
    end
  end
  inherited iglImages: TcxImageList
    FormatVersion = 1
    DesignInfo = 655651
  end
  inherited escDef: TcxEditStyleController
    Left = 319
    Top = 10
    PixelsPerInch = 96
  end
  inherited lczMaster: TcxLocalizer
    Left = 347
    Top = 10
  end
  object dxBarApplicationMenu: TdxBarApplicationMenu
    BarManager = dxBarManager
    Buttons = <>
    ExtraPane.Items = <>
    ItemLinks = <>
    UseOwnFont = False
    Left = 375
    Top = 10
    PixelsPerInch = 96
  end
  object dxBarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default'
      'File')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 403
    Top = 10
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      21
      0)
    object dxBarManager1Bar1: TdxBar
      BorderStyle = bbsNone
      Caption = 'Default'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 497
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bibFile'
        end>
      MultiLine = True
      OneOnRow = True
      Row = 0
      ShowMark = False
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bibFile: TdxBarSubItem
      Caption = 'Arquivo'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bibOpenWorkspace'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bibClose'
        end>
    end
    object bibOpenWorkspace: TdxBarButton
      Action = actOpenWorkspace
      Category = 1
    end
    object bibClose: TdxBarButton
      Action = actWindowsClose
      Category = 1
    end
  end
end
