program signer;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, System.IniFiles, System.IOUtils, Winapi.Windows, System.Types, System.Hash;

procedure Log(const AMsg: string; const AEnableLog, ASilent: Boolean; const ALogFile: string);
var
  LF: TextFile;
begin
  if not ASilent then
  begin
    Writeln(AMsg); // mostra no console apenas se não estiver em ASilent
  end;
  if AEnableLog then
  begin
    AssignFile(LF, ALogFile);
    if FileExists(ALogFile) then
      Append(LF)
    else
      Rewrite(LF);
    try
      Writeln(LF, FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ' - ' + AMsg);
    finally
      CloseFile(LF);
    end;
  end;
end;

function FileNeedsSigning(const AFileName, ALogFile: string): Boolean;
var
  LF: TextFile;
  LLine: string;
begin
  Result := True; // padrão: precisa assinar
  if not FileExists(ALogFile) then Exit;
  var FileHash := THashSHA2.GetHashString(AFileName); // SHA256 do arquivo
  AssignFile(LF, ALogFile);
  Reset(LF);
  try
    while not Eof(LF) do
    begin
      ReadLn(LF, LLine);
      if LLine.Contains(FileHash) then
      begin
        Result := False; // já assinado
        Exit;
      end;
    end;
  finally
    CloseFile(LF);
  end;
end;

procedure SignFile(const AFileName, ASigntoolPath, ACertFile, ACertPass, ATimestamp, AHashAlgo: string;
  const AEnableLog, ASilent: Boolean; const ALogFile: string);
var
  LExitCode: DWORD;
  LProcessInfo: TProcessInformation;
  LStartupInfo: TStartupInfo;
begin
  if not FileNeedsSigning(AFileName, ALogFile) then
  begin
    Log(AFileName + ' -> Skipped (already signed)', AEnableLog, ASilent, ALogFile);
    Exit;
  end;
  var LFileHash := THashSHA2.GetHashString(AFileName);
  var LParams := Format(
    'sign /f "%s" /p %s /tr "%s" /td %s /fd %s "%s"',
    [ACertFile, ACertPass, ATimestamp, AHashAlgo, AHashAlgo, AFileName]);
  FillChar(LStartupInfo, SizeOf(LStartupInfo), 0);
  LStartupInfo.cb := SizeOf(LStartupInfo);
  LStartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  LStartupInfo.wShowWindow := SW_HIDE;
  if CreateProcess(nil, PChar(ASigntoolPath + ' ' + LParams),
    nil, nil, False, CREATE_NO_WINDOW, nil, nil,
    LStartupInfo, LProcessInfo) then
  begin
    WaitForSingleObject(LProcessInfo.hProcess, INFINITE);
    GetExitCodeProcess(LProcessInfo.hProcess, LExitCode);
    CloseHandle(LProcessInfo.hProcess);
    CloseHandle(LProcessInfo.hThread);
    if LExitCode = 0 then
      Log(AFileName + ' -> OK [' + LFileHash + ']', AEnableLog, ASilent, ALogFile)
    else
      Log(AFileName + Format(' -> Failed (ExitCode: %d) [' + LFileHash + ']', [LExitCode]), AEnableLog, ASilent, ALogFile);
  end
  else
    Log(AFileName + ' -> Failed to execute signtool: ' + SysErrorMessage(GetLastError) +
      ' [' + LFileHash + ']', AEnableLog, ASilent, ALogFile);
end;

function ResolvePath(const ABasePath, ARelOrAbs: string): string;
begin
  if TPath.IsPathRooted(ARelOrAbs) then
    Result := TPath.GetFullPath(ARelOrAbs)
  else
    Result := TPath.GetFullPath(TPath.Combine(ABasePath, ARelOrAbs));
end;

procedure ParseParams(const ABasePath, AIniFileName: string;
  out AEnableLog, ASilent, ARecursive: Boolean; out ALogFile: string);
