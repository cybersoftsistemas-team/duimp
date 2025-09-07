inherited frmDialogDef: TfrmDialogDef
  Caption = 'frmDialogDef'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 13
  inherited lclDef: TdxLayoutControl
    object btnWindowOk: TcxButton [0]
      Left = 255
      Top = 247
      Width = 75
      Height = 25
      Action = actWindowOk
      Default = True
      ModalResult = 1
      TabOrder = 3
    end
    object btnWindowCancel: TcxButton [1]
      Left = 336
      Top = 247
      Width = 75
      Height = 25
      Action = actWindowCancel
      Cancel = True
      ModalResult = 2
      TabOrder = 4
    end
    inherited lclDefGroup_Root: TdxLayoutGroup
      ItemIndex = 1
    end
    object loibtnWindowOk: TdxLayoutItem
      Parent = lagBtns
      AlignHorz = ahRight
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnWindowOk
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 0
    end
    object loibtnWindowCancel: TdxLayoutItem
      Parent = lagBtns
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnWindowCancel
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lagBtns: TdxLayoutAutoCreatedGroup
      Parent = lclDefGroup_Root
      AlignVert = avBottom
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object lsi1: TdxLayoutSeparatorItem
      Parent = lclDefGroup_Root
      AlignVert = avBottom
      CaptionOptions.Text = 'Separator'
      Index = 0
    end
  end
  inherited llfMain: TdxLayoutLookAndFeelList
    inherited lsfMain: TdxLayoutSkinLookAndFeel
      PixelsPerInch = 96
    end
  end
  inherited decDef: TcxDefaultEditStyleController
    PixelsPerInch = 96
  end
  inherited aclDef: TActionList
    object actWindowOk: TAction
      Category = 'Window'
      Caption = '&Ok'
      Enabled = False
      OnExecute = actWindowOkExecute
    end
    object actWindowCancel: TAction
      Category = 'Window'
      Caption = '&Cancelar'
      OnExecute = actWindowCancelExecute
    end
  end
  inherited iglImages: TcxImageList
    FormatVersion = 1
  end
  inherited escDef: TcxEditStyleController
    PixelsPerInch = 96
  end
end
