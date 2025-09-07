inherited frmMain: TfrmMain
  Caption = 'Duimp'
  ClientHeight = 776
  ClientWidth = 1187
  CustomTitleBar.Height = 31
  Constraints.MinHeight = 815
  Constraints.MinWidth = 1203
  GlassFrame.Top = 31
  Position = poDesktopCenter
  StyleElements = []
  ExplicitWidth = 1203
  ExplicitHeight = 815
  TextHeight = 13
  inherited lclDef: TdxLayoutControl
    Left = 46
    Width = 1141
    Height = 776
    TabOrder = 1
    ExplicitLeft = 46
    ExplicitWidth = 1141
    ExplicitHeight = 776
  end
  object nvbMain: TdxNavBar [1]
    Left = 0
    Top = 0
    Width = 46
    Height = 776
    Align = alLeft
    Visible = False
    ActiveGroupIndex = -1
    TabOrder = 0
    View = 21
    OptionsBehavior.Common.AllowExpandAnimation = True
    OptionsBehavior.HamburgerMenu.Collapsed = True
    OptionsView.HamburgerMenu.NavigationPaneMode = npmNone
    OriginalWidth = 210
  end
  inherited llfMain: TdxLayoutLookAndFeelList
    Left = 993
    inherited lsfMain: TdxLayoutSkinLookAndFeel
      PixelsPerInch = 96
    end
  end
  inherited sclMain: TdxSkinController
    Left = 1021
  end
  inherited decDef: TcxDefaultEditStyleController
    Left = 993
    PixelsPerInch = 96
  end
  inherited lfcDef: TcxLookAndFeelController
    Left = 965
  end
  inherited aclDef: TActionList
    Left = 965
  end
  inherited iglImages: TcxImageList
    FormatVersion = 1
    DesignInfo = 1049625
  end
  inherited escDef: TcxEditStyleController
    Left = 1021
    PixelsPerInch = 96
  end
  inherited lczMaster: TcxLocalizer
    Left = 1077
  end
end
