program dsc;

uses
  System.SysUtils,
  Vcl.Forms,
  duimp.pre.view.System.DefForm in 'pre\view\System\duimp.pre.view.System.DefForm.pas' {frmDef: TdxFluentDesignForm},
  duimp.pre.view.System.DialogDefForm in 'pre\view\System\duimp.pre.view.System.DialogDefForm.pas' {frmDialogDef: TdxFluentDesignForm},
  duimp.pre.view.ConnectionEditorForm in 'pre\view\duimp.pre.view.ConnectionEditorForm.pas' {ConnectionEditor: TdxFluentDesignForm},
  duimp.dom.DataModules.System.damMain in 'dom\DataModules\System\duimp.dom.DataModules.System.damMain.pas' {damMain: TDataModule},
  duimp.dom.System.DataModules.Utils in 'dom\System\duimp.dom.System.DataModules.Utils.pas',
  duimp.pre.view.System.Loading in 'pre\view\System\duimp.pre.view.System.Loading.pas',
  duimp.pre.view.System.LoadFormDef in 'pre\view\System\duimp.pre.view.System.LoadFormDef.pas' {frmLoadDef},
  duimp.pre.view.System.LoadingForm in 'pre\view\System\duimp.pre.view.System.LoadingForm.pas' {frmLoading: TdxFluentDesignForm},
  dsc.dom.DataModules.damMainDSC in 'dom\DataModules\dsc.dom.DataModules.damMainDSC.pas' {damMainDSC: TDataModule},
  dsc.MainDSCFrm in 'pre\view\dsc.MainDSCFrm.pas' {frmMainDSC: TdxFluentDesignForm};

{$R *.res}

begin
{$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
{$WARN SYMBOL_PLATFORM ON}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Duimp Config Editor';
  Application.CreateForm(TdamMainDSC, damMainDSC);
  Application.CreateForm(TfrmMainDSC, frmMainDSC);
  Application.Run;
end.
