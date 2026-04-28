unit duimp.dom.DataModules.damProducts;

interface

uses
{PROJECT}
  duimp.dom.DataModules.System.damMain,
{SPRING}
  Spring.Collections,
{IDE}
  System.JSON, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet;

type
  IProductList = IDictionary<string, string>;

  TdamProducts = class(TdamMain)
    qryPRO: TFDQuery;
    dsoPRO: TDataSource;
    qryPROProdId: TIntegerField;
    qryPROProduto: TStringField;
    qryPRODescricao: TStringField;
    qryPRONCM: TStringField;
    qryEPR: TFDQuery;
    dsoEPR: TDataSource;
    qryEPRprodId: TIntegerField;
    qryEPRNCM: TStringField;
    qryEPRdescricao: TStringField;
    EPRInsOrDel: TFDCommand;
    qryEPRsituacao: TStringField;
    qryEPRmodalidade: TStringField;
    qryATT: TFDQuery;
    dsoATT: TDataSource;
    qryATTProdId: TIntegerField;
    qryATTNcm: TStringField;
    qryATTAtributo: TStringField;
    qryATTNomeApresentacao: TStringField;
    qryATTNome: TStringField;
    qryATTorientacaoPreenchimento: TStringField;
    qryATTformaPreenchimento: TStringField;
    qryATTvalor: TStringField;
    qryATTmodalidade: TStringField;
    qryATTmultivalorado: TBooleanField;
    qryDOM: TFDQuery;
    qryDOMatributo: TStringField;
    qryDOMcodigo: TStringField;
    qryDOMdescricao: TStringField;
    dsoDOM: TDataSource;
    updPAT: TFDUpdateSQL;
    qryATD: TFDQuery;
    qryFOR: TFDQuery;
    qryFORProdId: TIntegerField;
    qryFORCodigo: TIntegerField;
    qryFORNome: TStringField;
    qryFORLogradouro: TStringField;
    qryFORNomeCidade: TStringField;
    qryFORCodigoPais: TStringField;
    qryFORCep: TStringField;
    qryFOREmail: TStringField;
    qryFORcodigoDuimp: TStringField;
    dsoFOR: TDataSource;
    qryFAB: TFDQuery;
    qryFABProdId: TIntegerField;
    qryFABCodigo: TIntegerField;
    qryFABNome: TStringField;
    qryFABLogradouro: TStringField;
    qryFABNomeCidade: TStringField;
    qryFABCodigoPais: TStringField;
    qryFABCep: TStringField;
    qryFABEmail: TStringField;
    qryFABCodigoDuimp: TStringField;
    dsoFAB: TDataSource;
    qryATTobrigatorio: TBooleanField;
    qryEPRseq: TLargeintField;
    qryEPRmsg: TMemoField;
    qryEPRcpfCnpjRaiz: TStringField;
    qryEPRdenominacao: TStringField;
    qryEPRcodigoProduto: TIntegerField;
    updEPR: TFDUpdateSQL;
    qryEPRNaoSincPSiscomex: TBooleanField;
    updFAO: TFDUpdateSQL;
    qryFORseq: TIntegerField;
    mtbFPR: TFDMemTable;
    mtbFPRcpfCnpjFabricante: TStringField;
    mtbFPRConhecido: TBooleanField;
    mtbFPRCodigoOperadorEstrangeiro: TStringField;
    mtbFPRCodigoProduto: TIntegerField;
    mtbFPRCodigoPais: TStringField;
    qryFORcnpj: TStringField;
    qryFABcnpj: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryATTvalorGetText(Sender: TField; var Text: string; DisplayText:
        Boolean);
    procedure qryEPRCalcFields(DataSet: TDataSet);
  private
    function ConverterProDSTToJSON(const AMasterDS, ADetailDS: TDataSet): TJSONArray;
    function DataSetToJSONArray(const AMaster: TDataSet; const ADetails: TDataSet = nil): TJSONArray;
    function DataSetToJSONObject(const ADataSet: TDataSet): TJSONObject;
    function FindProdID(AMessages: TArray<string>; out AProdID: Integer): Boolean;
    function ForeignOperatorsUpdateRecord(const ANome: string; ACpfCnpjRaiz: string; const ACodigoPais: string; const ACodigoDuimpField: TField; const ADataSet: TDataSet;
      const AProduct: TDataSet): Boolean;
    function DataSetToJSONStringStream(const AMaster: TDataSet; const ADetails: TDataSet = nil): TStringStream;
    procedure GetProducts;
    procedure LinkManufacturerOrProducerToProduct(const ACodigoOperadorEstrangeiroField: TField; const ACpfCnpjFabricanteField: TField; const ACodigoProdutoField: TField;
      const ACodigoPaisField: TField);
  public
    procedure ExportProd;
    procedure GetAllProducts;
    procedure GetProductsForExport;
    procedure ImportAttributes(const AProducts: IProductList);
    procedure PrepareProducts(const AProducts: IProductList);
  end;

  function CreateProductList: IProductList;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
{IDE}
  Data.FmtBcd,
  Data.SqlTimSt,
  System.Generics.Collections,
  System.Generics.Defaults,
  System.NetEncoding,
  System.SysUtils,
  System.RegularExpressions,
  System.Variants,
{PROJECT}
  duimp.dom.DataModules.damAttrs,
  duimp.dom.DataModules.damConnection,
  duimp.dom.Products.Attributes.FillingForm,
  duimp.dom.System.DataModules.Extensions,
  duimp.dom.System.Utils,
  pucomex.dom.Contracts.Http.Response.LoteValidacao,
  pucomex.dom.Contracts.Http.Response.LoteValidacaoVersao,
  pucomex.dom.Contracts.Http.Response.OperadorEstrangeiroIntegracao,
  pucomex.dom.Duimps.Model.OperadorEstrangeiroIntegracaoDTO,
  pucomex.dom.Http.Model.Response.LoteValidacaoVersaoDTO,
  pucomex.dom.Support.PUComex;

