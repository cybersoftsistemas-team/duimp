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
  IProductMsgList = IDictionary<Integer, string>;

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
    qryFAB: TFDQuery;
    dsoFAB: TDataSource;
    qryATTobrigatorio: TBooleanField;
    qryEPRcpfCnpjRaiz: TStringField;
    qryEPRdenominacao: TStringField;
    qryEPRcodigoProduto: TIntegerField;
    updEPR: TFDUpdateSQL;
    qryEPRNaoSincPSiscomex: TBooleanField;
    mtbFPR: TFDMemTable;
    mtbFPRcpfCnpjFabricante: TStringField;
    mtbFPRConhecido: TBooleanField;
    mtbFPRCodigoOperadorEstrangeiro: TStringField;
    mtbFPRCodigoProduto: TIntegerField;
    mtbFPRCodigoPais: TStringField;
    qryEPRmsg: TStringField;
    qryFABprodId: TIntegerField;
    qryFABnome: TStringField;
    qryFABlogradouro: TStringField;
    qryFABnomeCidade: TStringField;
    qryFABcodigoPais: TStringField;
    qryFABcep: TStringField;
    qryFABemail: TStringField;
    qryFABcodigoDuimp: TStringField;
    qryFABcnpj: TStringField;
    updFAB: TFDUpdateSQL;
    qryFABcodigoInterno: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryATTvalorGetText(Sender: TField; var Text: string; DisplayText:
        Boolean);
    procedure qryEPRCalcFields(DataSet: TDataSet);
  private
    FProductMsgList: IProductMsgList;
    function DataSetToJSONArray(const AMaster: TDataSet; const ADetails: TDataSet = nil): TJSONArray;
    function DataSetToJSONObject(const ADataSet: TDataSet): TJSONObject;
    function ForeignOperatorsUpdateRecord(const ANome: string; ACpfCnpjRaiz: string; const ACodigoPais: string; const ACodigoDuimpField: TField; const ADataSet: TDataSet;
      const AProduct: TDataSet): Boolean;
    procedure GetProducts;
    procedure LinkManufacturerOrProducerToProduct(const ACodigoOperadorEstrangeiroField: TField; const ACpfCnpjFabricanteField: TField; const ACodigoProdutoField: TField;
      const ACodigoPaisField: TField);
    procedure LinkManufacturerOrProducer(const AProDST: TDataSet);
    procedure ManufacturerProducer(const AProDST: TDataSet);
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
  pucomex.dom.Contracts.Products,
  pucomex.dom.Duimps.Model.OperadorEstrangeiroIntegracaoDTO,
  pucomex.dom.Http.Model.Response.LoteValidacaoVersaoDTO,
  pucomex.dom.Support.PUComex;

type
  EDataSetConverterException = class(Exception);
  TBooleanFieldType = (bfUnknown, bfBoolean, bfInteger);

resourcestring
  ERROR_PRODUCT_REGISTERED = 'JÃ¡ existe produto idÃªntico cadastrado. CÃ³digo:';

function CreateProductList: IProductList;
begin
  Result := TCollections.CreateDictionary<string, string>;
end;

function CreateProductMsgList: IProductMsgList;
begin
  Result := TCollections.CreateDictionary<Integer, string>;
end;

procedure RemoveEmptyJsonFields(AJsonObject: TJSONObject);
var
  LFieldsToRemove: TArray<string>;
  LPair: TJSONPair;
  LValue: TJSONValue;
begin
  if not Assigned(AJsonObject) then
    Exit;
  for LPair in AJsonObject do
  begin
    LValue := LPair.JsonValue;
    if
      (LValue is TJSONNull) or
      ((LValue is TJSONString) and
       (Trim(LValue.Value) = ''))
    then
      LFieldsToRemove := LFieldsToRemove + [LPair.JsonString.Value];
  end;
  for var LField in LFieldsToRemove do
    AJsonObject.RemovePair(LField).Free;
end;

procedure RemoverAtributosSemValor(Atributos: TJSONArray);
begin
  for var I := Atributos.Count - 1 downto 0 do
  begin
    var Obj := Atributos.Items[I] as TJSONObject;
    RemoveEmptyJsonFields(Obj);
    if Obj.GetValue('valor') = nil then
      Atributos.Remove(I);
  end;
end;

{ TdamProducts }

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
              else if SameText(ADataSet.Fields[I].AsWideString, 'NÃO') then
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

function TdamProducts.ForeignOperatorsUpdateRecord(const ANome: string; ACpfCnpjRaiz: string; const ACodigoPais: string; const ACodigoDuimpField: TField; const ADataSet: TDataSet;
  const AProduct: TDataSet): Boolean;
