unit updater.SplashFrm;

interface

uses
{IDE}
  IdComponent, IdFTP, System.Types, System.Generics.Collections, dxSkinsFluentDesignForm, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinOffice2019Colorful, dxCore, cxClasses, dxSkinsForm, Vcl.Controls, cxLabel, Vcl.StdCtrls, dxGDIPlusClasses, System.Classes, Vcl.ExtCtrls, dxSkinOffice2019Black,
  IdBaseComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase;

type
  TfrmSplash = class(TdxFluentDesignForm)
    dxSkinController: TdxSkinController;
    imgLogo: TImage;
    labInfor01: TcxLabel;
    labInfor02: TcxLabel;
    labSubTitle1: TcxLabel;
    labVer: TcxLabel;
    labInfor: TLabel;
    labDownload: TLabel;
    procedure dxFluentDesignFormActivate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dxFluentDesignFormCreate(Sender: TObject);
    procedure IdFTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure IdFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
  private
    const
      MANIFEST_FILE_FTP = 'manifest.json';
      ROOT_PATH_FTP = 'duimp/updates/';
  private
    FDownloadFileName: string;
    FDownloadSize: Int64;
    FDownloadStart: TDateTime;
    FUpdateFileName: string;
    function GetFTP: TIdFTP;
    function GetUpdateFileName: string;
    function GetAppLocalTempPath: string;
    procedure CheckForUpdates;
    procedure TryConnect(const AIdFTP: TIdFTP);
    procedure SetComponentOnMouseDownEvent;
    procedure UpdateLabelInfo(const AValue: string; const ASleep: DWORD = 1000);
    procedure UpdateSystem(var AExecutableName, AParams: string);
  end;

implementation

uses
{IDE}
  IdFTPCommon,
  System.JSON,
  System.IOUtils,
  System.SysUtils,
  System.Threading,
  Vcl.Forms,
  Winapi.Messages,
  Winapi.ShellAPI,
  Winapi.Windows,

{PROJECT}
  cbsCore.System;

{$R *.dfm}

function FormatSize(Bytes: Int64): string;
begin
  if Bytes < 1024 then
    Result := FormatFloat('0.##', Bytes) + ' B'
  else if Bytes < 1024*1024 then
    Result := FormatFloat('0.##', Bytes / 1024) + ' KB'
  else if Bytes < 1024*1024*1024 then
    Result := FormatFloat('0.##', Bytes / 1024 / 1024) + ' MB'
  else
  begin
    Result := FormatFloat('0.##', Bytes / 1024 / 1024 / 1024) + ' GB';
  end;
end;

function FormatTimeRemaining(ASeconds: Integer): string;
var
  LMinutes: Integer;
begin
  if ASeconds < 60 then
    Result := Format('Falta %d segundos', [ASeconds])
  else if ASeconds < 3600 then
  begin
    LMinutes := ASeconds div 60;
    ASeconds := ASeconds mod 60;
    if ASeconds = 0 then
      Result := Format('Falta %d minutos', [LMinutes])
    else
    begin
      Result := Format('Falta %d minutos %d segundos', [LMinutes, ASeconds]);
    end;
  end
  else
  begin
    var LHours := ASeconds div 3600;
    LMinutes := (ASeconds mod 3600) div 60;
    Result := Format('Falta %d h %d min', [LHours, LMinutes]);
  end;
end;

{ TfrmSplash }

function TfrmSplash.GetAppLocalTempPath: string;
begin
  Result := IncludeTrailingPathDelimiter(GetEnvironmentVariable('TEMP'));
end;

function TfrmSplash.GetFTP: TIdFTP;
begin
  Result := TIdFTP.Create(nil);
  Result.Username := 'cybersoft_importa';
  Result.Password := 'cybersoft@123';
  Result.Passive := True;
  Result.Port := 13000;
  Result.TransferType := ftBinary;
end;

function TfrmSplash.GetUpdateFileName: string;
begin
  Result := '';
  var LManifestFTP := GetFTP;
  try
    TryConnect(LManifestFTP);
    var LStream := TBytesStream.Create;
    try
      LManifestFTP.Get(Concat(ROOT_PATH_FTP, MANIFEST_FILE_FTP), LStream, True);
      LStream.Position := 0;
      var LJsonStr := TEncoding.UTF8.GetString(LStream.Bytes, 0, LStream.Size);
      var LJSONObject := TJSONObject.ParseJSONValue(LJsonStr) as TJSONObject;
      try
        var LLatestVersion: Integer := LJSONObject.GetValue<string>('latestVersion').Replace('.', '').ToInteger;
        var LCurrentVersion: Integer := GetParamValue('-currentversion').Replace('.', '').ToInteger;
        if LCurrentVersion < LLatestVersion then
        begin
          var LExt := ExtractFileExt(LJSONObject.GetValue<string>('installer'));
          var LInstaller := Concat(ChangeFileExt(ExtractFileName(LJSONObject.GetValue<string>('installer')), ''), '-', LJSONObject.GetValue<string>('latestVersion'), LExt);
          Result := Concat(ROOT_PATH_FTP, LInstaller);
        end;
      finally
        FreeAndNil(LJSONObject);
      end;
    finally
      FreeAndNil(LStream);
      LManifestFTP.Disconnect;
    end;
  finally
    FreeAndNil(LManifestFTP);
  end;
end;

procedure TfrmSplash.CheckForUpdates;
var
  LExecutableName: string;
  LParams: string;
