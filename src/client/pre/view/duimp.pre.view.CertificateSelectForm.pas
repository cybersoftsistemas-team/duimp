unit duimp.pre.view.CertificateSelectForm;

interface

uses
{PROJECT}
  duimp.dom.DataModules.damUserAuth,
  duimp.dom.System.Utils,
  duimp.pre.view.System.DialogDefForm,
{IDE}
  System.Generics.Collections, System.Types, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2019Colorful, Vcl.Menus,
  dxLayoutControlAdapters, dxLayoutcxEditAdapters, dxLayoutContainer, dxCore, cxContainer, cxEdit, Vcl.Controls, Vcl.ComCtrls, cxLabel, cxLocalization, System.ImageList,
  Vcl.ImgList, cxImageList, System.Classes, System.Actions, Vcl.ActnList, dxSkinsForm, cxClasses, dxLayoutLookAndFeels, Vcl.StdCtrls, cxButtons, dxLayoutControl;

type
  TfrmCertificateSelect = class(TfrmDialogDef)
    labInfo: TcxLabel;
    dxLayoutItem1: TdxLayoutItem;
    labInfo02: TcxLabel;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    lstCer: TListView;
    procedure dxFluentDesignFormActivate(Sender: TObject);
    procedure lstCerDrawItem(Sender: TCustomListView; Item: TListItem; Rect: TRect; State: TOwnerDrawState);
    procedure dxFluentDesignFormCreate(Sender: TObject);
    procedure dxFluentDesignFormDestroy(Sender: TObject);
    procedure lstCerSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
  private
    type
      TCertificateInfo = record
        Subject: string;
        Issuer: string;
        ValidFrom: TDateTime;
        ValidTo: TDateTime;
        Thumb: string;
      end;
  private
    FCertList: TList<TCertificateInfo>;
    FSelected: TCertificateInfo;
    function GetdamUserAuth: TdamUserAuth;
    procedure LoadCertsFromStore;
  public
    property DataModule: TdamUserAuth read GetdamUserAuth;
    property Selected: TCertificateInfo read FSelected;
  end;

implementation

uses
{IDE}
  System.SysUtils,
  Vcl.Graphics,
  Winapi.WinCrypt,
  Winapi.Windows;

{$R *.dfm}

procedure TfrmCertificateSelect.LoadCertsFromStore;
var
  hStore: HCERTSTORE;
  pCertCtx: CSD_CERT_CONTEXT;
  Info: TCertificateInfo;
  SysTime: TSystemTime;
  ValidFrom, ValidTo: TDateTime;
begin
  FCertList.Clear;
  lstCer.Items.Clear;
  hStore := CertOpenSystemStore(0, 'MY'); // certificados pessoais do usuário
  if hStore = nil then
  begin
    Exit;
  end;
  try
    pCertCtx := nil;
    pCertCtx := CertEnumCertificatesInStore(hStore, pCertCtx);
    while pCertCtx <> nil do
    begin
      // Datas de validade
      FileTimeToSystemTime(pCertCtx.pCertInfo.NotBefore, SysTime);
      ValidFrom := SystemTimeToDateTime(SysTime);
      FileTimeToSystemTime(pCertCtx.pCertInfo.NotAfter, SysTime);
      ValidTo := SystemTimeToDateTime(SysTime);
      // Ignora certificados expirados ou ainda não válidos
      if (Now < ValidFrom) or (Now > ValidTo) then
      begin
        pCertCtx := CertEnumCertificatesInStore(hStore, pCertCtx);
        Continue;
      end;
      Info.Subject := GetCertName(pCertCtx, False);
      Info.Issuer  := GetCertName(pCertCtx, True);
      // Ignora autoassinados
      if Info.Subject = Info.Issuer then
      begin
        pCertCtx := CertEnumCertificatesInStore(hStore, pCertCtx);
        Continue;
      end;
      // Ignora certificados sem Client Authentication ou com outros usos
      if not HasClientAuthUsage(pCertCtx) then
      begin
        pCertCtx := CertEnumCertificatesInStore(hStore, pCertCtx);
        Continue;
      end;
      Info.ValidFrom := ValidFrom;
      Info.ValidTo := ValidTo;
      Info.Thumb := GetCertThumbprint(pCertCtx);
      FCertList.Add(Info);
      with lstCer.Items.Add do
      begin
        Caption := Info.Subject;
      end;
      pCertCtx := CertEnumCertificatesInStore(hStore, pCertCtx);
    end;
  finally
    CertCloseStore(hStore, 0);
  end;