begin
  if ADataSet.IsEmpty then
  begin
    Exit(False);
  end;
  var LRecordId := '';
  var LResponseCode := 0;
  try
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
          var LJSonObject := DataSetToJSONObject(ADataSet);
          RemoveEmptyJsonFields(LJSonObject);
          var LStream := TStringStream.Create(LJSonObject.ToJSON, TEncoding.UTF8);
          try
            PComex.Products.ForeignOperators.Post(LStream, ACpfCnpjRaiz, ACodigoPais,
              procedure(const AResponse: IOEIResponse)
              begin
                LResponseCode := AResponse.ResponseCode;
                if LResponseCode = 200 then
                begin
                  LRecordId := AResponse.Content.ToArray[0].Codigo;
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
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TdamProducts.DataModuleCreate(Sender: TObject);
begin
  inherited;
  mtbFPR.CreateDataSet;
  FProductMsgList := CreateProductMsgList;
end;

procedure TdamProducts.ManufacturerProducer(const AProDST: TDataSet);
begin
  var LJSonObject := DataSetToJSONObject(mtbFPR);
  try
    var LFORStream := TStringStream.Create(LJSonObject.ToJSON, TEncoding.UTF8);
    try
      PComex.Products.ManufacturerProducer.Post(AProDST.FieldByName('cpfCnpjRaiz').AsString, LFORStream);
    finally
      FreeAndNil(LFORStream);
    end;
  finally
    FreeAndNil(LJSonObject);
  end;
end;

procedure TdamProducts.LinkManufacturerOrProducer(const AProDST: TDataSet);
begin
  try
    if qryFAB.IsEmpty then
      Exit;
    ForeignOperatorsUpdateRecord(
      qryFABNome.AsString,
      AProDST.FieldByName('cpfCnpjRaiz').AsString,
      qryFABcodigoPais.AsString,
      qryFABCodigoDuimp,
      qryFAB,
      AProDST);
    LinkManufacturerOrProducerToProduct(
      qryFABCodigoDuimp,
      qryFABcnpj,
      AProDST.FieldByName('CodigoProduto'),
      qryFABcodigoPais);
    ManufacturerProducer(AProDST);
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TdamProducts.ExportProd;
 var
   LProDST: TFDDataSet;
begin
  FProductMsgList.Clear;
  LProDST := qryEPR;
  var LBookMark := LProDST.BookMark;
  try
    LProDST.First;
    while not LProDST.Eof do
    begin
      var LJSonObject := DataSetToJSONObject(LProDST);
      try
        if not qryATT.IsEmpty then
        begin
          var LDetailDS := DataSetToJSONArray(qryATT);
          RemoverAtributosSemValor(LDetailDS);
          LJSonObject.AddPair('atributos', LDetailDS);
        end;
        var LArray := TJSONArray.Create;
        LArray.Add(LProDST.FieldByName('prodId').AsString);
        LJSonObject.AddPair('codigosInterno', LArray);
        var LStream := TStringStream.Create(LJSonObject.ToJSON, TEncoding.UTF8);
        try
          LStream.Position := 0;
          try
            if qryFAB.IsEmpty then
              raise Exception.Create('Declare um fabricante.');
            if qryFABlogradouro.AsString.Trim.IsEmpty then
              raise Exception.CreateFmt('Declare um logradouro para o fabricante %s.', [qryFABNome.AsString]);
            if qryFABcodigoPais.AsString.Trim.IsEmpty then
              raise Exception.CreateFmt('Declare a sigla de país para o fabricante %s.', [qryFABNome.AsString]);
            var LProductExists := LProDST.FieldByName('CodigoProduto').AsInteger > 0;
            if LProductExists then
            begin
              PComex.Products.GetByID(LProDST.FieldByName('CodigoProduto').AsInteger, LProDST.FieldByName('cpfCnpjRaiz').AsString,
                procedure(const AResponse: IProductResponse)
                  begin
                    if AResponse.ResponseCode = 200 then
                    begin
                      LProductExists := Assigned(AResponse.Content);
                    end;
                  end);
            end;
            if not LProductExists then
            begin
              PComex.Products.Post(LProDST.FieldByName('cpfCnpjRaiz').AsString, LStream,
                procedure(const AResponse: IProductResponse)
                begin
                  if AResponse.ResponseCode = 200 then
                  begin
                    LProDST.Edit;
                    LProDST.FieldByName('CodigoProduto').AsInteger := AResponse.Content.Codigo;
                    LProDST.Post;
                  end;
                end);
            end;
            LinkManufacturerOrProducer(LProDST);
            LProDST.Edit;
            LProDST.FieldByName('NaoSincPSiscomex').AsBoolean := True;
            LProDST.Post;
          except
            on E: Exception do
            begin
              LProDST.Edit;
              LProDST.FieldByName('NaoSincPSiscomex').AsBoolean := False;
              LProDST.Post;
              FProductMsgList[LProDST.FieldByName('prodId').AsInteger] := Concat('Produto - Erro: ', string.Join(#13 + '         ', E.Message));
            end;
          end;
        finally
          FreeAndNil(LStream);
        end;
      finally
        FreeAndNil(LJSonObject);
      end;
      LProDST.Next;
    end;
    LProDST.Refresh;
  finally
    if LProDST.BookmarkValid(LBookMark) then
    begin
      LProDST.GotoBookmark(LBookMark);
    end;
    LProDST.FreeBookmark(LBookMark);
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
  qryATD.Open;
  qryEPR.Open;
  qryATT.Open;
  qryDOM.Open;
  qryFAB.Open;
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
  mtbFPRConhecido.AsBoolean := True;
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
  qryEPRmsg.AsString := if FProductMsgList.ContainsKey(qryEPRprodId.AsInteger) then FProductMsgList[qryEPRprodId.AsInteger] else '';
end;

end.
