unit duimp.dom.System.DataModules.Utils;

interface

uses
{PROJECT}
  duimp.dom.DataModules.System.damMain;

procedure DoDataBaseChange;
procedure RegisterDataModule(const ADataModule: TdamMain);
procedure UnRegisterDataModule(const ADataModule: TdamMain);

implementation

uses
{IDE}
  System.Generics.Collections,
  System.SysUtils;

var
  InternalDataModule: TList<TdamMain>;

procedure DoDataBaseChange;
var
  LDataModule: TdamMain;
begin
  for LDataModule in InternalDataModule do
  begin
    LDataModule.DataBaseChange;
  end;
end;

procedure RegisterDataModule(const ADataModule: TdamMain);
begin
  if not InternalDataModule.Contains(ADataModule) then
  begin
    InternalDataModule.Add(ADataModule);
  end;
end;

procedure UnRegisterDataModule(const ADataModule: TdamMain);
begin
  InternalDataModule.Remove(ADataModule);
end;

initialization
begin
  InternalDataModule := TList<TdamMain>.Create;
end;

finalization
begin
  FreeAndNil(InternalDataModule);
end;

end.
