unit duimp.pre.view.System.PageDefFram;

interface

uses
{PROJECT}
  duimp.dom.DataModules.System.damMain,
  duimp.pre.view.System.LoadFormDef,
  duimp.pre.view.System.Loading,
{IDE}
  System.Generics.Collections, System.SysUtils, Vcl.Forms, Data.DB, System.Classes, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinOffice2019Colorful, cxContainer, cxEdit, dxLayoutcxEditAdapters, dxCore, dxSkinsForm, dxLayoutLookAndFeels, cxLocalization, cxClasses, System.ImageList, Vcl.ImgList,
  Vcl.Controls, cxImageList, System.Actions, Vcl.ActnList, dxLayoutContainer, cxLabel, dxLayoutControl, dxSkinOffice2019Black;

type
  TfraPageDef = class(TFrame)
    lclPageDef: TdxLayoutControl;
    ltgPageDef_Root: TdxLayoutGroup;
    lsiTitle: TdxLayoutSeparatorItem;
    labTitle: TcxLabel;
    loiTitle: TdxLayoutItem;
    aclActionList: TActionList;
    iglImageList: TcxImageList;
    decDef: TcxDefaultEditStyleController;
    escDef: TcxEditStyleController;
    lczMaster: TcxLocalizer;
    lfcDef: TcxLookAndFeelController;
    llfMain: TdxLayoutLookAndFeelList;
    lsfMain: TdxLayoutSkinLookAndFeel;
    sclMain: TdxSkinController;
    procedure DisableCpfOrCnpfDBFieldDisplayText(Sender: TObject);
    procedure EnableCpfOrCnpfDBFieldDisplayText(Sender: TObject);
  private
    FDataModule: TdamMain;
    FOrder: Integer;
    FOwnDataModule: Boolean;
    function GetNavBarCaption: string;
    function GetNavBarGroupCaption: string;
  protected
    function GetDataModuleType: damMainType; virtual;
    function GetInternalNavBarCaption: string; dynamic;
    function GetInternalNavBarGroupCaption: string; dynamic;
    procedure DataChange(Sender: TObject; Field: TField); virtual;
    procedure SetDataModule(const AValue: TdamMain);
    procedure ShowLoading(const AEvent: TProc); overload;
    procedure ShowLoading<TLoad: TfrmLoadDef>(const AEvent: TShowLoadingEvent<TLoad>;
      const AShowLoadForm: Boolean = True); overload;
  public
    constructor Create(AOwner: TComponent); override;
    property DataModule: TdamMain read FDataModule;
    property NavBarCaption: string read GetNavBarCaption;
    property NavBarGroupCaption: string read GetNavBarGroupCaption;
    property Order: Integer read FOrder write FOrder;
  end;

  TPageDef = class of TfraPageDef;

  function GetPageDefTypes: TEnumerable<TPair<TPageDef, Integer>>;
  procedure RegisterPageDef(const APageDef: TPageDef; const AOrder: Integer = 0);

implementation

{$R *.dfm}

var
  InternalPageDef: TDictionary<TPageDef, Integer>;

function GetPageDefTypes: TEnumerable<TPair<TPageDef, Integer>>;
begin
  Result := InternalPageDef;
end;

procedure RegisterPageDef(const APageDef: TPageDef; const AOrder: Integer = 0);
begin
  if not InternalPageDef.ContainsKey(APageDef) then
  begin
    InternalPageDef.Add(APageDef, AOrder);
  end;
end;

{ TfraPageDef }

constructor TfraPageDef.Create(AOwner: TComponent);
var
  TdamDataModule: damMainType;
begin
  inherited Create(AOwner);
  FOrder := 0;
  FDataModule := nil;
  FOwnDataModule := False;
  TdamDataModule := GetDataModuleType;
  if Assigned(TdamDataModule) then
  begin
    FDataModule := TdamDataModule.Create(Self);
    FDataModule.OnDataChange := DataChange;
    FOwnDataModule := True;
  end;
end;

procedure TfraPageDef.DataChange(Sender: TObject; Field: TField);
begin
end;

procedure TfraPageDef.DisableCpfOrCnpfDBFieldDisplayText(Sender: TObject);
begin
  FDataModule.CpfOrCnpfDBFieldDisplayText := False;
end;

procedure TfraPageDef.EnableCpfOrCnpfDBFieldDisplayText(Sender: TObject);
begin
  FDataModule.CpfOrCnpfDBFieldDisplayText := True;
end;

function TfraPageDef.GetDataModuleType: damMainType;
begin
  Result := nil;
end;

function TfraPageDef.GetInternalNavBarCaption: string;
begin
  Result := '';
end;

function TfraPageDef.GetInternalNavBarGroupCaption: string;
begin
  Result := '';
end;

function TfraPageDef.GetNavBarCaption: string;
begin
  Result := GetInternalNavBarCaption;
  if Result.Trim.IsEmpty then
  begin
    Result := labTitle.Caption;
  end;
end;

function TfraPageDef.GetNavBarGroupCaption: string;
begin
  Result := GetInternalNavBarGroupCaption;
  if Result.Trim.IsEmpty then
  begin
    Result := labTitle.Caption;
  end;
end;

procedure TfraPageDef.SetDataModule(const AValue: TdamMain);
begin
  FDataModule := AValue;
end;

procedure TfraPageDef.ShowLoading(const AEvent: TProc);
begin
  duimp.pre.view.System.Loading.Load.ShowLoading(Self, AEvent);
end;

procedure TfraPageDef.ShowLoading<TLoad>(const AEvent: TShowLoadingEvent<TLoad>; const AShowLoadForm: Boolean);
begin
  duimp.pre.view.System.Loading.Load.ShowLoading<TLoad>(Self, AEvent, AShowLoadForm);
end;

initialization
begin
  InternalPageDef := TDictionary<TPageDef, Integer>.Create;
end;

finalization
begin
  FreeAndNil(InternalPageDef);
end;

end.
