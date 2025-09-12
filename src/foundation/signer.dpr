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
    Writeln(AMsg);

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

function GetRelativePath(const ABasePath, AFullPath: string): string;
begin
  var LBase := TPath.GetFullPath(ABasePath);
  var LFull := TPath.GetFullPath(AFullPath);

  // normaliza para ter "\" no final
  if not LBase.EndsWith(PathDelim) then
    LBase := LBase + PathDelim;

  if LFull.StartsWith(LBase, True) then
    Result := '.' + PathDelim + LFull.Substring(LBase.Length)
  else
    Result := AFullPath; // se não for subpasta, mostra como está
end;

function ToRelativePath(const ABasePath, AFileName: string): string;
begin
  Result := GetRelativePath(ABasePath, AFileName);
  if Result.StartsWith('..') then
    Result := AFileName; // fallback se não for possível relativizar
end;

function FileNeedsSigning(const AFileName, ALogFile: string): Boolean;
var
  LF: TextFile;
  LLine: string;
  FileHash: string;
begin
  Result := True;
  if not FileExists(ALogFile) then Exit;
  FileHash := THashSHA2.GetHashString(AFileName);
  AssignFile(LF, ALogFile);
  Reset(LF);
  try
    while not Eof(LF) do
    begin
      ReadLn(LF, LLine);
      if LLine.Contains(FileHash) then
      begin
        Result := False;
        Exit;
      end;
    end;
  finally
    CloseFile(LF);
  end;
end;

procedure SignFile(const AFileName, ASigntoolPath, ACertFile, ACertPass, ATimestamp, AHashAlgo, ABasePath: string;
  const AEnableLog, ASilent: Boolean; const ALogFile: string);
var
  LExitCode: DWORD;
  LProcessInfo: TProcessInformation;
  LStartupInfo: TStartupInfo;
  LFileHash, LRelName, LParams: string;
begin
  LRelName := ToRelativePath(ABasePath, AFileName);

  if not FileNeedsSigning(AFileName, ALogFile) then
  begin
    Log(LRelName + ' -> Skipped (already signed)', AEnableLog, ASilent, ALogFile);
    Exit;
  end;

  LFileHash := THashSHA2.GetHashString(AFileName);
  LParams := Format('sign /f "%s" /p %s /tr "%s" /td %s /fd %s "%s"',
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
      Log(LRelName + ' -> OK [' + LFileHash + ']', AEnableLog, ASilent, ALogFile)
    else
      Log(LRelName + Format(' -> Failed (ExitCode: %d) [' + LFileHash + ']', [LExitCode]), AEnableLog, ASilent, ALogFile);
  end
  else
    Log(LRelName + ' -> Failed to execute signtool: ' + SysErrorMessage(GetLastError) +
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
  out AEnableLog, ASilent, ARecursive: Boolean; out ALogFile: string; out ADirs: TArray<string>);
begin
  AEnableLog := False;
  ASilent := False;
  ARecursive := False;
  ALogFile := '';
  SetLength(ADirs, 0);

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
        ALogFile := TPath.Combine(ABasePath, ALogFile);
    end
    else if SameText(LArg, '-silent') then
      ASilent := True
    else if SameText(LArg, '-allsubdirs') then
      ARecursive := True
    else if LArg.StartsWith('-directories=', True) then
    begin
      var LValue := Copy(LArg, 13, MaxInt);
      ADirs := LValue.Split([';'], TStringSplitOptions.ExcludeEmpty);
      for var J := 0 to High(ADirs) do
        ADirs[J] := ResolvePath(ABasePath, ADirs[J]);
    end;
  end;
end;

procedure ProcessFiles(const ATargetFolder, ASigntoolPath, ACertFile, ACertPass, ATimestamp, AHashAlgo, ABasePath: string;
  const AEnableLog, ASilent: Boolean; const ALogFile: string; ARecursive: Boolean;
  const AExts: TArray<string>);
var
  LSearchOption: TSearchOption;
begin
  if not TDirectory.Exists(ATargetFolder) then
  begin
    Log('Directory not found: ' + ToRelativePath(ABasePath, ATargetFolder), AEnableLog, ASilent, ALogFile);
    Exit;
  end;

  if ARecursive then
    LSearchOption := TSearchOption.soAllDirectories
  else
    LSearchOption := TSearchOption.soTopDirectoryOnly;

  for var LExt in AExts do
  begin
    var LValue := LExt.Trim;
    if LValue.IsEmpty then Continue;
    for var LFileName in TDirectory.GetFiles(ATargetFolder, '*.' + LValue, LSearchOption) do
      SignFile(LFileName, ASigntoolPath, ACertFile, ACertPass, ATimestamp, AHashAlgo, ABasePath, AEnableLog, ASilent, ALogFile);
  end;
end;

var
  LEnableLog, LSilent, LRecursive: Boolean;
  LLogFile: string;
  LDirs: TArray<string>;
begin
  try
    var LBasePath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
    var LIniFileName := ChangeFileExt(ExtractFileName(ParamStr(0)), '.ini');
    var LIniFullPath := TPath.Combine(LBasePath, LIniFileName);

    if not FileExists(LIniFullPath) then
      raise Exception.CreateFmt('Configuration file not found: %s', [LIniFullPath]);

    ParseParams(LBasePath, LIniFileName, LEnableLog, LSilent, LRecursive, LLogFile, LDirs);

    var LIni := TIniFile.Create(LIniFullPath);
    try
      var LCertFile := ResolvePath(LBasePath, LIni.ReadString('Config', 'Certificate', ''));
      var LCertPass := LIni.ReadString('Config', 'Password', '');
      var LExtList := LIni.ReadString('Config', 'Extensions', '');
      var LTimestamp := LIni.ReadString('Config', 'Timestamp', 'http://timestamp.digicert.com');
      var LHashAlgo := LIni.ReadString('Config', 'HashAlgorithm', 'SHA256');
      var LSigntoolPath := ResolvePath(LBasePath, LIni.ReadString('Config', 'Signtool', 'signtool.exe'));

      if not FileExists(LSigntoolPath) then
        raise Exception.Create('Signtool not found: ' + LSigntoolPath);

      if (LCertFile = '') or (not FileExists(LCertFile)) then
        raise Exception.Create('Certificate not found or not configured.');

      if LCertPass = '' then
        raise Exception.Create('Certificate password not configured.');

      if LExtList = '' then
        raise Exception.Create('No file extensions configured.');

      if Length(LDirs) = 0 then
      begin
        var LDirList := LIni.ReadString('Config', 'Directories', '');
        LDirs := LDirList.Split([';'], TStringSplitOptions.ExcludeEmpty);
        for var I := 0 to High(LDirs) do
          LDirs[I] := ResolvePath(LBasePath, LDirs[I]);
      end;

      var LExts := LExtList.Split([';'], TStringSplitOptions.ExcludeEmpty);
      for var LDir in LDirs do
        ProcessFiles(LDir, LSigntoolPath, LCertFile, LCertPass, LTimestamp, LHashAlgo, LBasePath, LEnableLog, LSilent, LLogFile, LRecursive, LExts);

    finally
      LIni.Free;
    end;
  except
    on E: Exception do
    begin
      if not LSilent then
        Writeln('Error: ' + E.Message);
      Halt(1);
    end;
  end;
end.