type
  EDataSetConverterException = class(Exception);
  TBooleanFieldType = (bfUnknown, bfBoolean, bfInteger);

resourcestring
  ERROR_PRODUCT_REGISTERED = 'Já existe produto idêntico cadastrado. Código:';

function CreateProductList: IProductList;
begin
  Result := TCollections.CreateDictionary<string, string>;
end;

procedure RemoverAtributosSemValor(Atributos: TJSONArray);
begin
  for var I := Atributos.Count - 1 downto 0 do
  begin
    var Obj := Atributos.Items[I] as TJSONObject;
    if (Obj.GetValue('valor') = nil) or
       (Obj.GetValue('valor').Value = '') or
       (Obj.GetValue('valor').Value = 'null') then
    begin
      Atributos.Remove(I);
    end;
  end;
end;

{ TdamProducts }

function TdamProducts.ConverterProDSTToJSON(const AMasterDS, ADetailDS: TDataSet): TJSONArray;
begin
  Result := DataSetToJSONArray(AMasterDS, ADetailDS);
end;

function TdamProducts.DataSetToJSONArray(const AMaster: TDataSet; const ADetails: TDataSet = nil): TJSONArray;
begin
  Result := TJSONArray.Create;
  if Assigned(AMaster) and not AMaster.IsEmpty then
  begin
    var LBookMark := AMaster.BookMark;
    try
      AMaster.First;
      while not AMaster.Eof do
      begin
        var LJSonObject := DataSetToJSONObject(AMaster);
        if Assigned(ADetails) and not ADetails.IsEmpty then
        begin
          var LDetailDS := DataSetToJSONArray(ADetails);
          RemoverAtributosSemValor(LDetailDS);
          LJSonObject.AddPair('atributos', LDetailDS);
        end;
        Result.AddElement(LJSonObject);
        AMaster.Next;
      end;
    finally
      if AMaster.BookmarkValid(LBookMark) then
      begin
        AMaster.GotoBookmark(LBookMark);
      end;
      AMaster.FreeBookmark(LBookMark);
    end;
  end;
end;

