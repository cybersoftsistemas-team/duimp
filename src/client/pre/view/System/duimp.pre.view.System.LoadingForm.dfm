inherited frmLoading: TfrmLoading
  Align = alClient
  AlphaBlend = True
  AlphaBlendValue = 150
  BorderStyle = bsNone
  Caption = 'frmLoading'
  ClientHeight = 88
  ClientWidth = 176
  Color = clFuchsia
  TransparentColor = True
  TransparentColorValue = clFuchsia
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 176
  ExplicitHeight = 88
  TextHeight = 13
  inherited lclDef: TdxLayoutControl
    Width = 176
    Height = 88
    ExplicitWidth = 176
    ExplicitHeight = 88
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
  end
  inherited iglImages: TcxImageList
    FormatVersion = 1
    DesignInfo = 1048676
  end
  inherited escDef: TcxEditStyleController
    Left = 72
    PixelsPerInch = 96
  end
  inherited lczMaster: TcxLocalizer
    Left = 128
  end
end
