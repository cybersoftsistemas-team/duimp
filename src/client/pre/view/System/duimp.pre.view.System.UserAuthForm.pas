unit duimp.pre.view.System.UserAuthForm;

interface

uses
{PROJECT}
  duimp.dom.DataModules.damUserAuth,
  duimp.dom.DataModules.System.damMain,
  duimp.pre.view.System.DefForm,
{IDE}
  Vcl.Forms, System.Classes, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2019Colorful, dxLayoutcxEditAdapters, dxLayoutControlAdapters,
  dxCore, cxContainer, cxEdit, Vcl.Menus, System.Actions, Vcl.ActnList, dxLayoutContainer, cxTextEdit, cxDBEdit, Vcl.StdCtrls, cxButtons, cxLabel, dxGDIPlusClasses, Vcl.Controls,
  Vcl.ExtCtrls, cxLocalization, System.ImageList, Vcl.ImgList, cxImageList, dxSkinsForm, cxClasses, dxLayoutLookAndFeels, dxLayoutControl, dxSkinOffice2019Black;

type
  TfrmUserAuth = class(TfrmDef)
    loilabInfor01: TdxLayoutItem;
    labInfor01: TcxLabel;
    loilabInfor02: TdxLayoutItem;
    labInfor02: TcxLabel;
    loilabSubTitle1: TdxLayoutItem;
    labSubTitle1: TcxLabel;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    loilabTitle: TdxLayoutItem;
    labTitle: TcxLabel;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    lesSpace2: TdxLayoutEmptySpaceItem;
    actConnect: TAction;
    loibtnConnect: TdxLayoutItem;
    btnConnect: TcxButton;
    imgBckgTop: TImage;
    imgBckgBottom: TImage;
    edtUserName: TcxDBTextEdit;
    loiedtUserName: TdxLayoutItem;
    edtPassword: TcxDBTextEdit;
    loiedtPassword: TdxLayoutItem;
    labInfoFooter: TcxLabel;
    loilabInfoFooter: TdxLayoutItem;
    labSubInfoFooter: TcxLabel;
    loilabSubInfoFooter: TdxLayoutItem;
    labVersion: TcxLabel;
    loilabVersion: TdxLayoutItem;
    dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup;
    labVs: TcxLabel;
    loilabVs: TdxLayoutItem;
    procedure actConnectExecute(Sender: TObject);
    procedure dxFluentDesignFormPaint(Sender: TObject);
  private
    function GetdamUserAuth: TdamUserAuth;
  protected
    function GetDataModuleType: damMainType; override;
    function IsPossibleConnect: Boolean; virtual;
    procedure AfterConnect; virtual;
    procedure BeforeConnect; virtual;
    procedure OnConnect; virtual; abstract;
  public
    constructor Create(AOwner: TComponent); override;
    property DataModule: TdamUserAuth read GetdamUserAuth;
  end;

  TUserAuthForm = class of TfrmUserAuth;

implementation

uses
{IDE}
  Data.DB,
  System.Types,
  Vcl.Graphics,
{PROJECT}
  duimp.dom.System.AppInfo;

{$R *.dfm}

{ TfrmUserAuth }

constructor TfrmUserAuth.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ActiveControl := edtPassword;
  if DataModule.mtbLGN.IsEmpty then
  begin
    ActiveControl := edtUserName;
  end;
  labVs.Caption := TAppInfo.Version;
end;

function TfrmUserAuth.GetdamUserAuth: TdamUserAuth;
begin
  Result := TdamUserAuth(inherited DataModule);
end;

function TfrmUserAuth.IsPossibleConnect: Boolean;
begin
  Result := True;
end;

procedure TfrmUserAuth.actConnectExecute(Sender: TObject);
begin
  if IsPossibleConnect then
  begin
    BeforeConnect;
    OnConnect;
    AfterConnect;
  end;
end;

procedure TfrmUserAuth.AfterConnect;
begin
  DataModule.SetConnectionProperties;
end;

procedure TfrmUserAuth.BeforeConnect;
begin
end;

procedure TfrmUserAuth.dxFluentDesignFormPaint(Sender: TObject);
begin
  var LR := ClientRect;
  Canvas.Brush.Color := clWindow;
  Canvas.FillRect(LR);
  inherited;
end;

function TfrmUserAuth.GetDataModuleType: damMainType;
begin
  Result := TdamUserAuth;
end;

end.