function TdamProducts.DataSetToJSONObject(const ADataSet: TDataSet): TJSONObject;

  function BooleanToJSON(const value: Boolean): TJSONValue;
  begin
    if value then
      Result := TJSONTrue.Create
    else
      Result := TJSONFalse.Create;
  end;

  function BooleanFieldToType(const booleanField: TBooleanField): TBooleanFieldType;
  const
    DESC_BOOLEAN_FIELD_TYPE: array [TBooleanFieldType] of string = ('Unknown', 'Boolean', 'Integer');
  var
    index: Integer;
    origin: string;
  begin
    Result := bfUnknown;
    origin := Trim(booleanField.Origin);
    for index := Ord(Low(TBooleanFieldType)) to Ord(High(TBooleanFieldType)) do
      if (LowerCase(DESC_BOOLEAN_FIELD_TYPE[TBooleanFieldType(index)]) = LowerCase(origin)) then
        Exit(TBooleanFieldType(index));
  end;

  function DateToISODate(const date: TDateTime): string;
  begin
    Result := FormatDateTime('YYYY-MM-DD', date);
  end;

  function DateTimeToISOTimeStamp(const dateTime: TDateTime): string;
  var
    fs: TFormatSettings;
  begin
    fs.TimeSeparator := ':';
    Result := FormatDateTime('yyyy-mm-dd hh:nn:ss', dateTime, fs);
  end;

  function SQLTimeStampToStr(const Format: string; DateTime: TSQLTimeStamp): string;
  var
    FTimeStamp: TDateTime;
  begin
    FTimeStamp := SqlTimeStampToDateTime(DateTime);
    DateTimeToString(Result, Format, FTimeStamp);
  end;

begin
  Result := nil;
  if Assigned(ADataSet) and not ADataSet.IsEmpty then
  begin
    Result := TJSONObject.Create;
    for var I := 0 to Pred(ADataSet.FieldCount) do if
      ADataSet.Fields[I].Tag = 0 then
    begin
      var LKey := ADataSet.Fields[I].FieldName;
      case ADataSet.Fields[I].DataType of
        TFieldType.ftBoolean:
          begin
            var LBft := BooleanFieldToType(TBooleanField(ADataSet.Fields[I]));
            case LBft of
              bfUnknown, bfBoolean: Result.AddPair(LKey, BooleanToJSON(ADataSet.Fields[I].AsBoolean));
              bfInteger: Result.AddPair(LKey, TJSONNumber.Create(ADataSet.Fields[I].AsInteger));
            end;
          end;
        TFieldType.ftInteger, TFieldType.ftSmallint, TFieldType.ftShortint:
          Result.AddPair(LKey, TJSONNumber.Create(ADataSet.Fields[I].AsInteger));
        TFieldType.ftLongWord, TFieldType.ftAutoInc:
          begin
            if not ADataSet.Fields[I].IsNull then
              Result.AddPair(LKey, TJSONNumber.Create(ADataSet.Fields[I].AsWideString))
            else
              Result.AddPair(LKey, TJSONNull.Create);
          end;
        TFieldType.ftLargeint:
          Result.AddPair(LKey, TJSONNumber.Create(ADataSet.Fields[I].AsLargeInt));
        TFieldType.ftSingle, TFieldType.ftFloat:
          Result.AddPair(LKey, TJSONNumber.Create(ADataSet.Fields[I].AsFloat));
        ftString, ftWideString, ftMemo, ftWideMemo:
          begin
            if not ADataSet.Fields[I].IsNull then
            begin
              if SameText(ADataSet.Fields[I].AsWideString, 'SIM') then
              begin
                Result.AddPair(LKey, TJSONTrue.Create);
              end
              else if SameText(ADataSet.Fields[I].AsWideString, 'NÃO') then
              begin
                Result.AddPair(LKey, TJSONFalse.Create);
              end
              else
                Result.AddPair(LKey, TJSONString.Create(ADataSet.Fields[I].AsWideString));
            end
            else
              Result.AddPair(LKey, TJSONNull.Create);
          end;
        TFieldType.ftDate:
          begin
            if not ADataSet.Fields[I].IsNull then
              Result.AddPair(LKey, TJSONString.Create(DateToISODate(ADataSet.Fields[I].AsDateTime)))
            else
              Result.AddPair(LKey, TJSONNull.Create);
          end;
        TFieldType.ftTimeStamp, TFieldType.ftDateTime:
          begin
            if not ADataSet.Fields[I].IsNull then
              Result.AddPair(LKey, TJSONString.Create(DateTimeToISOTimeStamp(ADataSet.Fields[I].AsDateTime)))
            else
              Result.AddPair(LKey, TJSONNull.Create);
          end;
        TFieldType.ftTime:
          begin
            if not ADataSet.Fields[I].IsNull then
            begin
              var LTimeStamp := ADataSet.Fields[I].AsSQLTimeStamp;
              Result.AddPair(LKey, TJSONString.Create(SQLTimeStampToStr('hh:nn:ss', LTimeStamp)));
            end
            else
              Result.AddPair(LKey, TJSONNull.Create);
          end;
        TFieldType.ftCurrency:
          begin
            if not ADataSet.Fields[I].IsNull then
              Result.AddPair(LKey, TJSONString.Create(FormatCurr('0.00##', ADataSet.Fields[I].AsCurrency)))
            else
              Result.AddPair(LKey, TJSONNull.Create);
          end;
        TFieldType.ftFMTBcd, TFieldType.ftBCD:
          begin
            if not ADataSet.Fields[I].IsNull then
              Result.AddPair(LKey, TJSONNumber.Create(BcdToDouble(ADataSet.Fields[I].AsBcd)))
            else
              Result.AddPair(LKey, TJSONNull.Create);
          end;
        TFieldType.ftGraphic, TFieldType.ftBlob, TFieldType.ftStream:
          begin
            var ms := TMemoryStream.Create;
            try
              TBlobField(ADataSet.Fields[I]).SaveToStream(ms);
              ms.Position := 0;
              var ss := TStringStream.Create;
              try
                TNetEncoding.Base64.Encode(ms, ss);
                Result.AddPair(LKey, TJSONString.Create(ss.DataString));
              finally
                ss.Free;
              end;
            finally
              ms.Free;
            end;
          end;
        TFieldType.ftGuid:
        begin
          Result.AddPair(LKey, ADataSet.Fields[I].AsString);
        end;
      else
        raise EDataSetConverterException.CreateFmt('Cannot find type for field "%s"', [LKey]);
      end;
    end;
  end;
