unit duimp.dom.System.AppInfo;

interface

type
  TAppInfo = class
  private
    class function GetFileInfoValue(const AKey: string): string; static;
  public
    class function Version: string; static;
    class function CompanyName: string; static;
    class function FileDescription: string; static;
    class function ProductName: string; static;
    class function LegalCopyright: string; static;
  end;

implementation

uses
{IDE}
  System.SysUtils,
  Winapi.Windows;

{ TAppInfo }

class function TAppInfo.Version: string;
var
  Size, Handle: DWORD;
  Buffer: Pointer;
  FileInfo: ^VS_FIXEDFILEINFO;
  VerSize: UINT;
begin
  Result := '';
  Size := GetFileVersionInfoSize(PChar(ParamStr(0)), Handle);
  if Size > 0 then
  begin
    GetMem(Buffer, Size);
    try
      if GetFileVersionInfo(PChar(ParamStr(0)), Handle, Size, Buffer) then
      begin
        if VerQueryValue(Buffer, '\', Pointer(FileInfo), VerSize) then
        begin
          Result := Format('%d.%d.%d.%d', [
            HiWord(FileInfo.dwFileVersionMS), // Major
            LoWord(FileInfo.dwFileVersionMS), // Minor
            HiWord(FileInfo.dwFileVersionLS), // Release
            LoWord(FileInfo.dwFileVersionLS)  // Build
          ]);
        end;
      end;
    finally
      FreeMem(Buffer);
    end;
  end;
end;

class function TAppInfo.GetFileInfoValue(const AKey: string): string;
var
  Size, Handle: DWORD;
  Buffer: Pointer;
  Value: PChar;
  VerSize: UINT;
  SubBlock: string;
begin
  Result := '';
  Size := GetFileVersionInfoSize(PChar(ParamStr(0)), Handle);
  if Size > 0 then
  begin
    GetMem(Buffer, Size);
    try
      if GetFileVersionInfo(PChar(ParamStr(0)), Handle, Size, Buffer) then
      begin
        // Padrão para idiomas: 0409 (US English), 04E4 (Brazilian Portuguese) etc.
        SubBlock := Format('\StringFileInfo\%4.4x%4.4x\%s', [GetThreadLocale, 1200, AKey]);
        if VerQueryValue(Buffer, PChar(SubBlock), Pointer(Value), VerSize) then
          Result := Value;
      end;
    finally
      FreeMem(Buffer);
    end;
  end;
end;

class function TAppInfo.CompanyName: string;
begin
  Result := GetFileInfoValue('CompanyName');
end;

class function TAppInfo.FileDescription: string;
begin
  Result := GetFileInfoValue('FileDescription');
end;

class function TAppInfo.ProductName: string;
begin
  Result := GetFileInfoValue('ProductName');
end;

class function TAppInfo.LegalCopyright: string;
begin
  Result := GetFileInfoValue('LegalCopyright');
end;

end.
