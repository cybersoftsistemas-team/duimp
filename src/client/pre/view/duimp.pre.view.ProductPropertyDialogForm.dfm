inherited frmProductPropertyDialog: TfrmProductPropertyDialog
  ActiveControl = btnWindowCancel
  Caption = 'Produto'
  ClientHeight = 498
  ClientWidth = 842
  Constraints.MinHeight = 521
  Constraints.MinWidth = 848
  StyleElements = [seFont, seClient, seBorder]
  OnClose = dxFluentDesignFormClose
  OnShow = dxFluentDesignFormShow
  ExplicitWidth = 858
  ExplicitHeight = 537
  TextHeight = 13
  inherited lclDef: TdxLayoutControl
    Width = 842
    Height = 498
    ExplicitWidth = 842
    ExplicitHeight = 498
    inherited btnWindowOk: TcxButton
      Left = 676
      Top = 463
      TabOrder = 8
      ExplicitLeft = 676
      ExplicitTop = 463
    end
    inherited btnWindowCancel: TcxButton
      Left = 757
      Top = 463
      TabOrder = 9
      ExplicitLeft = 757
      ExplicitTop = 463
    end
    object edtCodigo_DUIMP: TcxDBTextEdit [2]
      Left = 10
      Top = 28
      AutoSize = False
      DataBinding.DataField = 'ProdutoCodigo'
      DataBinding.DataSource = damDuimp.dsoPRO
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.StyleController = escDef
      Style.TransparentBorder = False
      TabOrder = 3
      Height = 21
      Width = 121
    end
    object edtNCM: TcxDBTextEdit [3]
      Left = 137
      Top = 28
      AutoSize = False
      DataBinding.DataField = 'NCM'
      DataBinding.DataSource = damDuimp.dsoPRO
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.StyleController = escDef
      Style.TransparentBorder = False
      TabOrder = 4
      Height = 21
      Width = 121
    end
    object edtDescricao_Reduzida: TcxDBTextEdit [4]
      Left = 264
      Top = 28
      AutoSize = False
      DataBinding.DataField = 'Descricao_Reduzida'
      DataBinding.DataSource = damDuimp.dsoPRO
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.StyleController = escDef
      Style.TransparentBorder = False
      TabOrder = 5
      Height = 21
      Width = 568
    end
    object redDescricao: TcxDBRichEdit [5]
      Left = 10
      Top = 73
      DataBinding.DataField = 'Descricao'
      DataBinding.DataSource = damDuimp.dsoPRO
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
      Height = 89
      Width = 822
    end
    object pclProps: TcxPageControl [6]
      Left = 10
      Top = 168
      Width = 822
      Height = 277
      Color = 15790320
      ParentBackground = False
      ParentColor = False
      TabOrder = 7
      Properties.ActivePage = tshAttributes
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 275
      ClientRectLeft = 2
      ClientRectRight = 820
      ClientRectTop = 23
      object tshAttributes: TcxTabSheet
        Caption = 'Atributos'
        ImageIndex = 0
        object lclAttrs: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 818
          Height = 252
          Align = alClient
          ParentBackground = True
          TabOrder = 0
          Transparent = True
          LayoutLookAndFeel = lsfMain
          object grdAtts: TcxGrid
            Left = 10
            Top = 10
            Width = 798
            Height = 232
            TabOrder = 3
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = 'Office2019Colorful'
            object grdAttsDBTableView: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.DataSource = damDuimp.dsoATS
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = ',0'
                  Kind = skCount
                  Column = grdAttsDBTableViewatributo
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.CellHints = True
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnGrouping = False
              OptionsCustomize.ColumnMoving = False
              OptionsCustomize.ColumnSorting = False
              OptionsData.Deleting = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.CellEndEllipsis = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              OptionsView.Indicator = True
              Preview.Column = grdAttsDBTableVieworientacaoPreenchimento
              Preview.Visible = True
              object grdAttsDBTableViewProdutoCodigoInterno: TcxGridDBColumn
                DataBinding.FieldName = 'ProdutoCodigoInterno'
                Visible = False
              end
              object grdAttsDBTableViewncm: TcxGridDBColumn
                DataBinding.FieldName = 'ncm'
                Visible = False
              end
              object grdAttsDBTableViewatributo: TcxGridDBColumn
                DataBinding.FieldName = 'atributo'
                FooterAlignmentHorz = taRightJustify
              end
              object grdAttsDBTableViewnomeApresentacao: TcxGridDBColumn
                DataBinding.FieldName = 'nomeApresentacao'
              end
              object grdAttsDBTableViewnome: TcxGridDBColumn
                DataBinding.FieldName = 'nome'
              end
              object grdAttsDBTableVieworientacaoPreenchimento: TcxGridDBColumn
                DataBinding.FieldName = 'orientacaoPreenchimento'
              end
              object grdAttsDBTableViewformaPreenchimento: TcxGridDBColumn
                DataBinding.FieldName = 'formaPreenchimento'
                Visible = False
              end
              object grdAttsDBTableViewmodalidade: TcxGridDBColumn
                DataBinding.FieldName = 'modalidade'
                Visible = False
              end
              object grdAttsDBTableViewmultivalorado: TcxGridDBColumn
                DataBinding.FieldName = 'multivalorado'
                Visible = False
              end
              object grdAttsDBTableViewvalor: TcxGridDBColumn
                DataBinding.FieldName = 'valor'
                OnGetProperties = grdAttsDBTableViewvalorGetProperties
              end
            end
            object grdAttsLevel: TcxGridLevel
              GridView = grdAttsDBTableView
            end
          end
          object lclAttrsGroup_Root: TdxLayoutGroup
            AlignHorz = ahParentManaged
            AlignVert = avParentManaged
            Hidden = True
            ShowBorder = False
            Index = -1
          end
          object loigrdAtts: TdxLayoutItem
            Parent = lclAttrsGroup_Root
            AlignVert = avClient
            Control = grdAtts
            ControlOptions.OriginalHeight = 168
            ControlOptions.OriginalWidth = 818
            ControlOptions.ShowBorder = False
            Index = 0
          end
        end
      end
      object tshFRN: TcxTabSheet
        Caption = 'Fornecedor'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 246
        object lclFRN: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 818
          Height = 252
          Align = alClient
          ParentBackground = True
          TabOrder = 0
          Transparent = True
          LayoutLookAndFeel = lsfMain
          ExplicitLeft = 520
          ExplicitTop = 112
          ExplicitWidth = 300
          ExplicitHeight = 250
          object edtFRNCodigo_DUIMP: TcxDBButtonEdit
            Left = 52
            Top = 10
            DataBinding.DataField = 'Codigo_DUIMP'
            DataBinding.DataSource = damDuimp.dsoFRN
            Properties.Buttons = <
              item
                Default = True
                Glyph.SourceDPI = 96
                Glyph.Data = {
                  89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
                  610000001974455874536F6674776172650041646F626520496D616765526561
                  647971C9653C00000021744558745469746C6500446F63756D656E746174696F
                  6E3B48656C703B5175657374696F6EE093CC98000000E549444154785EA5D3BF
                  8AC24010C771C1C23F788501FB341616BEC03576DB59FA42D6D9771082A5BD6F
                  904611C483E3B8E6EEE0EA401A53ADDF851164D82C81149F2299DF0E1932DB5B
                  6F8F9A8145815214B0303AFFFA90224305D7A0924CAA1BA4C8E15ACA91BE36C8
                  54E08A778C31C40A3795C99E0D4CE0B3F7E86381C439E773F3C038C6172C9C72
                  C19704CFBE8134A955CEFA97055CC44E0E2F03B5C217CAC8E1030698E11AA897
                  B106152648F0D990296323FCCADC1B5DD323D848E0848F48DD067FA3F8C6086F
                  F86B18D1041749FC608A04FF817AD66695EFA823ABDCFD3275BECE0F168B3D4A
                  3EEAC27D0000000049454E44AE426082}
                Kind = bkGlyph
                Visible = False
              end>
            Properties.ReadOnly = True
            Style.HotTrack = False
            Style.TransparentBorder = False
            TabOrder = 0
            Width = 70
          end
          object edtFRNVersao: TcxDBTextEdit
            Left = 52
            Top = 35
            DataBinding.DataField = 'Versao'
            DataBinding.DataSource = damDuimp.dsoFRN
            Properties.ReadOnly = True
            Style.HotTrack = False
            Style.TransparentBorder = False
            TabOrder = 1
            Width = 70
          end
          object edtFRNNIOperador: TcxDBTextEdit
            Left = 254
            Top = 35
            DataBinding.DataField = 'NIOperador'
            DataBinding.DataSource = damDuimp.dsoFRN
            Properties.ReadOnly = True
            Style.HotTrack = False
            Style.TransparentBorder = False
            TabOrder = 2
            Width = 70
          end
          object edtFRNNome: TcxDBTextEdit
            Left = 52
            Top = 60
            DataBinding.DataField = 'Nome'
            DataBinding.DataSource = damDuimp.dsoFRN
            Properties.ReadOnly = True
            Style.HotTrack = False
            Style.TransparentBorder = False
            TabOrder = 3
            Width = 756
          end
          object edtFRNEmail: TcxDBTextEdit
            Left = 52
            Top = 85
            DataBinding.DataField = 'Email'
            DataBinding.DataSource = damDuimp.dsoFRN
            Properties.ReadOnly = True
            Style.HotTrack = False
            Style.TransparentBorder = False
            TabOrder = 4
            Width = 756
          end
          object edtFRNRua: TcxDBTextEdit
            Left = 62
            Top = 153
            DataBinding.DataField = 'Rua'
            DataBinding.DataSource = damDuimp.dsoFRN
            Properties.ReadOnly = True
            Style.HotTrack = False
            Style.TransparentBorder = False
            TabOrder = 5
            Width = 619
          end
          object edtFRNBairro: TcxDBTextEdit
            Left = 62
            Top = 178
            DataBinding.DataField = 'Bairro'
            DataBinding.DataSource = damDuimp.dsoFRN
            Properties.ReadOnly = True
            Style.HotTrack = False
            Style.TransparentBorder = False
            TabOrder = 7
            Width = 121
          end
          object edtFRNMunicipio: TcxDBTextEdit
            Left = 231
            Top = 178
            AutoSize = False
            DataBinding.DataField = 'Municipio'
            DataBinding.DataSource = damDuimp.dsoFRN
            Properties.ReadOnly = True
            Style.HotTrack = False
            Style.TransparentBorder = False
            TabOrder = 9
            Height = 19
            Width = 200
          end
          object edtFRNCEP: TcxDBTextEdit
            Left = 465
            Top = 178
            AutoSize = False
            DataBinding.DataField = 'CEP'
            DataBinding.DataSource = damDuimp.dsoFRN
            Properties.ReadOnly = True
            Style.HotTrack = False
            Style.TransparentBorder = False
            TabOrder = 10
            Height = 19
            Width = 70
          end
          object edtFRNRua_Numero: TcxDBTextEdit
            Left = 733
            Top = 153
            DataBinding.DataField = 'Rua_Numero'
            DataBinding.DataSource = damDuimp.dsoFRN
            Properties.ReadOnly = True
            Style.HotTrack = False
            Style.TransparentBorder = False
            TabOrder = 6
            Width = 60
          end
          object edtFRNPaisCodigo: TcxDBTextEdit
            Left = 62
            Top = 203
            DataBinding.DataField = 'PaisCodigo'
            DataBinding.DataSource = damDuimp.dsoFRN
            Properties.ReadOnly = True
            Style.HotTrack = False
            Style.TransparentBorder = False
            TabOrder = 8
            Width = 121
          end
          object lclFRNGroup_Root: TdxLayoutGroup
            AlignHorz = ahParentManaged
            AlignVert = avParentManaged
            Hidden = True
            ItemIndex = 4
            ShowBorder = False
            Index = -1
          end
          object loiedtFRNCodigo_DUIMP: TdxLayoutItem
            Parent = lclFRNGroup_Root
            AlignHorz = ahLeft
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Text = 'C'#243'digo:'
            Control = edtFRNCodigo_DUIMP
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 70
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object loiedtFRNVersao: TdxLayoutItem
            Parent = dxLayoutAutoCreatedGroup2
            AlignHorz = ahLeft
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Text = 'Vers'#227'o:'
            Control = edtFRNVersao
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 70
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object loiedtFRNNIOperador: TdxLayoutItem
            Parent = dxLayoutAutoCreatedGroup2
            AlignHorz = ahLeft
            CaptionOptions.Text = 'N'#250'mero de Identifica'#231#227'o:'
            Control = edtFRNNIOperador
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 70
            ControlOptions.ShowBorder = False
            Index = 1
          end
          object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
            Parent = lclFRNGroup_Root
            LayoutDirection = ldHorizontal
            Index = 1
          end
          object loiedtFRNNome: TdxLayoutItem
            Parent = lclFRNGroup_Root
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Text = 'Nome:'
            Control = edtFRNNome
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 2
          end
          object loiedtFRNEmail: TdxLayoutItem
            Parent = lclFRNGroup_Root
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Text = 'Email:'
            Control = edtFRNEmail
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 3
          end
          object ltgAddress: TdxLayoutGroup
            Parent = lclFRNGroup_Root
            AlignVert = avClient
            CaptionOptions.Text = 'Endere'#231'o:'
            ItemIndex = 1
            Index = 4
          end
          object loiedtFRNRua: TdxLayoutItem
            Parent = dxLayoutAutoCreatedGroup4
            AlignHorz = ahClient
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Text = 'Rua:'
            Control = edtFRNRua
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object loiedtFRNBairro: TdxLayoutItem
            Parent = dxLayoutAutoCreatedGroup5
            AlignHorz = ahLeft
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Text = 'Bairro:'
            Control = edtFRNBairro
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object loiedtFRNMunicipio: TdxLayoutItem
            Parent = dxLayoutAutoCreatedGroup3
            AlignHorz = ahLeft
            CaptionOptions.Text = 'Cidade:'
            Control = edtFRNMunicipio
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 200
            ControlOptions.ShowBorder = False
            Index = 1
          end
          object dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup
            Parent = ltgAddress
            LayoutDirection = ldHorizontal
            Index = 1
          end
          object loiedtFRNCEP: TdxLayoutItem
            Parent = dxLayoutAutoCreatedGroup3
            AlignHorz = ahLeft
            CaptionOptions.Text = 'CEP:'
            Control = edtFRNCEP
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 70
            ControlOptions.ShowBorder = False
            Index = 2
          end
          object loiedtFRNRua_Numero: TdxLayoutItem
            Parent = dxLayoutAutoCreatedGroup4
            AlignHorz = ahRight
            CaptionOptions.Text = 'N'#250'mero:'
            Control = edtFRNRua_Numero
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 60
            ControlOptions.ShowBorder = False
            Index = 1
          end
          object dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup
            Parent = ltgAddress
            LayoutDirection = ldHorizontal
            Index = 0
          end
          object dxLayoutItem4: TdxLayoutItem
            Parent = dxLayoutAutoCreatedGroup5
            AlignHorz = ahRight
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Text = 'Pa'#237's:'
            Control = edtFRNPaisCodigo
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 1
          end
          object dxLayoutAutoCreatedGroup5: TdxLayoutAutoCreatedGroup
            Parent = dxLayoutAutoCreatedGroup3
            AlignHorz = ahLeft
            Index = 0
          end
        end
      end
    end
    inherited lclDefGroup_Root: TdxLayoutGroup
      ItemIndex = 4
    end
    inherited loibtnWindowOk: TdxLayoutItem
      Visible = False
    end
    inherited loibtnWindowCancel: TdxLayoutItem
      Visible = False
    end
    inherited lagBtns: TdxLayoutAutoCreatedGroup
      Index = 2
    end
    inherited lsi1: TdxLayoutSeparatorItem
      Visible = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = 'C'#243'digo:'
      CaptionOptions.Layout = clTop
      Control = edtCodigo_DUIMP
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = 'N.C.M.:'
      CaptionOptions.Layout = clTop
      Control = edtNCM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = 'Produto:'
      CaptionOptions.Layout = clTop
      Control = edtDescricao_Reduzida
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = lclDefGroup_Root
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = lclDefGroup_Root
      CaptionOptions.Text = 'Detalhamento complementar do produto:'
      CaptionOptions.Layout = clTop
      Control = redDescricao
      ControlOptions.OriginalHeight = 89
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = lclDefGroup_Root
      AlignVert = avClient
      CaptionOptions.Text = 'cxPageControl1'
      CaptionOptions.Visible = False
      Control = pclProps
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 193
      ControlOptions.OriginalWidth = 289
      ControlOptions.ShowBorder = False
      Index = 4
    end
  end
  inherited llfMain: TdxLayoutLookAndFeelList
    Left = 742
    inherited lsfMain: TdxLayoutSkinLookAndFeel
      PixelsPerInch = 96
    end
  end
  inherited sclMain: TdxSkinController
    Left = 770
  end
  inherited decDef: TcxDefaultEditStyleController
    Left = 714
    PixelsPerInch = 96
  end
  inherited lfcDef: TcxLookAndFeelController
    Left = 714
  end
  inherited aclDef: TActionList
    Left = 686
  end
  inherited iglImages: TcxImageList
    FormatVersion = 1
    DesignInfo = 1049374
  end
  inherited escDef: TcxEditStyleController
    Left = 770
    PixelsPerInch = 96
  end
  inherited lczMaster: TcxLocalizer
    Left = 686
    Top = 44
  end
  object edrProd: TcxEditRepository
    Left = 742
    Top = 16
    PixelsPerInch = 96
    object ertList: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Default = True
          ImageIndex = 1
          Kind = bkGlyph
        end>
      Properties.ReadOnly = True
    end
    object ertText: TcxEditRepositoryTextItem
    end
    object ertYesOrNo: TcxEditRepositoryComboBoxItem
      Properties.DropDownListStyle = lsFixedList
    end
    object ertDouble: TcxEditRepositoryCurrencyItem
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.Nullable = False
    end
    object ertInt: TcxEditRepositorySpinItem
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0'
    end
    object ertDate: TcxEditRepositoryDateItem
    end
    object ertDataTime: TcxEditRepositoryDateItem
      Properties.Kind = ckDateTime
    end
  end
end
