inherited frmProdAttDomsDialog: TfrmProdAttDomsDialog
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeable
  Caption = 'Dom'#237'nios do Atributo'
  ClientHeight = 326
  ClientWidth = 447
  ExplicitWidth = 463
  ExplicitHeight = 365
  TextHeight = 13
  inherited lclDef: TdxLayoutControl
    Width = 447
    Height = 326
    ExplicitWidth = 447
    ExplicitHeight = 326
    inherited btnWindowOk: TcxButton
      Left = 281
      Top = 291
      TabOrder = 1
      ExplicitLeft = 281
      ExplicitTop = 291
    end
    inherited btnWindowCancel: TcxButton
      Left = 362
      Top = 291
      TabOrder = 2
      ExplicitLeft = 362
      ExplicitTop = 291
    end
    object grdAttDoms: TcxGrid [2]
      Left = 10
      Top = 28
      Width = 427
      Height = 245
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2019Colorful'
      object grdAttDomsDBTableView: TcxGridDBTableView
        OnDblClick = grdAttDomsDBTableViewDblClick
        DataController.DataSource = damProducts.dsoDOM
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'
            Kind = skCount
            Column = grdAttDomsDBTableViewcodigo
          end>
        OptionsBehavior.CellHints = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.CellEndEllipsis = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object grdAttDomsDBTableViewAtributo: TcxGridDBColumn
          DataBinding.FieldName = 'Atributo'
          Visible = False
        end
        object grdAttDomsDBTableViewcodigo: TcxGridDBColumn
          DataBinding.FieldName = 'codigo'
        end
        object grdAttDomsDBTableViewdescricao: TcxGridDBColumn
          DataBinding.FieldName = 'descricao'
        end
      end
      object grdAttDomsLevel: TcxGridLevel
        GridView = grdAttDomsDBTableView
      end
    end
    inherited lagBtns: TdxLayoutAutoCreatedGroup
      Index = 2
    end
    inherited lsi1: TdxLayoutSeparatorItem
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = lclDefGroup_Root
      AlignVert = avClient
      CaptionOptions.Text = '&Selecione a baixo um dom'#237'nio de atributo:'
      CaptionOptions.Layout = clTop
      Control = grdAttDoms
      ControlOptions.OriginalHeight = 249
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  inherited llfMain: TdxLayoutLookAndFeelList
    Left = 223
    inherited lsfMain: TdxLayoutSkinLookAndFeel
      PixelsPerInch = 96
    end
  end
  inherited sclMain: TdxSkinController
    Left = 251
  end
  inherited decDef: TcxDefaultEditStyleController
    Left = 223
    PixelsPerInch = 96
  end
  inherited lfcDef: TcxLookAndFeelController
    Left = 195
  end
  inherited aclDef: TActionList
    Left = 195
  end
  inherited iglImages: TcxImageList
    FormatVersion = 1
    DesignInfo = 1048855
  end
  inherited escDef: TcxEditStyleController
    Left = 251
    PixelsPerInch = 96
  end
  inherited lczMaster: TcxLocalizer
    Left = 307
  end
end
