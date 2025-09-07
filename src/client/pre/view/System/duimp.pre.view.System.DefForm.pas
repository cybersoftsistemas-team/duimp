unit duimp.pre.view.System.DefForm;

interface

uses
{PROJECT}
  duimp.dom.DataModules.System.damMain,
{IDE}
  System.SysUtils, Data.DB, dxSkinsFluentDesignForm, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2019Colorful, dxCore, cxLocalization,
  cxContainer, cxEdit, System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList, System.Actions, Vcl.ActnList, dxSkinsForm, cxClasses, dxLayoutLookAndFeels, dxLayoutContainer,
  System.Classes, dxLayoutControl, dxSkinOffice2019Black;

type
  TfrmDef = class(TdxFluentDesignForm)
    lclDefGroup_Root: TdxLayoutGroup;
    lclDef: TdxLayoutControl;
    llfMain: TdxLayoutLookAndFeelList;
    lsfMain: TdxLayoutSkinLookAndFeel;
    sclMain: TdxSkinController;
    decDef: TcxDefaultEditStyleController;
    lfcDef: TcxLookAndFeelController;
    aclDef: TActionList;
    iglImages: TcxImageList;
    escDef: TcxEditStyleController;
    lczMaster: TcxLocalizer;
    procedure dxFluentDesignFormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
    procedure dxFluentDesignFormCreate(Sender: TObject);
  private
    FAllowFormToMove: Boolean;
    FCanMoveOwnerForm: Boolean;
    FDataModule: TdamMain;
    FOwnDataModule: Boolean;
  protected
    function GetDataModuleType: damMainType; virtual;
    procedure DataChange(Sender: TObject; Field: TField); virtual;
    procedure ShowLoading(const AEvent: TProc); overload;
    property AllowFormToMove: Boolean read FAllowFormToMove write FAllowFormToMove;
    property CanMoveOwnerForm: Boolean read FCanMoveOwnerForm write FCanMoveOwnerForm;
  public
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const ADataModule: TdamMain; const AOwnDataModule: Boolean = True); reintroduce; overload;
    constructor Create(AOwner: TComponent; const ADataModuleType: damMainType); reintroduce; overload;
    destructor Destroy; override;
    property DataModule: TdamMain read FDataModule;
  end;

implementation

uses
{PROJECT}
  duimp.pre.view.System.Loading;

{$R *.dfm}

{ TfrmDef }

constructor TfrmDef.Create(AOwner: TComponent);
var
  TdamDataModule: damMainType;
begin
  inherited Create(AOwner);
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

constructor TfrmDef.Create(AOwner: TComponent; const ADataModule: TdamMain; const AOwnDataModule: Boolean = True);
begin
  inherited Create(AOwner);
  FDataModule := ADataModule;
  FDataModule.OnDataChange := DataChange;
  FOwnDataModule := AOwnDataModule;
end;

constructor TfrmDef.Create(AOwner: TComponent; const ADataModuleType: damMainType);
begin
  inherited Create(AOwner);
  FDataModule := ADataModuleType.Create(Self);
  FDataModule.OnDataChange := DataChange;
  FOwnDataModule := True;
end;

procedure TfrmDef.DataChange(Sender: TObject; Field: TField);
begin
end;

destructor TfrmDef.Destroy;
begin
  if FOwnDataModule and Assigned(FDataModule) then
  begin
    FreeAndNil(FDataModule);
  end;
  inherited;
end;

function TfrmDef.GetDataModuleType: damMainType;
begin
  Result := nil;
end;

procedure TfrmDef.ShowLoading(const AEvent: TProc);
begin
  duimp.pre.view.System.Loading.Load.ShowLoading(Self, AEvent);
end;

procedure TfrmDef.dxFluentDesignFormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
 var
   LOwner: TfrmDef;
begin
  if not((Owner is TfrmDef) and TfrmDef(Owner).AllowFormToMove and FCanMoveOwnerForm) then
  begin
    Exit;
  end;
  LOwner  := TfrmDef(Owner);
  LOwner.Left := (Self.Width  div 2) + Self.Left - (LOwner.Width  div 2);
  LOwner.Top  := (Self.Height div 2) + Self.Top  - (LOwner.Height div 2);
  if Assigned(LOwner.OnCanResize) then
  begin
    LOwner.OnCanResize(Sender, NewWidth, NewHeight, Resize);
  end;
end;

procedure TfrmDef.dxFluentDesignFormCreate(Sender: TObject);
begin
  FAllowFormToMove := True;
  FCanMoveOwnerForm := False;
end;

end.
