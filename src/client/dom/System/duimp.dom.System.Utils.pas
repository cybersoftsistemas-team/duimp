unit duimp.dom.System.Utils;

interface

uses
{IDE}
  System.Classes,
  Winapi.WinCrypt,
  Winapi.Windows;

type
  CSD_CERT_CONTEXT = Winapi.WinCrypt.PCCERT_CONTEXT;

  function CryptUIDlgSelectCertificateFromStore(
    hCertStore: HCERTSTORE;
    hwnd: HWND;
    pwszTitle: LPCWSTR;
    pwszDisplayString: LPCWSTR;
    dwFlags: DWORD;
    pvReserved: Pointer
  ): CSD_CERT_CONTEXT; stdcall; external 'Cryptui.dll';

  function GetCertificate(const AHandle: HWND): CSD_CERT_CONTEXT;
  function GetCertName(const ACertCtx: CSD_CERT_CONTEXT; const AIssuer: Boolean = False): string;
  function GetCertThumbprint(const ACertCtx: CSD_CERT_CONTEXT): string;
  function GetYesOrNoItems: TStrings;
  function HasClientAuthUsage(const ACertCtx: CSD_CERT_CONTEXT): Boolean;
  procedure GetAddressVariables(const AValue: string; out AAddress, ANumber, ANeighborhood: string);

implementation

uses
{IDE}
  System.RegularExpressions,
  System.SysUtils;

var
  InternalYesOrNoItems: TStrings;

function GetCertificate(const AHandle: HWND): CSD_CERT_CONTEXT;
var
  hStore: HCERTSTORE;
  pCertCtx: CSD_CERT_CONTEXT;
begin
  Result := nil;
  hStore := CertOpenSystemStore(0, 'MY');
  if hStore = nil then
  begin
    raise Exception.Create('Não foi possível abrir o repositório de certificados.');
  end;
  try
    pCertCtx := CryptUIDlgSelectCertificateFromStore(
      hStore,
      AHandle,
      'Selecione o certificado',
      'Escolha o certificado a ser usado',
      0,
      nil
    );
    if Assigned(pCertCtx) then
    begin
      Result := pCertCtx;
    end;
  finally
    CertCloseStore(hStore, 0);
  end;
end;

function GetCertName(const ACertCtx: CSD_CERT_CONTEXT; const AIssuer: Boolean): string;
var
  LFlags: DWORD;
begin
  Result := '';
  if ACertCtx = nil then
  begin
    Exit;
  end;
  LFlags := 0;
  if AIssuer then
  begin
    LFlags := CERT_NAME_ISSUER_FLAG;
  end;
  var LNameLen := CertGetNameString(ACertCtx, CERT_NAME_SIMPLE_DISPLAY_TYPE, LFlags, nil, nil, 0);
  if LNameLen > 1 then
  begin
    var LBuffer: array of Char;
    SetLength(LBuffer, LNameLen);
    CertGetNameString(ACertCtx, CERT_NAME_SIMPLE_DISPLAY_TYPE, LFlags, nil, PChar(LBuffer), LNameLen);
    Result := PChar(LBuffer);
  end;
end;

function GetCertThumbprint(const ACertCtx: CSD_CERT_CONTEXT): string;
var
  LHash: array[0..19] of Byte;
  LHashLen: DWORD;
begin
  Result := '';
  LHashLen := SizeOf(LHash);
  if CryptHashCertificate(
    0,
    CALG_SHA1,
    0,
    ACertCtx^.pbCertEncoded,
    ACertCtx^.cbCertEncoded,
    @LHash,
    LHashLen
  ) then
  begin
    for var I := 0 to LHashLen - 1 do
    begin
      Result := Result + IntToHex(LHash[I], 2);
    end;
  end;
end;

function GetYesOrNoItems: TStrings;
begin
  Result := InternalYesOrNoItems;
end;

function HasClientAuthUsage(const ACertCtx: CSD_CERT_CONTEXT): Boolean;
var
  I: Integer;
  LppOID: PLPSTR; // ponteiro para o primeiro OID
  LSize: DWORD;
  LUsage: PCERT_ENHKEY_USAGE;
begin
  Result := False;
  LSize := 0;
  // Primeiro chama para obter o tamanho necessário
  CertGetEnhancedKeyUsage(ACertCtx, 0, nil, LSize);
  if LSize = 0 then
  begin
    Exit;
  end;
  GetMem(LUsage, LSize);
  try
    if CertGetEnhancedKeyUsage(ACertCtx, 0, LUsage, LSize) then
    begin
      LppOID := LUsage.rgpszUsageIdentifier;
      for I := 0 to LUsage.cUsageIdentifier - 1 do
      begin
        if string(LppOID^) = '1.3.6.1.5.5.7.3.2' then
        begin
          Result := True;
          Break;
        end;
        Inc(LppOID); // avança para o próximo LPSTR
      end;
    end;
  finally
    FreeMem(LUsage);
  end;
end;

procedure GetAddressVariables(const AValue: string; out AAddress, ANumber, ANeighborhood: string);
var
  LMatch: TMatch;
  LRegEx: TRegEx;
begin
  AAddress := '';
  ANumber := '';
  ANeighborhood := 'EXTERIOR';
  LRegEx := TRegEx.Create('(?P<rua>[A-Za-zÀ-ÖØ-öø-ÿ0-9\s]+)(?:[,\s]+(?P<numero>\d+))?(?:[,\s]+(?P<bairro>[A-Za-zÀ-ÖØ-öø-ÿ0-9\s]+))?');
  if not AValue.Trim.IsEmpty then
  begin
    LMatch := LRegEx.Match(AValue);
    if LMatch.Success then
    begin
      AAddress := LMatch.Groups['rua'].Value;
      if LMatch.Groups.Count > 2 then
      begin
        ANumber := LMatch.Groups['numero'].Value;
      end;
      if LMatch.Groups.Count > 3 then
      begin
        ANeighborhood := LMatch.Groups['bairro'].Value;
      end;
    end;
  end;
end;

initialization
begin
  InternalYesOrNoItems := TStringList.Create;
  InternalYesOrNoItems.Append('NÃO');
  InternalYesOrNoItems.Append('SIM');
end;

finalization
begin
  FreeAndNil(InternalYesOrNoItems);
end;

end.
