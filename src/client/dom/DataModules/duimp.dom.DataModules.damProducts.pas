unit duimp.dom.DataModules.damProducts;

interface

uses
{PROJECT}
  duimp.dom.DataModules.System.damMain,
{IDE}
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdamProducts = class(TdamMain)
    qryPRO: TFDQuery;
    dsoPRO: TDataSource;
    qryPROCodigo: TIntegerField;
    qryPROProduto: TStringField;
    qryPRODescricao: TStringField;
    qryPRONaoSincPSiscomex: TBooleanField;
    qryPRONCM: TStringField;
    qryEPR: TFDQuery;
    dsoEPR: TDataSource;
    qryEPRCodigo: TIntegerField;
    qryEPRNCM: TStringField;
    qryEPRProduto: TStringField;
    qryEPRDescricao: TStringField;
    qryEPRNaoSincPSiscomex: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
{PROJECT}
  duimp.dom.DataModules.damConnection;

end.
