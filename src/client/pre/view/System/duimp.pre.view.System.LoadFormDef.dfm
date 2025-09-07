object frmLoadDef: TfrmLoadDef
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmLoadDef'
  ClientHeight = 86
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object shpDUITop: TShape
    Left = 0
    Top = 0
    Width = 359
    Height = 9
    Align = alTop
    Brush.Color = clSilver
    Pen.Color = clSilver
    Pen.Width = 0
  end
  object shpDUILeft: TShape
    Left = 0
    Top = 9
    Width = 9
    Height = 68
    Align = alLeft
    Brush.Color = clSilver
    Pen.Color = clSilver
    Pen.Width = 0
    ExplicitTop = 1
    ExplicitHeight = 85
  end
  object shpDUIBottom: TShape
    Left = 0
    Top = 77
    Width = 359
    Height = 9
    Align = alBottom
    Brush.Color = clSilver
    Pen.Color = clSilver
    Pen.Width = 0
  end
  object shpDUIRight: TShape
    Left = 350
    Top = 9
    Width = 9
    Height = 68
    Align = alRight
    Brush.Color = clSilver
    Pen.Color = clSilver
    Pen.Width = 0
    ExplicitTop = 1
    ExplicitHeight = 85
  end
  object tpgDUI: TdxTaskbarProgress
    Position = 0
    Left = 20
    Top = 12
  end
end