end;

function TdamProducts.FindProdID(AMessages: TArray<string>; out AProdID: Integer): Boolean;

  function ExtractProdID(const AText: string): string;
  var
    LMatch: TMatch;
  begin
    LMatch := TRegEx.Match(AText, 'Código:\s*(\d+),?');
    if LMatch.Success then
    begin
      Exit(LMatch.Groups[1].Value);
    end;
    Result := '';
  end;

var
  LIndex: Integer;
begin
  TArray.Sort<string>(AMessages);
  if TArray.BinarySearch<string>(AMessages, ERROR_PRODUCT_REGISTERED, LIndex,
    TComparer<string>.Construct(
      function(const ALeft, ARight: string): Integer
      begin
        if ALeft.Contains(ERROR_PRODUCT_REGISTERED) then
        begin
          Result := 0;
        end
        else
          Result := CompareStr(ALeft, ARight);
      end)) then
  begin
    Exit(TryStrToInt(ExtractProdID(AMessages[LIndex]), AProdID));
  end;
  AProdID := -1;
  Result := False;
end;

function TdamProducts.ForeignOperatorsUpdateRecord(const ANome: string; ACpfCnpjRaiz: string; const ACodigoPais: string; const ACodigoDuimpField: TField; const ADataSet: TDataSet;
  const AProduct: TDataSet): Boolean;
