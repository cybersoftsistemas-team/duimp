unit duimp.dom.DataModules.damUserAuth;

interface

uses
{PROJECT}
  duimp.dom.DataModules.System.damMain,
{IDE}
  System.Classes, FireDAC.Stan.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.DApt;

type
  TdamUserAuth = class(TdamMain)
    mtbCER: TFDMemTable;
    dsoCER: TDataSource;
    mtbCERHost: TStringField;
    mtbCERPath: TStringField;
    mtbCERPort: TIntegerField;
    mtbCERProtocol: TStringField;
    mtbCERId: TGuidField;
    mtbCERUrl: TStringField;
    mtbCERCertificatePath: TStringField;
    mtbCERPassword: TStringField;
    mtbCERName: TStringField;
    mtbCERPreview: TStringField;
    mtbCERConnectionString: TStringField;
    mtbLGN: TFDMemTable;
    dsoLGN: TDataSource;
    mtbLGNId: TGuidField;
    mtbLGNUserName: TStringField;
    mtbLGNPassword: TStringField;
    mtbCON: TFDMemTable;
    dsoCON: TDataSource;
    mtbCONId: TGuidField;
    mtbCONConnectionName: TStringField;
    conCadastro: TFDConnection;
    qryCMP: TFDQuery;
    dsoCMP: TDataSource;
    qryCMPCompanyId: TIntegerField;
    qryCMPName: TStringField;
    qryCMPBranch: TIntegerField;
    qryCMPParentId: TIntegerField;
    qryCMPImageIndex: TIntegerField;
    mtbCONConnectionString: TStringField;
    qryCMPDatabaseName: TStringField;
    qryUSR: TFDQuery;
    qryUSREXISTS: TBooleanField;
    qryCMPCNPJ: TStringField;
    qryCMPState: TStringField;
    mtbLGNCompanyCNPJ: TStringField;
    mtbLGNCompanyId: TIntegerField;
    mtbLGNCompanyName: TStringField;
    mtbLGNCompanyState: TStringField;
    mtbLGNDatabaseName: TStringField;
    mtbLGNCompanyBranch: TIntegerField;
    qryCMPDesativada: TBooleanField;
    procedure DataModuleCreate(Sender: TObject);
    procedure mtbCERNewRecord(DataSet: TDataSet);
    procedure mtbCERCalcFields(DataSet: TDataSet);
    procedure mtbCERAfterPost(DataSet: TDataSet);
    procedure DataSetBeforePost(DataSet: TDataSet);
    procedure mtbLGNNewRecord(DataSet: TDataSet);
    procedure mtbCERBeforeDelete(DataSet: TDataSet);
    procedure mtbCERConnectionStringChange(Sender: TField);
  private
    FIsURLValid: Boolean;
    procedure ClearCompany;
    procedure LoadData;
    procedure SetConnectionString(const AValue: string);
  protected
    procedure SetOnDataChangeEvent; override;
  public
    procedure SaveCertificateData;
    procedure SaveLogonData;
    procedure SetConnectionProperties;
    procedure SetConnectionSelected(const AId: TGUID; const AConnectionName, AConnectionString: string);
    property IsURLValid: Boolean read FIsURLValid;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
{IDE}
  System.IOUtils,
  System.RegularExpressions,
  System.SysUtils,
  Winapi.ShlObj,
  Winapi.Windows,
{PROJECT}
  duimp.dom.DataModules.damConnection;

{$R *.dfm}

