program updater;

uses
  Vcl.Forms,
  cbsCore.System,
  System.SysUtils,
  updater.SplashFrm in 'src\updater.SplashFrm.pas' {frmSplash: TdxFluentDesignForm};

{$R *.res}

begin
{$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
{$WARN SYMBOL_PLATFORM ON}
  if not GetParamValue('-currentversion').Trim.IsEmpty then
  begin
    Application.Initialize;
    Application.MainFormOnTaskbar := False;
    var frmSplash := TfrmSplash.Create(nil);
    try
      frmSplash.ShowModal;
    finally
      FreeAndNil(frmSplash);
    end;
    Application.Run;
  end;
end.