begin
  if ADataSet.IsEmpty then
  begin
    Exit(False);
  end;
  var LRecordId := '';
  var LResponseCode := 0;
  PComex.Products.ForeignOperators.Get(ANome, ACpfCnpjRaiz, ACodigoPais,
    procedure(const AResponse: IOEIResponse)
    begin
      LResponseCode := AResponse.ResponseCode;
      if LResponseCode = 200 then
      begin
        LRecordId := AResponse.Content.ToArray[0].Codigo;
      end
      else if AResponse.ResponseCode = 204 then
      begin
        var LStream := DataSetToJSONStringStream(ADataSet);
        try
          PComex.Products.ForeignOperators.Post(LStream, ACpfCnpjRaiz, ACodigoPais,
            procedure(const AResponse: ILVVResponse)
            begin
              LResponseCode := AResponse.ResponseCode;
              if LResponseCode = 200 then
              begin
                LRecordId := AResponse.Content.ToArray[0].Codigo;
              end
              else
              begin
                AProduct.Edit;
                AProduct.FieldByName('CodigoProduto').Clear;
                AProduct.FieldByName('NaoSincPSiscomex').AsBoolean := False;
                AProduct.FieldByName('Msg').AsString := Concat('Fabricantes/Produtores - Erro: ', AResponse.Msg);
                AProduct.Post;
              end;
            end);
        finally
          FreeAndNil(LStream);
        end;
      end;
    end);
  if LResponseCode = 200 then
  begin
    ADataSet.Edit;
    ACodigoDuimpField.AsString := LRecordId;
    ADataSet.Post;
  end;
  Result := LResponseCode <= 204;
end;

function TdamProducts.DataSetToJSONStringStream(const AMaster: TDataSet; const ADetails: TDataSet = nil): TStringStream;
begin
  var LJSonObject := ConverterProDSTToJSON(AMaster, ADetails);
  try
    Result := TStringStream.Create(LJSonObject.ToJSON, TEncoding.UTF8);
    Result.Position := 0;
  finally
    FreeAndNil(LJSonObject);
  end;
end;

procedure TdamProducts.DataModuleCreate(Sender: TObject);
begin
  inherited;
  mtbFPR.CreateDataSet;
end;

