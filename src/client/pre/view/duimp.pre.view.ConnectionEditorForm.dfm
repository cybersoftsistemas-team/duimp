inherited ConnectionEditor: TConnectionEditor
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cybersoft Editor de Conex'#227'o'
  ClientHeight = 548
  ClientWidth = 475
  OnActivate = dxFluentDesignFormActivate
  OnDestroy = dxFluentDesignFormDestroy
  ExplicitWidth = 491
  ExplicitHeight = 587
  TextHeight = 13
  inherited lclDef: TdxLayoutControl
    Width = 475
    Height = 548
    ExplicitWidth = 475
    ExplicitHeight = 548
    inherited btnWindowOk: TcxButton
      Left = 309
      Top = 513
      TabOrder = 0
      ExplicitLeft = 309
      ExplicitTop = 513
    end
    inherited btnWindowCancel: TcxButton
      Left = 390
      Top = 513
      TabOrder = 1
      ExplicitLeft = 390
      ExplicitTop = 513
    end
    object pclCec: TcxPageControl [2]
      Left = 10
      Top = 60
      Width = 455
      Height = 435
      Color = 15790320
      ParentBackground = False
      ParentColor = False
      TabOrder = 5
      Properties.ActivePage = tshDef
      Properties.CustomButtons.Buttons = <>
      LookAndFeel.NativeStyle = False
      ClientRectBottom = 433
      ClientRectLeft = 2
      ClientRectRight = 453
      ClientRectTop = 23
      object tshDef: TcxTabSheet
        Caption = 'Defini'#231#227'o'
        ImageIndex = 0
        object lclDBDef: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 451
          Height = 410
          Align = alClient
          ParentBackground = True
          TabOrder = 0
          Transparent = True
          LayoutLookAndFeel = lsfMain
          object grdParams: TcxGrid
            Left = 10
            Top = 68
            Width = 431
            Height = 332
            TabOrder = 3
            OnExit = grdParamsExit
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = 'Office2019Colorful'
            object grdParamsDBTableView: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              ScrollbarAnnotations.CustomAnnotations = <>
              OnCustomDrawCell = grdParamsDBTableViewCustomDrawCell
              OnFocusedRecordChanged = grdParamsDBTableViewFocusedRecordChanged
              DataController.DataSource = dsoPRM
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnGrouping = False
              OptionsCustomize.ColumnMoving = False
              OptionsCustomize.ColumnSorting = False
              OptionsData.Deleting = False
              OptionsData.Inserting = False
              OptionsView.CellEndEllipsis = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              OptionsView.Indicator = True
              Styles.UseOddEvenStyles = bFalse
              object grdParamsDBTableViewParam: TcxGridDBColumn
                DataBinding.FieldName = 'Param'
                Options.Editing = False
              end
              object grdParamsDBTableViewValue: TcxGridDBColumn
                DataBinding.FieldName = 'Value'
                OnGetProperties = grdParamsDBTableViewValueGetProperties
                OnGetPropertiesForEdit = grdParamsDBTableViewValueGetPropertiesForEdit
              end
              object grdParamsDBTableViewDefault: TcxGridDBColumn
                DataBinding.FieldName = 'Default'
                Options.Editing = False
                Styles.Content = stlFont
              end
            end
            object grdParamsLevel: TcxGridLevel
              GridView = grdParamsDBTableView
            end
          end
          object btnTestConnection: TcxButton
            Left = 10
            Top = 37
            Width = 111
            Height = 25
            Action = actTestConnection
            TabOrder = 1
          end
          object btnDefaults: TcxButton
            Left = 127
            Top = 37
            Width = 194
            Height = 25
            Action = actDefaults
            TabOrder = 2
          end
          object cbxServerID: TcxComboBox
            Left = 127
            Top = 10
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = cbxServerIDPropertiesChange
            TabOrder = 0
            Width = 314
          end
          object lclDBDefGroup_Root: TdxLayoutGroup
            AlignHorz = ahParentManaged
            AlignVert = avParentManaged
            Hidden = True
            ItemIndex = 1
            ShowBorder = False
            Index = -1
          end
          object dxLayoutItem3: TdxLayoutItem
            Parent = lclDBDefGroup_Root
            AlignVert = avClient
            CaptionOptions.Visible = False
            Control = grdParams
            ControlOptions.OriginalHeight = 200
            ControlOptions.OriginalWidth = 250
            ControlOptions.ShowBorder = False
            Index = 2
          end
          object dxLayoutItem4: TdxLayoutItem
            Parent = dxLayoutAutoCreatedGroup2
            AlignHorz = ahLeft
            CaptionOptions.Text = 'cxButton1'
            CaptionOptions.Visible = False
            Control = btnTestConnection
            ControlOptions.OriginalHeight = 25
            ControlOptions.OriginalWidth = 111
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object dxLayoutItem7: TdxLayoutItem
            Parent = dxLayoutAutoCreatedGroup2
            AlignVert = avBottom
            CaptionOptions.Text = 'cxButton1'
            CaptionOptions.Visible = False
            Control = btnDefaults
            ControlOptions.OriginalHeight = 25
            ControlOptions.OriginalWidth = 194
            ControlOptions.ShowBorder = False
            Index = 1
          end
          object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
            Parent = lclDBDefGroup_Root
            LayoutDirection = ldHorizontal
            Index = 1
          end
          object dxLayoutItem5: TdxLayoutItem
            Parent = lclDBDefGroup_Root
            CaptionOptions.Text = '&Driver ID:'
            CaptionOptions.Width = 113
            Control = cbxServerID
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 0
          end
        end
      end
    end
    inherited lclDefGroup_Root: TdxLayoutGroup
      ItemIndex = 3
    end
    object loiDatabase: TdxLayoutItem
      Parent = lclDefGroup_Root
      CaptionOptions.Glyph.SourceDPI = 96
      CaptionOptions.Glyph.Data = {
        89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
        F40000001974455874536F6674776172650041646F626520496D616765526561
        647971C9653C00000028744558745469746C650044423B536F757263653B5374
        6F723B64617461736F757263653B446174616261736503D2792A000000DE4944
        4154785EEDD7210AC33014C6F18AF9415D6F3051B1338CCEB6D7982C533315BB
        42DDCE5233315B4ADC2ED1991626067DFB8B272606235D2014227E26E4C107ED
        97904844BCFABA18023C6EC74F6BEC50E2820677F478A95ED71ADD5362A7B391
        B20E90A2420B99A94585D43640010371C4A0B00960208E199B0003C4B1C126C0
        13E2D8D37B00EF9FC0FB4FB8A81A9E903B3C88729C6C6BD8E18CEC8FA338C319
        DD3F351C71458D03F6D820C64AC5BAB6D73DB5CE8C8BADE104716C5A540D430D
        430DC36D186A08E7359CF53049B04536A38699CE26BF1E265E85006F5B71F53C
        EFE11DC80000000049454E44AE426082}
      CaptionOptions.Text = 'Configure os par'#226'metros de conex'#227'o do banco de dados.'
      Index = 2
    end
    object lsi2: TdxLayoutSeparatorItem
      Parent = lclDefGroup_Root
      CaptionOptions.Text = 'Separator'
      Index = 3
    end
  end
  inherited llfMain: TdxLayoutLookAndFeelList
    Left = 319
    Top = 16
    inherited lsfMain: TdxLayoutSkinLookAndFeel
      PixelsPerInch = 96
    end
  end
  inherited sclMain: TdxSkinController
    Left = 347
    Top = 16
  end
  inherited decDef: TcxDefaultEditStyleController
    Left = 375
    PixelsPerInch = 96
  end
  inherited lfcDef: TcxLookAndFeelController
    Left = 403
    Top = 16
  end
  inherited aclDef: TActionList
    Left = 431
    inherited actWindowOk: TAction
      Enabled = True
    end
    object actTestConnection: TAction
      Category = 'Connection'
      Caption = '&Testar Conex'#227'o'
      ImageIndex = 0
      OnExecute = actTestConnectionExecute
    end
    object actDefaults: TAction
      Category = 'Connection'
      Caption = 'Reverter para os valores padr'#245'es'
      ImageIndex = 1
      OnExecute = actDefaultsExecute
    end
  end
  inherited iglImages: TcxImageList
    FormatVersion = 1
    DesignInfo = 2883903
    ImageInfo = <
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000023744558745469746C6500436F6E766572743B52657065
          61743B4172726F773B45786368616E6765762368D2000000C049444154785EA5
          D3B10983501087F1141619C0259C20A033BC29EC1C20609914AE90116C1C208E
          E00E366EF04AC1E2F205727024175E24C5AFF3FF71A01E4424E9DCDF04011FCF
          EC08F811FB90CA51A3C78C0DE244DC4085019210BC408111E24B5F703183051D
          4A1CED385CEF27B45E603281C6790B3A8E98BCC00A4144A663C528438460FD76
          41C4F3C400790B3410C0BFA0B5E397234A74584CE0E27E483A4E1851E866EF78
          40A59B5F2ED830A3478D3CF92FD88886AD6440237B027F7900F82BA5E5BA0A0F
          4B0000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000027744558745469746C6500526566726573683B52657065
          61743B426172733B526962626F6E3B52656C6F6164CD4DF6E9000000B1494441
          54785EC593B10D02310C454162001688D8E0FA1BC2A2A3A14F895241CF128C40
          7B5DE86E1F96301FE947F249761A4EA2784DBEF3EC28C946557F623D81DC5F8D
          040AA8E04D2AD7126B42C1165C80064C608C047B2094DC40060792C16C24C913
          9C5920A683CD0723290B0137A941107A92CCBCB66CB1399230F3E8875FC1F5F9
          D8F59AD8F12A83EC8C1F1ED30A0A83190C8EC04AC4BB8504A62671AEF16424E1
          431A9B24E048C97A4FF9FFBFF103FFEC875AFFDCA9F30000000049454E44AE42
          6082}
        FileName = 'Office 2013\Actions\Refresh_16x16.png'
        Keywords = 'Actions;Refresh'
      end>
  end
  inherited escDef: TcxEditStyleController
    Left = 347
    Top = 44
    PixelsPerInch = 96
  end
  inherited lczMaster: TcxLocalizer
    Left = 375
    Top = 44
  end
  object sryCec: TcxStyleRepository
    Left = 403
    Top = 44
    PixelsPerInch = 96
    object stlContent: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object stlFont: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      TextColor = clBtnShadow
    end
  end
  object mtbPRM: TFDMemTable
    AfterPost = mtbPRMAfterPost
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 431
    Top = 44
    object mtbPRMParam: TStringField
      DisplayLabel = 'Par'#226'metro'
      FieldName = 'Param'
      Size = 255
    end
    object mtbPRMValue: TStringField
      DisplayLabel = 'Valor'
      FieldName = 'Value'
      Size = 255
    end
    object mtbPRMDefault: TStringField
      DisplayLabel = 'Padr'#227'o'
      FieldName = 'Default'
      Size = 255
    end
  end
  object dsoPRM: TDataSource
    DataSet = mtbPRM
    Left = 319
    Top = 72
  end
  object edrCec: TcxEditRepository
    Left = 347
    Top = 72
    PixelsPerInch = 96
    object ertPassword: TcxEditRepositoryTextItem
      Properties.EchoMode = eemPassword
    end
    object ertEdit: TcxEditRepositoryTextItem
    end
    object ertParams: TcxEditRepositoryComboBoxItem
    end
  end
  object dlgOpenDialog: TOpenDialog
    Left = 375
    Top = 72
  end
end
