unit duimp.dom.System.Application;

interface

uses
{IDE}
  Vcl.Forms,
{PROJECT}
  duimp.pre.view.System.UserAuthForm;

type
  cbsApplication = class
  strict private
    class var FCompanyBranch: Integer;
    class var FCompanyId: Integer;
    class procedure RunClientMigrations; static;
    class procedure RunMigrations; static;
    class procedure RunRegisterMigrations; static;
  public
    class function CompanyBranch: Integer; static;
    class function CompanyId: Integer; static;
    class procedure CheckForUpdates; static;
    class procedure Start(const TLogonForm: TUserAuthForm); static;
  end;

implementation

uses
{IDE}
  System.UITypes,
  System.StrUtils,
  System.SysUtils,
  Winapi.ShellAPI,
  Winapi.Windows,
{PROJECT}
  cbsCore.SysUtils,
  cbsMigrationsFireDac.Contracts.Support.MigrationContext,
  duimp.dom.DataModules.damConnection,
  duimp.dom.System.AppInfo,
  duimp.inf.Database.MigrationContext,
  duimp.pre.view.MainForm,
  pucomex.dom.Support.Authenticator,
  pucomex.dom.Support.PUComex;

{ cbsApplication }

class function cbsApplication.CompanyBranch: Integer;
begin
  Result := FCompanyBranch;
end;

class function cbsApplication.CompanyId: Integer;
begin
  Result := FCompanyId;
end;

class procedure cbsApplication.RunClientMigrations;
var
  LMigration: IFDMigrationContext;
begin
  damConnection.DBCliente.StartTransaction;
  try
    LMigration := TClientMigration.Create;
    try
      LMigration.Connection := damConnection.DBCliente;
      LMigration.UpdateDatabase(
        procedure
        begin
          damConnection.RunClientSeed;
        end);
      damConnection.DBCliente.Commit;
    finally
      LMigration := nil;
    end;
  except
    damConnection.DBCliente.Rollback;
    raise;
  end;
end;

class procedure cbsApplication.RunMigrations;
begin
  RunRegisterMigrations;
  RunClientMigrations;
end;

class procedure cbsApplication.RunRegisterMigrations;
var
  LMigration: IFDMigrationContext;
begin
  damConnection.DBCadastro.StartTransaction;
  try
    LMigration := TRegisterMigration.Create;
    try
      LMigration.Connection := damConnection.DBCadastro;
      LMigration.UpdateDatabase(
        procedure
        begin
          damConnection.RunRegisterSeed;
        end);
      damConnection.DBCadastro.Commit;
    finally
      LMigration := nil;
    end;
  except
    damConnection.DBCadastro.Rollback;
    raise;
  end;
end;

class procedure cbsApplication.CheckForUpdates;
begin
  ShellExecute(0, 'open', 'updater.exe', PChar(Format('-currentversion %s', [TAppInfo.Version])), nil, SW_SHOW);
end;

class procedure cbsApplication.Start(const TLogonForm: TUserAuthForm);
var
  LCaption: string;
  LfrmLogon: TfrmUserAuth;
  LModalResult: TModalResult;
  LSkinPaletteName: string;
begin
{$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
{$WARN SYMBOL_PLATFORM ON}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Cybersoft - Simplificando Operações com Desenvolvimento de Software e Soluções Técnica';
  Application.CreateForm(TdamConnection, damConnection);
  Application.CreateForm(TLogonForm, LfrmLogon);
  try
    try
      LModalResult := LfrmLogon.ShowModal;
      FCompanyBranch := -1;
      FCompanyId := -1;
      if LModalResult = mrOk then
      begin
        LCaption := Concat(
           LfrmLogon.DataModule.mtbCONConnectionName.AsString
          ,'; Empresa: ', LfrmLogon.DataModule.mtbLGNCompanyName.AsString, ' ('
          ,GetCpfOrCnpfMask(GetOnlyNumbers(LfrmLogon.DataModule.mtbLGNCompanyCNPJ.AsString)), ')');
        LSkinPaletteName := IfThen(LfrmLogon.DataModule.mtbCERHost.AsString.Contains('val.'), 'Amber', 'Default');
        Authenticator.Headers.Clear;
        Authenticator.Headers.AddValue('Role-Type', 'IMPEXP');
        Authenticator.BaseURL := Concat(LfrmLogon.DataModule.mtbCERProtocol.AsString, LfrmLogon.DataModule.mtbCERHost.AsString);
        Authenticator.Resource := LfrmLogon.DataModule.mtbCERPath.AsString;
        Authenticator.Password := LfrmLogon.DataModule.mtbCERPassword.AsString;
        Authenticator.CertFile := LfrmLogon.DataModule.mtbCERCertificatePath.AsString;
        Authenticator.Execute;
        PComex := CreatePUComex(Authenticator);
        PComex.Duimp.NI_ESTADO := LfrmLogon.DataModule.mtbLGNCompanyState.AsString;
        PComex.Duimp.NI_IMPORTADOR := GetOnlyNumbers(LfrmLogon.DataModule.mtbLGNCompanyCNPJ.AsString);
        FCompanyBranch := LfrmLogon.DataModule.mtbLGNCompanyBranch.AsInteger;
        FCompanyId := LfrmLogon.DataModule.mtbLGNCompanyId.AsInteger;
      end;
    finally
      FreeAndNil(LfrmLogon);
    end;
    if LModalResult = mrOk then
    begin
      RunMigrations;
      Application.CreateForm(TfrmMain, frmMain);
      frmMain.Caption := Format('%s', [LCaption]);
      frmMain.sclMain.SkinPaletteName := LSkinPaletteName;
    end;
    Application.Run;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar(E.Message), 'Erro', MB_OK or MB_ICONERROR);
      Application.Terminate;
    end;
  end;
end;

end.
