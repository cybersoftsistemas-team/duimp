inherited frmDuimpLoad: TfrmDuimpLoad
  Caption = 'frmDuimpLoad'
  ClientHeight = 103
  ClientWidth = 364
  Color = clWhite
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 364
  ExplicitHeight = 103
  TextHeight = 13
  inherited shpDUITop: TShape
    Width = 364
  end
  inherited shpDUILeft: TShape
    Height = 85
  end
  inherited shpDUIBottom: TShape
    Top = 94
    Width = 364
    ExplicitTop = 94
  end
  inherited shpDUIRight: TShape
    Left = 355
    Height = 85
  end
  object pbrDUI: TcxProgressBar [4]
    Left = 23
    Top = 62
    Anchors = [akLeft, akTop, akRight]
    Properties.BarStyle = cxbsAnimation
    Properties.BeginColor = 13602864
    Properties.PeakValue = 100.000000000000000000
    Properties.ShowTextStyle = cxtsPosition
    Style.TransparentBorder = False
    TabOrder = 2
    ExplicitWidth = 314
    Width = 319
  end
  object labDUI: TcxLabel [5]
    Left = 116
    Top = 18
    Caption = 'Duimp: 00BR00000000000'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TransparentBorder = False
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taCenter
    Transparent = True
    AnchorX = 180
  end
  object labInfo: TcxLabel [6]
    Left = 23
    Top = 43
    AutoSize = False
    Caption = 'Verificando a vers'#227'o da Duimp...'
    Properties.Alignment.Horz = taLeftJustify
    Transparent = True
    Height = 17
    Width = 314
  end
end
