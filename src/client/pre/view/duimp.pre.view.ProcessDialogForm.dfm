inherited frmProcessDialog: TfrmProcessDialog
  BorderStyle = bsDialog
  Caption = 'Processo'
  ClientHeight = 187
  ClientWidth = 370
  StyleElements = [seFont, seClient, seBorder]
  OnShow = dxFluentDesignFormShow
  ExplicitWidth = 386
  ExplicitHeight = 226
  TextHeight = 13
  inherited lclDef: TdxLayoutControl
    Width = 370
    Height = 187
    ExplicitWidth = 370
    ExplicitHeight = 187
    inherited btnWindowOk: TcxButton
      Left = 204
      Top = 152
      ExplicitLeft = 204
      ExplicitTop = 152
    end
    inherited btnWindowCancel: TcxButton
      Left = 285
      Top = 152
      TabOrder = 2
      ExplicitLeft = 285
      ExplicitTop = 152
    end
    object edtProcesso_Mestre: TcxDBTextEdit [2]
      Left = 188
      Top = 28
      DataBinding.DataField = 'Processo_Mestre'
      DataBinding.DataSource = damDuimp.dsoProc
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Office2019Colorful'
      Style.TransparentBorder = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleReadOnly.LookAndFeel.NativeStyle = False
      StyleReadOnly.LookAndFeel.SkinName = 'Office2019Colorful'
      TabOrder = 4
      Width = 172
    end
    object cbxIncentivo_Fiscal: TcxDBLookupComboBox [3]
      Left = 10
      Top = 71
      DataBinding.DataField = 'Incentivo_Fiscal'
      DataBinding.DataSource = damDuimp.dsoProc
      Properties.ClearKey = 16430
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'Nome'
      Properties.ListColumns = <
        item
          SortOrder = soAscending
          FieldName = 'Nome'
        end>
      Properties.ListOptions.ColumnSorting = False
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = damDuimp.dsoIFI
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Office2019Colorful'
      Style.TransparentBorder = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleReadOnly.LookAndFeel.NativeStyle = False
      StyleReadOnly.LookAndFeel.SkinName = 'Office2019Colorful'
      TabOrder = 5
      Width = 350
    end
    object cbxUFImportacao: TcxDBLookupComboBox [4]
      Left = 10
      Top = 114
      DataBinding.DataField = 'UF_Importacao'
      DataBinding.DataSource = damDuimp.dsoProc
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'UF'
      Properties.ListColumns = <
        item
          FieldName = 'UF'
        end
        item
          FieldName = 'Estado'
        end>
      Properties.ListOptions.ColumnSorting = False
      Properties.ListSource = damDuimp.dsoUFI
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Office2019Colorful'
      Style.TransparentBorder = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleReadOnly.LookAndFeel.NativeStyle = False
      StyleReadOnly.LookAndFeel.SkinName = 'Office2019Colorful'
      TabOrder = 6
      Width = 45
    end
    object edtUFImportacaoNome: TcxDBTextEdit [5]
      Left = 61
      Top = 114
      DataBinding.DataField = 'UFImportacaoNome'
      DataBinding.DataSource = damDuimp.dsoDCR
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Office2019Colorful'
      Style.TransparentBorder = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleReadOnly.LookAndFeel.NativeStyle = False
      StyleReadOnly.LookAndFeel.SkinName = 'Office2019Colorful'
      TabOrder = 7
      Width = 121
    end
    object cbxUFDesembaraco: TcxDBLookupComboBox [6]
      Left = 188
      Top = 114
      DataBinding.DataField = 'UF_Desembaraco'
      DataBinding.DataSource = damDuimp.dsoProc
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'UF'
      Properties.ListColumns = <
        item
          FieldName = 'UF'
        end
        item
          FieldName = 'Estado'
        end>
      Properties.ListOptions.ColumnSorting = False
      Properties.ListSource = damDuimp.dsoUFD
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Office2019Colorful'
      Style.TransparentBorder = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleReadOnly.LookAndFeel.NativeStyle = False
      StyleReadOnly.LookAndFeel.SkinName = 'Office2019Colorful'
      TabOrder = 8
      Width = 45
    end
    object edtUFDesembaracoNome: TcxDBTextEdit [7]
      Left = 239
      Top = 114
      AutoSize = False
      DataBinding.DataField = 'UFDesembaracoNome'
      DataBinding.DataSource = damDuimp.dsoDCR
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Office2019Colorful'
      Style.TransparentBorder = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleReadOnly.LookAndFeel.NativeStyle = False
      StyleReadOnly.LookAndFeel.SkinName = 'Office2019Colorful'
      TabOrder = 9
      Height = 19
      Width = 121
    end
    object edtProcesso: TcxDBTextEdit [8]
      Left = 10
      Top = 28
      DataBinding.DataField = 'Processo'
      DataBinding.DataSource = damDuimp.dsoProc
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Office2019Colorful'
      Style.TransparentBorder = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Office2019Colorful'
      StyleReadOnly.LookAndFeel.NativeStyle = False
      StyleReadOnly.LookAndFeel.SkinName = 'Office2019Colorful'
      TabOrder = 3
      Width = 172
    end
    inherited lclDefGroup_Root: TdxLayoutGroup
      ItemIndex = 2
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = 'Vinculado ao processo:'
      CaptionOptions.Layout = clTop
      Control = edtProcesso_Mestre
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = lclDefGroup_Root
      CaptionOptions.Text = 'Incentivo Fiscal:'
      CaptionOptions.Layout = clTop
      Control = cbxIncentivo_Fiscal
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 145
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      CaptionOptions.AlignHorz = taRightJustify
      CaptionOptions.Text = 'UF de'
      CaptionOptions.Layout = clTop
      Control = cbxUFImportacao
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 45
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      CaptionOptions.Text = 'Importa'#231#227'o:'
      CaptionOptions.Layout = clTop
      Control = edtUFImportacaoNome
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
      Parent = lclDefGroup_Root
      LayoutDirection = ldHorizontal
      Index = 4
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignHorz = ahClient
      CaptionOptions.AlignHorz = taRightJustify
      CaptionOptions.Text = 'UF de'
      CaptionOptions.Layout = clTop
      Control = cbxUFDesembaraco
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 145
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      CaptionOptions.Text = 'Desembara'#231'o:'
      CaptionOptions.Layout = clTop
      Control = edtUFDesembaracoNome
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = 'N'#186' do Processo:'
      CaptionOptions.Layout = clTop
      Control = edtProcesso
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = lclDefGroup_Root
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      Index = 2
    end
  end
  inherited llfMain: TdxLayoutLookAndFeelList
    Left = 16
    Top = 115
    inherited lsfMain: TdxLayoutSkinLookAndFeel
      PixelsPerInch = 96
    end
  end
  inherited sclMain: TdxSkinController
    Left = 44
    Top = 115
  end
  inherited decDef: TcxDefaultEditStyleController
    Left = 72
    Top = 115
    PixelsPerInch = 96
  end
  inherited lfcDef: TcxLookAndFeelController
    Left = 100
    Top = 115
  end
  inherited aclDef: TActionList
    Left = 128
    Top = 115
  end
  inherited iglImages: TcxImageList
    FormatVersion = 1
    DesignInfo = 9371664
  end
  inherited escDef: TcxEditStyleController
    Left = 44
    Top = 143
    PixelsPerInch = 96
  end
  inherited lczMaster: TcxLocalizer
    Left = 72
    Top = 143
  end
end