procedure TdamProducts.ExportProd;
begin
  var LProDST := qryEPR;
  var LStream := DataSetToJSONStringStream(LProDST, qryATT);
  try
    PComex.Products.Post(LStream,
      procedure(const AResponse: ILVVResponse)

        procedure ManufacturerProducer;
        begin
          var LJSonObject := DataSetToJSONObject(mtbFPR);
          try
            var LFORStream := TStringStream.Create(LJSonObject.ToJSON, TEncoding.UTF8);
            try
              PComex.Products.ManufacturerProducer.Post(LProDST.FieldByName('cpfCnpjRaiz').AsString, LFORStream);
            finally
              FreeAndNil(LFORStream);
            end;
          finally
            FreeAndNil(LJSonObject);
          end;
        end;

      begin
        if AResponse.ResponseCode = 200 then
        begin
          for var LResponse in AResponse.Content do if
            LProDST.LocateEx('Seq', LResponse.Seq) then
          begin
            LProDST.Edit;
            if LResponse.Sucesso then
            begin
              LProDST.FieldByName('CodigoProduto').AsInteger := LResponse.Codigo.ToInteger;
            end
            else
            begin
              var LProdID: Integer;
              if FindProdID(LResponse.Erros, LProdID) then
              begin
                LProDST.FieldByName('CodigoProduto').AsInteger := LProdID;
                LResponse.Sucesso := True;
              end
              else
              begin
                LProDST.FieldByName('CodigoProduto').Clear;
                LProDST.FieldByName('Msg').AsString := Concat('Produto - Erro: ', string.Join(#13 + '         ', LResponse.Erros));
              end;
            end;
            LProDST.FieldByName('NaoSincPSiscomex').AsBoolean := LResponse.Sucesso;
            LProDST.Post;
            if LResponse.Sucesso and
              not qryFAB.IsEmpty or not qryFOR.IsEmpty then
            begin
              if not qryFAB.IsEmpty and
                qryFABCodigoDuimp.IsNull and
                ForeignOperatorsUpdateRecord(
                  qryFABNome.AsString,
                  LProDST.FieldByName('cpfCnpjRaiz').AsString,
                  qryFABCodigoPais.AsString,
                  qryFABCodigoDuimp,
                  qryFAB,
                  LProDST) then
              begin
                LinkManufacturerOrProducerToProduct(
                  qryFABCodigoDuimp,
                  qryFABcnpj,
                  LProDST.FieldByName('CodigoProduto'),
                  qryFABCodigoPais);
                ManufacturerProducer;
              end;
              if not qryFOR.IsEmpty and
                qryFORCodigoDuimp.IsNull and
                ForeignOperatorsUpdateRecord(
                  qryFORNome.AsString,
                  LProDST.FieldByName('cpfCnpjRaiz').AsString,
                  qryFORCodigoPais.AsString,
                  qryFORCodigoDuimp,
                  qryFOR,
                  LProDST) then
              begin
                LinkManufacturerOrProducerToProduct(
                  qryFORCodigoDuimp,
                  qryFORcnpj,
                  LProDST.FieldByName('CodigoProduto'),
                  qryFORCodigoPais);
                ManufacturerProducer;
              end;
            end;
          end;
          LProDST.ApplyUpdates;
          LProDST.Refresh;
        end;
      end);
  finally
    FreeAndNil(LStream);
  end;
end;

procedure TdamProducts.GetAllProducts;
begin
  GetProducts;
  GetProductsForExport;
end;

procedure TdamProducts.GetProducts;
begin
  qryPRO.Close;
  qryPRO.Open;
end;

procedure TdamProducts.GetProductsForExport;
begin
  qryATD.Close;
  qryEPR.Close;
  qryATT.Close;
  qryDOM.Close;
  qryFAB.Close;
  qryFOR.Close;
  qryATD.Open;
  qryEPR.Open;
  qryATT.Open;
  qryDOM.Open;
  qryFAB.Open;
  qryFOR.Open;
end;

procedure TdamProducts.ImportAttributes(const AProducts: IProductList);
begin
  var damAttrs := TdamAttrs.Create(nil);
  try
    var LNcm := TCollections.CreateList<string>;
    try
      for var LProduct in AProducts do if
        not LNcm.Contains(LProduct.Value) then
      begin
        damAttrs.Import(LProduct.Value);
        LNcm.Add(LProduct.Value);
      end;
    finally
      LNcm := nil;
    end;
  finally
    FreeAndNil(damAttrs);
  end;
end;

procedure TdamProducts.LinkManufacturerOrProducerToProduct(const ACodigoOperadorEstrangeiroField, ACpfCnpjFabricanteField, ACodigoProdutoField, ACodigoPaisField: TField);
begin
  mtbFPR.EmptyDataSet;
  mtbFPR.Append;
  mtbFPRCodigoOperadorEstrangeiro.AsString := ACodigoOperadorEstrangeiroField.AsString;
  mtbFPRCpfCnpjFabricante.AsString := ACpfCnpjFabricanteField.AsString;
  mtbFPRConhecido.AsBoolean := False;
  mtbFPRCodigoProduto.AsInteger := ACodigoProdutoField.AsInteger;
  mtbFPRCodigoPais.AsString := ACodigoPaisField.AsString;
  mtbFPR.Post;
end;

procedure TdamProducts.PrepareProducts(const AProducts: IProductList);
begin
  EPRInsOrDel.ParamByName('Products').AsString := string.Join(',', AProducts.Keys.ToArray);
  EPRInsOrDel.Execute;
end;

procedure TdamProducts.qryATTvalorGetText(Sender: TField; var Text: string; DisplayText: Boolean);
var
  LValue: Boolean;
begin
  Text := Sender.AsString;
  if SameText(qryATTformaPreenchimento.AsString, LISTA_ESTATICA.ToString) then
  begin
    if StrToIntDef(Sender.AsString, 0) = 0 then
    begin
      Text := '';
    end
    else if qryATD.Active then
    begin
      var LDataSet := TFDMemTable.Create(nil);
      try
        LDataSet.Data := qryATD.Data;
        if LDataSet.LocateEx('atributo;codigo',
          VarArrayOf([qryATTAtributo.AsString, Sender.AsString])) then
        begin
          Text := LDataSet.FieldByName('Descricao').AsString;
        end;
      finally
        FreeAndNil(LDataSet);
      end;
    end;
  end
  else if SameText(qryATTformaPreenchimento.AsString, BOOLEANO.ToString) and
    not Sender.AsString.Trim.IsEmpty and TryStrToBool(Sender.AsString, LValue) then
  begin
    Text := GetYesOrNoItems[LValue.ToInteger];
  end;
end;

procedure TdamProducts.qryEPRCalcFields(DataSet: TDataSet);
begin
  qryEPRcpfCnpjRaiz.AsString := PComex.Duimp.CpfCnpjRaiz;
end;

end.
