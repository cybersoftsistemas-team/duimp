unit duimp.dom.System.DataModules.Extensions;

interface

uses
{IDE}
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.DatS,
  FireDAC.Stan.Param,
  FireDAC.Stan.Option,
  System.Classes;

type
  TFDDatSTableExtensions = class Helper for TFDDatSTable
  public
    function IsEmpty: Boolean;
  end;

  TFDParamsExtensions = class Helper for TFDParams
  public
    procedure SetParamValues(const ADataSet: TDataSet);
  end;

  TFDUpdateSQLExtensions = class Helper for TFDUpdateSQL
  private
    function GetCommandBy(const ARequest: TFDUpdateRequest; const ADataSet: TDataSet = nil): TFDCustomCommand; overload;
    procedure GetCommandBy(const ARequest: TFDUpdateRequest; out ACommand: TFDCustomCommand;
      const ADataSet: TDataSet = nil); overload;
    procedure GetCommandBy(const ARequest: TFDUpdateRequest; out ACommand: TFDCustomCommand; out ADatSTable: TFDDatSTable;
      const ADataSet: TDataSet = nil); overload;
  public
    procedure GetCommandFetchRow(const ADataSet: TDataSet; out ADatSTable: TFDDatSTable; out ACommand: TFDCustomCommand);
    procedure GetCommandInsert(const ADataSet: TDataSet; out ACommand: TFDCustomCommand);
    procedure GetCommandUpdate(const ADataSet: TDataSet; out ACommand: TFDCustomCommand);
  end;

implementation

uses
{IDE}
  System.SysUtils;

{ TFDDatSTableExtensions }

function TFDDatSTableExtensions.IsEmpty: Boolean;
begin
  Result := Rows.Count = 0;
end;

{ TFDParamsExtensions }

procedure TFDParamsExtensions.SetParamValues(const ADataSet: TDataSet);
var
  LField: TField;
  LNewParam: TFDParam;
  LOldParam: TFDParam;
begin
  for LField in ADataSet.Fields do
  begin
    LNewParam := FindParam('NEW_' + LField.FieldName);
    LOldParam := FindParam('OLD_' + LField.FieldName);
    if Assigned(LNewParam) then
    begin
      LNewParam.DataType := ADataSet.Fields[LField.Index].DataType;
      LNewParam.Value := ADataSet.Fields[LField.Index].Value;
    end;
    if Assigned(LOldParam) then
    begin
      LOldParam.DataType := ADataSet.Fields[LField.Index].DataType;
      LOldParam.Value := ADataSet.Fields[LField.Index].Value;
    end;
  end;
end;

{ TFDUpdateSQLExtensions }

function TFDUpdateSQLExtensions.GetCommandBy(const ARequest: TFDUpdateRequest; const ADataSet: TDataSet): TFDCustomCommand;
begin
  Result := Commands[ARequest];
  if Assigned(ADataSet) and (Result.Params.Count > 0) then
  begin
    Result.Params.SetParamValues(ADataSet);
  end;
end;

procedure TFDUpdateSQLExtensions.GetCommandBy(const ARequest: TFDUpdateRequest; out ACommand: TFDCustomCommand;
  const ADataSet: TDataSet);
begin
  ACommand := GetCommandBy(ARequest, ADataSet);
end;

procedure TFDUpdateSQLExtensions.GetCommandBy(const ARequest: TFDUpdateRequest; out ACommand: TFDCustomCommand;
  out ADatSTable: TFDDatSTable; const ADataSet: TDataSet);
begin
  GetCommandBy(ARequest, ACommand, ADataSet);
  ADatSTable := ACommand.Define;
end;

procedure TFDUpdateSQLExtensions.GetCommandFetchRow(const ADataSet: TDataSet; out ADatSTable: TFDDatSTable;
  out ACommand: TFDCustomCommand);
begin
  GetCommandBy(arFetchRow, ACommand, ADatSTable, ADataSet);
end;

procedure TFDUpdateSQLExtensions.GetCommandInsert(const ADataSet: TDataSet; out ACommand: TFDCustomCommand);
begin
  GetCommandBy(arInsert, ACommand, ADataSet);
end;

procedure TFDUpdateSQLExtensions.GetCommandUpdate(const ADataSet: TDataSet; out ACommand: TFDCustomCommand);
begin
  GetCommandBy(arUpdate, ACommand, ADataSet);
end;

end.
