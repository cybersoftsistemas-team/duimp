unit duimp.dom.DataModules.damConnection;

interface

uses
{PROJECT}
  duimp.dom.DataModules.System.damMain,
{IDE}
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util,
  FireDAC.Comp.Script;

type
  TdamConnection = class(TdamMain)
    DBCadastro: TFDConnection;
    DBCliente: TFDConnection;
    FDStanStorageBinLink: TFDStanStorageBinLink;
    sptSeedCA: TFDScript;
    sptSeedCL: TFDScript;
  private
    procedure DoSeed(const AScript: TFDScript);
  public
    procedure RunClientSeed;
    procedure RunRegisterSeed;
  end;

var
  damConnection: TdamConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdamConnection }

procedure TdamConnection.DoSeed(const AScript: TFDScript);
begin
  AScript.ValidateAll;
  AScript.ExecuteAll;
end;

procedure TdamConnection.RunClientSeed;
begin
  DoSeed(sptSeedCL);
end;

procedure TdamConnection.RunRegisterSeed;
begin
  DoSeed(sptSeedCA);
end;

end.