begin
  LExecutableName := 'duimp.exe';
  LParams := '-status updated_system';
  UpdateLabelInfo('Verificando se há atualizações...');
  UpdateSystem(LExecutableName, LParams);
  labDownload.Visible := False;
  UpdateLabelInfo(Format('Iniciando o Cybersoft Sistemas %s...', [ChangeFileExt(ExtractFileName(LExecutableName), '')]));
  ShellExecute(Handle, 'open', PChar(LExecutableName), PChar(LParams), nil, SW_SHOWNORMAL);
end;

procedure TfrmSplash.dxFluentDesignFormActivate(Sender: TObject);
begin
  TTask.Create(
    procedure
    begin
      try
        CheckForUpdates;
      finally
        ModalResult := mrOk;
      end;
    end)
  .Start;
end;

procedure TfrmSplash.dxFluentDesignFormCreate(Sender: TObject);
begin
  labInfor.Caption := '';
  labVer.Caption := GetParamValue('-currentversion');
  SetComponentOnMouseDownEvent;
end;

procedure TfrmSplash.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DRAG_MOVE = $F012;
begin
  inherited;
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, SC_DRAG_MOVE, 0);
end;

procedure TfrmSplash.IdFTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
begin
  if FDownloadSize <= 0 then
  begin
    Exit;
  end;
  var LElapsedTime := (Now - FDownloadStart) * SecsPerDay;
  if LElapsedTime > 0 then
  begin
    var LSpeedStr: string;
    var LSpeed := AWorkCount / LElapsedTime; // bytes/s
    var LRemaining := (FDownloadSize - AWorkCount) / LSpeed; // segundos
    if LSpeed < 1024 * 1024 then
      LSpeedStr := FormatFloat('0.##', LSpeed / 1024) + ' KB/s'
    else
    begin
      LSpeedStr := FormatFloat('0.##', LSpeed / 1024 / 1024) + ' MB/s';
    end;
    UpdateLabelInfo(Format('%s - %s de %s (%s)', [FormatTimeRemaining(Round(LRemaining)), FormatSize(AWorkCount), FormatSize(FDownloadSize), LSpeedStr]), 1);
  end;
end;

procedure TfrmSplash.IdFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  if AWorkMode = wmRead then
  begin
    FDownloadStart := Now;
    if AWorkCountMax > 0 then
      FDownloadSize := AWorkCountMax
    else
    begin
      FDownloadSize := TIdFTP(ASender).Size(FUpdateFileName);
    end;
    labDownload.Visible := True;
    labDownload.Caption := Format('Download: %s', [ChangeFileExt(ExtractFileName(FDownloadFileName), '')]);
    UpdateLabelInfo(Format('Iniciando download de %s...', [ChangeFileExt(ExtractFileName(FDownloadFileName), '')]), 1);
  end;
end;

procedure TfrmSplash.SetComponentOnMouseDownEvent;
begin
  for var LComponent in Self do
  begin
    if LComponent is TcxLabel then
    begin
      TcxLabel(LComponent).OnMouseDown := FormMouseDown;
    end
    else if LComponent is TImage then
    begin
      TImage(LComponent).OnMouseDown := FormMouseDown;
    end
    else if LComponent is TPanel then
    begin
      TPanel(LComponent).OnMouseDown := FormMouseDown;
    end;
  end;
end;

procedure TfrmSplash.TryConnect(const AIdFTP: TIdFTP);
begin
  try
    AIdFTP.Disconnect;
    AIdFTP.Host := 'server-cyber';
    AIdFTP.ConnectTimeout := 2000;
    AIdFTP.Connect;
  except
    on E: Exception do
    begin
      try
        AIdFTP.Disconnect;
        AIdFTP.Host := '187.64.131.96';
        AIdFTP.ConnectTimeout := 10000;
        AIdFTP.Connect;
      except
        raise;
      end;
    end;
  end;
end;

procedure TfrmSplash.UpdateLabelInfo(const AValue: string; const ASleep: DWORD);
begin
  labInfor.Caption := AValue;
  Application.ProcessMessages;
  if ASleep > 0 then
  begin
    Sleep(ASleep);
  end;
end;

procedure TfrmSplash.UpdateSystem(var AExecutableName, AParams: string);
begin
  try
    FUpdateFileName := GetUpdateFileName;
    if not FUpdateFileName.Trim.IsEmpty then
    begin
      FDownloadFileName := TPath.GetFileName(FUpdateFileName);
      var LServerFTP := GetFTP;
      try
        LServerFTP.OnWorkBegin := IdFTPWorkBegin;
        LServerFTP.OnWork := IdFTPWork;
        TryConnect(LServerFTP);
        try
          var LAppLocalTempPath := GetAppLocalTempPath;
          var LStream := TFileStream.Create(Concat(LAppLocalTempPath, FDownloadFileName), fmCreate);
          try
            LServerFTP.Get(FUpdateFileName, LStream, True);
          finally
            FreeAndNil(LStream);
          end;
          AExecutableName := Concat(LAppLocalTempPath, FDownloadFileName);
          AParams := '';
        finally
          LServerFTP.Disconnect;
        end;
      finally
        FreeAndNil(LServerFTP);
      end;
    end;
  except
    on E: Exception do
    begin
      Application.NormalizeTopMosts;
      Application.MessageBox(PChar(E.Message), 'Erro', MB_OK or MB_ICONERROR);
      Application.RestoreTopMosts;
    end;
  end;
end;

end.
