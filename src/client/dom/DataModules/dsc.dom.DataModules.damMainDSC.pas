unit dsc.dom.DataModules.damMainDSC;

interface

uses
{PROJECT}
  duimp.dom.DataModules.System.damMain,
{IDE}
  FireDAC.Stan.Def, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Phys.MSSQLDef,
  FireDAC.Phys, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, System.Classes, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdamMainDSC = class(TdamMain)
    mtbDUC: TFDMemTable;
    FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink;
    mtbDUCName: TStringField;
    mtbDUCHost: TStringField;
    mtbDUCPath: TStringField;
    mtbDUCPort: TIntegerField;
    mtbDUCProtocol: TStringField;
    dsoDUC: TDataSource;
    mtbDUCConnectionString: TStringField;
    mtbDUCCertificateName: TStringField;
    mtbDUCCertificatePassword: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  damMainDSC: TdamMainDSC;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
