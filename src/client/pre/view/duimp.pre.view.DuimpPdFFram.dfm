inherited fraDuimpPageDef: TfraDuimpPageDef
  Width = 1171
  Height = 834
  ExplicitWidth = 1171
  ExplicitHeight = 834
  inherited lclPageDef: TdxLayoutControl
    Width = 1171
    Height = 834
    ExplicitWidth = 1171
    ExplicitHeight = 834
    inherited labTitle: TcxLabel
      Caption = 'Duimp'
      ExplicitWidth = 1147
    end
    object pclDuimpProcess: TcxPageControl [1]
      Left = 12
      Top = 88
      Width = 1147
      Height = 734
      Color = 15790320
      ParentBackground = False
      ParentColor = False
      TabOrder = 4
      Properties.ActivePage = tshDuimp
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 732
      ClientRectLeft = 2
      ClientRectRight = 1145
      ClientRectTop = 25
      object tshDuimp: TcxTabSheet
        Caption = 'Duimp (Vers'#227'o: 0)'
        ImageIndex = 0
        object lclDUI: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 1143
          Height = 707
          Align = alClient
          ParentBackground = True
          TabOrder = 0
          Transparent = True
          LayoutLookAndFeel = lsfMain
          object pclDuimp: TcxPageControl
            Left = 7
            Top = 8
            Width = 1129
            Height = 692
            Color = 15790320
            ParentBackground = False
            ParentColor = False
            TabOrder = 0
            Properties.ActivePage = tshDuimpCouver
            Properties.CustomButtons.Buttons = <>
            ClientRectBottom = 690
            ClientRectLeft = 2
            ClientRectRight = 1127
            ClientRectTop = 25
            object tshDuimpCouver: TcxTabSheet
              Caption = 'Capa'
              ImageIndex = 0
              object lclDuimp: TdxLayoutControl
                Left = 0
                Top = 0
                Width = 1125
                Height = 665
                Align = alClient
                ParentBackground = True
                TabOrder = 0
                Transparent = True
                LayoutLookAndFeel = lsfMain
                object edtSituacaoDuimp: TcxDBTextEdit
                  Left = 7
                  Top = 28
                  DataBinding.DataField = 'SituacaoDuimp'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.ReadOnly = True
                  TabOrder = 0
                  Width = 394
                end
                object edtUnidadeDespachoDescricao: TcxDBTextEdit
                  Left = 16
                  Top = 219
                  DataBinding.DataField = 'UnidadeDespachoDescricao'
                  DataBinding.DataSource = damDuimp.dsoDCG
                  Properties.ReadOnly = True
                  TabOrder = 7
                  Width = 177
                end
                object edtDataRegistro: TcxDBTextEdit
                  Left = 7
                  Top = 130
                  DataBinding.DataField = 'DataRegistro'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.Alignment.Horz = taCenter
                  Properties.ReadOnly = True
                  TabOrder = 3
                  Width = 113
                end
                object edtImportadorNI: TcxDBTextEdit
                  Left = 127
                  Top = 130
                  OnFocusChanged = EnableCpfOrCnpfDBFieldDisplayText
                  DataBinding.DataField = 'ImportadorNI'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.ReadOnly = True
                  TabOrder = 4
                  OnEnter = DisableCpfOrCnpfDBFieldDisplayText
                  Width = 65
                end
                object edtFreteMoedaNegociadaSimbolo: TcxDBTextEdit
                  Left = 25
                  Top = 410
                  DataBinding.DataField = 'FreteMoedaNegociadaSimbolo'
                  DataBinding.DataSource = damDuimp.dsoDCG
                  Properties.Alignment.Horz = taCenter
                  Properties.ReadOnly = True
                  TabOrder = 14
                  Width = 41
                end
                object edtFreteMoedaNegociadaValorCotacao: TcxDBTextEdit
                  Left = 158
                  Top = 410
                  DataBinding.DataField = 'FreteMoedaNegociadaValorCotacao'
                  DataBinding.DataSource = damDuimp.dsoDCG
                  Properties.ReadOnly = True
                  TabOrder = 16
                  Width = 48
                end
                object edtSeguroMoedaNegociadaSimbolo: TcxDBTextEdit
                  Left = 25
                  Top = 510
                  DataBinding.DataField = 'SeguroMoedaNegociadaSimbolo'
                  DataBinding.DataSource = damDuimp.dsoDCG
                  Properties.Alignment.Horz = taCenter
                  Properties.ReadOnly = True
                  TabOrder = 19
                  Width = 41
                end
                object edtSeguroMoedaNegociadaValorCotacao: TcxDBTextEdit
                  Left = 158
                  Top = 510
                  DataBinding.DataField = 'SeguroMoedaNegociadaValorCotacao'
                  DataBinding.DataSource = damDuimp.dsoDCG
                  Properties.ReadOnly = True
                  TabOrder = 21
                  Width = 48
                end
                object edtFreteMoedaNegociadaValorBRL: TcxDBTextEdit
                  Left = 213
                  Top = 410
                  DataBinding.DataField = 'FreteMoedaNegociadaValorBRL'
                  DataBinding.DataSource = damDuimp.dsoDCG
                  Properties.ReadOnly = True
                  TabOrder = 17
                  Width = 85
                end
                object edtFreteMoedaNegociadaValor: TcxDBTextEdit
                  Left = 73
                  Top = 410
                  DataBinding.DataField = 'FreteMoedaNegociadaValor'
                  DataBinding.DataSource = damDuimp.dsoDCG
                  Properties.ReadOnly = True
                  TabOrder = 15
                  Width = 78
                end
                object edtSeguroMoedaNegociadaValorBRL: TcxDBTextEdit
                  Left = 213
                  Top = 510
                  DataBinding.DataField = 'SeguroMoedaNegociadaValorBRL'
                  DataBinding.DataSource = damDuimp.dsoDCG
                  Properties.ReadOnly = True
                  TabOrder = 22
                  Width = 85
                end
                object edtSeguroMoedaNegociadaValor: TcxDBTextEdit
                  Left = 73
                  Top = 510
                  DataBinding.DataField = 'SeguroMoedaNegociadaValor'
                  DataBinding.DataSource = damDuimp.dsoDCG
                  Properties.ReadOnly = True
                  TabOrder = 20
                  Width = 78
                end
                object grdFOA: TcxGrid
                  Left = 7
                  Top = 583
                  Width = 376
                  Height = 75
                  TabOrder = 33
                  LookAndFeel.NativeStyle = False
                  object grdFOADBTableView: TcxGridDBTableView
                    Navigator.Buttons.CustomButtons = <>
                    ScrollbarAnnotations.CustomAnnotations = <>
                    DataController.DataSource = damDuimp.dsoACV
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <
                      item
                        Format = ',0'
                        Kind = skCount
                        Column = grdFOADBTableViewMoedaNegociadaSimbolo
                      end
                      item
                        Format = ',0.0000;-,0.0000'
                        Kind = skSum
                        Column = grdFOADBTableViewMoedaNegociadaValorBRL
                      end>
                    DataController.Summary.SummaryGroups = <>
                    OptionsCustomize.ColumnFiltering = False
                    OptionsCustomize.ColumnGrouping = False
                    OptionsCustomize.ColumnMoving = False
                    OptionsCustomize.ColumnSorting = False
                    OptionsData.Deleting = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsView.ColumnAutoWidth = True
                    OptionsView.Footer = True
                    OptionsView.GroupByBox = False
                    OptionsView.Indicator = True
                    object grdFOADBTableViewMoedaNegociadaId: TcxGridDBColumn
                      DataBinding.FieldName = 'MoedaNegociadaId'
                      Visible = False
                    end
                    object grdFOADBTableViewMoedaNegociadaSimbolo: TcxGridDBColumn
                      DataBinding.FieldName = 'MoedaNegociadaSimbolo'
                      HeaderAlignmentHorz = taCenter
                    end
                    object grdFOADBTableViewMoedaNegociadaValor: TcxGridDBColumn
                      DataBinding.FieldName = 'MoedaNegociadaValor'
                      HeaderAlignmentHorz = taRightJustify
                    end
                    object grdFOADBTableViewMoedaNegociadaValorCotacao: TcxGridDBColumn
                      DataBinding.FieldName = 'MoedaNegociadaValorCotacao'
                      HeaderAlignmentHorz = taRightJustify
                    end
                    object grdFOADBTableViewMoedaNegociadaValorBRL: TcxGridDBColumn
                      DataBinding.FieldName = 'MoedaNegociadaValorBRL'
                      HeaderAlignmentHorz = taRightJustify
                    end
                  end
                  object grdFOALevel: TcxGridLevel
                    GridView = grdFOADBTableView
                  end
                end
                object grdFOB: TcxGrid
                  Left = 390
                  Top = 583
                  Width = 376
                  Height = 75
                  TabOrder = 34
                  object grdFOBDBTableView: TcxGridDBTableView
                    Navigator.Buttons.CustomButtons = <>
                    ScrollbarAnnotations.CustomAnnotations = <>
                    DataController.DataSource = damDuimp.dsoFCV
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <
                      item
                        Format = ',0.0000;-,0.0000'
                        Kind = skSum
                        Column = grdFOBDBTableViewMoedaNegociadaValorBRL
                      end
                      item
                        Format = ',0'
                        Kind = skCount
                        Column = grdFOBDBTableViewMoedaNegociadaSimbolo
                      end>
                    DataController.Summary.SummaryGroups = <>
                    OptionsCustomize.ColumnFiltering = False
                    OptionsCustomize.ColumnGrouping = False
                    OptionsCustomize.ColumnMoving = False
                    OptionsCustomize.ColumnSorting = False
                    OptionsData.Deleting = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsView.ColumnAutoWidth = True
                    OptionsView.Footer = True
                    OptionsView.GroupByBox = False
                    OptionsView.Indicator = True
                    object grdFOBDBTableViewMoedaNegociadaId: TcxGridDBColumn
                      DataBinding.FieldName = 'MoedaNegociadaId'
                      Visible = False
                    end
                    object grdFOBDBTableViewMoedaNegociadaSimbolo: TcxGridDBColumn
                      DataBinding.FieldName = 'MoedaNegociadaSimbolo'
                      HeaderAlignmentHorz = taCenter
                    end
                    object grdFOBDBTableViewMoedaNegociadaValor: TcxGridDBColumn
                      DataBinding.FieldName = 'MoedaNegociadaValor'
                      HeaderAlignmentHorz = taRightJustify
                    end
                    object grdFOBDBTableViewMoedaNegociadaValorCotacao: TcxGridDBColumn
                      DataBinding.FieldName = 'MoedaNegociadaValorCotacao'
                      HeaderAlignmentHorz = taRightJustify
                    end
                    object grdFOBDBTableViewMoedaNegociadaValorBRL: TcxGridDBColumn
                      DataBinding.FieldName = 'MoedaNegociadaValorBRL'
                      HeaderAlignmentHorz = taRightJustify
                    end
                  end
                  object grdFOBLevel: TcxGridLevel
                    GridView = grdFOBDBTableView
                  end
                end
                object cbxRemoverValoracaoNoValorFob: TcxDBCheckBox
                  Left = 418
                  Top = 191
                  Caption = 'Remover a valora'#231#227'o aduaneira dos valores das mercadorias'
                  DataBinding.DataField = 'RemoverValoracaoNoValorFob'
                  DataBinding.DataSource = damDuimp.dsoDUI
                  Properties.ImmediatePost = True
                  Properties.NullStyle = nssUnchecked
                  Properties.OnEditValueChanged = cbxRemoverValoracaoNoValorFobPropertiesEditValueChanged
                  TabOrder = 28
                  Transparent = True
                end
                object grdDTC: TcxGrid
                  Left = 778
                  Top = 374
                  Width = 335
                  Height = 278
                  TabOrder = 48
                  object grdDTCDBTableView: TcxGridDBTableView
                    Navigator.Buttons.CustomButtons = <>
                    ScrollbarAnnotations.CustomAnnotations = <>
                    DataController.DataSource = damDuimp.dsoDTC
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <>
                    DataController.Summary.SummaryGroups = <>
                    OptionsCustomize.ColumnFiltering = False
                    OptionsCustomize.ColumnGrouping = False
                    OptionsCustomize.ColumnMoving = False
                    OptionsCustomize.ColumnSorting = False
                    OptionsData.Deleting = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsView.ColumnAutoWidth = True
                    OptionsView.GroupByBox = False
                    OptionsView.Indicator = True
                    object grdDTCDBTableViewId: TcxGridDBColumn
                      DataBinding.FieldName = 'Id'
                      Visible = False
                    end
                    object grdDTCDBTableViewTipo: TcxGridDBColumn
                      DataBinding.FieldName = 'Tipo'
                    end
                    object grdDTCDBTableViewVersaoId: TcxGridDBColumn
                      DataBinding.FieldName = 'VersaoId'
                      Visible = False
                    end
                  end
                  object grdDTVDBLayoutView: TcxGridDBLayoutView
                    Navigator.Buttons.CustomButtons = <>
                    ScrollbarAnnotations.CustomAnnotations = <>
                    DataController.DataSource = damDuimp.dsoDTV
                    DataController.DetailKeyFieldNames = 'TributoCalculadoId'
                    DataController.KeyFieldNames = 'TributoCalculadoId'
                    DataController.MasterKeyFieldNames = 'Id'
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <>
                    DataController.Summary.SummaryGroups = <>
                    OptionsBehavior.CellHints = True
                    OptionsCustomize.ItemFiltering = False
                    OptionsCustomize.RecordExpanding = True
                    OptionsData.Deleting = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsView.CellEndEllipsis = True
                    OptionsView.RecordCaption.Visible = False
                    OptionsView.SingleRecordStretch = srsHorizontal
                    object grdDTVDBLayoutViewId: TcxGridDBLayoutViewItem
                      DataBinding.FieldName = 'Id'
                      Visible = False
                      LayoutItem = grdDTVDBLayoutViewLayoutItem1
                    end
                    object grdDTVDBLayoutViewTipo: TcxGridDBLayoutViewItem
                      DataBinding.FieldName = 'Tipo'
                      Visible = False
                      LayoutItem = grdDTVDBLayoutViewLayoutItem12
                    end
                    object grdDTVDBLayoutViewCalculado: TcxGridDBLayoutViewItem
                      DataBinding.FieldName = 'Calculado'
                      LayoutItem = grdDTVDBLayoutViewLayoutItem2
                    end
                    object grdDTVDBLayoutViewAReduzir: TcxGridDBLayoutViewItem
                      DataBinding.FieldName = 'AReduzir'
                      LayoutItem = grdDTVDBLayoutViewLayoutItem3
                    end
                    object grdDTVDBLayoutViewDevido: TcxGridDBLayoutViewItem
                      DataBinding.FieldName = 'Devido'
                      LayoutItem = grdDTVDBLayoutViewLayoutItem4
                    end
                    object grdDTVDBLayoutViewSuspenso: TcxGridDBLayoutViewItem
                      DataBinding.FieldName = 'Suspenso'
                      LayoutItem = grdDTVDBLayoutViewLayoutItem5
                    end
                    object grdDTVDBLayoutViewARecolher: TcxGridDBLayoutViewItem
                      DataBinding.FieldName = 'ARecolher'
                      LayoutItem = grdDTVDBLayoutViewLayoutItem6
                    end
                    object grdDTVDBLayoutViewRecolhido: TcxGridDBLayoutViewItem
                      DataBinding.FieldName = 'Recolhido'
                      LayoutItem = grdDTVDBLayoutViewLayoutItem7
                    end
                    object grdDTVDBLayoutViewMajorado: TcxGridDBLayoutViewItem
                      DataBinding.FieldName = 'Majorado'
                      LayoutItem = grdDTVDBLayoutViewLayoutItem10
                    end
                    object grdDTVDBLayoutViewNotaFiscal: TcxGridDBLayoutViewItem
                      DataBinding.FieldName = 'NotaFiscal'
                      LayoutItem = grdDTVDBLayoutViewLayoutItem11
                    end
                    object grdDTVDBLayoutViewDiferenca: TcxGridDBLayoutViewItem
                      DataBinding.FieldName = 'Diferenca'
                      LayoutItem = grdDTVDBLayoutViewLayoutItem13
                    end
                    object grdDTVDBLayoutViewTributoCalculadoId: TcxGridDBLayoutViewItem
                      DataBinding.FieldName = 'TributoCalculadoId'
                      Visible = False
                      LayoutItem = grdDTVDBLayoutViewLayoutItem8
                    end
                    object grdDTVDBLayoutViewVersaoId: TcxGridDBLayoutViewItem
                      DataBinding.FieldName = 'VersaoId'
                      Visible = False
                      LayoutItem = grdDTVDBLayoutViewLayoutItem9
                    end
                    object grdDTVDBLayoutViewGroup_Root: TdxLayoutGroup
                      AlignHorz = ahClient
                      AlignVert = avTop
                      CaptionOptions.Text = 'Template Layout'
                      Hidden = True
                      ItemIndex = 8
                      ScrollOptions.Horizontal = smAuto
                      ShowBorder = False
                      Index = -1
                    end
                    object grdDTVDBLayoutViewLayoutItem1: TcxGridLayoutItem
                      Index = -1
                    end
                    object grdDTVDBLayoutViewLayoutItem2: TcxGridLayoutItem
                      Parent = grdDTVDBLayoutViewGroup_Root
                      CaptionOptions.AlignHorz = taRightJustify
                      Index = 0
                    end
                    object grdDTVDBLayoutViewLayoutItem3: TcxGridLayoutItem
                      Parent = grdDTVDBLayoutViewGroup_Root
                      CaptionOptions.AlignHorz = taRightJustify
                      Index = 1
                    end
                    object grdDTVDBLayoutViewLayoutItem4: TcxGridLayoutItem
                      Parent = grdDTVDBLayoutViewGroup_Root
                      CaptionOptions.AlignHorz = taRightJustify
                      Index = 2
                    end
                    object grdDTVDBLayoutViewLayoutItem5: TcxGridLayoutItem
                      Parent = grdDTVDBLayoutViewGroup_Root
                      CaptionOptions.AlignHorz = taRightJustify
                      Index = 3
                    end
                    object grdDTVDBLayoutViewLayoutItem6: TcxGridLayoutItem
                      Parent = grdDTVDBLayoutViewGroup_Root
                      CaptionOptions.AlignHorz = taRightJustify
                      Index = 4
                    end
                    object grdDTVDBLayoutViewLayoutItem7: TcxGridLayoutItem
                      Parent = grdDTVDBLayoutViewGroup_Root
                      CaptionOptions.AlignHorz = taRightJustify
                      Index = 5
                    end
                    object grdDTVDBLayoutViewLayoutItem8: TcxGridLayoutItem
                      Index = -1
                    end
                    object grdDTVDBLayoutViewLayoutItem9: TcxGridLayoutItem
                      Index = -1
                    end
                    object grdDTVDBLayoutViewLayoutItem10: TcxGridLayoutItem
                      Parent = grdDTVDBLayoutViewGroup_Root
                      CaptionOptions.AlignHorz = taRightJustify
                      Index = 6
                    end
                    object grdDTVDBLayoutViewLayoutItem11: TcxGridLayoutItem
                      Parent = grdDTVDBLayoutViewGroup_Root
                      CaptionOptions.AlignHorz = taRightJustify
                      Index = 7
                    end
                    object grdDTVDBLayoutViewLayoutItem12: TcxGridLayoutItem
                      Index = -1
                    end
                    object grdDTVDBLayoutViewLayoutItem13: TcxGridLayoutItem
                      Parent = grdDTVDBLayoutViewGroup_Root
                      CaptionOptions.AlignHorz = taRightJustify
                      Index = 8
                    end
                  end
                  object grdDTCLevel: TcxGridLevel
                    GridView = grdDTCDBTableView
                    object grdDTVLevel: TcxGridLevel
                      GridView = grdDTVDBLayoutView
                    end
                  end
                end
                object grdADV: TcxGrid
                  Left = 408
                  Top = 358
                  Width = 358
                  Height = 197
                  TabOrder = 32
                  object grdADVDBTableView: TcxGridDBTableView
                    Navigator.Buttons.CustomButtons = <>
                    ScrollbarAnnotations.CustomAnnotations = <>
                    DataController.DataSource = damDuimp.dsoADV
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <
                      item
                        Format = ',0'
                        Kind = skCount
                        Column = grdADVDBTableViewMoedaNegociadaSimbolo
                      end
                      item
                        Format = ',0.0000;-,0.0000'
                        Kind = skSum
                        Column = grdADVDBTableViewMoedaNegociadaValorBRL
                      end>
                    DataController.Summary.SummaryGroups = <>
                    OptionsCustomize.ColumnFiltering = False
                    OptionsCustomize.ColumnGrouping = False
                    OptionsCustomize.ColumnMoving = False
                    OptionsCustomize.ColumnSorting = False
                    OptionsData.Deleting = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsView.ColumnAutoWidth = True
                    OptionsView.Footer = True
                    OptionsView.GroupByBox = False
                    OptionsView.Indicator = True
                    object grdADVDBTableViewMoedaNegociadaId: TcxGridDBColumn
                      DataBinding.FieldName = 'MoedaNegociadaId'
                      Visible = False
                    end
                    object grdADVDBTableViewMoedaNegociadaSimbolo: TcxGridDBColumn
                      DataBinding.FieldName = 'MoedaNegociadaSimbolo'
                      HeaderAlignmentHorz = taCenter
                    end
                    object grdADVDBTableViewMoedaNegociadaValor: TcxGridDBColumn
                      DataBinding.FieldName = 'MoedaNegociadaValor'
                      HeaderAlignmentHorz = taRightJustify
                    end
                    object grdADVDBTableViewMoedaNegociadaValorCotacao: TcxGridDBColumn
                      DataBinding.FieldName = 'MoedaNegociadaValorCotacao'
                      HeaderAlignmentHorz = taRightJustify
                    end
                    object grdADVDBTableViewMoedaNegociadaValorBRL: TcxGridDBColumn
                      DataBinding.FieldName = 'MoedaNegociadaValorBRL'
                      HeaderAlignmentHorz = taRightJustify
                    end
                  end
                  object grdADVLevel: TcxGridLevel
                    GridView = grdADVDBTableView
                  end
                end
                object cbxDesembaracoAduaneiro: TcxDBCheckBox
                  Left = 418
                  Top = 137
                  Caption = 'Desembara'#231'o Aduaneiro (DA)'
                  DataBinding.DataField = 'DesembaracoAduaneiro'
                  DataBinding.DataSource = damDuimp.dsoDUI
                  Properties.ImmediatePost = True
                  Properties.NullStyle = nssUnchecked
                  TabOrder = 26
                  Transparent = True
                end
                object cbxAdmissaoTemporaria: TcxDBCheckBox
                  Left = 418
                  Top = 110
                  Caption = 'Admiss'#227'o Tempor'#225'ria'
                  DataBinding.DataField = 'AdmissaoTemporaria'
                  DataBinding.DataSource = damDuimp.dsoDUI
                  Properties.ImmediatePost = True
                  Properties.NullStyle = nssUnchecked
                  TabOrder = 25
                  Transparent = True
                end
                object cbxSuspensaoImpostos: TcxDBCheckBox
                  Left = 418
                  Top = 245
                  Caption = 'Suspens'#227'o de Impostos'
                  DataBinding.DataField = 'SuspensaoImpostos'
                  DataBinding.DataSource = damDuimp.dsoDUI
                  Properties.ImmediatePost = True
                  Properties.NullStyle = nssUnchecked
                  TabOrder = 30
                  Transparent = True
                end
                object cbxEntrepostoAduaneiro: TcxDBCheckBox
                  Left = 418
                  Top = 164
                  Caption = 'Entreposto Aduaneiro'
                  DataBinding.DataField = 'EntrepostoAduaneiro'
                  DataBinding.DataSource = damDuimp.dsoDUI
                  Properties.ImmediatePost = True
                  Properties.NullStyle = nssUnchecked
                  TabOrder = 27
                  Transparent = True
                end
                object cbxRemoverFreteTerrirtrioNacionalBCImpostos: TcxDBCheckBox
                  Left = 418
                  Top = 218
                  Caption = 'Remover Frete em Terrirt'#243'rio Nacional da B.C.Impostos'
                  DataBinding.DataField = 'RemoverFreteTerrirtorioNacionalBCImpostos'
                  DataBinding.DataSource = damDuimp.dsoDUI
                  Properties.ImmediatePost = True
                  Properties.NullStyle = nssUnchecked
                  TabOrder = 29
                  Transparent = True
                end
                object edtTipoAplicacaoDescricao: TcxDBTextEdit
                  Left = 7
                  Top = 79
                  DataBinding.DataField = 'TipoAplicacaoDescricao'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.ReadOnly = True
                  TabOrder = 1
                  Width = 185
                end
                object edtClienteNome: TcxDBTextEdit
                  Left = 131
                  Top = 270
                  DataBinding.DataField = 'ClienteNome'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.ReadOnly = True
                  TabOrder = 11
                  Width = 261
                end
                object edtUFDesembaracoNome: TcxDBTextEdit
                  Left = 247
                  Top = 219
                  DataBinding.DataField = 'UFDesembaracoNome'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.ReadOnly = True
                  TabOrder = 9
                  Width = 145
                end
                object edtUFImportacaoNome: TcxDBTextEdit
                  Left = 246
                  Top = 130
                  DataBinding.DataField = 'UFImportacaoNome'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.ReadOnly = True
                  TabOrder = 6
                  Width = 155
                end
                object edtModalidades: TcxDBTextEdit
                  Left = 408
                  Top = 307
                  DataBinding.DataField = 'Modalidades'
                  DataBinding.DataSource = damDuimp.dsoMDS
                  Properties.ReadOnly = True
                  TabOrder = 31
                  Width = 358
                end
                object edtProcessoNumeroVinculado: TcxDBTextEdit
                  Left = 861
                  Top = 76
                  DataBinding.DataField = 'ProcessoNumeroVinculado'
                  DataBinding.DataSource = damDuimp.dsoDUI
                  Properties.CharCase = ecUpperCase
                  TabOrder = 36
                  Width = 165
                end
                object edtClienteCNPJ: TcxDBTextEdit
                  Left = 16
                  Top = 270
                  OnFocusChanged = EnableCpfOrCnpfDBFieldDisplayText
                  DataBinding.DataField = 'ClienteCNPJ'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.Alignment.Horz = taCenter
                  Properties.ReadOnly = True
                  TabOrder = 10
                  OnEnter = DisableCpfOrCnpfDBFieldDisplayText
                  Width = 108
                end
                object btnProcessSave: TcxButton
                  Left = 1033
                  Top = 43
                  Width = 75
                  Height = 25
                  Action = actProcessSave
                  TabOrder = 37
                end
                object btnProcessCancel: TcxButton
                  Left = 1033
                  Top = 71
                  Width = 75
                  Height = 25
                  Action = actProcessCancel
                  TabOrder = 38
                end
                object edtViaTransporteDescricao: TcxDBTextEdit
                  Left = 234
                  Top = 321
                  DataBinding.DataField = 'ViaTransporteDescricao'
                  DataBinding.DataSource = damDuimp.dsoDCG
                  Properties.ReadOnly = True
                  TabOrder = 13
                  Width = 158
                end
                object edtIdentificacao: TcxDBTextEdit
                  Left = 16
                  Top = 321
                  DataBinding.DataField = 'Identificacao'
                  DataBinding.DataSource = damDuimp.dsoDCG
                  Properties.ReadOnly = True
                  TabOrder = 12
                  Width = 211
                end
                object cbxIncentivoFiscalNome: TcxDBLookupComboBox
                  Left = 199
                  Top = 79
                  DataBinding.DataField = 'IncentivoFiscalCodigo'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.DropDownListStyle = lsFixedList
                  Properties.ImmediatePost = True
                  Properties.KeyFieldNames = 'Codigo'
                  Properties.ListColumns = <
                    item
                      FieldName = 'Nome'
                    end>
                  Properties.ListOptions.ColumnSorting = False
                  Properties.ListOptions.GridLines = glNone
                  Properties.ListOptions.ShowHeader = False
                  Properties.ListSource = damDuimp.dsoIFI
                  Properties.ReadOnly = False
                  TabOrder = 2
                  Width = 202
                end
                object cbxUFImportacao: TcxDBLookupComboBox
                  Left = 199
                  Top = 130
                  DataBinding.DataField = 'UFImportacao'
                  DataBinding.DataSource = damDuimp.dsoDCR
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
                  TabOrder = 5
                  Width = 40
                end
                object cbxUFDesembaraco: TcxDBLookupComboBox
                  Left = 200
                  Top = 219
                  DataBinding.DataField = 'UFDesembaraco'
                  DataBinding.DataSource = damDuimp.dsoDCR
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
                  Properties.ReadOnly = False
                  TabOrder = 8
                  Width = 40
                end
                object edtFobValorTotal: TcxDBButtonEdit
                  Left = 783
                  Top = 252
                  DataBinding.DataField = 'FobValorTotal'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.Buttons = <
                    item
                      Caption = 'USD'
                      ContentAlignment = taRightJustify
                      Default = True
                      Kind = bkText
                      Transparent = True
                    end>
                  Properties.ReadOnly = True
                  TabOrder = 42
                  Width = 135
                end
                object edtFobAdicaoValorTotal: TcxDBButtonEdit
                  Left = 783
                  Top = 201
                  DataBinding.DataField = 'FobAdicaoValorTotal'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.Buttons = <
                    item
                      Caption = 'USD'
                      ContentAlignment = taRightJustify
                      Default = True
                      Kind = bkText
                      Transparent = True
                    end>
                  Properties.ReadOnly = True
                  TabOrder = 39
                  Width = 135
                end
                object edtFobValorTotalBRL: TcxDBButtonEdit
                  Left = 987
                  Top = 252
                  DataBinding.DataField = 'FobValorTotalBRL'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.Buttons = <
                    item
                      Caption = 'BRL'
                      ContentAlignment = taRightJustify
                      Default = True
                      Kind = bkText
                      Transparent = True
                    end>
                  Properties.ReadOnly = True
                  TabOrder = 44
                  Width = 121
                end
                object edtFobAdicaoValorTotalBRL: TcxDBButtonEdit
                  Left = 987
                  Top = 201
                  DataBinding.DataField = 'FobAdicaoValorTotalBRL'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.Buttons = <
                    item
                      Caption = 'BRL'
                      ContentAlignment = taRightJustify
                      Default = True
                      Kind = bkText
                      Transparent = True
                    end>
                  Properties.ReadOnly = True
                  TabOrder = 41
                  Width = 121
                end
                object cbxProcessoNumero: TcxDBLookupComboBox
                  Left = 861
                  Top = 46
                  DataBinding.DataField = 'ProcessoNumero'
                  DataBinding.DataSource = damDuimp.dsoDUV
                  Properties.CharCase = ecUpperCase
                  Properties.DropDownListStyle = lsEditList
                  Properties.ImmediatePost = True
                  Properties.KeyFieldNames = 'ProcessoNumero'
                  Properties.ListColumns = <
                    item
                      FieldName = 'ProcessoNumero'
                    end>
                  Properties.ListOptions.ColumnSorting = False
                  Properties.ListOptions.ShowHeader = False
                  Properties.ListSource = damDuimp.dsoPRS
                  TabOrder = 35
                  Width = 165
                end
                object edtValAduaneiraValorTotal: TcxDBButtonEdit
                  Left = 783
                  Top = 316
                  DataBinding.DataField = 'ValAduaneiraValorTotal'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.Buttons = <
                    item
                      Caption = 'USD'
                      ContentAlignment = taRightJustify
                      Default = True
                      Kind = bkText
                      Transparent = True
                    end>
                  Properties.ReadOnly = True
                  Style.HotTrack = False
                  Style.TransparentBorder = False
                  TabOrder = 45
                  Width = 135
                end
                object edtValAduaneiraValorTotalBRL: TcxDBButtonEdit
                  Left = 987
                  Top = 316
                  DataBinding.DataField = 'ValAduaneiraValorTotalBRL'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.Buttons = <
                    item
                      Caption = 'BRL'
                      ContentAlignment = taRightJustify
                      Default = True
                      Kind = bkText
                      Transparent = True
                    end>
                  Properties.ReadOnly = True
                  Style.HotTrack = False
                  Style.TransparentBorder = False
                  TabOrder = 47
                  Width = 121
                end
                object edtFobValorCotacao: TcxDBTextEdit
                  Left = 925
                  Top = 252
                  DataBinding.DataField = 'FobValorCotacao'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.Alignment.Horz = taRightJustify
                  Properties.ReadOnly = True
                  Style.HotTrack = False
                  Style.TransparentBorder = False
                  TabOrder = 43
                  Width = 55
                end
                object edtFobAdicaoValorCotacao: TcxDBTextEdit
                  Left = 925
                  Top = 201
                  DataBinding.DataField = 'FobAdicaoValorCotacao'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.Alignment.Horz = taRightJustify
                  Properties.ReadOnly = True
                  Style.HotTrack = False
                  Style.TransparentBorder = False
                  TabOrder = 40
                  Width = 55
                end
                object edtValAduaneiraCotacao: TcxDBTextEdit
                  Left = 925
                  Top = 316
                  DataBinding.DataField = 'ValAduaneiraCotacao'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.Alignment.Horz = taRightJustify
                  Properties.ReadOnly = True
                  Style.HotTrack = False
                  Style.TransparentBorder = False
                  TabOrder = 46
                  Width = 55
                end
                object edtFreteFobValor: TcxDBTextEdit
                  Left = 305
                  Top = 410
                  DataBinding.DataField = 'FreteFobValor'
                  DataBinding.DataSource = damDuimp.dsoDCG
                  Properties.ReadOnly = True
                  Style.HotTrack = False
                  Style.TransparentBorder = False
                  TabOrder = 18
                  Width = 78
                end
                object edtSeguroFobValor: TcxDBTextEdit
                  Left = 305
                  Top = 510
                  DataBinding.DataField = 'SeguroFobValor'
                  DataBinding.DataSource = damDuimp.dsoDCG
                  Properties.ReadOnly = True
                  Style.HotTrack = False
                  Style.TransparentBorder = False
                  TabOrder = 23
                  Width = 78
                end
                object rgpCanalConsolidado: TcxDBRadioGroup
                  Left = 408
                  Top = 7
                  Caption = 'Canal:'
                  DataBinding.DataField = 'CanalConsolidado'
                  DataBinding.DataSource = damDuimp.dsoDRR
                  Properties.Columns = 4
                  Properties.Items = <>
                  Properties.ReadOnly = True
                  Style.TransparentBorder = False
                  TabOrder = 24
                  Height = 55
                  Width = 358
                end
                object lclDuimpGroup_Root: TdxLayoutGroup
                  AlignHorz = ahParentManaged
                  AlignVert = avClient
                  Hidden = True
                  ItemIndex = 1
                  LayoutDirection = ldHorizontal
                  Padding.Bottom = -5
                  Padding.Left = -5
                  Padding.Right = -5
                  Padding.Top = -5
                  Padding.AssignedValues = [lpavBottom, lpavLeft, lpavRight, lpavTop]
                  ShowBorder = False
                  Index = -1
                end
                object loiSituacaoDuimp: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup15
                  AlignHorz = ahClient
                  CaptionOptions.Text = 'Situa'#231#227'o:'
                  CaptionOptions.Layout = clTop
                  Control = edtSituacaoDuimp
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 121
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
                object loiLocalDesembaracoDesc: TdxLayoutItem
                  Parent = ltgUnidadeDespachoCodigo
                  AlignHorz = ahClient
                  AlignVert = avBottom
                  CaptionOptions.Text = 'Despacho:'
                  CaptionOptions.Layout = clTop
                  Control = edtUnidadeDespachoDescricao
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 121
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
                object loiDataRegistroDeclaracao: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup9
                  AlignHorz = ahLeft
                  CaptionOptions.Text = 'Data de Registro:'
                  CaptionOptions.Layout = clTop
                  Control = edtDataRegistro
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 113
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
                object loiImportador: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup9
                  AlignHorz = ahClient
                  CaptionOptions.Text = 'Importador:'
                  CaptionOptions.Layout = clTop
                  Control = edtImportadorNI
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 90
                  ControlOptions.ShowBorder = False
                  Index = 1
                end
                object loiFreteDescMN: TdxLayoutItem
                  Parent = ltgFreteMoeda
                  AlignHorz = ahLeft
                  CaptionOptions.Text = 'Moeda:'
                  CaptionOptions.Layout = clTop
                  Control = edtFreteMoedaNegociadaSimbolo
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 41
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
                object loiFreteValorMN: TdxLayoutItem
                  Parent = ltgFreteMoeda
                  AlignHorz = ahClient
                  SizeOptions.Width = 70
                  CaptionOptions.AlignHorz = taRightJustify
                  CaptionOptions.Text = 'Cota'#231#227'o:'
                  CaptionOptions.Layout = clTop
                  Control = edtFreteMoedaNegociadaValorCotacao
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 60
                  ControlOptions.ShowBorder = False
                  Index = 2
                end
                object loiSeguroDescMN: TdxLayoutItem
                  Parent = ltgSeguroMoeda
                  AlignHorz = ahLeft
                  CaptionOptions.Text = 'Moeda:'
                  CaptionOptions.Layout = clTop
                  Control = edtSeguroMoedaNegociadaSimbolo
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 41
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
                object loiSeguroValorMN: TdxLayoutItem
                  Parent = ltgSeguroMoeda
                  AlignHorz = ahClient
                  SizeOptions.Width = 70
                  CaptionOptions.AlignHorz = taRightJustify
                  CaptionOptions.Text = 'Cota'#231#227'o:'
                  CaptionOptions.Layout = clTop
                  Control = edtSeguroMoedaNegociadaValorCotacao
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 60
                  ControlOptions.ShowBorder = False
                  Index = 2
                end
                object loiCondicaoVendaVlrBRLTotalFrete: TdxLayoutItem
                  Parent = ltgFreteMoeda
                  AlignHorz = ahClient
                  SizeOptions.Width = 133
                  CaptionOptions.AlignHorz = taRightJustify
                  CaptionOptions.Text = 'Valor (BRL):'
                  CaptionOptions.Layout = clTop
                  Control = edtFreteMoedaNegociadaValorBRL
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 103
                  ControlOptions.ShowBorder = False
                  Index = 3
                end
                object loiFreteMe: TdxLayoutItem
                  Parent = ltgFreteMoeda
                  AlignHorz = ahClient
                  CaptionOptions.AlignHorz = taRightJustify
                  CaptionOptions.Text = 'Valor:'
                  CaptionOptions.Layout = clTop
                  Control = edtFreteMoedaNegociadaValor
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 121
                  ControlOptions.ShowBorder = False
                  Index = 1
                end
                object loiCondicaoVendaVlrBRLTotalSeguro: TdxLayoutItem
                  Parent = ltgSeguroMoeda
                  AlignHorz = ahClient
                  SizeOptions.Width = 133
                  CaptionOptions.AlignHorz = taRightJustify
                  CaptionOptions.Text = 'Valor (BRL):'
                  CaptionOptions.Layout = clTop
                  Control = edtSeguroMoedaNegociadaValorBRL
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 103
                  ControlOptions.ShowBorder = False
                  Index = 3
                end
                object loiSeguroMe: TdxLayoutItem
                  Parent = ltgSeguroMoeda
                  AlignHorz = ahClient
                  CaptionOptions.AlignHorz = taRightJustify
                  CaptionOptions.Text = 'Valor:'
                  CaptionOptions.Layout = clTop
                  Control = edtSeguroMoedaNegociadaValor
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 121
                  ControlOptions.ShowBorder = False
                  Index = 1
                end
                object ltgCarga: TdxLayoutGroup
                  Parent = dxLayoutAutoCreatedGroup15
                  AlignHorz = ahClient
                  AlignVert = avClient
                  CaptionOptions.Text = 'Carga:'
                  ItemIndex = 4
                  Padding.Bottom = -8
                  Padding.Left = -6
                  Padding.Right = -6
                  Padding.Top = -8
                  Padding.AssignedValues = [lpavBottom, lpavLeft, lpavRight, lpavTop]
                  Index = 3
                end
                object loigrdFOA: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup6
                  AlignHorz = ahClient
                  AlignVert = avClient
                  CaptionOptions.Text = 'FOB Adi'#231#245'es:'
                  CaptionOptions.Layout = clTop
                  Control = grdFOA
                  ControlOptions.OriginalHeight = 90
                  ControlOptions.OriginalWidth = 340
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
                object loigrdFOB: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup6
                  AlignHorz = ahClient
                  AlignVert = avClient
                  CaptionOptions.Text = 'FOB:'
                  CaptionOptions.Layout = clTop
                  Control = grdFOB
                  ControlOptions.OriginalHeight = 90
                  ControlOptions.OriginalWidth = 340
                  ControlOptions.ShowBorder = False
                  Index = 1
                end
                object ltgUnidadeDespachoCodigo: TdxLayoutGroup
                  Parent = ltgCarga
                  ItemIndex = 2
                  LayoutDirection = ldHorizontal
                  ShowBorder = False
                  Index = 0
                end
                object ltgFreteMoeda: TdxLayoutGroup
                  Parent = ltgFrete
                  ItemIndex = 3
                  LayoutDirection = ldHorizontal
                  ShowBorder = False
                  Index = 0
                end
                object ltgFrete: TdxLayoutGroup
                  Parent = ltgCarga
                  CaptionOptions.Text = 'Frete:'
                  Padding.Bottom = -8
                  Padding.Left = -6
                  Padding.Right = -6
                  Padding.Top = -8
                  Padding.AssignedValues = [lpavBottom, lpavLeft, lpavRight, lpavTop]
                  Index = 3
                end
                object ltgSeguro: TdxLayoutGroup
                  Parent = ltgCarga
                  CaptionOptions.Text = 'Seguro:'
                  Padding.Bottom = -8
                  Padding.Left = -6
                  Padding.Right = -6
                  Padding.Top = -8
                  Padding.AssignedValues = [lpavBottom, lpavLeft, lpavRight, lpavTop]
                  Index = 4
                end
                object ltgSeguroMoeda: TdxLayoutGroup
                  Parent = ltgSeguro
                  CaptionOptions.Text = 'New Group'
                  ItemIndex = 3
                  LayoutDirection = ldHorizontal
                  ShowBorder = False
                  Index = 0
                end
                object loicbxAddValoracaoNoValorFob: TdxLayoutItem
                  Parent = ltgOpcoesDiversas
                  CaptionOptions.Visible = False
                  Control = cbxRemoverValoracaoNoValorFob
                  ControlOptions.OriginalHeight = 20
                  ControlOptions.OriginalWidth = 181
                  ControlOptions.ShowBorder = False
                  Index = 3
                end
                object ltgOpcoesDiversas: TdxLayoutGroup
                  Parent = dxLayoutAutoCreatedGroup16
                  AlignHorz = ahClient
                  CaptionOptions.Text = 'Op'#231#245'es Diversas:'
                  ItemIndex = 3
                  Padding.Bottom = -5
                  Padding.Left = -5
                  Padding.Right = -5
                  Padding.Top = -5
                  Padding.AssignedValues = [lpavBottom, lpavLeft, lpavRight, lpavTop]
                  Index = 1
                end
                object loigrdDTC: TdxLayoutItem
                  Parent = ltgTributos
                  AlignVert = avClient
                  CaptionOptions.Text = 'Tributos Calculados:'
                  CaptionOptions.Layout = clTop
                  Control = grdDTC
                  ControlOptions.OriginalHeight = 90
                  ControlOptions.OriginalWidth = 250
                  ControlOptions.ShowBorder = False
                  Index = 1
                end
                object ltgTributos: TdxLayoutGroup
                  Parent = dxLayoutAutoCreatedGroup20
                  AlignHorz = ahRight
                  AlignVert = avClient
                  CaptionOptions.Text = 'Tributos:'
                  Padding.Bottom = -13
                  Padding.Left = -10
                  Padding.Right = -10
                  Padding.Top = -13
                  Padding.AssignedValues = [lpavBottom, lpavLeft, lpavRight, lpavTop]
                  Index = 1
                end
                object ltgMercadoria: TdxLayoutGroup
                  Parent = ltgTributos
                  AlignHorz = ahRight
                  CaptionOptions.Text = 'Mercadoria:'
                  ItemIndex = 1
                  Padding.Bottom = -10
                  Padding.Left = -10
                  Padding.Right = -10
                  Padding.Top = -14
                  Padding.AssignedValues = [lpavBottom, lpavLeft, lpavRight, lpavTop]
                  Index = 0
                end
                object loigrdADV: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup16
                  AlignHorz = ahRight
                  AlignVert = avClient
                  SizeOptions.Width = 358
                  CaptionOptions.Text = 'Valora'#231#227'o Aduaneira:'
                  CaptionOptions.Layout = clTop
                  Control = grdADV
                  ControlOptions.OriginalHeight = 95
                  ControlOptions.OriginalWidth = 358
                  ControlOptions.ShowBorder = False
                  Index = 3
                end
                object loicbxDesembaracoAduaneiro: TdxLayoutItem
                  Parent = ltgOpcoesDiversas
                  CaptionOptions.Visible = False
                  Control = cbxDesembaracoAduaneiro
                  ControlOptions.OriginalHeight = 20
                  ControlOptions.OriginalWidth = 165
                  ControlOptions.ShowBorder = False
                  Index = 1
                end
                object loicbxAdmissaoTemporaria: TdxLayoutItem
                  Parent = ltgOpcoesDiversas
                  CaptionOptions.Visible = False
                  Control = cbxAdmissaoTemporaria
                  ControlOptions.OriginalHeight = 20
                  ControlOptions.OriginalWidth = 125
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
                object loicbxSuspensaoImpostos: TdxLayoutItem
                  Parent = ltgOpcoesDiversas
                  CaptionOptions.Visible = False
                  Control = cbxSuspensaoImpostos
                  ControlOptions.OriginalHeight = 20
                  ControlOptions.OriginalWidth = 137
                  ControlOptions.ShowBorder = False
                  Index = 5
                end
                object loicbxEntrepostoAduaneiro: TdxLayoutItem
                  Parent = ltgOpcoesDiversas
                  CaptionOptions.Visible = False
                  Control = cbxEntrepostoAduaneiro
                  ControlOptions.OriginalHeight = 20
                  ControlOptions.OriginalWidth = 128
                  ControlOptions.ShowBorder = False
                  Index = 2
                end
                object loicbxRemoverFreteTerrirtrioNacionalBCImpostos: TdxLayoutItem
                  Parent = ltgOpcoesDiversas
                  CaptionOptions.Visible = False
                  Control = cbxRemoverFreteTerrirtrioNacionalBCImpostos
                  ControlOptions.OriginalHeight = 20
                  ControlOptions.OriginalWidth = 289
                  ControlOptions.ShowBorder = False
                  Index = 4
                end
                object dxLayoutAutoCreatedGroup20: TdxLayoutAutoCreatedGroup
                  Parent = lclDuimpGroup_Root
                  AlignHorz = ahRight
                  AlignVert = avClient
                  Index = 1
                end
                object dxLayoutItem2: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup24
                  AlignHorz = ahClient
                  CaptionOptions.Text = 'Tipo da Mercadoria:'
                  CaptionOptions.Layout = clTop
                  Control = edtTipoAplicacaoDescricao
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 100
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
                object dxLayoutItem3: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup14
                  AlignHorz = ahClient
                  CaptionOptions.Text = 'Cliente:'
                  CaptionOptions.Layout = clTop
                  Control = edtClienteNome
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 328
                  ControlOptions.ShowBorder = False
                  Index = 1
                end
                object dxLayoutItem8: TdxLayoutItem
                  Parent = ltgUnidadeDespachoCodigo
                  CaptionOptions.Text = 'Desembara'#231'o:'
                  CaptionOptions.Layout = clTop
                  Control = edtUFDesembaracoNome
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 145
                  ControlOptions.ShowBorder = False
                  Index = 2
                end
                object dxLayoutItem11: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup9
                  AlignHorz = ahRight
                  CaptionOptions.Text = 'Importa'#231#227'o:'
                  CaptionOptions.Layout = clTop
                  Control = edtUFImportacaoNome
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 155
                  ControlOptions.ShowBorder = False
                  Index = 3
                end
                object dxLayoutItem12: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup16
                  CaptionOptions.Text = 'Modalidade:'
                  CaptionOptions.Layout = clTop
                  Control = edtModalidades
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 121
                  ControlOptions.ShowBorder = False
                  Index = 2
                end
                object dxLayoutAutoCreatedGroup24: TdxLayoutAutoCreatedGroup
                  Parent = dxLayoutAutoCreatedGroup15
                  LayoutDirection = ldHorizontal
                  Index = 1
                end
                object ltgProcesso: TdxLayoutGroup
                  Parent = dxLayoutAutoCreatedGroup20
                  CaptionOptions.Text = 'Processo:'
                  ItemIndex = 1
                  LayoutDirection = ldHorizontal
                  Padding.Bottom = -10
                  Padding.Left = -5
                  Padding.Right = -5
                  Padding.Top = -10
                  Padding.AssignedValues = [lpavBottom, lpavLeft, lpavRight, lpavTop]
                  Index = 0
                end
                object dxLayoutItem17: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup18
                  CaptionOptions.Text = 'Vinculado ao:'
                  Control = edtProcessoNumeroVinculado
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 121
                  ControlOptions.ShowBorder = False
                  Index = 1
                end
                object loiedtClienteCNPJ: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup14
                  AlignHorz = ahLeft
                  CaptionOptions.Text = 'CNPJ:'
                  CaptionOptions.Layout = clTop
                  Control = edtClienteCNPJ
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 108
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
                object dxLayoutAutoCreatedGroup14: TdxLayoutAutoCreatedGroup
                  Parent = ltgCarga
                  LayoutDirection = ldHorizontal
                  Index = 1
                end
                object dxLayoutAutoCreatedGroup15: TdxLayoutAutoCreatedGroup
                  Parent = dxLayoutAutoCreatedGroup2
                  AlignHorz = ahClient
                  AlignVert = avClient
                  Index = 0
                end
                object dxLayoutAutoCreatedGroup16: TdxLayoutAutoCreatedGroup
                  Parent = dxLayoutAutoCreatedGroup2
                  AlignHorz = ahRight
                  AlignVert = avClient
                  Index = 1
                end
                object dxLayoutAutoCreatedGroup9: TdxLayoutAutoCreatedGroup
                  Parent = dxLayoutAutoCreatedGroup15
                  LayoutDirection = ldHorizontal
                  Index = 2
                end
                object dxLayoutItem1: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup1
                  AlignVert = avClient
                  Offsets.Bottom = -4
                  CaptionOptions.Visible = False
                  CaptionOptions.Layout = clTop
                  Control = btnProcessSave
                  ControlOptions.OriginalHeight = 25
                  ControlOptions.OriginalWidth = 75
                  ControlOptions.ShowBorder = False
                  Enabled = False
                  Index = 0
                end
                object dxLayoutItem4: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup1
                  AlignHorz = ahLeft
                  CaptionOptions.Text = 'cxButton2'
                  CaptionOptions.Visible = False
                  Control = btnProcessCancel
                  ControlOptions.OriginalHeight = 25
                  ControlOptions.OriginalWidth = 75
                  ControlOptions.ShowBorder = False
                  Enabled = False
                  Index = 1
                end
                object dxLayoutAutoCreatedGroup6: TdxLayoutAutoCreatedGroup
                  Parent = dxLayoutAutoCreatedGroup4
                  AlignHorz = ahClient
                  AlignVert = avClient
                  LayoutDirection = ldHorizontal
                  Index = 1
                end
                object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
                  Parent = dxLayoutAutoCreatedGroup4
                  LayoutDirection = ldHorizontal
                  Index = 0
                end
                object dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup
                  Parent = lclDuimpGroup_Root
                  AlignHorz = ahClient
                  AlignVert = avClient
                  Index = 0
                end
                object dxLayoutItem19: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup5
                  AlignHorz = ahRight
                  CaptionOptions.Text = 'Via de Transporte:'
                  CaptionOptions.Layout = clTop
                  Control = edtViaTransporteDescricao
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 158
                  ControlOptions.ShowBorder = False
                  Index = 1
                end
                object dxLayoutItem20: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup5
                  AlignHorz = ahClient
                  CaptionOptions.Text = 'Identifica'#231#227'o da Carga:'
                  CaptionOptions.Layout = clTop
                  Control = edtIdentificacao
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 121
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
                object dxLayoutAutoCreatedGroup5: TdxLayoutAutoCreatedGroup
                  Parent = ltgCarga
                  LayoutDirection = ldHorizontal
                  Index = 2
                end
                object dxLayoutItem21: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup24
                  CaptionOptions.Text = 'Incentivo Fiscal:'
                  CaptionOptions.Layout = clTop
                  Control = cbxIncentivoFiscalNome
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 202
                  ControlOptions.ShowBorder = False
                  Index = 1
                end
                object dxLayoutItem14: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup9
                  AlignHorz = ahRight
                  CaptionOptions.AlignHorz = taRightJustify
                  CaptionOptions.Text = 'UF de'
                  CaptionOptions.Layout = clTop
                  Control = cbxUFImportacao
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 40
                  ControlOptions.ShowBorder = False
                  Index = 2
                end
                object dxLayoutItem10: TdxLayoutItem
                  Parent = ltgUnidadeDespachoCodigo
                  CaptionOptions.AlignHorz = taRightJustify
                  CaptionOptions.Text = 'UF de'
                  CaptionOptions.Layout = clTop
                  Control = cbxUFDesembaraco
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 40
                  ControlOptions.ShowBorder = False
                  Index = 1
                end
                object dxLayoutItem23: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup22
                  AlignHorz = ahClient
                  CaptionOptions.Text = 'Valor Total FOB:'
                  CaptionOptions.Layout = clTop
                  Control = edtFobValorTotal
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 121
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
                object dxLayoutItem24: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup8
                  AlignHorz = ahClient
                  CaptionOptions.AlignHorz = taRightJustify
                  CaptionOptions.Text = 'Valor Total FOB Adi'#231#245'es:'
                  CaptionOptions.Layout = clTop
                  Control = edtFobAdicaoValorTotal
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 121
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
                object dxLayoutItem22: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup22
                  AlignVert = avBottom
                  CaptionOptions.AlignHorz = taRightJustify
                  CaptionOptions.Text = 'Valor Total FOB:'
                  CaptionOptions.Visible = False
                  CaptionOptions.Layout = clTop
                  Control = edtFobValorTotalBRL
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 121
                  ControlOptions.ShowBorder = False
                  Index = 2
                end
                object dxLayoutItem25: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup8
                  AlignVert = avBottom
                  CaptionOptions.Text = 'Valor Total FOB Adi'#231#245'es:'
                  CaptionOptions.Visible = False
                  CaptionOptions.Layout = clTop
                  Control = edtFobAdicaoValorTotalBRL
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 121
                  ControlOptions.ShowBorder = False
                  Index = 2
                end
                object dxLayoutAutoCreatedGroup8: TdxLayoutAutoCreatedGroup
                  Parent = ltgMercadoria
                  LayoutDirection = ldHorizontal
                  Index = 0
                end
                object dxLayoutItem5: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup18
                  AlignVert = avTop
                  Padding.Top = 3
                  Padding.AssignedValues = [lpavTop]
                  CaptionOptions.Text = 'N'#250'mero:'
                  Control = cbxProcessoNumero
                  ControlOptions.OriginalHeight = 23
                  ControlOptions.OriginalWidth = 121
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
                object dxLayoutItem18: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup25
                  AlignHorz = ahClient
                  CaptionOptions.Text = 'Valor Total Valora'#231#227'o AD:'
                  CaptionOptions.Layout = clTop
                  Control = edtValAduaneiraValorTotal
                  ControlOptions.OriginalHeight = 21
                  ControlOptions.OriginalWidth = 128
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
                object dxLayoutItem26: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup25
                  AlignVert = avBottom
                  Control = edtValAduaneiraValorTotalBRL
                  ControlOptions.OriginalHeight = 21
                  ControlOptions.OriginalWidth = 121
                  ControlOptions.ShowBorder = False
                  Index = 2
                end
                object dxLayoutAutoCreatedGroup25: TdxLayoutAutoCreatedGroup
                  Parent = ltgMercadoria
                  AlignHorz = ahClient
                  AlignVert = avTop
                  LayoutDirection = ldHorizontal
                  Index = 3
                end
                object dxLayoutAutoCreatedGroup22: TdxLayoutAutoCreatedGroup
                  Parent = ltgMercadoria
                  LayoutDirection = ldHorizontal
                  Index = 1
                end
                object lsi2: TdxLayoutSeparatorItem
                  Parent = ltgMercadoria
                  CaptionOptions.Text = 'Separator'
                  Index = 2
                end
                object dxLayoutItem27: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup22
                  CaptionOptions.Text = 'Cota'#231#227'o:'
                  CaptionOptions.Layout = clTop
                  Control = edtFobValorCotacao
                  ControlOptions.OriginalHeight = 21
                  ControlOptions.OriginalWidth = 55
                  ControlOptions.ShowBorder = False
                  Index = 1
                end
                object dxLayoutItem28: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup8
                  CaptionOptions.Text = 'Cota'#231#227'o:'
                  CaptionOptions.Layout = clTop
                  Control = edtFobAdicaoValorCotacao
                  ControlOptions.OriginalHeight = 21
                  ControlOptions.OriginalWidth = 55
                  ControlOptions.ShowBorder = False
                  Index = 1
                end
                object dxLayoutItem29: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup25
                  CaptionOptions.Text = 'Cota'#231#227'o:'
                  CaptionOptions.Layout = clTop
                  Control = edtValAduaneiraCotacao
                  ControlOptions.OriginalHeight = 21
                  ControlOptions.OriginalWidth = 55
                  ControlOptions.ShowBorder = False
                  Index = 1
                end
                object loiedtFreteFobValor: TdxLayoutItem
                  Parent = ltgFreteMoeda
                  AlignHorz = ahClient
                  CaptionOptions.AlignHorz = taRightJustify
                  CaptionOptions.Text = 'Valor (USD):'
                  CaptionOptions.Layout = clTop
                  Control = edtFreteFobValor
                  ControlOptions.OriginalHeight = 21
                  ControlOptions.OriginalWidth = 121
                  ControlOptions.ShowBorder = False
                  Index = 4
                end
                object loiedtSeguroFobValor: TdxLayoutItem
                  Parent = ltgSeguroMoeda
                  AlignHorz = ahClient
                  CaptionOptions.AlignHorz = taRightJustify
                  CaptionOptions.Text = 'Valor (USD):'
                  CaptionOptions.Layout = clTop
                  Control = edtSeguroFobValor
                  ControlOptions.OriginalHeight = 21
                  ControlOptions.OriginalWidth = 121
                  ControlOptions.ShowBorder = False
                  Index = 4
                end
                object dxLayoutItem32: TdxLayoutItem
                  Parent = dxLayoutAutoCreatedGroup16
                  CaptionOptions.Text = 'cxDBRadioGroup1'
                  CaptionOptions.Visible = False
                  Control = rgpCanalConsolidado
                  ControlOptions.AutoColor = True
                  ControlOptions.OriginalHeight = 55
                  ControlOptions.OriginalWidth = 185
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
                object dxLayoutAutoCreatedGroup18: TdxLayoutAutoCreatedGroup
                  Parent = ltgProcesso
                  AlignHorz = ahClient
                  Index = 0
                end
                object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
                  Parent = ltgProcesso
                  AlignHorz = ahLeft
                  AlignVert = avTop
                  Index = 1
                end
              end
            end
            object tshGoods: TcxTabSheet
              Caption = 'Mercadorias (0)'
              ImageIndex = 1
              object lclGoods: TdxLayoutControl
                Left = 0
                Top = 0
                Width = 1125
                Height = 665
                Align = alClient
                ParentBackground = True
                TabOrder = 0
                Transparent = True
                LayoutLookAndFeel = lsfMain
                object pclDCI: TcxPageControl
                  Left = 12
                  Top = 12
                  Width = 1101
                  Height = 641
                  Color = 15790320
                  ParentBackground = False
                  ParentColor = False
                  TabOrder = 0
                  Properties.ActivePage = tshDCI
                  Properties.CustomButtons.Buttons = <>
                  ClientRectBottom = 639
                  ClientRectLeft = 2
                  ClientRectRight = 1099
                  ClientRectTop = 25
                  object tshDCI: TcxTabSheet
                    Caption = 'Mercadoria'
                    ImageIndex = 0
                    object dxLayoutControl1: TdxLayoutControl
                      Left = 0
                      Top = 0
                      Width = 1097
                      Height = 614
                      Align = alClient
                      ParentBackground = True
                      TabOrder = 0
                      Transparent = True
                      LayoutLookAndFeel = lsfMain
                      DesignSize = (
                        1097
                        614)
                      object grdDCI: TcxGrid
                        Left = 12
                        Top = 33
                        Width = 742
                        Height = 421
                        TabOrder = 0
                        object grdDCIDBBandedTableView: TcxGridDBBandedTableView
                          Navigator.Buttons.CustomButtons = <>
                          ScrollbarAnnotations.CustomAnnotations = <>
                          DataController.DataSource = damDuimp.dsoDCI
                          DataController.Summary.DefaultGroupSummaryItems = <>
                          DataController.Summary.FooterSummaryItems = <
                            item
                              Format = ',0'
                              Kind = skCount
                              Column = grdDCIDBBandedTableViewAdicao
                            end
                            item
                              Format = ',0.00;-,0.00'
                              Kind = skSum
                              Column = grdDCIDBBandedTableViewCondicaoVendaValorFrete
                            end
                            item
                              Format = ',0.00;-,0.00'
                              Kind = skSum
                              Column = grdDCIDBBandedTableViewCondicaoVendaValorSeguro
                            end
                            item
                              Format = ',0.0000000;-,0.0000000'
                              Kind = skSum
                              Column = grdDCIDBBandedTableViewIncotermValorBRL
                            end
                            item
                              Format = ',0.0000000;-,0.0000000'
                              Kind = skSum
                              Column = grdDCIDBBandedTableViewIncotermValorVcBRL
                            end
                            item
                              Format = ',0.0000000;-,0.0000000'
                              Kind = skSum
                              Column = grdDCIDBBandedTableViewIncotermValorMoedaNegociadaVlcCVT
                            end
                            item
                              Format = ',0.0000000;-,0.0000000'
                              Kind = skSum
                              Column = grdDCIDBBandedTableViewIncotermValorMoedaNegociadaVlc
                            end
                            item
                              Format = ',0.0000000;-,0.0000000'
                              Kind = skSum
                              Column = grdDCIDBBandedTableViewIncotermValorUnitarioVlcCVT
                            end
                            item
                              Format = ',0.0000000;-,0.0000000'
                              Kind = skSum
                              Column = grdDCIDBBandedTableViewIncotermValorUnitarioVlc
                            end>
                          DataController.Summary.SummaryGroups = <>
                          OptionsBehavior.CellHints = True
                          OptionsCustomize.ColumnFiltering = False
                          OptionsCustomize.ColumnMoving = False
                          OptionsCustomize.BandMoving = False
                          OptionsCustomize.BandSizing = False
                          OptionsData.Deleting = False
                          OptionsData.Editing = False
                          OptionsData.Inserting = False
                          OptionsView.CellEndEllipsis = True
                          OptionsView.Footer = True
                          OptionsView.FooterMultiSummaries = True
                          OptionsView.GroupByBox = False
                          OptionsView.Indicator = True
                          Bands = <
                            item
                              Caption = 'Mercadoria'
                              HeaderAlignmentHorz = taLeftJustify
                            end
                            item
                              Caption = 'Produto Interno'
                            end
                            item
                              Caption = 'Modalidade'
                              Visible = False
                            end
                            item
                              Caption = 'Moeda Negociada'
                            end
                            item
                              Caption = 'Sem Valora'#231#227'o'
                              Position.BandIndex = 3
                              Position.ColIndex = 0
                              Visible = False
                            end
                            item
                              Caption = 'Com Valora'#231#227'o'
                              Position.BandIndex = 3
                              Position.ColIndex = 1
                            end
                            item
                              Caption = 'Condi'#231#227'o de Venda'
                            end
                            item
                              Caption = 'Incoterm'
                            end>
                          object grdDCIDBBandedTableViewId: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'Id'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 0
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewAdicao: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'Adicao'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 0
                            Position.ColIndex = 1
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewCamex: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'Camex'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 22
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewCaracterizacaoImportacaoIndicador: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CaracterizacaoImportacaoIndicador'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 20
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewCaracterizacaoImportacaoNI: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CaracterizacaoImportacaoNI'
                            Position.BandIndex = 2
                            Position.ColIndex = 1
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewClienteCodigo: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ClienteCodigo'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 24
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewClienteNome: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ClienteNome'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 25
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaValorBRL: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaValorBRL'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaValorVlcBRL: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaValorVlcBRL'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 28
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaValorFreteBRL: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaValorFreteBRL'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaValorFreteCotacao: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaValorFreteCotacao'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaValorFrete: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaValorFrete'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 6
                            Position.ColIndex = 0
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaValorMoedaNegociada: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaValorMoedaNegociada'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaValorMoedaNegociadaVlc: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaValorMoedaNegociadaVlc'
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaValorSeguroBRL: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaValorSeguroBRL'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaValorSeguroCotacao: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaValorSeguroCotacao'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaValorSeguro: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaValorSeguro'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 6
                            Position.ColIndex = 1
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaMoedaNegociadaSimboloCVT: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaMoedaNegociadaSimboloCVT'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaMoedaNegociadaCotacaoCVT: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaMoedaNegociadaCotacaoCVT'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaValorMoedaNegociadaCVT: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaValorMoedaNegociadaCVT'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaValorMoedaNegociadaVlcCVT: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaValorMoedaNegociadaVlcCVT'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaValorUnitarioCVT: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaValorUnitarioCVT'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaValorUnitarioVlcCVT: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaValorUnitarioVlcCVT'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaValorFreteCVT: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaValorFreteCVT'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewCondicaoVendaValorSeguroCVT: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'CondicaoVendaValorSeguroCVT'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewDumping: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'Dumping'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 23
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewFabricanteCodigo: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'FabricanteCodigo'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 3
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewFabricanteCodigoPais: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'FabricanteCodigoPais'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 4
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewFabricanteNIOperador: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'FabricanteNIOperador'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 5
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewFabricanteVersao: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'FabricanteVersao'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 6
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewExportadorCodigo: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ExportadorCodigo'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 7
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewExportadorCodigoPais: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ExportadorCodigoPais'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 8
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewExportadorNIOperador: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ExportadorNIOperador'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 9
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewExportadorVersao: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ExportadorVersao'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 10
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewIncotermCodigo: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'IncotermCodigo'
                            HeaderAlignmentHorz = taCenter
                            Position.BandIndex = 7
                            Position.ColIndex = 0
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewIncotermDescricao: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'IncotermDescricao'
                            Position.BandIndex = 7
                            Position.ColIndex = 1
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewIncotermFrete: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'IncotermFrete'
                            HeaderAlignmentHorz = taCenter
                            Position.BandIndex = 7
                            Position.ColIndex = 2
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewIncotermSeguro: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'IncotermSeguro'
                            HeaderAlignmentHorz = taCenter
                            Position.BandIndex = 7
                            Position.ColIndex = 3
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewIncotermTexto: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'IncotermTexto'
                            Visible = False
                            Position.BandIndex = 7
                            Position.ColIndex = 4
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewIncotermValorBRL: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'IncotermValorBRL'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 4
                            Position.ColIndex = 4
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewIncotermValorVcBRL: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'IncotermValorVlcBRL'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 5
                            Position.ColIndex = 4
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewIncotermValorMoedaNegociada: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'IncotermValorMoedaNegociada'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 4
                            Position.ColIndex = 2
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewIncotermValorMoedaNegociadaVlc: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'IncotermValorMoedaNegociadaVlc'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 5
                            Position.ColIndex = 2
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewIncotermValorUnitario: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'IncotermValorUnitario'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 4
                            Position.ColIndex = 0
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewIncotermValorUnitarioVlc: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'IncotermValorUnitarioVlc'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 5
                            Position.ColIndex = 0
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewIncotermMoedaNegociadaSimboloCVT: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'IncotermMoedaNegociadaSimboloCVT'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 29
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewIncotermMoedaNegociadaCotacaoCVT: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'IncotermMoedaNegociadaCotacaoCVT'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 30
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewIncotermValorMoedaNegociadaCVT: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'IncotermValorMoedaNegociadaCVT'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 4
                            Position.ColIndex = 3
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewIncotermValorMoedaNegociadaVlcCVT: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'IncotermValorMoedaNegociadaVlcCVT'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 5
                            Position.ColIndex = 3
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewIncotermValorUnitarioCVT: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'IncotermValorUnitarioCVT'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 4
                            Position.ColIndex = 1
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewIncotermValorUnitarioVlcCVT: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'IncotermValorUnitarioVlcCVT'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 5
                            Position.ColIndex = 1
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewModalidadeCodigo: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ModalidadeCodigo'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 21
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewModalidadeDescricao: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ModalidadeDescricao'
                            Position.BandIndex = 2
                            Position.ColIndex = 0
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewMoedaNegociadaCodigo: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'MoedaNegociadaCodigo'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewMoedaNegociadaSimbolo: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'MoedaNegociadaSimbolo'
                            Visible = False
                            GroupIndex = 0
                            HeaderAlignmentHorz = taCenter
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewNumeroItem: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'NumeroItem'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 0
                            Position.ColIndex = 2
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewPesoLiquido: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'PesoLiquido'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 0
                            Position.ColIndex = 19
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewPesoLiquidoUnitario: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'PesoLiquidoUnitario'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 0
                            Position.ColIndex = 18
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewProdutoCodigo: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ProdutoCodigo'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 0
                            Position.ColIndex = 11
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewProdutoCodigoInterno: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ProdutoCodigoInterno'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 1
                            Position.ColIndex = 0
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewProdutoDescricao: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ProdutoDescricao'
                            Position.BandIndex = 0
                            Position.ColIndex = 14
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewProdutoDescricaoInterno: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ProdutoDescricaoInterno'
                            DataBinding.IsNullValueType = True
                            Visible = False
                            Position.BandIndex = 1
                            Position.ColIndex = 3
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewProdutoNCM: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ProdutoNCM'
                            HeaderAlignmentHorz = taCenter
                            Position.BandIndex = 1
                            Position.ColIndex = 1
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewProdutoNIResponsavel: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ProdutoNIResponsavel'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 13
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewProdutoNomeInterno: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ProdutoNomeInterno'
                            Position.BandIndex = 1
                            Position.ColIndex = 2
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewProdutoVersao: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ProdutoVersao'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 0
                            Position.ColIndex = 12
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewQuantidadeComercial: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'QuantidadeComercial'
                            HeaderAlignmentHorz = taRightJustify
                            Position.BandIndex = 0
                            Position.ColIndex = 17
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewTipoAplicacao: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'TipoAplicacao'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 26
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewTipoAplicacaoDescricao: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'TipoAplicacaoDescricao'
                            Visible = False
                            Position.BandIndex = 0
                            Position.ColIndex = 27
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewUnidadeComercialCodigo: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'UnidadeComercialCodigo'
                            HeaderAlignmentHorz = taCenter
                            Position.BandIndex = 0
                            Position.ColIndex = 15
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewUnidadeComercial: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'UnidadeComercial'
                            Position.BandIndex = 0
                            Position.ColIndex = 16
                            Position.RowIndex = 0
                          end
                          object grdDCIDBBandedTableViewValorUnitario: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ValorUnitario'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewValorUnitarioBRL: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ValorUnitarioBRL'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewValorUnitarioVlc: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ValorUnitarioVlc'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewValorUnitarioVlcBRL: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'ValorUnitarioVlcBRL'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                          object grdDCIDBBandedTableViewVersaoId: TcxGridDBBandedColumn
                            DataBinding.FieldName = 'VersaoId'
                            Visible = False
                            Position.BandIndex = -1
                            Position.ColIndex = -1
                            Position.RowIndex = -1
                          end
                        end
                        object grdDCILevel: TcxGridLevel
                          GridView = grdDCIDBBandedTableView
                        end
                      end
                      object redIncotermTexto: TcxDBRichEdit
                        Left = 12
                        Top = 533
                        DataBinding.DataField = 'IncotermTexto'
                        DataBinding.DataSource = damDuimp.dsoDCI
                        Properties.HideScrollBars = False
                        Properties.ReadOnly = True
                        Properties.ScrollBars = ssVertical
                        Style.Color = clInfoBk
                        TabOrder = 3
                        Height = 69
                        Width = 742
                      end
                      object grdDAD: TcxGrid
                        Left = 770
                        Top = 33
                        Width = 315
                        Height = 569
                        TabOrder = 4
                        object grdDADDBTableView: TcxGridDBTableView
                          Navigator.Buttons.CustomButtons = <>
                          ScrollbarAnnotations.CustomAnnotations = <>
                          DataController.DataSource = damDuimp.dsoDAD
                          DataController.Summary.DefaultGroupSummaryItems = <>
                          DataController.Summary.FooterSummaryItems = <
                            item
                              Format = ',0'
                              Kind = skCount
                              Column = grdDADDBTableViewMoedaNegociadaSimbolo
                            end
                            item
                              Format = ',0.00;-,0.00'
                              Kind = skSum
                              Column = grdDADDBTableViewValorBRL
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
                          object grdDADDBTableViewId: TcxGridDBColumn
                            DataBinding.FieldName = 'Id'
                            Visible = False
                          end
                          object grdDADDBTableViewTipo: TcxGridDBColumn
                            DataBinding.FieldName = 'Tipo'
                            Visible = False
                          end
                          object grdDADDBTableViewMoedaNegociadaSimbolo: TcxGridDBColumn
                            DataBinding.FieldName = 'MoedaNegociadaSimbolo'
                            HeaderAlignmentHorz = taCenter
                          end
                          object grdDADDBTableViewMoedaNegociadaValor: TcxGridDBColumn
                            DataBinding.FieldName = 'MoedaNegociadaValor'
                            HeaderAlignmentHorz = taRightJustify
                          end
                          object grdDADDBTableViewDenominacaoCodigo: TcxGridDBColumn
                            DataBinding.FieldName = 'DenominacaoCodigo'
                            Visible = False
                          end
                          object grdDADDBTableViewValorBRL: TcxGridDBColumn
                            DataBinding.FieldName = 'ValorBRL'
                            HeaderAlignmentHorz = taRightJustify
                          end
                          object grdDADDBTableViewDenominacaoDescricao: TcxGridDBColumn
                            DataBinding.FieldName = 'DenominacaoDescricao'
                          end
                          object grdDADDBTableViewCapaItemId: TcxGridDBColumn
                            DataBinding.FieldName = 'CapaItemId'
                            Visible = False
                          end
                        end
                        object grdDADLevel: TcxGridLevel
                          GridView = grdDADDBTableView
                        end
                      end
                      object edtProdutoCodigoInterno: TcxDBButtonEdit
                        Left = 12
                        Top = 482
                        Anchors = [akLeft, akBottom]
                        DataBinding.DataField = 'ProdutoCodigoInterno'
                        DataBinding.DataSource = damDuimp.dsoDCI
                        Properties.Buttons = <
                          item
                            Action = actFindProdutoCodigoInterno
                            Default = True
                            Kind = bkGlyph
                          end
                          item
                            Action = actShowProdutoCodigoInterno
                            Kind = bkGlyph
                          end>
                        Properties.Images = iglImageList
                        Properties.OnEditValueChanged = edtProdutoCodigoInternoPropertiesEditValueChanged
                        TabOrder = 1
                        Width = 121
                      end
                      object edtProdutoNomeInterno: TcxDBTextEdit
                        Left = 140
                        Top = 485
                        Anchors = [akLeft, akBottom]
                        AutoSize = False
                        DataBinding.DataField = 'ProdutoNomeInterno'
                        DataBinding.DataSource = damDuimp.dsoDCI
                        Properties.ReadOnly = True
                        Style.Color = clBtnFace
                        TabOrder = 2
                        Height = 20
                        Width = 614
                      end
                      object dxLayoutControl1Group_Root: TdxLayoutGroup
                        AlignHorz = ahClient
                        AlignVert = avClient
                        Hidden = True
                        ItemIndex = 1
                        LayoutDirection = ldHorizontal
                        ShowBorder = False
                        Index = -1
                      end
                      object loigrdDCI: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup3
                        AlignVert = avClient
                        CaptionOptions.Text = ' '
                        CaptionOptions.Layout = clTop
                        Control = grdDCI
                        ControlOptions.OriginalHeight = 390
                        ControlOptions.OriginalWidth = 58
                        ControlOptions.ShowBorder = False
                        Index = 0
                      end
                      object loiIncotermTexto: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup3
                        SizeOptions.Height = 90
                        CaptionOptions.Text = 'Incoterm Informa'#231#227'o:'
                        CaptionOptions.Layout = clTop
                        Control = redIncotermTexto
                        ControlOptions.OriginalHeight = 69
                        ControlOptions.OriginalWidth = 752
                        ControlOptions.ShowBorder = False
                        Index = 2
                      end
                      object loigrdDAD: TdxLayoutItem
                        Parent = dxLayoutControl1Group_Root
                        AlignVert = avClient
                        SizeOptions.Height = 110
                        SizeOptions.Width = 315
                        CaptionOptions.Text = 'Acr'#233'scimos e Dedu'#231#245'es de Valora'#231#227'o Aduaneira:'
                        CaptionOptions.Layout = clTop
                        Control = grdDAD
                        ControlOptions.OriginalHeight = 200
                        ControlOptions.OriginalWidth = 315
                        ControlOptions.ShowBorder = False
                        Index = 2
                      end
                      object dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup
                        Parent = dxLayoutControl1Group_Root
                        AlignHorz = ahClient
                        Index = 0
                      end
                      object lsi3: TdxLayoutSplitterItem
                        Parent = dxLayoutControl1Group_Root
                        Offsets.Left = -4
                        Offsets.Right = -4
                        SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
                        SizeOptions.SizableHorz = False
                        SizeOptions.SizableVert = False
                        CaptionOptions.Text = 'Splitter'
                        Index = 1
                      end
                      object loiedtProdutoCodigoInterno: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup7
                        AlignHorz = ahLeft
                        CaptionOptions.Text = 'Produto:'
                        CaptionOptions.Layout = clTop
                        Control = edtProdutoCodigoInterno
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 121
                        ControlOptions.ShowBorder = False
                        Index = 0
                      end
                      object loiedtProdutoNomeInterno: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup7
                        AlignHorz = ahClient
                        AlignVert = avBottom
                        CaptionOptions.Layout = clTop
                        Control = edtProdutoNomeInterno
                        ControlOptions.OriginalHeight = 20
                        ControlOptions.OriginalWidth = 121
                        ControlOptions.ShowBorder = False
                        Index = 1
                      end
                      object dxLayoutAutoCreatedGroup7: TdxLayoutAutoCreatedGroup
                        Parent = dxLayoutAutoCreatedGroup3
                        LayoutDirection = ldHorizontal
                        Index = 1
                      end
                    end
                  end
                  object tshTRI: TcxTabSheet
                    Caption = 'Tributos'
                    ImageIndex = 1
                    object dxLayoutControl2: TdxLayoutControl
                      Left = 0
                      Top = 0
                      Width = 1097
                      Height = 614
                      Align = alClient
                      ParentBackground = True
                      TabOrder = 0
                      Transparent = True
                      LayoutLookAndFeel = lsfMain
                      object edtMercadoriaValorLocalEmbarqueBRL: TcxDBTextEdit
                        Left = 19
                        Top = 71
                        DataBinding.DataField = 'MercadoriaValorLocalEmbarqueBRL'
                        DataBinding.DataSource = damDuimp.dsoDIT
                        Properties.ReadOnly = True
                        TabOrder = 0
                        Width = 136
                      end
                      object edtMercadoriaValorAduaneiroBRL: TcxDBTextEdit
                        Left = 305
                        Top = 71
                        DataBinding.DataField = 'MercadoriaValorAduaneiroBRL'
                        DataBinding.DataSource = damDuimp.dsoDIT
                        Properties.ReadOnly = True
                        TabOrder = 2
                        Width = 121
                      end
                      object edtIncotermValorBRL: TcxDBTextEdit
                        Left = 162
                        Top = 71
                        DataBinding.DataField = 'IncotermValorBRL'
                        DataBinding.DataSource = damDuimp.dsoDCI
                        Properties.ReadOnly = True
                        TabOrder = 1
                        Width = 136
                      end
                      object grdDIA: TcxGrid
                        Left = 12
                        Top = 133
                        Width = 675
                        Height = 469
                        TabOrder = 3
                        object grdDIADBTableView: TcxGridDBTableView
                          Navigator.Buttons.CustomButtons = <>
                          ScrollbarAnnotations.CustomAnnotations = <>
                          DataController.DataSource = damDuimp.dsoDIA
                          DataController.Summary.DefaultGroupSummaryItems = <>
                          DataController.Summary.FooterSummaryItems = <
                            item
                              Format = ',0'
                              Kind = skCount
                              Column = grdDIADBTableViewTributoCodigo
                            end>
                          DataController.Summary.SummaryGroups = <>
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
                          object grdDIADBTableViewId: TcxGridDBColumn
                            DataBinding.FieldName = 'Id'
                            Visible = False
                          end
                          object grdDIADBTableViewTributoCodigo: TcxGridDBColumn
                            DataBinding.FieldName = 'TributoCodigo'
                            FooterAlignmentHorz = taRightJustify
                          end
                          object grdDIADBTableViewRegimeCodigo: TcxGridDBColumn
                            DataBinding.FieldName = 'RegimeCodigo'
                            Visible = False
                          end
                          object grdDIADBTableViewRegimeDescricao: TcxGridDBColumn
                            DataBinding.FieldName = 'RegimeDescricao'
                          end
                          object grdDIADBTableViewFundamentoCodigo: TcxGridDBColumn
                            DataBinding.FieldName = 'FundamentoCodigo'
                            Visible = False
                          end
                          object grdDIADBTableViewItemTributoId: TcxGridDBColumn
                            DataBinding.FieldName = 'ItemTributoId'
                            Visible = False
                          end
                          object grdDIADBTableViewFundamentoDescricao: TcxGridDBColumn
                            DataBinding.FieldName = 'FundamentoDescricao'
                          end
                        end
                        object grdDIALevel: TcxGridLevel
                          GridView = grdDIADBTableView
                        end
                      end
                      object grdDIC: TcxGrid
                        Left = 694
                        Top = 133
                        Width = 391
                        Height = 469
                        TabOrder = 4
                        object grdDICSelDBLayoutView: TcxGridDBLayoutView
                          Navigator.Buttons.CustomButtons = <>
                          ScrollbarAnnotations.CustomAnnotations = <>
                          DataController.DataSource = damDuimp.dsoDICSel
                          DataController.DetailKeyFieldNames = 'Id'
                          DataController.KeyFieldNames = 'Id'
                          DataController.MasterKeyFieldNames = 'Id'
                          DataController.Summary.DefaultGroupSummaryItems = <>
                          DataController.Summary.FooterSummaryItems = <>
                          DataController.Summary.SummaryGroups = <>
                          OptionsBehavior.CellHints = True
                          OptionsCustomize.ItemFiltering = False
                          OptionsData.Deleting = False
                          OptionsData.Editing = False
                          OptionsData.Inserting = False
                          OptionsView.CellEndEllipsis = True
                          OptionsView.CellBorders = False
                          OptionsView.RecordCaption.Visible = False
                          OptionsView.ShowOnlyEntireRecords = False
                          OptionsView.SingleRecordStretch = srsVertical
                          OptionsView.ViewMode = lvvmSingleRow
                          object grdDICSelDBLayoutViewDuimpItcId: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'Id'
                            Visible = False
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem1
                          end
                          object grdDICSelDBLayoutViewCodigoFundamentoLegalNormal: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'CodigoFundamentoLegalNormal'
                            Visible = False
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem2
                          end
                          object grdDICSelDBLayoutViewDescricaoFundamentoLegalNormal: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'DescricaoFundamentoLegalNormal'
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem3
                          end
                          object grdDICSelDBLayoutViewBaseCalculoBRL: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'BaseCalculoBRL'
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem4
                          end
                          object grdDICSelDBLayoutViewBaseCalculoEspecificaBRL: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'BaseCalculoEspecificaBRL'
                            Visible = False
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem5
                          end
                          object grdDICSelDBLayoutViewBaseCalculoReduzidaBRL: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'BaseCalculoReduzidaBRL'
                            Visible = False
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem6
                          end
                          object grdDICSelDBLayoutViewPercentualReducaoBaseCalculo: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'PercentualReducaoBaseCalculo'
                            Visible = False
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem7
                          end
                          object grdDICSelDBLayoutViewTipoAliquota: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'TipoAliquota'
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem8
                          end
                          object grdDICSelDBLayoutViewPercentualReducaoAliquotaReduzida: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'PercentualReducaoAliquotaReduzida'
                            Visible = False
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem9
                          end
                          object grdDICSelDBLayoutViewValorAliquota: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'ValorAliquota'
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem10
                          end
                          object grdDICSelDBLayoutViewValorAliquotaEspecifica: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'ValorAliquotaEspecifica'
                            Visible = False
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem11
                          end
                          object grdDICSelDBLayoutViewValorAliquotaReduzida: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'ValorAliquotaReduzida'
                            Visible = False
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem12
                          end
                          object grdDICSelDBLayoutViewNormal: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'Normal'
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem13
                          end
                          object grdDICSelDBLayoutViewTributado: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'Tributado'
                            Visible = False
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem14
                          end
                          object grdDICSelDBLayoutViewPercentualPagamento: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'PercentualPagamento'
                            Visible = False
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem15
                          end
                          object grdDICSelDBLayoutViewCalculado: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'Calculado'
                            Visible = False
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem16
                          end
                          object grdDICSelDBLayoutViewAReduzir: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'AReduzir'
                            Visible = False
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem17
                          end
                          object grdDICSelDBLayoutViewDevido: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'Devido'
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem18
                          end
                          object grdDICSelDBLayoutViewSuspenso: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'Suspenso'
                            Visible = False
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem19
                          end
                          object grdDICSelDBLayoutViewARecolher: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'ARecolher'
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem20
                          end
                          object grdDICSelDBLayoutViewOriginalDevido: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'OriginalDevido'
                            Visible = False
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem21
                          end
                          object grdDICSelDBLayoutViewCalculadoPagProporcional: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'CalculadoPagProporcional'
                            Visible = False
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem22
                          end
                          object grdDICSelDBLayoutViewDuimpItId: TcxGridDBLayoutViewItem
                            DataBinding.FieldName = 'ItemTributoId'
                            Visible = False
                            LayoutItem = grdDICSelDBLayoutViewLayoutItem23
                          end
                          object grdDICSelDBLayoutViewGroup_Root: TdxLayoutGroup
                            AlignHorz = ahLeft
                            AlignVert = avTop
                            CaptionOptions.Text = 'Template Layout'
                            Hidden = True
                            ItemIndex = 1
                            ShowBorder = False
                            Index = -1
                          end
                          object grdDICSelDBLayoutViewLayoutItem1: TcxGridLayoutItem
                            Index = -1
                          end
                          object grdDICSelDBLayoutViewLayoutItem2: TcxGridLayoutItem
                            Index = -1
                          end
                          object grdDICSelDBLayoutViewLayoutItem3: TcxGridLayoutItem
                            Parent = grdDICSelDBLayoutViewGroup_Root
                            AlignHorz = ahLeft
                            AlignVert = avTop
                            SizeOptions.Width = 333
                            CaptionOptions.Layout = clTop
                            Index = 0
                          end
                          object grdDICSelDBLayoutViewLayoutItem4: TcxGridLayoutItem
                            Parent = grdDICSelDBLayoutViewAutoCreatedGroup2
                            AlignVert = avClient
                            SizeOptions.Width = 111
                            CaptionOptions.Layout = clTop
                            Index = 0
                          end
                          object grdDICSelDBLayoutViewLayoutItem5: TcxGridLayoutItem
                            Index = -1
                          end
                          object grdDICSelDBLayoutViewLayoutItem6: TcxGridLayoutItem
                            Index = -1
                          end
                          object grdDICSelDBLayoutViewLayoutItem7: TcxGridLayoutItem
                            Index = -1
                          end
                          object grdDICSelDBLayoutViewLayoutItem8: TcxGridLayoutItem
                            Parent = grdDICSelDBLayoutViewAutoCreatedGroup2
                            AlignVert = avClient
                            SizeOptions.Width = 111
                            CaptionOptions.Layout = clTop
                            Index = 1
                          end
                          object grdDICSelDBLayoutViewLayoutItem9: TcxGridLayoutItem
                            Index = -1
                          end
                          object grdDICSelDBLayoutViewLayoutItem10: TcxGridLayoutItem
                            Parent = grdDICSelDBLayoutViewAutoCreatedGroup2
                            AlignVert = avClient
                            SizeOptions.Width = 111
                            CaptionOptions.Layout = clTop
                            Index = 2
                          end
                          object grdDICSelDBLayoutViewLayoutItem11: TcxGridLayoutItem
                            Index = -1
                          end
                          object grdDICSelDBLayoutViewLayoutItem12: TcxGridLayoutItem
                            Index = -1
                          end
                          object grdDICSelDBLayoutViewLayoutItem13: TcxGridLayoutItem
                            Parent = grdDICSelDBLayoutViewAutoCreatedGroup3
                            AlignHorz = ahLeft
                            SizeOptions.Width = 111
                            CaptionOptions.Layout = clTop
                            Index = 0
                          end
                          object grdDICSelDBLayoutViewLayoutItem14: TcxGridLayoutItem
                            Index = -1
                          end
                          object grdDICSelDBLayoutViewLayoutItem15: TcxGridLayoutItem
                            Index = -1
                          end
                          object grdDICSelDBLayoutViewLayoutItem16: TcxGridLayoutItem
                            Index = -1
                          end
                          object grdDICSelDBLayoutViewLayoutItem17: TcxGridLayoutItem
                            Index = -1
                          end
                          object grdDICSelDBLayoutViewLayoutItem18: TcxGridLayoutItem
                            Parent = grdDICSelDBLayoutViewAutoCreatedGroup3
                            AlignHorz = ahClient
                            AlignVert = avBottom
                            SizeOptions.Width = 111
                            CaptionOptions.Layout = clTop
                            Index = 2
                          end
                          object grdDICSelDBLayoutViewLayoutItem19: TcxGridLayoutItem
                            Index = -1
                          end
                          object grdDICSelDBLayoutViewLayoutItem20: TcxGridLayoutItem
                            Parent = grdDICSelDBLayoutViewAutoCreatedGroup3
                            AlignVert = avClient
                            SizeOptions.Width = 111
                            CaptionOptions.Layout = clTop
                            Index = 1
                          end
                          object grdDICSelDBLayoutViewLayoutItem21: TcxGridLayoutItem
                            Index = -1
                          end
                          object grdDICSelDBLayoutViewLayoutItem22: TcxGridLayoutItem
                            Index = -1
                          end
                          object grdDICSelDBLayoutViewLayoutItem23: TcxGridLayoutItem
                            Index = -1
                          end
                          object grdDICSelDBLayoutViewAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
                            Parent = grdDICSelDBLayoutViewGroup_Root
                            LayoutDirection = ldHorizontal
                            Index = 1
                          end
                          object grdDICSelDBLayoutViewAutoCreatedGroup3: TdxLayoutAutoCreatedGroup
                            Parent = grdDICSelDBLayoutViewGroup_Root
                            LayoutDirection = ldHorizontal
                            Index = 2
                          end
                        end
                        object grdDICDBTableView: TcxGridDBTableView
                          Navigator.Buttons.CustomButtons = <>
                          ScrollbarAnnotations.CustomAnnotations = <>
                          DataController.DataSource = damDuimp.dsoDIC
                          DataController.Summary.DefaultGroupSummaryItems = <>
                          DataController.Summary.FooterSummaryItems = <>
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
                          OptionsView.GroupByBox = False
                          OptionsView.Header = False
                          OptionsView.Indicator = True
                          object grdDICDBTableViewId: TcxGridDBColumn
                            DataBinding.FieldName = 'Id'
                            Visible = False
                          end
                          object grdDICDBTableViewTipo: TcxGridDBColumn
                            DataBinding.FieldName = 'Tipo'
                          end
                          object grdDICDBTableViewItemTributoId: TcxGridDBColumn
                            DataBinding.FieldName = 'ItemTributoId'
                            Visible = False
                          end
                        end
                        object grdDICLevel: TcxGridLevel
                          GridView = grdDICDBTableView
                          object grdDICSelLevel: TcxGridLevel
                            GridView = grdDICSelDBLayoutView
                          end
                        end
                      end
                      object dxLayoutControl2Group_Root: TdxLayoutGroup
                        AlignHorz = ahParentManaged
                        AlignVert = avParentManaged
                        Hidden = True
                        ShowBorder = False
                        Index = -1
                      end
                      object loigrdDIA: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup21
                        AlignHorz = ahClient
                        AlignVert = avClient
                        SizeOptions.Height = 170
                        CaptionOptions.Text = 'Tributa'#231#227'o:'
                        CaptionOptions.Layout = clTop
                        Control = grdDIA
                        ControlOptions.OriginalHeight = 152
                        ControlOptions.OriginalWidth = 250
                        ControlOptions.ShowBorder = False
                        Index = 0
                      end
                      object dxLayoutGroup4: TdxLayoutGroup
                        Parent = dxLayoutControl2Group_Root
                        AlignHorz = ahLeft
                        CaptionOptions.Text = 'Valor da Mercadoria:'
                        LayoutDirection = ldHorizontal
                        Padding.Bottom = -8
                        Padding.Left = -8
                        Padding.Right = -8
                        Padding.Top = -8
                        Padding.AssignedValues = [lpavBottom, lpavLeft, lpavRight, lpavTop]
                        Index = 0
                      end
                      object loiMercadoriaValorLocalEmbarqueBRL: TdxLayoutItem
                        Parent = dxLayoutGroup4
                        CaptionOptions.Text = 'Local de Embarque (BRL):'
                        CaptionOptions.Layout = clTop
                        Control = edtMercadoriaValorLocalEmbarqueBRL
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 136
                        ControlOptions.ShowBorder = False
                        Index = 0
                      end
                      object loiIncotermValorBRL: TdxLayoutItem
                        Parent = dxLayoutGroup4
                        CaptionOptions.Text = 'Local de Embarque (BRL):'
                        CaptionOptions.Layout = clTop
                        Control = edtIncotermValorBRL
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 136
                        ControlOptions.ShowBorder = False
                        Index = 1
                      end
                      object loiMercadoriaValorAduaneiroBRL: TdxLayoutItem
                        Parent = dxLayoutGroup4
                        CaptionOptions.Text = 'Valor Aduaneiro (BRL):'
                        CaptionOptions.Layout = clTop
                        Control = edtMercadoriaValorAduaneiroBRL
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 121
                        ControlOptions.ShowBorder = False
                        Index = 2
                      end
                      object loigrdDIC: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup21
                        AlignHorz = ahRight
                        AlignVert = avClient
                        CaptionOptions.Text = 'Tributo:'
                        CaptionOptions.Layout = clTop
                        Control = grdDIC
                        ControlOptions.OriginalHeight = 152
                        ControlOptions.OriginalWidth = 391
                        ControlOptions.ShowBorder = False
                        Index = 1
                      end
                      object dxLayoutAutoCreatedGroup21: TdxLayoutAutoCreatedGroup
                        Parent = dxLayoutControl2Group_Root
                        AlignHorz = ahClient
                        AlignVert = avClient
                        LayoutDirection = ldHorizontal
                        Index = 1
                      end
                    end
                  end
                  object tshCamex: TcxTabSheet
                    Caption = 'Camex'
                    ImageIndex = 2
                    object lclCamex: TdxLayoutControl
                      Left = 0
                      Top = 0
                      Width = 1097
                      Height = 614
                      Align = alClient
                      ParentBackground = True
                      TabOrder = 0
                      Transparent = True
                      LayoutLookAndFeel = lsfMain
                      object grdCMX: TcxGrid
                        Left = 12
                        Top = 12
                        Width = 1073
                        Height = 590
                        TabOrder = 0
                        object grdCMXDBTableView: TcxGridDBTableView
                          Navigator.Buttons.CustomButtons = <>
                          ScrollbarAnnotations.CustomAnnotations = <>
                          DataController.DataSource = damDuimp.dsoDCI
                          DataController.Summary.DefaultGroupSummaryItems = <>
                          DataController.Summary.FooterSummaryItems = <
                            item
                              Format = ',0'
                              Kind = skCount
                              Column = grdCMXDBTableViewAdicao
                            end>
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
                          object grdCMXDBTableViewId: TcxGridDBColumn
                            DataBinding.FieldName = 'Id'
                            Visible = False
                            Options.Editing = False
                          end
                          object grdCMXDBTableViewCamex: TcxGridDBColumn
                            DataBinding.FieldName = 'Camex'
                            PropertiesClassName = 'TcxCheckBoxProperties'
                            Properties.Alignment = taCenter
                            Properties.ImmediatePost = True
                            Properties.NullStyle = nssUnchecked
                            Properties.OnEditValueChanged = grdCMXDBTableViewCamexPropertiesEditValueChanged
                            HeaderAlignmentHorz = taCenter
                          end
                          object grdCMXDBTableViewAdicao: TcxGridDBColumn
                            DataBinding.FieldName = 'Adicao'
                            HeaderAlignmentHorz = taRightJustify
                            Options.Editing = False
                          end
                          object grdCMXDBTableViewNumeroItem: TcxGridDBColumn
                            DataBinding.FieldName = 'NumeroItem'
                            HeaderAlignmentHorz = taRightJustify
                            Options.Editing = False
                          end
                          object grdCMXDBTableViewProdutoCodigo: TcxGridDBColumn
                            DataBinding.FieldName = 'ProdutoCodigo'
                            HeaderAlignmentHorz = taRightJustify
                            Options.Editing = False
                          end
                          object grdCMXDBTableViewProdutoVersao: TcxGridDBColumn
                            DataBinding.FieldName = 'ProdutoVersao'
                            HeaderAlignmentHorz = taRightJustify
                            Options.Editing = False
                          end
                          object grdCMXDBTableViewProdutoCodigoInterno: TcxGridDBColumn
                            DataBinding.FieldName = 'ProdutoCodigoInterno'
                            Visible = False
                            Options.Editing = False
                          end
                          object grdCMXDBTableViewProdutoDescricao: TcxGridDBColumn
                            DataBinding.FieldName = 'ProdutoDescricao'
                            Options.Editing = False
                            Width = 550
                          end
                          object grdCMXDBTableViewProdutoDescricaoInterno: TcxGridDBColumn
                            DataBinding.FieldName = 'ProdutoDescricaoInterno'
                            DataBinding.IsNullValueType = True
                            Visible = False
                            Options.Editing = False
                          end
                          object grdCMXDBTableViewVersaoId: TcxGridDBColumn
                            DataBinding.FieldName = 'VersaoId'
                            Visible = False
                            Options.Editing = False
                          end
                        end
                        object grdCMXLevel: TcxGridLevel
                          GridView = grdCMXDBTableView
                        end
                      end
                      object lclCamexGroup_Root: TdxLayoutGroup
                        AlignHorz = ahParentManaged
                        AlignVert = avParentManaged
                        Hidden = True
                        ShowBorder = False
                        Index = -1
                      end
                      object dxLayoutItem6: TdxLayoutItem
                        Parent = lclCamexGroup_Root
                        AlignVert = avClient
                        CaptionOptions.Layout = clTop
                        Control = grdCMX
                        ControlOptions.OriginalHeight = 200
                        ControlOptions.OriginalWidth = 250
                        ControlOptions.ShowBorder = False
                        Index = 0
                      end
                    end
                  end
                  object tshDUM: TcxTabSheet
                    Caption = 'Dumping'
                    ImageIndex = 3
                    object lclDUM: TdxLayoutControl
                      Left = 0
                      Top = 0
                      Width = 1097
                      Height = 614
                      Align = alClient
                      ParentBackground = True
                      TabOrder = 0
                      Transparent = True
                      LayoutLookAndFeel = lsfMain
                      object grdDUM: TcxGrid
                        Left = 12
                        Top = 12
                        Width = 1073
                        Height = 590
                        TabOrder = 0
                        object grdDUMDBTableView: TcxGridDBTableView
                          Navigator.Buttons.CustomButtons = <>
                          ScrollbarAnnotations.CustomAnnotations = <>
                          DataController.DataSource = damDuimp.dsoDCI
                          DataController.Summary.DefaultGroupSummaryItems = <>
                          DataController.Summary.FooterSummaryItems = <
                            item
                              Format = ',0'
                              Kind = skCount
                            end>
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
                          object grdDUMDBTableViewId: TcxGridDBColumn
                            DataBinding.FieldName = 'Id'
                            Visible = False
                            Options.Editing = False
                          end
                          object grdDUMDBTableViewDumping: TcxGridDBColumn
                            DataBinding.FieldName = 'Dumping'
                            PropertiesClassName = 'TcxCheckBoxProperties'
                            Properties.Alignment = taCenter
                            Properties.OnEditValueChanged = grdDUMDBTableViewDumpingPropertiesEditValueChanged
                            HeaderAlignmentHorz = taCenter
                          end
                          object grdDUMDBTableViewAdicao: TcxGridDBColumn
                            DataBinding.FieldName = 'Adicao'
                            HeaderAlignmentHorz = taRightJustify
                            Options.Editing = False
                          end
                          object grdDUMDBTableViewNumeroItem: TcxGridDBColumn
                            DataBinding.FieldName = 'NumeroItem'
                            HeaderAlignmentHorz = taRightJustify
                            Options.Editing = False
                          end
                          object grdDUMDBTableViewProdutoCodigo: TcxGridDBColumn
                            DataBinding.FieldName = 'ProdutoCodigo'
                            HeaderAlignmentHorz = taRightJustify
                            Options.Editing = False
                          end
                          object grdDUMDBTableViewProdutoVersao: TcxGridDBColumn
                            DataBinding.FieldName = 'ProdutoVersao'
                            HeaderAlignmentHorz = taRightJustify
                            Options.Editing = False
                          end
                          object grdDUMDBTableViewProdutoCodigoInterno: TcxGridDBColumn
                            DataBinding.FieldName = 'ProdutoCodigoInterno'
                            Visible = False
                            Options.Editing = False
                          end
                          object grdDUMDBTableViewProdutoDescricao: TcxGridDBColumn
                            DataBinding.FieldName = 'ProdutoDescricao'
                            Options.Editing = False
                            Width = 550
                          end
                          object grdDUMDBTableViewProdutoDescricaoInterno: TcxGridDBColumn
                            DataBinding.FieldName = 'ProdutoDescricaoInterno'
                            DataBinding.IsNullValueType = True
                            Visible = False
                            Options.Editing = False
                          end
                          object grdDUMDBTableViewVersaoId: TcxGridDBColumn
                            DataBinding.FieldName = 'VersaoId'
                            Visible = False
                            Options.Editing = False
                          end
                        end
                        object grdDUMLevel: TcxGridLevel
                          GridView = grdDUMDBTableView
                        end
                      end
                      object dxLayoutGroup1: TdxLayoutGroup
                        AlignHorz = ahParentManaged
                        AlignVert = avParentManaged
                        Hidden = True
                        ShowBorder = False
                        Index = -1
                      end
                      object dxLayoutItem7: TdxLayoutItem
                        Parent = dxLayoutGroup1
                        AlignVert = avClient
                        CaptionOptions.Layout = clTop
                        Control = grdDUM
                        ControlOptions.OriginalHeight = 200
                        ControlOptions.OriginalWidth = 250
                        ControlOptions.ShowBorder = False
                        Index = 0
                      end
                    end
                  end
                  object tshEF: TcxTabSheet
                    Caption = 'Exportador / Fabricante'
                    ImageIndex = 4
                    object lclEF: TdxLayoutControl
                      Left = 0
                      Top = 0
                      Width = 1097
                      Height = 614
                      Align = alClient
                      ParentBackground = True
                      TabOrder = 0
                      Transparent = True
                      LayoutLookAndFeel = lsfMain
                      object edtExpNome: TcxDBTextEdit
                        Left = 67
                        Top = 140
                        DataBinding.DataField = 'Nome'
                        DataBinding.DataSource = damDuimp.dsoDIE
                        Properties.ReadOnly = True
                        TabOrder = 6
                        Width = 994
                      end
                      object edtFabNome: TcxDBTextEdit
                        Left = 67
                        Top = 448
                        DataBinding.DataField = 'Nome'
                        DataBinding.DataSource = damDuimp.dsoDIF
                        Properties.ReadOnly = True
                        TabOrder = 18
                        Width = 994
                      end
                      object edtExpEmail: TcxDBTextEdit
                        Left = 67
                        Top = 170
                        DataBinding.DataField = 'Email'
                        DataBinding.DataSource = damDuimp.dsoDIE
                        Properties.ReadOnly = True
                        TabOrder = 7
                        Width = 994
                      end
                      object edtFabEmail: TcxDBTextEdit
                        Left = 67
                        Top = 478
                        DataBinding.DataField = 'Email'
                        DataBinding.DataSource = damDuimp.dsoDIF
                        Properties.ReadOnly = True
                        TabOrder = 19
                        Width = 994
                      end
                      object edtExpRua: TcxDBTextEdit
                        Left = 66
                        Top = 238
                        DataBinding.DataField = 'Rua'
                        DataBinding.DataSource = damDuimp.dsoDIE
                        Properties.ReadOnly = True
                        TabOrder = 8
                        Width = 868
                      end
                      object edtFabLogradouro: TcxDBTextEdit
                        Left = 66
                        Top = 546
                        DataBinding.DataField = 'Rua'
                        DataBinding.DataSource = damDuimp.dsoDIF
                        Properties.ReadOnly = True
                        TabOrder = 20
                        Width = 868
                      end
                      object edtExpMunicipio: TcxDBTextEdit
                        Left = 240
                        Top = 268
                        DataBinding.DataField = 'Municipio'
                        DataBinding.DataSource = damDuimp.dsoDIE
                        Properties.ReadOnly = True
                        TabOrder = 11
                        Width = 200
                      end
                      object edtFabMunicipio: TcxDBTextEdit
                        Left = 240
                        Top = 576
                        DataBinding.DataField = 'Municipio'
                        DataBinding.DataSource = damDuimp.dsoDIF
                        Properties.ReadOnly = True
                        TabOrder = 23
                        Width = 200
                      end
                      object edtExpCEP: TcxDBTextEdit
                        Left = 477
                        Top = 268
                        DataBinding.DataField = 'CEP'
                        DataBinding.DataSource = damDuimp.dsoDIE
                        Properties.ReadOnly = True
                        TabOrder = 12
                        Width = 70
                      end
                      object edtExpPaisCodigo: TcxDBTextEdit
                        Left = 66
                        Top = 298
                        DataBinding.DataField = 'PaisCodigo'
                        DataBinding.DataSource = damDuimp.dsoDIE
                        Properties.ReadOnly = True
                        TabOrder = 13
                        Width = 70
                      end
                      object edtFabCep: TcxDBTextEdit
                        Left = 477
                        Top = 576
                        DataBinding.DataField = 'CEP'
                        DataBinding.DataSource = damDuimp.dsoDIF
                        Properties.ReadOnly = True
                        TabOrder = 24
                        Width = 70
                      end
                      object edtFabPaisCodigo: TcxDBTextEdit
                        Left = 66
                        Top = 606
                        DataBinding.DataField = 'PaisCodigo'
                        DataBinding.DataSource = damDuimp.dsoDIF
                        Properties.ReadOnly = True
                        TabOrder = 25
                        Width = 70
                      end
                      object edtExpCodigoInterno: TcxDBButtonEdit
                        Left = 450
                        Top = 112
                        AutoSize = False
                        DataBinding.DataField = 'CodigoInterno'
                        DataBinding.DataSource = damDuimp.dsoDIE
                        Properties.Buttons = <
                          item
                            Default = True
                            Glyph.SourceDPI = 96
                            Glyph.Data = {
                              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
                              610000001974455874536F6674776172650041646F626520496D616765526561
                              647971C9653C0000000B744558745469746C65005A6F6F6D3BCF09FEBC000000
                              8D49444154785EB592CB0D83301005433BEE251DB8082A6093D4E02E2C38530E
                              17BB8DCD137A5CACC5D2CAE230A7D11BC99F97AA0E718AF76FB7984004195492
                              41A4BB0F70FC016A4137F502918302040422A0D0C55E2033208613BADC0B5406
                              82E1025D1D0E3C7A841528715FE2728D7DCF688F37CF476AC75F464DDA40B2C6
                              9EC0D18EBD81999144E90A0CF1073A60247E2F791EBF0000000049454E44AE42
                              6082}
                            Kind = bkGlyph
                          end>
                        Properties.ReadOnly = False
                        TabOrder = 5
                        Height = 20
                        Width = 70
                      end
                      object edtFabCodigoInterno: TcxDBButtonEdit
                        Left = 450
                        Top = 418
                        DataBinding.DataField = 'CodigoInterno'
                        DataBinding.DataSource = damDuimp.dsoDIF
                        Properties.Buttons = <
                          item
                            Default = True
                            Glyph.SourceDPI = 96
                            Glyph.Data = {
                              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
                              610000001974455874536F6674776172650041646F626520496D616765526561
                              647971C9653C0000000B744558745469746C65005A6F6F6D3BCF09FEBC000000
                              8D49444154785EB592CB0D83301005433BEE251DB8082A6093D4E02E2C38530E
                              17BB8DCD137A5CACC5D2CAE230A7D11BC99F97AA0E718AF76FB7984004195492
                              41A4BB0F70FC016A4137F502918302040422A0D0C55E2033208613BADC0B5406
                              82E1025D1D0E3C7A841528715FE2728D7DCF688F37CF476AC75F464DDA40B2C6
                              9EC0D18EBD81999144E90A0CF1073A60247E2F791EBF0000000049454E44AE42
                              6082}
                            Kind = bkGlyph
                          end>
                        Properties.ReadOnly = False
                        TabOrder = 17
                        Width = 70
                      end
                      object edtExpVersao: TcxDBTextEdit
                        Left = 67
                        Top = 112
                        AutoSize = False
                        DataBinding.DataField = 'Versao'
                        DataBinding.DataSource = damDuimp.dsoDIE
                        Properties.ReadOnly = True
                        TabOrder = 3
                        Height = 21
                        Width = 70
                      end
                      object edtFabVersao: TcxDBTextEdit
                        Left = 67
                        Top = 418
                        DataBinding.DataField = 'Versao'
                        DataBinding.DataSource = damDuimp.dsoDIF
                        Properties.ReadOnly = True
                        TabOrder = 15
                        Width = 70
                      end
                      object edtExpNIOperador: TcxDBTextEdit
                        Left = 284
                        Top = 112
                        AutoSize = False
                        DataBinding.DataField = 'NIOperador'
                        DataBinding.DataSource = damDuimp.dsoDIE
                        Properties.ReadOnly = True
                        TabOrder = 4
                        Height = 19
                        Width = 70
                      end
                      object edtFabNIOperador: TcxDBTextEdit
                        Left = 284
                        Top = 418
                        AutoSize = False
                        DataBinding.DataField = 'NIOperador'
                        DataBinding.DataSource = damDuimp.dsoDIF
                        Properties.ReadOnly = True
                        TabOrder = 16
                        Height = 23
                        Width = 70
                      end
                      object edtExpCodigo: TcxDBButtonEdit
                        Left = 67
                        Top = 82
                        DataBinding.DataField = 'Codigo'
                        DataBinding.DataSource = damDuimp.dsoDIE
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
                        TabOrder = 2
                        Width = 70
                      end
                      object edtFabCodigo: TcxDBButtonEdit
                        Left = 67
                        Top = 388
                        DataBinding.DataField = 'Codigo'
                        DataBinding.DataSource = damDuimp.dsoDIF
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
                        TabOrder = 14
                        Width = 70
                      end
                      object btnCancelOpe: TcxButton
                        Left = 993
                        Top = 12
                        Width = 75
                        Height = 25
                        Action = actCancelOpe
                        TabOrder = 1
                      end
                      object btnSaveOpe: TcxButton
                        Left = 911
                        Top = 12
                        Width = 75
                        Height = 25
                        Action = actSaveOpe
                        TabOrder = 0
                      end
                      object edtExpRua_Numero: TcxDBTextEdit
                        Left = 994
                        Top = 238
                        AutoSize = False
                        DataBinding.DataField = 'Rua_Numero'
                        DataBinding.DataSource = damDuimp.dsoDIE
                        Properties.ReadOnly = True
                        TabOrder = 9
                        Height = 23
                        Width = 60
                      end
                      object edtFabRua_Numero: TcxDBTextEdit
                        Left = 994
                        Top = 546
                        AutoSize = False
                        DataBinding.DataField = 'Rua_Numero'
                        DataBinding.DataSource = damDuimp.dsoDIF
                        Properties.ReadOnly = True
                        TabOrder = 21
                        Height = 23
                        Width = 60
                      end
                      object edtExpBairro: TcxDBTextEdit
                        Left = 66
                        Top = 268
                        AutoSize = False
                        DataBinding.DataField = 'Bairro'
                        DataBinding.DataSource = damDuimp.dsoDIE
                        Properties.ReadOnly = True
                        TabOrder = 10
                        Height = 23
                        Width = 121
                      end
                      object edtFabBairro: TcxDBTextEdit
                        Left = 66
                        Top = 576
                        AutoSize = False
                        DataBinding.DataField = 'Bairro'
                        DataBinding.DataSource = damDuimp.dsoDIF
                        Properties.ReadOnly = True
                        TabOrder = 22
                        Height = 23
                        Width = 121
                      end
                      object ltgManufacturerOrProducerGroup_Root: TdxLayoutGroup
                        AlignHorz = ahParentManaged
                        AlignVert = avParentManaged
                        Hidden = True
                        ItemIndex = 1
                        ShowBorder = False
                        Index = -1
                      end
                      object loiedtExpNome: TdxLayoutItem
                        Parent = ltgFornecedor
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'Nome:'
                        Control = edtExpNome
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 121
                        ControlOptions.ShowBorder = False
                        Index = 2
                      end
                      object ltgFornecedor: TdxLayoutGroup
                        Parent = dxLayoutAutoCreatedGroup13
                        AlignVert = avClient
                        CaptionOptions.Text = 'Exportador:'
                        ItemIndex = 4
                        Padding.Bottom = -8
                        Padding.Left = -8
                        Padding.Right = -8
                        Padding.Top = -8
                        Padding.AssignedValues = [lpavBottom, lpavLeft, lpavRight, lpavTop]
                        Index = 1
                      end
                      object loiedtFabNome: TdxLayoutItem
                        Parent = ltgFabricante
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'Nome:'
                        Control = edtFabNome
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 121
                        ControlOptions.ShowBorder = False
                        Index = 2
                      end
                      object ltgFabricante: TdxLayoutGroup
                        Parent = ltgManufacturerOrProducerGroup_Root
                        AlignVert = avClient
                        CaptionOptions.Text = 'Fabricante:'
                        ItemIndex = 4
                        Padding.Bottom = -8
                        Padding.Left = -8
                        Padding.Right = -8
                        Padding.Top = -8
                        Padding.AssignedValues = [lpavBottom, lpavLeft, lpavRight, lpavTop]
                        Index = 1
                      end
                      object loiedtExpEmail: TdxLayoutItem
                        Parent = ltgFornecedor
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'Email:'
                        Control = edtExpEmail
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 121
                        ControlOptions.ShowBorder = False
                        Index = 3
                      end
                      object loiedtFabEmail: TdxLayoutItem
                        Parent = ltgFabricante
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'Email:'
                        Control = edtFabEmail
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 121
                        ControlOptions.ShowBorder = False
                        Index = 3
                      end
                      object ltgExpEndereco: TdxLayoutGroup
                        Parent = ltgFornecedor
                        AlignVert = avClient
                        CaptionOptions.Text = 'Endere'#231'o:'
                        ItemIndex = 1
                        Padding.Bottom = -8
                        Padding.Left = -8
                        Padding.Right = -8
                        Padding.Top = -8
                        Padding.AssignedValues = [lpavBottom, lpavLeft, lpavRight, lpavTop]
                        Index = 4
                      end
                      object ltgFabEndereco: TdxLayoutGroup
                        Parent = ltgFabricante
                        AlignVert = avClient
                        CaptionOptions.Text = 'Endere'#231'o:'
                        ItemIndex = 1
                        Padding.Bottom = -8
                        Padding.Left = -8
                        Padding.Right = -8
                        Padding.Top = -8
                        Padding.AssignedValues = [lpavBottom, lpavLeft, lpavRight, lpavTop]
                        Index = 4
                      end
                      object loiedtExpRua: TdxLayoutItem
                        Parent = ltgForEnd1
                        AlignHorz = ahClient
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'Rua:'
                        Control = edtExpRua
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 121
                        ControlOptions.ShowBorder = False
                        Index = 0
                      end
                      object loiedtFabLogradouro: TdxLayoutItem
                        Parent = lagFabEnd1
                        AlignHorz = ahClient
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'Rua:'
                        Control = edtFabLogradouro
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 121
                        ControlOptions.ShowBorder = False
                        Index = 0
                      end
                      object loiedtExpMunicipio: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup17
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'Cidade:'
                        Control = edtExpMunicipio
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 200
                        ControlOptions.ShowBorder = False
                        Index = 1
                      end
                      object loiedtFabMunicipio: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup19
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'Cidade:'
                        Control = edtFabMunicipio
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 200
                        ControlOptions.ShowBorder = False
                        Index = 1
                      end
                      object loiedtExpCEP: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup17
                        AlignHorz = ahLeft
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'CEP:'
                        Control = edtExpCEP
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 70
                        ControlOptions.ShowBorder = False
                        Index = 2
                      end
                      object ltgForEnd1: TdxLayoutGroup
                        Parent = ltgExpEndereco
                        CaptionOptions.Text = 'New Group'
                        CaptionOptions.Visible = False
                        ItemIndex = 1
                        LayoutDirection = ldHorizontal
                        ShowBorder = False
                        Index = 0
                      end
                      object loiedtExpPaisCodigo: TdxLayoutItem
                        Parent = ltgExpEndereco
                        AlignHorz = ahLeft
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'Pa'#237's:'
                        Control = edtExpPaisCodigo
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 70
                        ControlOptions.ShowBorder = False
                        Index = 2
                      end
                      object loiedtFabCep: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup19
                        AlignHorz = ahLeft
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'CEP:'
                        Control = edtFabCep
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 70
                        ControlOptions.ShowBorder = False
                        Index = 2
                      end
                      object lagFabEnd1: TdxLayoutAutoCreatedGroup
                        Parent = ltgFabEndereco
                        AlignVert = avTop
                        LayoutDirection = ldHorizontal
                        Index = 0
                      end
                      object loiedtFabPaisCodigo: TdxLayoutItem
                        Parent = ltgFabEndereco
                        AlignHorz = ahLeft
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'Pa'#237's:'
                        Control = edtFabPaisCodigo
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 70
                        ControlOptions.ShowBorder = False
                        Index = 2
                      end
                      object loiedtExpCodigoInterno: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup12
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'C'#243'digo Interno:'
                        Control = edtExpCodigoInterno
                        ControlOptions.OriginalHeight = 20
                        ControlOptions.OriginalWidth = 70
                        ControlOptions.ShowBorder = False
                        Index = 2
                      end
                      object loiedtFabCodigoInterno: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup11
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'C'#243'digo Interno:'
                        Control = edtFabCodigoInterno
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 70
                        ControlOptions.ShowBorder = False
                        Index = 2
                      end
                      object loiedtExpVersao: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup12
                        AlignHorz = ahLeft
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'Vers'#227'o:'
                        Control = edtExpVersao
                        ControlOptions.OriginalHeight = 21
                        ControlOptions.OriginalWidth = 70
                        ControlOptions.ShowBorder = False
                        Index = 0
                      end
                      object dxLayoutAutoCreatedGroup12: TdxLayoutAutoCreatedGroup
                        Parent = ltgFornecedor
                        LayoutDirection = ldHorizontal
                        Index = 1
                      end
                      object loiedtFabVersao: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup11
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'Vers'#227'o:'
                        Control = edtFabVersao
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 70
                        ControlOptions.ShowBorder = False
                        Index = 0
                      end
                      object dxLayoutAutoCreatedGroup11: TdxLayoutAutoCreatedGroup
                        Parent = ltgFabricante
                        AlignHorz = ahLeft
                        AlignVert = avTop
                        LayoutDirection = ldHorizontal
                        Index = 1
                      end
                      object loiedtExpNIOperador: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup12
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'N'#250'mero de Identifica'#231#227'o:'
                        Control = edtExpNIOperador
                        ControlOptions.OriginalHeight = 19
                        ControlOptions.OriginalWidth = 70
                        ControlOptions.ShowBorder = False
                        Index = 1
                      end
                      object loiedtFabNIOperador: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup11
                        AlignVert = avClient
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'N'#250'mero de Identifica'#231#227'o:'
                        Control = edtFabNIOperador
                        ControlOptions.OriginalHeight = 19
                        ControlOptions.OriginalWidth = 70
                        ControlOptions.ShowBorder = False
                        Index = 1
                      end
                      object loiedtExpCodigo: TdxLayoutItem
                        Parent = ltgFornecedor
                        AlignHorz = ahLeft
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'C'#243'digo:'
                        Control = edtExpCodigo
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 70
                        ControlOptions.ShowBorder = False
                        Index = 0
                      end
                      object loiedtFabCodigo: TdxLayoutItem
                        Parent = ltgFabricante
                        AlignHorz = ahLeft
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'C'#243'digo:'
                        Control = edtFabCodigo
                        ControlOptions.OriginalHeight = 23
                        ControlOptions.OriginalWidth = 70
                        ControlOptions.ShowBorder = False
                        Index = 0
                      end
                      object dxLayoutItem15: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup10
                        AlignHorz = ahRight
                        CaptionOptions.Visible = False
                        Control = btnCancelOpe
                        ControlOptions.OriginalHeight = 25
                        ControlOptions.OriginalWidth = 75
                        ControlOptions.ShowBorder = False
                        Enabled = False
                        Index = 1
                      end
                      object dxLayoutAutoCreatedGroup13: TdxLayoutAutoCreatedGroup
                        Parent = ltgManufacturerOrProducerGroup_Root
                        AlignHorz = ahClient
                        AlignVert = avClient
                        Index = 0
                      end
                      object dxLayoutItem16: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup10
                        AlignHorz = ahRight
                        CaptionOptions.Visible = False
                        Control = btnSaveOpe
                        ControlOptions.OriginalHeight = 25
                        ControlOptions.OriginalWidth = 75
                        ControlOptions.ShowBorder = False
                        Enabled = False
                        Index = 0
                      end
                      object dxLayoutAutoCreatedGroup10: TdxLayoutAutoCreatedGroup
                        Parent = dxLayoutAutoCreatedGroup13
                        LayoutDirection = ldHorizontal
                        Index = 0
                      end
                      object loiedtExpRua_Numero: TdxLayoutItem
                        Parent = ltgForEnd1
                        AlignVert = avClient
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'N'#250'mero:'
                        Control = edtExpRua_Numero
                        ControlOptions.OriginalHeight = 19
                        ControlOptions.OriginalWidth = 60
                        ControlOptions.ShowBorder = False
                        Index = 1
                      end
                      object loiedtFabRua_Numero: TdxLayoutItem
                        Parent = lagFabEnd1
                        AlignVert = avClient
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'N'#250'mero:'
                        Control = edtFabRua_Numero
                        ControlOptions.OriginalHeight = 19
                        ControlOptions.OriginalWidth = 60
                        ControlOptions.ShowBorder = False
                        Index = 1
                      end
                      object dxLayoutAutoCreatedGroup17: TdxLayoutAutoCreatedGroup
                        Parent = ltgExpEndereco
                        LayoutDirection = ldHorizontal
                        Index = 1
                      end
                      object dxLayoutAutoCreatedGroup19: TdxLayoutAutoCreatedGroup
                        Parent = ltgFabEndereco
                        LayoutDirection = ldHorizontal
                        Index = 1
                      end
                      object loiedtExpBairro: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup17
                        AlignVert = avClient
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'Bairro:'
                        Control = edtExpBairro
                        ControlOptions.OriginalHeight = 19
                        ControlOptions.OriginalWidth = 121
                        ControlOptions.ShowBorder = False
                        Index = 0
                      end
                      object loiedtFabBairro: TdxLayoutItem
                        Parent = dxLayoutAutoCreatedGroup19
                        AlignVert = avClient
                        CaptionOptions.AlignHorz = taRightJustify
                        CaptionOptions.Text = 'Bairro:'
                        Control = edtFabBairro
                        ControlOptions.OriginalHeight = 19
                        ControlOptions.OriginalWidth = 121
                        ControlOptions.ShowBorder = False
                        Index = 0
                      end
                    end
                  end
                end
                object ltgGoods_Root: TdxLayoutGroup
                  AlignHorz = ahParentManaged
                  AlignVert = avParentManaged
                  Hidden = True
                  ShowBorder = False
                  Index = -1
                end
                object loipclDCI: TdxLayoutItem
                  Parent = ltgGoods_Root
                  AlignVert = avClient
                  CaptionOptions.Layout = clTop
                  Control = pclDCI
                  ControlOptions.AutoColor = True
                  ControlOptions.OriginalHeight = 193
                  ControlOptions.OriginalWidth = 289
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
              end
            end
            object tshDPG: TcxTabSheet
              Caption = 'Pagamentos (0)'
              ImageIndex = 3
              object lclDPG: TdxLayoutControl
                Left = 0
                Top = 0
                Width = 1125
                Height = 665
                Align = alClient
                ParentBackground = True
                TabOrder = 0
                Transparent = True
                LayoutLookAndFeel = lsfMain
                object grdDPG: TcxGrid
                  Left = 12
                  Top = 12
                  Width = 1101
                  Height = 641
                  TabOrder = 0
                  object grdDPGDBTableView: TcxGridDBTableView
                    Navigator.Buttons.CustomButtons = <>
                    ScrollbarAnnotations.CustomAnnotations = <>
                    DataController.DataSource = damDuimp.dsoDPGSel
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <
                      item
                        Format = ',0.00;-,0.00'
                        Kind = skSum
                        Column = grdDPGDBTableViewValor
                      end
                      item
                        Format = ',0'
                        Kind = skCount
                        Column = grdDPGDBTableViewCodigoReceita
                      end>
                    DataController.Summary.SummaryGroups = <>
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
                    object grdDPGDBTableViewId: TcxGridDBColumn
                      DataBinding.FieldName = 'Id'
                      Visible = False
                    end
                    object grdDPGDBTableViewModalidadeCodigo: TcxGridDBColumn
                      DataBinding.FieldName = 'ModalidadeCodigo'
                      Visible = False
                    end
                    object grdDPGDBTableViewModalidadeDescricao: TcxGridDBColumn
                      DataBinding.FieldName = 'ModalidadeDescricao'
                      Visible = False
                      GroupIndex = 0
                    end
                    object grdDPGDBTableViewCustoCF: TcxGridDBColumn
                      DataBinding.FieldName = 'CustoCF'
                      Visible = False
                    end
                    object grdDPGDBTableViewCusto_EntradaCF: TcxGridDBColumn
                      DataBinding.FieldName = 'Custo_EntradaCF'
                      Visible = False
                    end
                    object grdDPGDBTableViewCusto_OutrosCF: TcxGridDBColumn
                      DataBinding.FieldName = 'Custo_OutrosCF'
                      Visible = False
                    end
                    object grdDPGDBTableViewCusto_SeletivoCF: TcxGridDBColumn
                      DataBinding.FieldName = 'Custo_SeletivoCF'
                      Visible = False
                    end
                    object grdDPGDBTableViewNivelCF: TcxGridDBColumn
                      DataBinding.FieldName = 'NivelCF'
                      Visible = False
                    end
                    object grdDPGDBTableViewTipoCF: TcxGridDBColumn
                      DataBinding.FieldName = 'TipoCF'
                      Visible = False
                    end
                    object grdDPGDBTableViewCodigoReceita: TcxGridDBColumn
                      DataBinding.FieldName = 'CodigoReceita'
                      HeaderAlignmentHorz = taRightJustify
                    end
                    object grdDPGDBTableViewCodigoCF: TcxGridDBColumn
                      DataBinding.FieldName = 'CodigoCF'
                    end
                    object grdDPGDBTableViewDescricaoCF: TcxGridDBColumn
                      DataBinding.FieldName = 'DescricaoCF'
                    end
                    object grdDPGDBTableViewAgencia: TcxGridDBColumn
                      DataBinding.FieldName = 'Agencia'
                      HeaderAlignmentHorz = taRightJustify
                    end
                    object grdDPGDBTableViewBanco: TcxGridDBColumn
                      DataBinding.FieldName = 'Banco'
                      HeaderAlignmentHorz = taRightJustify
                    end
                    object grdDPGDBTableViewConta: TcxGridDBColumn
                      DataBinding.FieldName = 'Conta'
                      HeaderAlignmentHorz = taRightJustify
                    end
                    object grdDPGDBTableViewDataPagamento: TcxGridDBColumn
                      DataBinding.FieldName = 'DataPagamento'
                      HeaderAlignmentHorz = taCenter
                    end
                    object grdDPGDBTableViewTributo: TcxGridDBColumn
                      DataBinding.FieldName = 'Tributo'
                      Visible = False
                    end
                    object grdDPGDBTableViewValor: TcxGridDBColumn
                      DataBinding.FieldName = 'Valor'
                      HeaderAlignmentHorz = taRightJustify
                    end
                    object grdDPGDBTableViewVersaoOrigem: TcxGridDBColumn
                      DataBinding.FieldName = 'VersaoOrigem'
                      Visible = False
                    end
                    object grdDPGDBTableViewDuimpId: TcxGridDBColumn
                      DataBinding.FieldName = 'DuimpId'
                      Visible = False
                    end
                  end
                  object grdDPGLevel: TcxGridLevel
                    GridView = grdDPGDBTableView
                  end
                end
                object lclDPGGroup_Root: TdxLayoutGroup
                  AlignHorz = ahParentManaged
                  AlignVert = avParentManaged
                  Hidden = True
                  ShowBorder = False
                  Index = -1
                end
                object dxLayoutItem9: TdxLayoutItem
                  Parent = lclDPGGroup_Root
                  AlignVert = avClient
                  CaptionOptions.Layout = clTop
                  Control = grdDPG
                  ControlOptions.OriginalHeight = 200
                  ControlOptions.OriginalWidth = 250
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
              end
            end
            object tshExpFab: TcxTabSheet
              Caption = 'Exportadores / Fabricantes'
              ImageIndex = 4
              object lclFornFabric: TdxLayoutControl
                Left = 0
                Top = 0
                Width = 1125
                Height = 665
                Align = alClient
                ParentBackground = True
                TabOrder = 0
                Transparent = True
                LayoutLookAndFeel = lsfMain
                object grdExp: TcxGrid
                  Left = 12
                  Top = 33
                  Width = 1101
                  Height = 307
                  TabOrder = 0
                  object grdExpDBTableView: TcxGridDBTableView
                    Navigator.Buttons.CustomButtons = <>
                    ScrollbarAnnotations.CustomAnnotations = <>
                    DataController.DataSource = damDuimp.dsoEXP
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <
                      item
                        Format = ',0'
                        Kind = skCount
                      end
                      item
                        Format = ',0'
                        Kind = skCount
                      end
                      item
                        Format = ',0'
                        Kind = skCount
                      end>
                    DataController.Summary.SummaryGroups = <>
                    OptionsCustomize.ColumnFiltering = False
                    OptionsCustomize.ColumnGrouping = False
                    OptionsData.Deleting = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsView.ColumnAutoWidth = True
                    OptionsView.Footer = True
                    OptionsView.GroupByBox = False
                    OptionsView.Indicator = True
                    object grdExpDBTableViewAdicao: TcxGridDBColumn
                      DataBinding.FieldName = 'Adicao'
                    end
                    object grdExpDBTableViewCodigo: TcxGridDBColumn
                      DataBinding.FieldName = 'Codigo'
                    end
                    object grdExpDBTableViewNome: TcxGridDBColumn
                      DataBinding.FieldName = 'Nome'
                    end
                    object grdExpDBTableViewEmail: TcxGridDBColumn
                      DataBinding.FieldName = 'Email'
                    end
                    object grdExpDBTableViewNIOperador: TcxGridDBColumn
                      DataBinding.FieldName = 'NIOperador'
                    end
                    object grdExpDBTableViewVersao: TcxGridDBColumn
                      DataBinding.FieldName = 'Versao'
                      HeaderAlignmentHorz = taRightJustify
                    end
                    object grdExpDBTableViewRua: TcxGridDBColumn
                      DataBinding.FieldName = 'Rua'
                    end
                    object grdExpDBTableViewRua_Numero: TcxGridDBColumn
                      DataBinding.FieldName = 'Rua_Numero'
                    end
                    object grdExpDBTableViewBairro: TcxGridDBColumn
                      DataBinding.FieldName = 'Bairro'
                    end
                    object grdExpDBTableViewMunicipio: TcxGridDBColumn
                      DataBinding.FieldName = 'Municipio'
                    end
                    object grdExpDBTableViewCEP: TcxGridDBColumn
                      DataBinding.FieldName = 'CEP'
                    end
                    object grdExpDBTableViewEstado: TcxGridDBColumn
                      DataBinding.FieldName = 'Estado'
                    end
                    object grdExpDBTableViewPaisCodigo: TcxGridDBColumn
                      DataBinding.FieldName = 'PaisCodigo'
                    end
                  end
                  object grdExpLevel: TcxGridLevel
                    GridView = grdExpDBTableView
                  end
                end
                object grdFab: TcxGrid
                  Left = 12
                  Top = 385
                  Width = 1101
                  Height = 268
                  TabOrder = 1
                  object grdFabDBTableView: TcxGridDBTableView
                    Navigator.Buttons.CustomButtons = <>
                    ScrollbarAnnotations.CustomAnnotations = <>
                    DataController.DataSource = damDuimp.dsoFAB
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <
                      item
                        Format = ',0'
                        Kind = skCount
                      end
                      item
                        Format = ',0'
                        Kind = skCount
                      end
                      item
                        Format = ',0'
                        Kind = skCount
                      end>
                    DataController.Summary.SummaryGroups = <>
                    OptionsCustomize.ColumnFiltering = False
                    OptionsCustomize.ColumnGrouping = False
                    OptionsData.Deleting = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsView.ColumnAutoWidth = True
                    OptionsView.Footer = True
                    OptionsView.GroupByBox = False
                    OptionsView.Indicator = True
                    object grdFabDBTableViewAdicao: TcxGridDBColumn
                      DataBinding.FieldName = 'Adicao'
                    end
                    object grdFabDBTableViewCodigo: TcxGridDBColumn
                      DataBinding.FieldName = 'Codigo'
                    end
                    object grdFabDBTableViewNome: TcxGridDBColumn
                      DataBinding.FieldName = 'Nome'
                    end
                    object grdFabDBTableViewEmail: TcxGridDBColumn
                      DataBinding.FieldName = 'Email'
                    end
                    object grdFabDBTableViewNIOperador: TcxGridDBColumn
                      DataBinding.FieldName = 'NIOperador'
                    end
                    object grdFabDBTableViewVersao: TcxGridDBColumn
                      DataBinding.FieldName = 'Versao'
                    end
                    object grdFabDBTableViewRua: TcxGridDBColumn
                      DataBinding.FieldName = 'Rua'
                    end
                    object grdFabDBTableViewRua_Numero: TcxGridDBColumn
                      DataBinding.FieldName = 'Rua_Numero'
                    end
                    object grdFabDBTableViewBairro: TcxGridDBColumn
                      DataBinding.FieldName = 'Bairro'
                    end
                    object grdFabDBTableViewMunicipio: TcxGridDBColumn
                      DataBinding.FieldName = 'Municipio'
                    end
                    object grdFabDBTableViewCEP: TcxGridDBColumn
                      DataBinding.FieldName = 'CEP'
                    end
                    object grdFabDBTableViewEstado: TcxGridDBColumn
                      DataBinding.FieldName = 'Estado'
                    end
                    object grdFabDBTableViewPaisCodigo: TcxGridDBColumn
                      DataBinding.FieldName = 'PaisCodigo'
                    end
                  end
                  object grdFabLevel: TcxGridLevel
                    GridView = grdFabDBTableView
                  end
                end
                object lclFornFabricGroup_Root: TdxLayoutGroup
                  AlignHorz = ahParentManaged
                  AlignVert = avParentManaged
                  CaptionOptions.Text = 'Fornecedor:'
                  Hidden = True
                  ShowBorder = False
                  Index = -1
                end
                object loiOpeExp: TdxLayoutItem
                  Parent = lclFornFabricGroup_Root
                  AlignVert = avClient
                  CaptionOptions.Text = 'Exportador:'
                  CaptionOptions.Layout = clTop
                  Control = grdExp
                  ControlOptions.OriginalHeight = 279
                  ControlOptions.OriginalWidth = 736
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
                object lsi1: TdxLayoutSplitterItem
                  Parent = lclFornFabricGroup_Root
                  SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
                  SizeOptions.SizableHorz = False
                  SizeOptions.SizableVert = False
                  CaptionOptions.Text = 'Splitter'
                  Index = 1
                end
                object loiOpeFab: TdxLayoutItem
                  Parent = lclFornFabricGroup_Root
                  AlignVert = avClient
                  CaptionOptions.Text = 'Fabricante:'
                  CaptionOptions.Layout = clTop
                  Control = grdFab
                  ControlOptions.OriginalHeight = 243
                  ControlOptions.OriginalWidth = 250
                  ControlOptions.ShowBorder = False
                  Index = 2
                end
              end
            end
            object tshInfCompl: TcxTabSheet
              Caption = 'Informa'#231#227'o Complementar'
              ImageIndex = 2
              object lclIFC: TdxLayoutControl
                Left = 0
                Top = 0
                Width = 1125
                Height = 665
                Align = alClient
                ParentBackground = True
                TabOrder = 0
                Transparent = True
                LayoutLookAndFeel = lsfMain
                object redInformacaoComplementar: TcxDBRichEdit
                  Left = 12
                  Top = 12
                  DataBinding.DataField = 'InformacaoComplementar'
                  DataBinding.DataSource = damDuimp.dsoDCR
                  Properties.HideScrollBars = False
                  Properties.ReadOnly = True
                  Properties.ScrollBars = ssBoth
                  Style.Color = clInfoBk
                  TabOrder = 0
                  Height = 641
                  Width = 1101
                end
                object lclIFCGroup_Root: TdxLayoutGroup
                  AlignHorz = ahParentManaged
                  AlignVert = avParentManaged
                  Hidden = True
                  ShowBorder = False
                  Index = -1
                end
                object loiInformacaoComplementar: TdxLayoutItem
                  Parent = lclIFCGroup_Root
                  AlignVert = avClient
                  Control = redInformacaoComplementar
                  ControlOptions.OriginalHeight = 455
                  ControlOptions.OriginalWidth = 185
                  ControlOptions.ShowBorder = False
                  Index = 0
                end
              end
            end
          end
          object lclDUIGroup_Root: TdxLayoutGroup
            AlignHorz = ahParentManaged
            AlignVert = avParentManaged
            Hidden = True
            Padding.Bottom = -5
            Padding.Left = -5
            Padding.Right = -5
            Padding.Top = -4
            Padding.AssignedValues = [lpavBottom, lpavLeft, lpavRight, lpavTop]
            ShowBorder = False
            Index = -1
          end
          object loipclDuimp: TdxLayoutItem
            Parent = lclDUIGroup_Root
            AlignVert = avClient
            Control = pclDuimp
            ControlOptions.AutoColor = True
            ControlOptions.OriginalHeight = 593
            ControlOptions.OriginalWidth = 289
            ControlOptions.ShowBorder = False
            Index = 0
          end
        end
      end
    end
    object btnFindDuimp: TcxButton [2]
      Left = 1137
      Top = 61
      Width = 22
      Height = 20
      Action = actFindDuimp
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000001974455874536F6674776172650041646F626520496D616765526561
        647971C9653C00000026744558745469746C650046696E643B426172733B5269
        62626F6E3B5374616E646172643B536561726368BB659C080000005B49444154
        785EB592C10900310804AFC16B630B4955E9CEE0C129C124FB303EC6C72A2388
        8F88186FEBF24372232F8843CE2E3F094004A81168B882F594B89D834940868F
        7D1384ED1C140BFC801FF50283BEB2734FA025415E3000FE3DA38A41B3014A00
        00000049454E44AE426082}
      PaintStyle = bpsGlyph
      TabOrder = 3
    end
    object cbxRedoDuimp: TcxCheckBox [3]
      Left = 12
      Top = 61
      Caption = 'Recarregar a Duimp do portal Siscomex.'
      Enabled = False
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 1
      Transparent = True
    end
    object edtSearchDuimp: TcxMaskEdit [4]
      Left = 1026
      Top = 61
      AutoSize = False
      Properties.Alignment.Horz = taCenter
      Properties.EditMask = '99\BR9999999999\-9;1;_'
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 2
      Text = '  BR          - '
      Height = 19
      Width = 104
    end
    inherited ltgPageDef_Root: TdxLayoutGroup
      AlignVert = avClient
    end
    inherited lsiTitle: TdxLayoutSeparatorItem
      Visible = False
    end
    inherited loiTitle: TdxLayoutItem
      Visible = False
    end
    object loiDuimp: TdxLayoutItem
      Parent = ltgPageDef_Root
      AlignVert = avClient
      Offsets.Top = -6
      CaptionOptions.Text = 'Duimp'
      CaptionOptions.Visible = False
      Control = pclDuimpProcess
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 193
      ControlOptions.OriginalWidth = 289
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object loiFindDuimp: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahRight
      AlignVert = avTop
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = True
      SizeOptions.SizableVert = True
      SizeOptions.Height = 20
      SizeOptions.Width = 22
      CaptionOptions.Visible = False
      Control = btnFindDuimp
      ControlOptions.OriginalHeight = 20
      ControlOptions.OriginalWidth = 22
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = ltgPageDef_Root
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      Offsets.Bottom = 6
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object TdxLayoutItem
      Index = -1
    end
    object TdxLayoutItem
      Index = -1
    end
    object dxLayoutItem30: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'cxCheckBox1'
      CaptionOptions.Visible = False
      Control = cbxRedoDuimp
      ControlOptions.OriginalHeight = 20
      ControlOptions.OriginalWidth = 233
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 0
    end
    object dxLayoutItem31: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahRight
      CaptionOptions.Text = 'Numero Duimp:'
      Control = edtSearchDuimp
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 104
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  inherited aclActionList: TActionList
    Left = 847
    object actFindDuimp: TAction
      Caption = 'actFindDuimp'
      ImageIndex = 1
      OnExecute = actFindDuimpExecute
    end
    object actProcessSave: TAction
      Caption = 'Salvar'
      Enabled = False
      ImageIndex = 2
      OnExecute = actProcessSaveExecute
    end
    object actProcessCancel: TAction
      Caption = 'Cancelar'
      Enabled = False
      ImageIndex = 3
      OnExecute = actProcessCancelExecute
    end
    object actSaveOpe: TAction
      Caption = 'Salvar'
      Enabled = False
      ImageIndex = 2
      OnExecute = actSaveOpeExecute
    end
    object actCancelOpe: TAction
      Caption = 'Cancelar'
      Enabled = False
      ImageIndex = 3
      OnExecute = actCancelOpeExecute
    end
    object actFindProdutoCodigoInterno: TAction
      Caption = 'actProdutoCodigoInterno'
      ImageIndex = 5
    end
    object actShowProdutoCodigoInterno: TAction
      Caption = 'actShowProdutoCodigoInterno'
      ImageIndex = 6
      Visible = False
      OnExecute = actShowProdutoCodigoInternoExecute
    end
  end
  inherited iglImageList: TcxImageList
    FormatVersion = 1
    DesignInfo = 1049535
    ImageInfo = <
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
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000026744558745469746C650046696E643B426172733B5269
          62626F6E3B5374616E646172643B536561726368BB659C080000005B49444154
          785EB592C10900310804AFC16B630B4955E9CEE0C129C124FB303EC6C72A2388
          8F88186FEBF24372232F8843CE2E3F094004A81168B882F594B89D834940868F
          7D1384ED1C140BFC801FF50283BEB2734FA025415E3000FE3DA38A41B3014A00
          00000049454E44AE426082}
        FileName = 'Office 2013\Find\Find_16x16.png'
        Keywords = 'Find;Find'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000012744558745469746C65005361766520546F3B53617665
          D4AB99720000007B49444154785EBDD1B10980301085E12C788B38808B583882
          A56063E56CCF9C78E1599847142D3EE321F921310178E518866EDE32B873C60D
          FEB66525001148BC865F03680A843C5FE980F66DC063E2084C07FA6964201EF0
          F57920A8004EC6019E55C0325458ED2F2C39508B181F616D8C18DF41212ED178
          73D801EB02895D95F39E360000000049454E44AE426082}
        FileName = 'Office 2013\Save\SaveTo_16x16.png'
        Keywords = 'Save;SaveTo'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000023744558745469746C650043616E63656C3B53746F703B
          457869743B426172733B526962626F6E3B4C9696B20000009449444154785E95
          93410A834010047D5C2027F3093F104C6461C5CD37F312C5D3641AD27810BAF1
          5030CC587510B68B88EE3BDCFAA46236F0FB190E66CA7B12C9125EFE24F1771E
          584C9009234626230FE514F1F21B2E8E22A2650654A42999011951320322A265
          E0FFF6411301219B88935F49511129F3A622567611C8B3905DA462794FD693EC
          231B5C2C19795E78CE131CCC3FD2409CCC2C3656140000000049454E44AE4260
          82}
        FileName = 'Office 2013\Actions\Cancel_16x16.png'
        Keywords = 'Actions;Cancel'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000035744558745469746C6500546563686E6F6C6F67793B53
          657474696E67733B4F7074696F6E733B437573746F6D697A3B50726F70657274
          6965730FB5035C0000008B49444154785EB591D109843010440F52486A482157
          49FEB7001BB01D4B0B081947180E3D21038A1F8FC58D3B59F23E007E7CA72591
          429A6ADAFB238EC320412AE9AA416003747390954040DF6103B46ED5D04CB22A
          D42F2EA091AE81AC5E2650BFBDB9817F03921E5918A9BD249E7EF66A1570C5AB
          F5015EAD09F06ADFDEC0AB1D06ECDCB53054FB7FB60109578EBCF804937B0000
          000049454E44AE426082}
        FileName = 'Office 2013\Programming\Technology_16x16.png'
        Keywords = 'Programming;Technology'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000000B744558745469746C65005A6F6F6D3BCF09FEBC000000
          8D49444154785EB592CB0D83301005433BEE251DB8082A6093D4E02E2C38530E
          17BB8DCD137A5CACC5D2CAE230A7D11BC99F97AA0E718AF76FB7984004195492
          41A4BB0F70FC016A4137F502918302040422A0D0C55E2033208613BADC0B5406
          82E1025D1D0E3C7A841528715FE2728D7DCF688F37CF476AC75F464DDA40B2C6
          9EC0D18EBD81999144E90A0CF1073A60247E2F791EBF0000000049454E44AE42
          6082}
        FileName = 'Office 2013\Zoom\Zoom_16x16.png'
        Keywords = 'Zoom;Zoom'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
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
        FileName = 'Office 2013\Support\Index_16x16.png'
        Keywords = 'Support;Index'
      end>
  end
  inherited decDef: TcxDefaultEditStyleController
    Left = 875
    PixelsPerInch = 96
  end
  inherited escDef: TcxEditStyleController
    Left = 931
    PixelsPerInch = 96
  end
  inherited lczMaster: TcxLocalizer
    Left = 987
  end
  inherited lfcDef: TcxLookAndFeelController
    Left = 1015
    Top = 16
  end
  inherited llfMain: TdxLayoutLookAndFeelList
    Left = 1071
    Top = 16
    inherited lsfMain: TdxLayoutSkinLookAndFeel
      PixelsPerInch = 96
    end
  end
  inherited sclMain: TdxSkinController
    Left = 1099
    Top = 16
  end
  object edrDuimp: TcxEditRepository
    Left = 903
    Top = 16
    PixelsPerInch = 96
    object edrDuimpDispYesOrNo: TcxEditRepositoryCheckBoxItem
      Properties.Alignment = taCenter
      Properties.DisplayChecked = 'SIM'
      Properties.DisplayUnchecked = 'N'#195'O'
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
    end
  end
  object sryDUI: TcxStyleRepository
    Left = 1043
    Top = 16
    PixelsPerInch = 96
    object stlGrd: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
  end
end
