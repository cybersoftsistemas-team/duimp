unit duimp.dom.DataModules.System.damMain;

interface

uses
{IDE}
  Data.DB, System.SysUtils, System.Classes;

type
  TdamMain = class(TDataModule)
    procedure CpfOrCnpfGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure CpfOrCnpfSetText(Sender: TField; const Text: string);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataSetBeforePost(DataSet: TDataSet);
    procedure dsoDataChange(Sender: TObject; Field: TField);
    procedure dsoStateChange(Sender: TObject);
    procedure SetZeroToTheLeft(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    FCpfOrCnpfDBFieldDisplayText: Boolean;
    FOnDataChange: TDataChangeEvent;
    FOnStateChange: TNotifyEvent;
    procedure CheckRequiredFields(const ADataSet: TDataSet);
    procedure SetOnDataChange(const AValue: TDataChangeEvent);
  protected
    procedure AfterDataBaseChange; virtual;
    procedure BeforeDataBaseChange; virtual;
    procedure DoOnDataChange(Sender: TObject; Field: TField); virtual;
    procedure DoOnStateChange(Sender: TObject); virtual;
    procedure OnDataBaseChange; virtual;
    procedure SetOnDataChangeEvent; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DataBaseChange;
    property CpfOrCnpfDBFieldDisplayText: Boolean read FCpfOrCnpfDBFieldDisplayText write FCpfOrCnpfDBFieldDisplayText;
    property OnDataChange: TDataChangeEvent read FOnDataChange write SetOnDataChange;
    property OnStateChange: TNotifyEvent read FOnStateChange write FOnStateChange;
  end;

  damMainType = class of TdamMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
{PROJECT}
  cbsCore.SysUtils,
  duimp.dom.System.DataModules.Utils;

{ TdamMain }

constructor TdamMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  RegisterDataModule(Self);
end;

destructor TdamMain.Destroy;
begin
  UnRegisterDataModule(Self);
  inherited;
end;

procedure TdamMain.AfterDataBaseChange;
begin
end;

procedure TdamMain.BeforeDataBaseChange;
begin
end;

procedure TdamMain.CheckRequiredFields(const ADataSet: TDataSet);
var
  I: Integer;
begin
  for I := 0 to ADataSet.Fields.Count - 1 do if
    ADataSet.Fields[I].Required and not ADataSet.Fields[I].ReadOnly and
      (ADataSet.Fields[I].FieldKind = fkData) and ADataSet.Fields[I].IsNull then
  begin
    ADataSet.Fields[I].FocusControl;
    DatabaseErrorFmt('O campo ''%s'' é de preenchimento obrigatório.', [ADataSet.Fields[I].DisplayName]);
  end;
end;

procedure TdamMain.CpfOrCnpfGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not FCpfOrCnpfDBFieldDisplayText then
  begin
    Text := Sender.AsString;
  end
  else
    Text := GetCpfOrCnpfMask(GetOnlyNumbers(Sender.AsString));
end;

procedure TdamMain.CpfOrCnpfSetText(Sender: TField; const Text: string);
begin
  Sender.AsString := GetOnlyNumbers(Text);
end;

procedure TdamMain.DataBaseChange;
begin
  BeforeDataBaseChange;
  OnDataBaseChange;
  AfterDataBaseChange;
end;

procedure TdamMain.DataModuleCreate(Sender: TObject);
begin
  FCpfOrCnpfDBFieldDisplayText := True;
end;

procedure TdamMain.DataSetBeforePost(DataSet: TDataSet);
begin
  CheckRequiredFields(DataSet);
end;

procedure TdamMain.DoOnDataChange(Sender: TObject; Field: TField);
begin
end;

procedure TdamMain.DoOnStateChange(Sender: TObject);
begin
end;

procedure TdamMain.dsoDataChange(Sender: TObject; Field: TField);
begin
  if Assigned(FOnDataChange) then
  begin
    DoOnDataChange(Sender, Field);
    FOnDataChange(Sender, Field);
  end;
end;

procedure TdamMain.dsoStateChange(Sender: TObject);
begin
  if Assigned(FOnStateChange) then
  begin
    DoOnStateChange(Sender);
    FOnStateChange(Sender);
  end;
end;

procedure TdamMain.OnDataBaseChange;
begin
end;

procedure TdamMain.SetOnDataChange(const AValue: TDataChangeEvent);
begin
  FOnDataChange := AValue;
  SetOnDataChangeEvent;
end;

procedure TdamMain.SetOnDataChangeEvent;
begin
  // This method can be overwritten by inherited classes.
end;

procedure TdamMain.SetZeroToTheLeft(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.AsInteger > 0 then
  begin
    Text := Format('%3.3d',[Sender.AsInteger]);
  end;
end;

end.
