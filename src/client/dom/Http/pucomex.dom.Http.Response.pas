unit pucomex.dom.Http.Response;

interface

uses
{PROJECT}
  pucomex.dom.Contracts.Http.Response;

type
  TResponse = class abstract(TInterfacedObject, IResponse)
  strict private
    FDataString: string;
    FMsg: string;
    FResponseCode: Integer;
    function GetDataString: string;
    function GetMsg: string;
    function GetResponseCode: Integer;
  protected
    procedure SetContent(const ADataString: string); dynamic; abstract;
    procedure SetMsg(const AValue: string);
  public
    constructor Create(const ADataString: string; const AResponseCode: Integer);
    property DataString: string read GetDataString;
    property Msg: string read GetMsg;
    property ResponseCode: Integer read GetResponseCode;
  end;

implementation

{ TResponse }

constructor TResponse.Create(const ADataString: string; const AResponseCode: Integer);
begin
  inherited Create;
  FDataString := ADataString;
  FResponseCode := AResponseCode;
  if FResponseCode <= 200 then
  begin
    SetContent(FDataString);
  end
  else SetMsg(
    if ResponseCode = 204 then 'Operação realizada com sucesso. Nenhum conteúdo retornado' else
    if ResponseCode = 400 then 'Requisição mal formatada' else
    if ResponseCode = 401 then 'Usuário não autenticado ou autenticação inválida' else
    if ResponseCode = 403 then 'Usuário não tem permissão de acesso ao recurso' else
    if ResponseCode = 404 then 'Recurso não encontrado' else
    if ResponseCode = 422 then 'Erro(s) de validação da camada de negócio' else
    if ResponseCode = 500 then 'Erro interno no servidor' else ''
  );
end;

function TResponse.GetDataString: string;
begin
  Result := FDataString;
end;

function TResponse.GetMsg: string;
begin
  Result := FMsg;
end;

function TResponse.GetResponseCode: Integer;
begin
  Result := FResponseCode;
end;

procedure TResponse.SetMsg(const AValue: string);
begin
  FMsg := AValue;
end;

end.
