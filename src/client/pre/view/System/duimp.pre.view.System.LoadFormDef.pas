unit duimp.pre.view.System.LoadFormDef;

interface

uses
{PROJECT}
  duimp.pre.view.System.DefForm,
{IDE}
  Vcl.Forms, System.Classes, cxClasses, dxTaskbarProgress, Vcl.Controls, Vcl.ExtCtrls;

type
  TfrmLoadDef = class(TForm)
    shpDUITop: TShape;
    shpDUILeft: TShape;
    shpDUIBottom: TShape;
    shpDUIRight: TShape;
    tpgDUI: TdxTaskbarProgress;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    function GetMax: Double;
    function GetPosition: Double;
  protected
    procedure SetMax(const AValue: Double); virtual;
    procedure SetPosition(const Value: Double); virtual;
  public
    procedure StepIt;
    property Max: Double read GetMax write SetMax;
    property Position: Double read GetPosition write SetPosition;
  end;

implementation

{$R *.dfm}

function TfrmLoadDef.GetMax: Double;
begin
  Result := tpgDUI.Total;
end;

function TfrmLoadDef.GetPosition: Double;
begin
  Result := tpgDUI.Position;
end;

procedure TfrmLoadDef.SetMax(const AValue: Double);
begin
  tpgDUI.Total := Round(AValue);
end;

procedure TfrmLoadDef.SetPosition(const Value: Double);
begin
   tpgDUI.Position := Round(Value);
end;

procedure TfrmLoadDef.StepIt;
begin
  Position := Position + 1;
end;

procedure TfrmLoadDef.FormCreate(Sender: TObject);
begin
  tpgDUI.Active := True;
end;

procedure TfrmLoadDef.FormDestroy(Sender: TObject);
begin
  tpgDUI.Active := False;
end;

end.