const
  cstName = 'Nome da conexão Siscomex';
  cstURLLabel = 'URL base do serviço';
  cstInvalidURLText = '''' + cstName + ''' ou ''' + cstURLLabel + ''' inválido!';
  cstURLText = 'Digite o ''' + cstName + ''' e a ''' + cstURLLabel + '''';

  CST_COMPANY_FOLDER = '.cybersoft';
  CST_CONFIG_CERTIFICATES = 'Certificates.dat';
  CST_CONFIG_CONNECTION = 'Connection.dat';
  CST_CONFIG_LOGON = 'Logon.dat';
  CST_CONFIG_FOLDER = 'config';
  CST_ENCRYPTED_PASSWORD = '{77AA2ACA-7789-400A-B074-B9EC9B025322}';

function GetCybersoftDataSubfolder(const ASubFolder: string): string;
var
  LBasePath: string;
  LFullPath: string;
begin
  SetLength(LBasePath, MAX_PATH);
  if SHGetFolderPath(0, CSIDL_COMMON_APPDATA, 0, 0, PChar(LBasePath)) = S_OK then
  begin
    SetLength(LBasePath, StrLen(PChar(LBasePath)));
    LFullPath := TPath.Combine(LBasePath, CST_COMPANY_FOLDER);
    if not DirectoryExists(LFullPath) then
    begin
      ForceDirectories(LFullPath);
      SetFileAttributes(PChar(LFullPath), GetFileAttributes(PChar(LFullPath)) or FILE_ATTRIBUTE_HIDDEN);
    end;
    if not ASubFolder.Trim.IsEmpty then
    begin
      LFullPath := TPath.Combine(LFullPath, ASubFolder);
    end;
    if not DirectoryExists(LFullPath) then
    begin
      ForceDirectories(LFullPath);
    end;
    Result := LFullPath;
  end
  else
    raise Exception.Create('Não foi possível localizar a pasta ProgramData.');
end;

procedure LoadEncryptedMemTable(AMemTable: TFDMemTable; const AFileName, ASubFolder, APassword: string);
var
  LPath: string;
  LData: TBytes;
  LStream: TMemoryStream;
begin
  LPath := TPath.Combine(GetCybersoftDataSubfolder(ASubFolder), AFileName);
  if not FileExists(LPath) then
  begin
    Exit;
  end;
  LData := TFile.ReadAllBytes(LPath);
  for var I := 0 to High(LData) do
  begin
    LData[I] := LData[I] xor Byte(APassword[(I mod Length(APassword)) + 1]);
  end;
  LStream := TMemoryStream.Create;
  try
    LStream.WriteBuffer(LData[0], Length(LData));
    LStream.Position := 0;
    AMemTable.LoadFromStream(LStream, sfBinary);
  finally
    LStream.Free;
  end;
end;

procedure SaveEncryptedMemTable(AMemTable: TFDMemTable; const AFileName, ASubFolder, APassword: string);
var
  LPath: string;
  LStream: TMemoryStream;
  LData: TBytes;
begin
  LPath := TPath.Combine(GetCybersoftDataSubfolder(ASubFolder), AFileName);
  LStream := TMemoryStream.Create;
  try
    AMemTable.SaveToStream(LStream, sfBinary);
    LStream.Position := 0;
    SetLength(LData, LStream.Size);
    LStream.ReadBuffer(LData[0], Length(LData));
    for var I := 0 to High(LData) do
    begin
      LData[I] := LData[I] xor Byte(APassword[(I mod Length(APassword)) + 1]);
    end;
    TFile.WriteAllBytes(LPath, LData);
  finally
    LStream.Free;
  end;
end;

procedure TdamUserAuth.ClearCompany;
begin
  if not mtbLGN.IsEmpty then
  begin
    mtbLGN.Edit;
    mtbLGNCompanyId.Clear;
    mtbLGNCompanyCNPJ.Clear;
    mtbLGNCompanyName.Clear;
    mtbLGNCompanyBranch.Clear;
    mtbLGN.Post;
  end;
end;

procedure TdamUserAuth.DataModuleCreate(Sender: TObject);
begin
  inherited;
  FIsURLValid := False;
  mtbCER.CreateDataSet;
  mtbCON.CreateDataSet;
  mtbLGN.CreateDataSet;
  LoadData;
end;

procedure TdamUserAuth.DataSetBeforePost(DataSet: TDataSet);
var
  LClone: TFDMemTable;
  LCurrentID: Variant;
  LCurrentName: Variant;
begin
  inherited;
  LClone := TFDMemTable.Create(nil);
  try
    LClone.CloneCursor(TFDMemTable(DataSet));
    LCurrentID := DataSet.FieldByName('Id').AsVariant;
    LCurrentName := DataSet.FieldByName('Name').AsVariant;
    if LClone.LocateEx('Name', LCurrentName) and
      (LClone.FieldByName('Id').AsVariant <> LCurrentID) then
    begin
      raise Exception.CreateFmt('Já existe um registro com o nome "%s".', [LCurrentName]);
    end;
  finally
    LClone.Free;
  end;
end;

procedure TdamUserAuth.LoadData;
begin
  LoadEncryptedMemTable(mtbCON, CST_CONFIG_CONNECTION  , CST_CONFIG_FOLDER, CST_ENCRYPTED_PASSWORD);
  LoadEncryptedMemTable(mtbLGN, CST_CONFIG_LOGON       , CST_CONFIG_FOLDER, CST_ENCRYPTED_PASSWORD);
  LoadEncryptedMemTable(mtbCER, CST_CONFIG_CERTIFICATES, CST_CONFIG_FOLDER, CST_ENCRYPTED_PASSWORD);
  if mtbCER.LocateEx('Id', mtbCONId.AsString) then
  begin
    SetConnectionString(mtbCERConnectionString.AsString);
  end;
  mtbLGN.Edit;
  mtbLGNPassword.Clear;
  mtbLGN.Post;
  ClearCompany;
end;

procedure TdamUserAuth.mtbCERAfterPost(DataSet: TDataSet);
begin
  SaveCertificateData;
  if IsEqualGUID(mtbCONId.AsGuid, mtbCERId.AsGuid) then
  begin
    SetConnectionSelected(mtbCERId.AsGuid, mtbCERName.AsString, mtbCERConnectionString.AsString);
  end;
end;

procedure TdamUserAuth.mtbCERBeforeDelete(DataSet: TDataSet);
begin
  if mtbCON.LocateEx('Id', mtbCERId.AsString) then
  begin
    mtbCON.Delete;
    SaveEncryptedMemTable(mtbCON, CST_CONFIG_CONNECTION, CST_CONFIG_FOLDER, CST_ENCRYPTED_PASSWORD);
  end;
end;

procedure TdamUserAuth.mtbCERCalcFields(DataSet: TDataSet);

  function IsMatch(const SearchText, Pattern: string): Boolean;
  begin
    Result := TRegEx.Create(Pattern).Match(SearchText).Success;
  end;

const
  CST_PROTOCOL_HTTP       = 'http://';
  CST_PROTOCOL_HTTPS      = 'https://';
  CST_PORT_HTTP_DEFAULT   = 80;
  CST_PORT_HTTP_ALT       = 8080;
  CST_PORT_HTTPS_DEFAULT  = 443;

var
  LProtocol: string;
  LHost: string;
  LPath: string;
  LPort: Integer;
  LShowPort: Boolean;
begin
  LProtocol := mtbCERProtocol.AsString.Trim;
  LHost := mtbCERHost.AsString.Trim;
  LPath := mtbCERPath.AsString.TrimLeft(['/']);

  if LProtocol.IsEmpty then
  begin
    LProtocol := CST_PROTOCOL_HTTPS;
    mtbCERProtocol.AsString := LProtocol;
  end;

  if ((mtbCERPort.AsInteger <= 0) or (mtbCERPort.AsInteger = CST_PORT_HTTPS_DEFAULT)) and
    SameText(mtbCERProtocol.AsString.Trim, CST_PROTOCOL_HTTP) then
  begin
    mtbCERPort.AsInteger := CST_PORT_HTTP_ALT;
  end
  else if ((mtbCERPort.AsInteger <= 0) or (mtbCERPort.AsInteger = CST_PORT_HTTP_ALT)
    or (mtbCERPort.AsInteger = CST_PORT_HTTP_DEFAULT)) and
    SameText(mtbCERProtocol.AsString.Trim, CST_PROTOCOL_HTTPS)  then
  begin
    mtbCERPort.AsInteger := CST_PORT_HTTPS_DEFAULT;
  end;

  LProtocol := mtbCERProtocol.AsString.Trim;
  LPort := mtbCERPort.AsInteger;

  LShowPort := not (
    (SameText(LProtocol, CST_PROTOCOL_HTTPS) and (LPort = CST_PORT_HTTPS_DEFAULT)) or
    (SameText(LProtocol, CST_PROTOCOL_HTTP) and ((LPort = CST_PORT_HTTP_DEFAULT) or (LPort = CST_PORT_HTTP_ALT)))
  );

  if LShowPort then
    mtbCERUrl.AsString := Format('%s%s:%d/%s', [LProtocol, LHost, LPort, LPath])
  else
    mtbCERUrl.AsString := Format('%s%s/%s', [LProtocol, LHost, LPath]);

  if LHost.IsEmpty then
  begin
    mtbCERPreview.AsString := cstURLText;
  end
  else if not mtbCERUrl.AsString.IsEmpty and
    not IsMatch(mtbCERUrl.AsString, '^https?:\/\/([\w\-\.]+)(?::\d{1,5})?(\/[\w\-\.~\/]*)?$') and
    not mtbCERUrl.AsString.Contains(cstInvalidURLText) then
  begin
    mtbCERPreview.AsString := cstInvalidURLText;
  end
  else
  begin
    mtbCERPreview.AsString := Format('%s: %s', [mtbCERName.AsString, mtbCERUrl.AsString]);
  end;

  FIsURLValid := not SameText(mtbCERPreview.AsString, cstURLText)
    and not SameText(mtbCERPreview.AsString, cstInvalidURLText);
end;

procedure TdamUserAuth.mtbCERConnectionStringChange(Sender: TField);
begin
  inherited;
  SetConnectionString(mtbCERConnectionString.AsString);
end;

procedure TdamUserAuth.mtbCERNewRecord(DataSet: TDataSet);
begin
  mtbCERId.AsGuid := TGUID.NewGuid;
end;

procedure TdamUserAuth.mtbLGNNewRecord(DataSet: TDataSet);
begin
  mtbLGNId.AsGuid := TGUID.NewGuid;
end;

procedure TdamUserAuth.SaveCertificateData;
begin
  SaveEncryptedMemTable(mtbCER, CST_CONFIG_CERTIFICATES, CST_CONFIG_FOLDER, CST_ENCRYPTED_PASSWORD);
end;

procedure TdamUserAuth.SaveLogonData;
begin
  SaveEncryptedMemTable(mtbLGN, CST_CONFIG_LOGON, CST_CONFIG_FOLDER, CST_ENCRYPTED_PASSWORD);
end;

procedure TdamUserAuth.SetConnectionProperties;
begin
  damConnection.DBCadastro.Close;
  damConnection.DBCliente.Close;
  damConnection.DBCadastro.ConnectionString := mtbCONConnectionString.AsString;
  damConnection.DBCliente.ConnectionString := mtbCONConnectionString.AsString;
  damConnection.DBCliente.Params.Values['Database'] := mtbLGNDatabaseName.AsString;
end;

procedure TdamUserAuth.SetConnectionSelected(const AId: TGUID; const AConnectionName, AConnectionString: string);
begin
  mtbCON.Edit;
  mtbCONId.AsGuid := AId;
  mtbCONConnectionName.AsString := AConnectionName;
  mtbCONConnectionString.AsString := AConnectionString;
  mtbCON.Post;
  ClearCompany;
  SaveEncryptedMemTable(mtbCON, CST_CONFIG_CONNECTION, CST_CONFIG_FOLDER, CST_ENCRYPTED_PASSWORD);
  mtbCER.Refresh;
end;

procedure TdamUserAuth.SetConnectionString(const AValue: string);
begin
  conCadastro.Close;
  conCadastro.ConnectionString := mtbCERConnectionString.AsString;
end;

procedure TdamUserAuth.SetOnDataChangeEvent;
begin
  inherited;
  mtbCER.Refresh;
end;

end.

