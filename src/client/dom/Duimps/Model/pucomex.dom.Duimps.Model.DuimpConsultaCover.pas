unit pucomex.dom.Duimps.Model.DuimpConsultaCover;

interface

uses
{IDE}
  System.Classes,
{PROJECT}
  pucomex.dom.Duimps.Model.AdicaoValoresCalculadosDuimpCover,
  pucomex.dom.Duimps.Model.CargaDuimpConsultaCover,
  pucomex.dom.Duimps.Model.DocumentosDuimpConsultaCover,
  pucomex.dom.Duimps.Model.EquipeTrabalhoDuimpConsultaCover,
  pucomex.dom.Duimps.Model.IdentificacaoDuimpConsultaCover,
  pucomex.dom.Duimps.Model.ItemConsultaDuimpCover,
  pucomex.dom.Duimps.Model.ItemDuimpCover,
  pucomex.dom.Duimps.Model.PagamentoDuimpConsultaCover,
  pucomex.dom.Duimps.Model.ResultadoAnaliseRiscoDuimpCover,
  pucomex.dom.Duimps.Model.SituacaoDuimpConsultaCover,
  pucomex.dom.Duimps.Model.TratamentoAdministrativoCover,
  pucomex.dom.Duimps.Model.TributoConsultaDuimpCover;

type
  TDuimpConsultaCover = class
  private
    FAdicoes: TArray<TAdicaoValoresCalculadosDuimpCover>;
    FCarga: TCargaDuimpConsultaCover;
    FDocumentos: TDocumentosDuimpConsultaCover;
    FEquipesTrabalho: TArray<TEquipeTrabalhoDuimpConsultaCover>;
    FIdentificacao: TIdentificacaoDuimpConsultaCover;
    FItens: TArray<TItemConsultaDuimpCover>;
    FItensDuimpCover: TArray<TItemDuimpCover>;
    FPagamentos: TArray<TPagamentoDuimpConsultaCover>;
    FQuantidadeItens: Integer;
    FResultadoAnaliseRisco: TResultadoAnaliseRiscoDuimpCover;
    FSituacao: TSituacaoDuimpConsultaCover;
    FTratamentoAdministrativo: TTratamentoAdministrativoCover;
    FTributos: TTributoConsultaDuimpCover;
    function GetAFRMM: Currency;
    function GetQS(const AParam: string): TStringList;
    function GetTup: Currency;
  public
    destructor Destroy; override;
    property Adicoes: TArray<TAdicaoValoresCalculadosDuimpCover> read FAdicoes write FAdicoes;
    property AFRMM: Currency read GetAFRMM;
    property Carga: TCargaDuimpConsultaCover read FCarga write FCarga;
    property Documentos: TDocumentosDuimpConsultaCover read FDocumentos write FDocumentos;
    property EquipesTrabalho: TArray<TEquipeTrabalhoDuimpConsultaCover> read FEquipesTrabalho write FEquipesTrabalho;
    property Identificacao: TIdentificacaoDuimpConsultaCover read FIdentificacao write FIdentificacao;
    property Itens: TArray<TItemConsultaDuimpCover> read FItens write FItens;
    property ItensDuimpCover: TArray<TItemDuimpCover> read FItensDuimpCover write FItensDuimpCover;
    property Pagamentos: TArray<TPagamentoDuimpConsultaCover> read FPagamentos write FPagamentos;
    property QuantidadeItens: Integer read FQuantidadeItens write FQuantidadeItens;
    property ResultadoAnaliseRisco: TResultadoAnaliseRiscoDuimpCover read FResultadoAnaliseRisco write FResultadoAnaliseRisco;
    property Situacao: TSituacaoDuimpConsultaCover read FSituacao write FSituacao;
    property TratamentoAdministrativo: TTratamentoAdministrativoCover read FTratamentoAdministrativo write FTratamentoAdministrativo;
    property Tributos: TTributoConsultaDuimpCover read FTributos write FTributos;
    property Tup: Currency read GetTup;
  end;

implementation

uses
{IDE}
  System.SysUtils,
{PROJECT}
  cbsCore.Reflection,
  cbsCore.SysUtils;

{ TDuimpConsultaCover }
destructor TDuimpConsultaCover.Destroy;
begin
  FreeArrayOfObjects<TAdicaoValoresCalculadosDuimpCover>(FAdicoes);
  FreeAndNil(FCarga);
  FreeAndNil(FDocumentos);
  FreeArrayOfObjects<TEquipeTrabalhoDuimpConsultaCover>(FEquipesTrabalho);
  FreeAndNil(FIdentificacao);
  FreeArrayOfObjects<TItemConsultaDuimpCover>(FItens);
  FreeArrayOfObjects<TItemDuimpCover>(FItensDuimpCover);
  FreeArrayOfObjects<TPagamentoDuimpConsultaCover>(FPagamentos);
  FreeAndNil(FResultadoAnaliseRisco);
  FreeAndNil(FSituacao);
  FreeAndNil(FTratamentoAdministrativo);
  FreeAndNil(FTributos);
  inherited;
end;

function TDuimpConsultaCover.GetAFRMM: Currency;
var
  I: Integer;
  LStringList: TStringList;
begin
  LStringList := GetQS('AFRMM');
  try
    if LStringList.Count > 0 then
    begin
      for I := 0 to pred(LStringList.Count) do if
        not LStringList[I].Trim.IsEmpty then
      begin
        Exit(LStringList[I].Replace('.', '').ToDouble);
      end;
    end;
  finally
    FreeAndNil(LStringList);
  end;
  Result := 0;
end;

function TDuimpConsultaCover.GetQS(const AParam: string): TStringList;
var
  I: Integer;
  LStringList: TStringList;
begin
  Result := TStringList.Create;
  if Pos(AParam, Identificacao.InformacaoComplementar) > 0 then
  begin
    LStringList := TStringList.Create;
    try
      LStringList.Text := Identificacao.InformacaoComplementar;
      for I := 0 to pred(LStringList.Count) do if
        Pos(AParam, LStringList[I]) > 0 then
      begin
        Result := QuebraString(LStringList[I], ' ');
        break;
      end;
      for I := 0 to pred(Result.Count) do if
        ApenasNumeros(Result[I]).Trim.IsEmpty then
      begin
        Result[I] := '';
      end;
    finally
      FreeAndNil(LStringList);
    end;
  end;
end;

function TDuimpConsultaCover.GetTUP: Currency;
var
  I: Integer;
  LStringList: TStringList;
begin
  LStringList := GetQS('TUP');
  try
    if LStringList.Count > 0 then
    begin
      for I := 0 to pred(LStringList.Count) do
      begin
        if not LStringList[I].Trim.IsEmpty then
        begin
          Exit(LStringList[I].Replace('.', '').ToDouble);
        end;
      end;
    end;
  finally
    FreeAndNil(LStringList);
  end;
  Result := 0;
end;

end.
