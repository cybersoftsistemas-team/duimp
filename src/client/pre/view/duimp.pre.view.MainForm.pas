unit duimp.pre.view.MainForm;

interface

uses
{PROJECT}
  duimp.pre.view.System.DefForm,
  duimp.pre.view.System.PageDefFram,
{IDE}
  dxNavBarCollns, System.Classes, System.Generics.Collections, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2019Colorful, dxCore,
  dxNavBar, cxLocalization, cxContainer, cxEdit, System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList, System.Actions, Vcl.ActnList, dxSkinsForm, cxClasses,
  dxLayoutLookAndFeels, dxLayoutContainer, dxLayoutControl;

type
  TfrmMain = class(TfrmDef)
    nvbMain: TdxNavBar;
    procedure dxFluentDesignFormCreate(Sender: TObject);
  private
    type
      TPageDefs = class(TDictionary<Integer, TfraPageDef>)
      public
        function PageByIndex(const AIndex: Integer): TfraPageDef;
      end;
  private
    FCurrNavBarCustomItem: TdxNavBarCustomItem;
    FPageDefs: TPageDefs;
    procedure CreatePageDefs;
    procedure NavBarGroup1Click(Sender: TObject);
    procedure SetPageVisible(const APageDef: TfraPageDef);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
{IDE}
  System.SysUtils;

{ TfrmMain.TPageDefs }

function TfrmMain.TPageDefs.PageByIndex(const AIndex: Integer): TfraPageDef;
begin
  Result := Items[AIndex];
end;

{ TfrmMain }

constructor TfrmMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPageDefs := TPageDefs.Create;
  CreatePageDefs;
end;

destructor TfrmMain.Destroy;
begin
  FreeAndNil(FPageDefs);
  inherited;
end;

procedure TfrmMain.dxFluentDesignFormCreate(Sender: TObject);
begin
  if FPageDefs.Count > 0 then
  begin
    SetPageVisible(FPageDefs.PageByIndex(0));
  end;
end;

procedure TfrmMain.CreatePageDefs;
var
  LIndex: Integer;
  LNavBarGroup: TdxNavBarGroup;
  LNavBarItem: TdxNavBarItem;
  LPage: TfraPageDef;
  LPages: TList<TfraPageDef>;
  TPage: TPair<TPageDef, Integer>;
begin
  LIndex := -1;
  FPageDefs.Clear;
  nvbMain.Groups.Clear;
  nvbMain.Items.Clear;
  LPages := TList<TfraPageDef>.Create;
  try
    for TPage in GetPageDefTypes do
    begin
      LPage := TPage.Key.Create(Self);
      LPage.Parent := Self;
      LPage.Align := alClient;
      LPage.Visible := False;
      LPage.Order := TPage.Value;
      LPages.Add(LPage);
    end;
    for LPage in LPages do
    begin
      Inc(LIndex);
      LNavBarGroup := nvbMain.Groups.ItemByCaption(LPage.NavBarGroupCaption) as TdxNavBarGroup;
      if not Assigned(LNavBarGroup) then
      begin
        LNavBarGroup := nvbMain.Groups.Add;
        LNavBarGroup.Expanded := False;
        LNavBarGroup.Caption := LPage.NavBarGroupCaption;
      end;
      if SameText(LPage.NavBarGroupCaption, LPage.NavBarCaption) then
      begin
        LNavBarGroup.Tag := LIndex;
        LNavBarGroup.OnClick := NavBarGroup1Click;
        LNavBarGroup.OptionsExpansion.ShowExpandButton := False;
        FPageDefs.Add(LIndex, LPage);
      end
      else
      begin
        LNavBarItem := nvbMain.Items.ItemByCaption(LPage.NavBarCaption) as TdxNavBarItem;
        if not Assigned(LNavBarItem) then
        begin
          LNavBarItem := nvbMain.Items.Add;
          LNavBarItem.Tag := LIndex;
          LNavBarItem.Caption := LPage.NavBarCaption;
          LNavBarItem.OnClick := NavBarGroup1Click;
          LNavBarGroup.CreateLink(LNavBarItem);
          FPageDefs.Add(LIndex, LPage);
        end;
      end;
    end;
  finally
    FreeAndNil(LPages);
  end;
end;

procedure TfrmMain.NavBarGroup1Click(Sender: TObject);
begin
  if FCurrNavBarCustomItem = Sender then
  begin
    Exit;
  end;
  FCurrNavBarCustomItem := TdxNavBarCustomItem(Sender);
  SetPageVisible(FPageDefs.PageByIndex(FCurrNavBarCustomItem.Tag));
end;

procedure TfrmMain.SetPageVisible(const APageDef: TfraPageDef);
var
  LPage: TfraPageDef;
begin
  for LPage in FPageDefs.Values do if
    LPage.Visible then
  begin
    LPage.Visible := False;
    Break;
  end;
  APageDef.Visible := True;
end;

end.
