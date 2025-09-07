unit duimp.pre.view.LogonForm;

interface

uses
{PROJECT}
  duimp.pre.view.System.UserAuthForm,
{IDE}
  Data.DB, System.Classes, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2019Colorful, cxContainer, cxEdit, Vcl.Menus,
  dxLayoutcxEditAdapters, dxLayoutControlAdapters, dxCore, cxMaskEdit, cxButtonEdit, cxDBEdit, cxLocalization, System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList,
  System.Actions, Vcl.ActnList, dxSkinsForm, cxClasses, dxLayoutLookAndFeels, dxLayoutContainer, cxTextEdit, Vcl.StdCtrls, cxButtons, cxLabel, dxLayoutControl, dxGDIPlusClasses,
  Vcl.ExtCtrls, dxSkinOffice2019Black;

type
  TfrmLogon = class(TfrmUserAuth)
    actOptions: TAction;
    actCompanies: TAction;
    loiedtCompanyName: TdxLayoutItem;
    edtCompanyName: TcxDBButtonEdit;
    loiedtConnectionName: TdxLayoutItem;
    edtConnectionName: TcxDBTextEdit;
    loibtnOptions: TdxLayoutItem;
    btnOptions: TcxButton;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    procedure actOptionsExecute(Sender: TObject);
    procedure actCompaniesExecute(Sender: TObject);
  protected
    function IsPossibleConnect: Boolean; override;
    procedure AfterConnect; override;
    procedure DataChange(Sender: TObject; Field: TField); override;
    procedure OnConnect; override;
  end;

implementation

uses
{IDE}
  FireDAC.Stan.Param,
  System.SysUtils,
{PROJECT}
  cbsCore.Reflection,
  duimp.dom.DataModules.damUserAuth,
  duimp.pre.view.CertificatesForm,
  duimp.pre.view.Logon.CompaniesForm;

{$R *.dfm}

{ TfrmLogon }

function TfrmLogon.IsPossibleConnect: Boolean;
begin
  if DataModule.mtbLGNCompanyId.IsNull then
  begin
    raise Exception.Create('Selecione um domíno de acesso.');
  end;
  Result := True;
end;

procedure TfrmLogon.actCompaniesExecute(Sender: TObject);
var
  LForm: TfrmCompanies;
begin
  LForm := TfrmCompanies.Create(Self, DataModule, False);
  try
    if LForm.ShowModal = mrOk then
    begin
      DataModule.mtbLGN.Edit;
      DataModule.mtbLGNCompanyId.AsInteger := DataModule.qryCMPCompanyId.AsInteger;
      DataModule.mtbLGNCompanyName.AsString := DataModule.qryCMPName.AsString;
      DataModule.mtbLGNCompanyState.AsString := DataModule.qryCMPState.AsString;
      DataModule.mtbLGNDatabaseName.AsString := DataModule.qryCMPDatabaseName.AsString;
      DataModule.mtbLGNCompanyCNPJ.AsString := DataModule.qryCMPCNPJ.AsString;
      DataModule.mtbLGN.Post;
    end;
  finally
    DataModule.OnDataChange := DataChange;
    FreeAndNil(LForm);
  end;
end;

procedure TfrmLogon.actOptionsExecute(Sender: TObject);
var
  LForm: TfrmCertificates;
begin
  LForm := TfrmCertificates.Create(Self, DataModule, False);
  try
    LForm.ShowModal;
  finally
    DataModule.OnDataChange := DataChange;
    FreeAndNil(LForm);
  end;
end;

procedure TfrmLogon.AfterConnect;
begin
  DataModule.SaveLogonData;
  ModalResult := mrOk;
  inherited;
end;

procedure TfrmLogon.DataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actCompanies.Enabled := not DataModule.mtbCON.IsEmpty and
    not DataModule.mtbCONConnectionString.AsString.IsEmpty;
  sclMain.SkinPaletteName := IIF(DataModule.mtbCERHost.AsString.Contains('val.'), 'Amber', 'Default');
  labInfor02.Style.Font.Color := IIF(DataModule.mtbCERHost.AsString.Contains('val.'), $002945B2, $009E5A00);
end;

procedure TfrmLogon.OnConnect;
begin
  DataModule.qryUSR.Close;
  DataModule.qryUSR.ParamByName('UserName').AsString := edtUserName.Text;
  DataModule.qryUSR.ParamByName('Password').AsString := edtPassword.Text;
  DataModule.qryUSR.Open;
  if not DataModule.qryUSREXISTS.AsBoolean then
  begin
    raise Exception.Create('Nome de usuário ou sernha incorretos.');
  end;
end;

end.
