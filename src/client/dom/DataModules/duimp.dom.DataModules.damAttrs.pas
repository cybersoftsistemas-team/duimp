unit duimp.dom.DataModules.damAttrs;

interface

uses
{PROJECT}
  duimp.dom.DataModules.System.damMain,
{IDE}
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.Client, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet;

type
  TdamAttrs = class(TdamMain)
    cmdNCMIns: TFDCommand;
    cmdATSIns: TFDCommand;
    cmdDOMIns: TFDCommand;
    cmdNATIns: TFDCommand;
  public
    procedure Import(const ANcm, ADescricao, AUnidade, ATipoAliquota: string; const ACamex: Boolean;
      const AAdicao, AModalidadeCodigo: Integer; const AII, AIPI, APIS, ACOFINS, APIS_ENTRADA, APIS_SAIDA, ACOFINS_ENTRADA,
      ACOFINS_SAIDA, AReducao_ICMS: Double);
  end;

var
  damAttrs: TdamAttrs;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
{PROJECT}
  cbsCore.Reflection,
  duimp.dom.DataModules.damConnection,
  pucomex.dom.Attributes.Ncm.Model.AtributoDetalhes,
  pucomex.dom.Attributes.Ncm.Model.Dominio,
  pucomex.dom.Contracts.Attributes.Ncm,
  pucomex.dom.Support.PUComex;

{ TdamAttrs }

procedure TdamAttrs.Import(const ANcm, ADescricao, AUnidade, ATipoAliquota: string; const ACamex: Boolean;
  const AAdicao, AModalidadeCodigo: Integer; const AII, AIPI, APIS, ACOFINS, APIS_ENTRADA, APIS_SAIDA, ACOFINS_ENTRADA,
  ACOFINS_SAIDA, AReducao_ICMS: Double);
var
  LInTransactionB: Boolean;
  LInTransactionC: Boolean;
begin
  if ANcm.Trim.IsEmpty or ADescricao.Trim.IsEmpty or AUnidade.Trim.IsEmpty then
  begin
    Exit;
  end;
  LInTransactionB := not damConnection.DBCadastro.InTransaction;
  LInTransactionC := not damConnection.DBCliente.InTransaction;
  if LInTransactionB then
  begin
    damConnection.DBCadastro.StartTransaction;
  end;
  if LInTransactionC then
  begin
    damConnection.DBCliente.StartTransaction;
  end;
  try
    cmdNCMIns.ParamByName('NCM').AsString := ANcm;
    cmdNCMIns.ParamByName('Produto').AsString := ADescricao;
    cmdNCMIns.ParamByName('Unidade').AsString := AUnidade;
    cmdNCMIns.ParamByName('Modalidade').AsInteger := AModalidadeCodigo;
    cmdNCMIns.ParamByName('CodigoTrib_TabA').AsString := IIF(not ACamex, '1', '6');
    cmdNCMIns.ParamByName('CodigoTrib_TabA2').AsString := '0';
    cmdNCMIns.ParamByName('CodigoTrib_TabA3').AsString := '2';
    cmdNCMIns.ParamByName('Genero').AsInteger := AAdicao;
    cmdNCMIns.ParamByName('ICMS_Reducao').AsFloat := AReducao_ICMS;
    cmdNCMIns.ParamByName('II').AsFloat := AII;
    cmdNCMIns.ParamByName('IPI').AsFloat := AIPI;
    cmdNCMIns.ParamByName('PIS').AsFloat := APIS;
    cmdNCMIns.ParamByName('PIS_Nota').AsFloat := APIS_ENTRADA;
    cmdNCMIns.ParamByName('PIS_NotaSaida').AsFloat := APIS_SAIDA;
    cmdNCMIns.ParamByName('COFINS').AsFloat := ACOFINS;
    cmdNCMIns.ParamByName('COFINS_Nota').AsFloat := ACOFINS_ENTRADA;
    cmdNCMIns.ParamByName('COFINS_NotaSaida').AsFloat := ACOFINS_SAIDA;
    cmdNCMIns.Execute;
    PComex.Attributes.Ncm.Get(ANcm,
      procedure(const AResponse: INcmAttributesResponse)
      var
        LAtributo: TDetalhesAtributos;
        LDominio: TDominio;
      begin
        if (AResponse.ResponseCode = 200) and
          Assigned(AResponse.Content) then
        begin
          for LAtributo in AResponse.Content.DetalhesAtributos do
          begin
            cmdATSIns.ParamByName('Codigo').AsString := LAtributo.Codigo;
            cmdATSIns.ParamByName('Nome_Apresentacao').AsString := LAtributo.NomeApresentacao;
            cmdATSIns.ParamByName('Nome_Atributo').AsString := LAtributo.Nome;
            cmdATSIns.ParamByName('Orientacao_Preenchimento').AsString := LAtributo.OrientacaoPreenchimento;
            cmdATSIns.ParamByName('Forma_Preenchimento').AsString := LAtributo.FormaPreenchimento;
            cmdATSIns.ParamByName('Modalidade_Operacao').AsString := LAtributo.Modalidade;
            cmdATSIns.ParamByName('Multivalorado').AsBoolean := LAtributo.Multivalorado;
            cmdATSIns.ParamByName('Obrigatorio').AsBoolean := LAtributo.Obrigatorio;
            cmdATSIns.Execute;
            for LDominio in LAtributo.Dominio do
            begin
              cmdDOMIns.ParamByName('Atributo').AsString := LAtributo.Codigo;
              cmdDOMIns.ParamByName('Codigo').AsString := LDominio.Codigo;
              cmdDOMIns.ParamByName('Descricao').AsString := LDominio.Descricao;
              cmdDOMIns.Execute;
            end;
            cmdNATIns.ParamByName('NCM').AsString := ANcm;
            cmdNATIns.ParamByName('Atributo').AsString := LAtributo.Codigo;
            cmdNATIns.Execute;
          end;
        end;
      end);
    if LInTransactionB then
    begin
      damConnection.DBCadastro.Commit;
    end;
    if LInTransactionC then
    begin
      damConnection.DBCliente.Commit;
    end;
  except
    if LInTransactionB then
    begin
      damConnection.DBCadastro.Rollback;
    end;
    if LInTransactionC then
    begin
      damConnection.DBCliente.Rollback;
    end;
    raise;
  end;
end;

end.
