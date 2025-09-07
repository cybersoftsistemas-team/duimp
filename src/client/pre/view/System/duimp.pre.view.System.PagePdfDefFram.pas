unit duimp.pre.view.System.PagePdfDefFram;

interface

uses
{PROJECT}
  duimp.pre.view.System.PageDefFram,
{IDE}
  System.Classes, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2019Colorful, cxContainer, cxEdit, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, dxCore, Vcl.Menus, System.Actions, Vcl.ActnList, dxLayoutContainer, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxSkinsForm, dxLayoutLookAndFeels, cxLocalization, cxClasses, System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList, cxLabel,
  dxLayoutControl;

type
  TfraPagePdfDef = class(TfraPageDef)
    loiDatabase: TdxLayoutItem;
    cbxDatabase: TcxLookupComboBox;
    lagTitle: TdxLayoutAutoCreatedGroup;
    btnRefresh: TcxButton;
    loiRefresh: TdxLayoutItem;
    actRefresh: TAction;
    dxLayoutGroup2: TdxLayoutGroup;
  end;

implementation

{$R *.dfm}

end.