begin
  AEnableLog := False;
  ASilent := False;
  ARecursive := False;
  ALogFile := '';
  var LDefaultLog := TPath.Combine(ABasePath, ChangeFileExt(AIniFileName, '.log'));
  for var I := 1 to ParamCount do
  begin
    var LArg := ParamStr(I);
    if SameText(LArg, '-log') then
    begin
      AEnableLog := True;
      ALogFile := LDefaultLog;
    end
    else if LArg.StartsWith('-log=', True) then
    begin
      AEnableLog := True;
      ALogFile := Copy(LArg, 6, MaxInt);
      if not TPath.IsPathRooted(ALogFile) then
      begin
        ALogFile := TPath.Combine(ABasePath, ALogFile);
      end;
    end
    else if SameText(LArg, '-silent') then
      ASilent := True
    else if SameText(LArg, '-allsubdirs') then
      ARecursive := True;
  end;
end;

procedure ProcessFiles(const ATargetFolder, ASigntoolPath, ACertFile, ACertPass, ATimestamp, AHashAlgo: string;
  const AEnableLog, ASilent: Boolean; const ALogFile: string; ARecursive: Boolean;
  const AExts: TArray<string>);
begin
  if not TDirectory.Exists(ATargetFolder) then
  begin
    Log('Directory not found: ' + ATargetFolder, AEnableLog, ASilent, ALogFile);
    Exit;
  end;
  var LSearchOption := TSearchOption.soTopDirectoryOnly;
  if ARecursive then
  begin
    LSearchOption := TSearchOption.soAllDirectories;
  end;
  for var LExt in AExts do
  begin
    var LValue := LExt.Trim;
    if LValue.IsEmpty then Continue;
    for var LFileName in TDirectory.GetFiles(ATargetFolder, '*.' + LValue, LSearchOption) do
    begin
      SignFile(LFileName, ASigntoolPath, ACertFile, ACertPass, ATimestamp, AHashAlgo, AEnableLog, ASilent, ALogFile);
    end;
  end;
end;

var
  LEnableLog, LSilent, LRecursive: Boolean;
  LLogFile: string;
begin
  try
    var LBasePath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
    var LIniFileName := ChangeFileExt(ExtractFileName(ParamStr(0)), '.ini');
    var LIniFullPath := TPath.Combine(LBasePath, LIniFileName);
    if not FileExists(LIniFullPath) then
    begin
      raise Exception.CreateFmt('Configuration file not found: %s', [LIniFullPath]);
    end;
    ParseParams(LBasePath, LIniFileName, LEnableLog, LSilent, LRecursive, LLogFile);
    var LIni := TIniFile.Create(LIniFullPath);
    try
      var LCertFile := ResolvePath(LBasePath, LIni.ReadString('Config', 'Certificate', ''));
      var LCertPass := LIni.ReadString('Config', 'Password', '');
      var LDirList := LIni.ReadString('Config', 'Directories', '');
      var LExtList := LIni.ReadString('Config', 'Extensions', '');
      var LTimestamp := LIni.ReadString('Config', 'Timestamp', 'http://timestamp.digicert.com');
      var LHashAlgo := LIni.ReadString('Config', 'HashAlgorithm', 'SHA256');
      var LSigntoolPath := ResolvePath(LBasePath, LIni.ReadString('Config', 'Signtool', 'signtool.exe'));
      if not FileExists(LSigntoolPath) then
      begin
        raise Exception.Create('Signtool not found: ' + LSigntoolPath);
      end;
      if (LCertFile = '') or (not FileExists(LCertFile)) then
      begin
        raise Exception.Create('Certificate not found or not configured.');
      end;
      if LCertPass = '' then
      begin
        raise Exception.Create('Certificate password not configured.');
      end;
      if LExtList = '' then
      begin
        raise Exception.Create('No file extensions configured.');
      end;
      var LDirs := LDirList.Split([';'], TStringSplitOptions.ExcludeEmpty);
      var LExts := LExtList.Split([';'], TStringSplitOptions.ExcludeEmpty);
      for var LDir in LDirs do
      begin
        var LValue := ResolvePath(LBasePath, LDir);
        ProcessFiles(LValue, LSigntoolPath, LCertFile, LCertPass, LTimestamp, LHashAlgo, LEnableLog, LSilent, LLogFile, LRecursive, LExts);
      end;
    finally
      LIni.Free;
    end;
  except
    on E: Exception do
    begin
      if not LSilent then
      begin
        Writeln('Error: ' + E.Message);
      end;
      Halt(1);
    end;
  end;
end.
