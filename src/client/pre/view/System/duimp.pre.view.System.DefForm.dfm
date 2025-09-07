object frmDef: TfrmDef
  Left = 0
  Top = 0
  Caption = 'frmDef'
  ClientHeight = 282
  ClientWidth = 421
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poOwnerFormCenter
  OnCanResize = dxFluentDesignFormCanResize
  OnCreate = dxFluentDesignFormCreate
  EnableAcrylicEffects = False
  TextHeight = 13
  object lclDef: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 421
    Height = 282
    Align = alClient
    ParentBackground = True
    TabOrder = 0
    Transparent = True
    LayoutLookAndFeel = lsfMain
    object lclDefGroup_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      Hidden = True
      ShowBorder = False
      Index = -1
    end
  end
  object llfMain: TdxLayoutLookAndFeelList
    Left = 293
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
    Left = 321
    Top = 44
  end
  object decDef: TcxDefaultEditStyleController
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    StyleReadOnly.LookAndFeel.NativeStyle = False
    Left = 293
    Top = 16
    PixelsPerInch = 96
  end
  object lfcDef: TcxLookAndFeelController
    NativeStyle = False
    ScrollbarMode = sbmHybrid
    SkinName = 'Office2019Colorful'
    Left = 265
    Top = 44
  end
  object aclDef: TActionList
    Images = iglImages
    Left = 265
    Top = 16
  end
  object iglImages: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 1048925
  end
  object escDef: TcxEditStyleController
    Left = 321
    Top = 16
    PixelsPerInch = 96
  end
  object lczMaster: TcxLocalizer
    Left = 377
    Top = 16
  end
end