end;

procedure TfrmCertificateSelect.dxFluentDesignFormActivate(Sender: TObject);
begin
  inherited;
  CanMoveOwnerForm := True;
end;

procedure TfrmCertificateSelect.dxFluentDesignFormCreate(Sender: TObject);
begin
  inherited;
  FCertList := TList<TCertificateInfo>.Create;
  LoadCertsFromStore;
  labInfo02.Caption := Format('O site %s:%d precisa de suas credenciais:',
    [DataModule.mtbCERHost.AsString, DataModule.mtbCERPort.AsInteger]);
end;

procedure TfrmCertificateSelect.dxFluentDesignFormDestroy(Sender: TObject);
begin
  FreeAndNil(FCertList);
  inherited;
end;

function TfrmCertificateSelect.GetdamUserAuth: TdamUserAuth;
begin
  Result := TdamUserAuth(inherited DataModule);
end;

procedure TfrmCertificateSelect.lstCerDrawItem(Sender: TCustomListView; Item: TListItem; Rect: TRect; State: TOwnerDrawState);
var
  Info: TCertificateInfo;
  C: TCanvas;
  LineHeight, Y: Integer;
  Padding: Integer;
  DrawRect, SelectionRect: TRect;
begin
  C := Sender.Canvas;
  Info := FCertList[Item.Index];

  Padding := 10;

  // área do conteúdo (texto)
  DrawRect := Rect;
  InflateRect(DrawRect, -Padding, -Padding);

  // área da seleção (fundo + borda)
  SelectionRect := Rect;
  InflateRect(SelectionRect, -5, -3); // diminui nas laterais para não colar nas bordas

  LineHeight := C.TextHeight('Wg');
  Y := DrawRect.Top;

  // Fundo e seleção
  if odSelected in State then
  begin
    // fundo
    C.Brush.Color := $00F0F0F0; // cinza claro
    C.FillRect(SelectionRect);

    // borda azul
    C.Pen.Color := $00B96B10;
    C.Pen.Width := 3;
    C.Brush.Style := bsClear;
    C.Rectangle(SelectionRect);
    C.Brush.Style := bsSolid;

    SetBkMode(C.Handle, TRANSPARENT);
  end
  else
  begin
    C.Brush.Color := clWindow;
    C.FillRect(Rect);
    SetBkMode(C.Handle, TRANSPARENT);
  end;

  // Subject
  C.Font.Style := [fsBold];
  C.Font.Size := 8;
  C.Font.Color := clBlack; // sempre preto
  C.TextOut(DrawRect.Left, Y, Info.Subject);
  Inc(Y, LineHeight + 2);

  // Outras informações
  C.Font.Style := [];
  if odSelected in State then
    C.Font.Color := clBlack
  else
    C.Font.Color := clGrayText;
  C.TextOut(DrawRect.Left, Y, 'Autoridade: ' + Info.Issuer);
  Inc(Y, LineHeight);
  C.TextOut(DrawRect.Left, Y,
    Format('Validade: %s até %s', [DateToStr(Info.ValidFrom), DateToStr(Info.ValidTo)]));
end;


procedure TfrmCertificateSelect.lstCerSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  lstCer.Repaint;
  actWindowOk.Enabled := Selected;
  FSelected := FCertList[Item.Index];
end;

end.
