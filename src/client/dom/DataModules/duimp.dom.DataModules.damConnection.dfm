inherited damConnection: TdamConnection
  Height = 131
  Width = 280
  object DBCadastro: TFDConnection
    Params.Strings = (
      'DriverID=MSSQL')
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    LoginPrompt = False
    Left = 28
    Top = 12
  end
  object DBCliente: TFDConnection
    Params.Strings = (
      'DriverID=MSSQL'
      'Database=Cybersoft_Pradotex2'
      'Server=SERVER-DADOS'
      'User_Name=sa'
      'Password=cybersoft@123')
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    UpdateOptions.AssignedValues = [uvRefreshMode, uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    LoginPrompt = False
    Left = 28
    Top = 68
  end
  object FDStanStorageBinLink: TFDStanStorageBinLink
    Left = 197
    Top = 12
  end
  object sptSeedCA: TFDScript
    SQLScripts = <
      item
        Name = 'root'
        SQL.Strings = (
          '@INSERT_INTO_AcrescimoValoracaoAduaneira'
          '@INSERT_INTO_FundamentoLegal'
          '@INSERT_INTO_RegimeTributacao')
      end
      item
        Name = 'INSERT_INTO_AcrescimoValoracaoAduaneira'
        SQL.Strings = (
          'SET ANSI_WARNINGS OFF;'
          ''
          'DECLARE @TabelaAcrescimos TABLE ('
          '    Codigo INT,'
          '    Descricao VARCHAR(255),'
          '    InicioVigencia DATETIME,'
          '    FimVigencia DATETIME NULL'
          ');'
          ''
          'INSERT INTO @TabelaAcrescimos '
          '(Codigo'
          ',Descricao'
          ',InicioVigencia'
          ',FimVigencia)'
          'VALUES '
          '(1, '#39'COMISSOES E CORRETAGENS'#39', '#39'1996-05-09'#39', NULL),'
          '(2, '#39'EMBALAGENS E RECIPIENTES'#39', '#39'1996-05-09'#39', NULL),'
          '(3, '#39'CUSTOS DE EMBALAR'#39', '#39'1996-05-09'#39', NULL),'
          '(4, '#39'MATERIAIS E COMPONENTES'#39', '#39'1996-05-09'#39', NULL),'
          '(5, '#39'FERRAMENTAS, MATRIZES, MOLDES'#39', '#39'1996-05-09'#39', NULL),'
          '(6, '#39'MATERIAIS CONSUMIDOS NA PRODUCAO'#39', '#39'1996-05-09'#39', NULL),'
          '(7, '#39'PROJETOS DE ENGENHARIA'#39', '#39'1996-05-09'#39', NULL),'
          '(8, '#39'ROYALTIES E DIREITOS DE LICENCA'#39', '#39'1996-12-03'#39', NULL),'
          '(9, '#39'VALOR DE QUALQUER PARCELA'#39', '#39'1996-05-09'#39', NULL),'
          '(10, '#39'FRETE INTERNO - PAIS DE EXPORTACAO'#39', '#39'1996-05-09'#39', NULL),'
          '(11, '#39'SEGURO INTERNO - PAIS DE EXPORTACAO'#39', '#39'1996-05-09'#39', NULL),'
          
            '(12, '#39'CARGA, DESCARGA E MANUSEIO - PAIS DE EXPORTACAO'#39', '#39'1996-05' +
            '-09'#39', NULL),'
          '(13, '#39'FRETE INTERNACIONAL'#39', '#39'1996-04-29'#39', NULL),'
          '(14, '#39'SEGURO INTERNACIONAL'#39', '#39'1996-04-29'#39', NULL),'
          
            '(15, '#39'CARGA, DESCARGA E MANUSEIO INTERNACIONAIS'#39', '#39'1996-05-09'#39', ' +
            'NULL),'
          
            '(16, '#39'CARGA, DESCARGA E MANUSEIO NA ENTRADA - PAIS DE IMPORTACAO' +
            #39', '#39'2011-09-15'#39', NULL),'
          
            '(17, '#39'OUTROS ACRESCIMOS AO VALOR ADUANEIRO'#39', '#39'2011-09-15'#39', NULL)' +
            ';'
          ''
          '-- Inser'#231#227'o com verifica'#231#227'o pr'#233'via'
          'INSERT INTO AcrescimoValoracaoAduaneira'
          '(Codigo'
          ',Descricao'
          ',InicioVigencia'
          ',FimVigencia)'
          'SELECT T.Codigo'
          ',T.Descricao'
          ',T.InicioVigencia'
          ',T.FimVigencia'
          'FROM @TabelaAcrescimos AS T'
          'WHERE NOT EXISTS ('
          '    SELECT 1 FROM AcrescimoValoracaoAduaneira AS A '
          '    WHERE A.Codigo = T.Codigo'
          ');'
          ''
          'SET ANSI_WARNINGS ON;')
      end
      item
        Name = 'INSERT_INTO_RegimeTributacao'
        SQL.Strings = (
          'MERGE INTO RegimeTributacao AS T'
          'USING (VALUES'
          '    (1, '#39'RECOLHIMENTO INTEGRAL'#39'),'
          '    (2, '#39'IMUNIDADE'#39'),'
          '    (3, '#39'ISENCAO'#39'),'
          '    (4, '#39'REDUCAO'#39'),'
          '    (5, '#39'SUSPENSAO'#39'),'
          '    (6, '#39'NAO INCIDENCIA'#39'),'
          '    (10, '#39'SUSPENS'#195'O COM PAGAMENTO PROPORCIONAL DE TRIBUTO'#39')'
          ') AS S(Codigo, Descricao)'
          'ON (T.Codigo = S.Codigo)'
          'WHEN MATCHED THEN'
          '    UPDATE SET T.Descricao = S.Descricao'
          'WHEN NOT MATCHED THEN'
          '    INSERT (Codigo, Descricao)'
          '    VALUES (S.Codigo, S.Descricao);')
      end
      item
        Name = 'INSERT_INTO_FundamentoLegal'
        SQL.Strings = (
          'MERGE INTO FundamentoLegal AS T'
          'USING (VALUES'
          '    (1, '#39'AL'#205'QUOTA OMC'#39'),'
          '    (2, '#39'ACE 18 AL'#205'QUOTA MERCOSUL'#39'),'
          '    (3, '#39'AL'#205'QUOTA TEC'#39'),'
          '    (4, '#39'LETEC - LISTA DE EXCE'#199#213'ES '#192' TEC - AL'#205'QUOTA NORMAL'#39'),'
          
            '    (5, '#39'LEBIT - LISTA DE EXCE'#199#213'ES DE BENS DE INFORM'#193'TICA E DE T' +
            'ELECOMUNICA'#199#213'ES'#39'),'
          '    (6, '#39'EX-TARIF'#193'RIOS TEMPOR'#193'RIOS DE II'#39'),'
          '    (7, '#39'SGPC - SISTEMA GLOBAL DE PREFER'#202'NCIAS COMERCIAIS'#39'),'
          '    (8, '#39'ACE 14 BRASIL X ARGENTINA - AUTOMOTIVO'#39'),'
          
            '    (9, '#39'AAP.AG N'#176' 2 - SEMENTES MERCOSUL X BOLIVIA,CHILE, CUBA, ' +
            'EQUADOR E PERU'#39'),'
          '    (10, '#39'ACE 58 MERCOSUL X PERU'#39'),'
          '    (11, '#39'ACE 53 BRASIL X M'#201'XICO'#39'),'
          '    (12, '#39'ACE 59 MERCOSUL X COL'#212'MBIA, VENEZUELA E EQUADOR'#39'),'
          '    (13, '#39'ACE 62 MERCOSUL X CUBA'#39'),'
          '    (14, '#39'ACE 69 BRASIL X VENEZUELA'#39'),'
          '    (15, '#39'ACE 72 MERCOSUL X COL'#212'MBIA'#39'),'
          '    (16, '#39'AAPCE 38 BRASIL X GUIANA E S'#195'O CRIST'#211'V'#195'O E NEVIS'#39'),'
          '    (17, '#39'AAPCE 41 BRASIL X SURINAME'#39'),'
          '    (18, '#39'ACP MERCOSUL X '#205'NDIA'#39'),'
          '    (19, '#39'ACP MERCOSUL X SACU'#39'),'
          '    (20, '#39'ALC MERCOSUL X ISRAEL'#39'),'
          '    (21, '#39'ALC MERCOSUL X EGITO'#39'),'
          '    (23, '#39'ACE 55 - AUTOMOTIVO MERCOSUL X M'#201'XICO'#39'),'
          '    (24, '#39'ACE 35 MERCOSUL-CHILE'#39'),'
          '    (25, '#39'ACE 02 BRASIL-URUGUAI'#39'),'
          
            '    (26, '#39'PTR4 BRASIL X ARGENTINA, BOL'#205'VIA, COL'#212'MBIA, CHILE, EQU' +
            'ADOR, MEXICO, PARAGUAI, PERU, URUGUAI E VENEZUELA'#39'),'
          
            '    (27, '#39'LETEC - LISTA DE EXCE'#199#213'ES '#192' TEC - COTA (AL'#205'QUOTA OPCIO' +
            'NAL)'#39'),'
          '    (28, '#39'ACE 74 - AUTOMOTIVO - BRASIL X PARAGUAI'#39'),'
          '    (31, '#39'ACE 36 - MERCOSUL X BOL'#205'VIA'#39'),'
          
            '    (32, '#39'ARCEIC N'#186' 7 BENS CULTURAIS, EDUCACIONAIS E CIENT'#205'FICOS' +
            ' - BRASIL X ARGENTINA, COLOMBIA, MEXICO, PER'#218', URUGUAI E VENEZUE' +
            'LA'#39'),'
          
            '    (33, '#39'EX-TARIF'#193'RIOS DE PRODUTOS AUTOMOTIVOS SEM PRODU'#199#195'O NAC' +
            'IONAL EQUIVALENTE - ACE N'#186' 14'#39'),'
          
            '    (34, '#39'EX-TARIF'#193'RIO PARA AUTOPE'#199'AS SEM PRODU'#199#195'O NACIONAL EQUI' +
            'VALENTE, NO '#194'MBITO DO REGIME DE AUTOPE'#199'AS N'#195'O PRODUZIDAS - ART. ' +
            '6'#186' DO 38'#186' PA DO ACE N'#186' 14'#39'),'
          
            '    (35, '#39'REDU'#199#195'O TEMPOR'#193'RIA DO II PARA FACILITAR COMBATE '#192' PAND' +
            'EMIA DO CORONA V'#205'RUS / COVID-19'#39'),'
          
            '    (36, '#39'EX-TARIF'#193'RIO, PARA AUTOPE'#199'AS SEM PRODU'#199#195'O NACIONAL EQU' +
            'IVALENTE E GRAFADAS COMO BENS DE CAPITAL - BK OU BENS DE INFORM'#193 +
            'TICAS E TELECOMUNICA'#199#213'ES - BIT.'#39'),'
          
            '    (37, '#39'TRATADO DE ITAIPU - BRASIL X PARAGUAI - BENS, SEM SIMI' +
            'LAR NACIONAL, IMPORTADOS PELOS CONTRATANTES DA ITAIPU BINACIONAL' +
            ', DESDE QUE COMPROVADA E EXCLUSIVAMENTE DESTINADOS '#192' EXECU'#199#195'O DO' +
            ' PROJETO DE APROVEITAMENTO HIDREL'#201'TRICO DOS RECURSOS H'#205'DRICOS DO' +
            ' RIO PARAN'#193', A CARGO DAQUELA ENTIDADE.'#39'),'
          '    (50, '#39'LEBIT COTA'#39'),'
          '    (51, '#39'COTA REFERENTE AO ANEXO IX DA RES GECEX N'#186' 272/2021'#39'),'
          '    (52, '#39'OMC ANEXO VIII - COTA'#39'),'
          '    (53, '#39'COTA REFERENTE AO ANEXO X DA RES GECEX N'#186' 272/2021'#39'),'
          
            '    (90, '#39'NOTA DE TRIBUTA'#199#195'O DA TEC - TINTAS DESTINADAS '#192' IMPRES' +
            'S'#195'O DE PAPEL-MOEDA, COMPREENDIDAS NA POSI'#199#195'O 32.15.'#39'),'
          
            '    (91, '#39'NOTA DE TRIBUTA'#199#195'O DA TEC - OS PAP'#201'IS DESTINADOS '#192' IMP' +
            'RESS'#195'O DE LIVROS, CAT'#193'LOGOS TELEF'#212'NICOS, JORNAIS, ...'#39'),'
          '    (903, '#39'ADMISS'#195'O TEMPOR'#193'RIA PARA APERFEI'#199'OAMENTO ATIVO'#39'),'
          '    (908, '#39'ADMISS'#195'O NO GNL-TEMPOR'#193'RIO'#39'),'
          
            '    (909, '#39'ADMISS'#195'O TEMPOR'#193'RIA PARA UTILIZA'#199#195'O ECON'#212'MICA - COM S' +
            'USPENS'#195'O TOTAL - ZFM'#39'),'
          '    (920, '#39'DRAWBACK '#8211' SUSPENS'#195'O CONT'#205'NUO'#39'),'
          '    (1001, '#39'LIVROS, JORNAIS E PERIODICOS'#39'),'
          
            '    (1002, '#39'PAPEL DEST. A IMPRESSAO DE LIVROS, JORNAIS E PERIODI' +
            'COS - II E IPI'#39'),'
          
            '    (1003, '#39'UNI'#195'O, ESTADOS, DISTRITO FEDERAL E MUNIC'#205'PIOS, SUAS ' +
            'AUTARQUIAS, FUNDA'#199#213'ES INSTITU'#205'DAS E MANTIDAS PELO PODER P'#218'BLICO ' +
            'E A EMPRESA P'#218'BLICA PRESTADORA DE SERVI'#199'O POSTAL'#39'),'
          
            '    (1005, '#39'AERONAVES - PARTES, PE'#199'AS E COMPONENTES DESTINADOS A' +
            'O REPARO, REVIS'#195'O E MANUTEN'#199#195'O DE AERONAVES.'#39'),'
          
            '    (1006, '#39'EMBARCA'#199#213'ES - PARTES, PE'#199'AS E COMPONENTES DESTINADOS' +
            ' AO REPARO, REVIS'#195'O E MANUTEN'#199#195'O DE EMBARCA'#199#213'ES.'#39'),'
          
            '    (1007, '#39'BENS IMPORTADOS PELO CONSELHO NACIONAL DE DESENVOLVI' +
            'MENTO CIENT'#205'FICO E TECNOL'#211'GICO - CNPQ, POR CIENTISTAS, POR PESQU' +
            'ISADORES E POR INSTITUI'#199#195'O CIENT'#205'FICA, TECNOL'#211'GICA E DE INOVA'#199#195'O' +
            ' - ICT'#39'),'
          
            '    (1008, '#39'M'#193'QUINAS, EQUIPAMENTOS, APARELHOS E INSTRUMENTOS, E ' +
            'SUAS PARTES E SUAS PE'#199'AS DE REPOSI'#199#195'O, ACESS'#211'RIOS, MAT'#201'RIAS-PRIM' +
            'AS E PRODUTOS INTERMEDI'#193'RIOS IMPORTADOS POR EMPRESAS HABILITADAS' +
            ' PELO CNPQ, NA EXECU'#199#195'O DE PROJETOS DE PESQUISA, DESENVOLVIMENTO' +
            ' E INOVA'#199#195'O'#39'),'
          '    (1009, '#39'DRAWBACK - ISEN'#199#195'O'#39'),'
          '    (1010, '#39'PARTIDOS POL'#205'TICOS'#39'),'
          '    (1011, '#39'INSTITUI'#199#213'ES DE EDUCA'#199#195'O OU DE ASSIST'#202'NCIA SOCIAL'#39'),'
          
            '    (1012, '#39'UNI'#195'O, ESTADOS, DISTRITO FEDERAL E MUNIC'#205'PIOS, SUAS ' +
            'AUTARQUIAS E FUNDA'#199#213'ES INSTITU'#205'DAS E MANTIDAS PELO PODER P'#218'BLICO' +
            '.'#39'),'
          
            '    (1013, '#39'MISS'#213'ES DIPLOM'#193'TICAS E REPARTI'#199#213'ES CONSULARES DE CAR' +
            #193'TER PERMANENTE E SEUS RESPECTIVOS INTEGRANTES'#39'),'
          
            '    (1014, '#39'REPRESENTA'#199#213'ES DE ORGANISMOS INTERNACIONAIS DOS QUAI' +
            'S O BRASIL SEJA MEMBRO, E SEUS RESPECTIVOS INTEGRANTES'#39'),'
          
            '    (1015, '#39'TROF'#201'US, MEDALHAS, PLACAS E OUTROS OBJETOS COMEMORAT' +
            'IVOS RECEBIDOS EM EVENTO CULTURAL, CIENT'#205'FICO OU ESPORTIVO OFICI' +
            'AL RECEBIDOS COMO PR'#202'MIO NO EXTERIOR'#39'),'
          '    (1016, '#39'DRAWBACK - SUSPENS'#195'O'#39'),'
          
            '    (1019, '#39'BENS DE INFORM'#193'TICA ADQUIRIDOS PELO TSE OU PARTES E ' +
            'PE'#199'AS DESTINADAS '#192' INDUSTRIALIZA'#199#195'O DE BENS DE INFORM'#193'TICA A SER' +
            'EM ADQUIRIDOS PELO TSE'#39'),'
          
            '    (1020, '#39'INTERNA'#199#195'O DE PRODUTOS INDUSTRIALIZADOS NA Z.F.M, CO' +
            'M INSUMOS ESTRANGEIROS EMPREGADOS, COM APLICA'#199#195'O DE COEFICIENTE ' +
            'DE REDU'#199#195'O DO II'#39'),'
          
            '    (1022, '#39'AQUISI'#199#195'O DE PROPRIEDADE DA MERCADORIA ADMITIDA EM R' +
            'EGIMES ADUANEIROS ESPECIAIS'#39'),'
          
            '    (1029, '#39'BENS IMPORTADOS PELAS ENTIDADES RELIGIOSAS E TEMPLOS' +
            ' DE QUALQUER CULTO, INCLUSIVE SUAS ORGANIZA'#199#213'ES ASSISTENCIAIS E ' +
            'BENEFICENTES'#39'),'
          
            '    (1030, '#39'REDU'#199#195'O TEMPOR'#193'RIA DA TEC EM RAZ'#195'O DE DESABASTECIMEN' +
            'TO'#39'),'
          
            '    (1031, '#39'ADMISS'#195'O TEMPOR'#193'RIA COM SUSPENS'#195'O TOTAL DE TRIBUTOS'#39 +
            '),'
          '    (1036, '#39'PRODUTOS DO SETOR AERONAUTICO - REGRA GERAL TEC'#39'),'
          
            '    (1037, '#39'ADMISS'#195'O TEMPOR'#193'RIA PARA UTILIZA'#199#195'O ECON'#212'MICA - COM ' +
            'PAGAMENTO PROPORCIONAL'#39'),'
          
            '    (1046, '#39'RECOF - REGIME ADUANEIRO ESPECIAL DE ENTREPOSTO INDU' +
            'STRIAL SOB CONTROLE ADUANEIRO INFORMATIZADO'#39'),'
          
            '    (1050, '#39'MERCADORIAS DESTINADAS A CONSUMO EM FEIRAS, CONGRESS' +
            'OS E EXPOSI'#199#213'ES INTERNACIONAIS OU EVENTOS ASSEMELHADOS'#39'),'
          '    (1051, '#39'ADMISS'#195'O EM LOJA FRANCA EM FRONTEIRA TERRESTRE'#39'),'
          '    (1052, '#39'ADMISS'#195'O EM ENTREPOSTO ADUANEIRO NA IMPORTA'#199#195'O'#39'),'
          '    (1057, '#39'ADMISS'#195'O EM LOJA FRANCA EM PORTO OU AEROPORTO'#39'),'
          '    (1058, '#39'ADMISS'#195'O EM DEP'#211'SITO ESPECIAL'#39'),'
          
            '    (1066, '#39'REPEX - REGIME ADUANEIRO ESPECIAL PARA IMPORTA'#199#195'O DE' +
            ' PETR'#211'LEO BRUTO E SEUS DERIVADOS'#39'),'
          
            '    (1067, '#39'REGIME DE ENTREPOSTO ADUANEIRO - BENS DESTINADOS '#192' P' +
            'ESQUISA E LAVRA DE JAZIDAS DE PETR'#211'LEO E G'#193'S NATURAL EM CONSTRU'#199 +
            #195'O OU CONVERS'#195'O NO PA'#205'S, CONTRATADAS POR EMPRESAS SEDIADAS NO EX' +
            'TERIOR'#39'),'
          
            '    (1069, '#39'ADMISS'#195'O NO REPETRO-TEMPOR'#193'RIO COM DISPENSA DO PAGAM' +
            'ENTO PROPORCIONAL'#39'),'
          '    (1070, '#39'ADMISS'#195'O NO REPETRO-PERMANENTE'#39'),'
          
            '    (1071, '#39'REPOSI'#199#195'O DE MERCADORIA IMPORTADA QUE TENHA APRESENT' +
            'ADO DEFEITO T'#201'CNICO AP'#211'S O DESEMBARA'#199'O'#39'),'
          
            '    (1073, '#39'RETORNO DE BENS ADMITIDOS EM REGIMES ESPECIAIS ENVIA' +
            'DOS AO EXTERIOR PARA CONSERTO'#39'),'
          '    (1076, '#39'ADMISS'#195'O EM DEP'#211'SITO AFIAN'#199'ADO'#39'),'
          
            '    (1077, '#39'REIMPORTA'#199#195'O DE MERCADORIA, NO MESMO ESTADO, '#192' QUAL ' +
            'TENHA SIDO APLICADO O REGIME DE EXPORTA'#199#195'O TEMPOR'#193'RIA'#39'),'
          
            '    (1079, '#39'REPORTO - REGIME TRIBUT'#193'RIO PARA INCENTIVO '#192' MODERNI' +
            'ZA'#199#195'O E '#192' AMPLIA'#199#195'O DA ESTRUTURA PORTU'#193'RIA - II'#39'),'
          
            '    (1080, '#39'REPORTO - REGIME TRIBUT'#193'RIO PARA INCENTIVO '#192' MODERNI' +
            'ZA'#199#195'O E '#192' AMPLIA'#199#195'O DA ESTRUTURA PORTU'#193'RIA - IPI, PIS E COFINS'#39')' +
            ','
          '    (1082, '#39'ADMISS'#195'O NO REPETRO-INDUSTRIALIZA'#199#195'O'#39'),'
          
            '    (1087, '#39'RECOF-SPED - REGIME ADUANEIRO ESPECIAL DE ENTREPOSTO' +
            ' INDUSTRIAL SOB CONTROLE INFORMATIZADO DO SISTEMA P'#218'BLICO DE ESC' +
            'RITURA'#199#195'O DIGITAL'#39'),'
          
            '    (1088, '#39'PIS/COFINS-IMPORTA'#199#195'O OPCIONAL - NAFTA, ETANO, PROPA' +
            'NO, ETC.'#39'),'
          
            '    (1097, '#39'AUTOPE'#199'AS, N'#195'O ORIGIN'#193'RIAS DO MERCOSUL, DESTINADAS '#192 +
            ' PRODU'#199#195'O DE TRATORES, COLHEITADEIRAS, M'#193'QUINAS AGR'#205'COLAS E RODO' +
            'VI'#193'RIAS AUTOPROPULSADAS - ARTIGO 7'#186' DO 38'#186' PROTOCOLO ADICIONAL A' +
            'O ACE 14 .'#39'),'
          '    (1099, '#39'PIS/COFINS-IMPORTA'#199#195'O B'#193'SICO OPCIONAL'#39'),'
          '    (1100, '#39'PIS-IMPORTA'#199#195'O E COFINS-IMPORTA'#199#195'O'#39'),'
          '    (1101, '#39'RETORNO DE BENS EXPORTADOS'#39'),'
          
            '    (1108, '#39'BENS IMPORTADOS PELAS ENTIDADES BENEFICENTES DE ASSI' +
            'ST'#202'NCIA SOCIAL'#39'),'
          
            '    (1109, '#39'PRODUTOS QU'#205'MICOS E PRODUTOS DESTINADOS AO USO EM HO' +
            'SPITAIS, CL'#205'NICAS, CONSULT'#211'RIOS M'#201'DICOS E ODONTOL'#211'GICOS E LABORA' +
            'T'#211'RIOS'#39'),'
          '    (1110, '#39'PRODUTOS FARMAC'#202'UTICOS'#39'),'
          
            '    (1111, '#39'REB '#8211' REGISTRO ESPECIAL BRASILEIRO '#8211' MATERIAIS E EQU' +
            'IPAMENTOS, INCLUSIVE PARTES, PE'#199'AS E COMPONENTES, DESTINADOS AO ' +
            'EMPREGO NA CONSTRU'#199#195'O, CONSERVA'#199#195'O, MODERNIZA'#199#195'O, CONVERS'#195'O OU R' +
            'EPARO DE EMBARCA'#199#213'ES REGISTRADAS OU PR'#201'-REGISTRADAS NO REB'#39'),'
          
            '    (1112, '#39'RETORNO, AO REGISTRO ESPECIAL BRASILEIRO - REB, DE E' +
            'MBARCA'#199#213'ES CONSTRU'#205'DAS NO BRASIL E TRANSFERIDAS AO EXTERIOR, NAS' +
            ' CONDI'#199#213'ES ESTABELECIDAS EM LEI - PIS E COFINS'#39'),'
          
            '    (1113, '#39'PAPEL DESTINADO '#192' IMPRESS'#195'O DE PERI'#211'DICOS - PIS E CO' +
            'FINS'#39'),'
          '    (1114, '#39'G'#193'S NATURAL LIQUEFEITO '#8211' GNL'#39'),'
          
            '    (1115, '#39'BENS DESTINADOS '#192' IND'#218'STRIA CINEMATOGR'#193'FICA E AUDIOV' +
            'ISUAL, SEM SIMILAR NACIONAL'#39'),'
          
            '    (1116, '#39'AERONAVES, CLASSIFICADAS NA POSI'#199#195'O 88.02 E 88.06.10' +
            ' DA TIPI'#39'),'
          
            '    (1117, '#39'BENS A SEREM EMPREGADOS EM AERONAVES (LEI 10865/04 -' +
            ' ART 8'#186',PAR 12, INC VII, C/C LEI 10925/04 - ART 6'#186', C/C DEC 5171' +
            '/04)'#39'),'
          
            '    (1118, '#39'RECINE - REGIME ESPECIAL DE TRIBUTA'#199#195'O PARA DESENVOL' +
            'VIMENTO DA ATIVIDADE DE EXIBI'#199#195'O CINEMATOGR'#193'FICA'#39'),'
          
            '    (1119, '#39'G'#193'S NATURAL DESTINADO AO CONSUMO EM UNIDADES TEREL'#201'T' +
            'RICAS INTEGRANTES DO PROGRAMA PRIORIT'#193'RIO DE TEREL'#201'TRICAS - PPT'#39 +
            '),'
          
            '    (1120, '#39'PRODUTOS HORT'#205'COLAS E FRUTAS, CLASSIFICADOS NOS CAP'#205 +
            'TULOS 7 E 8 DA TIPI'#39'),'
          '    (1121, '#39'SEMENS E EMBRI'#213'ES DA POSI'#199#195'O 05.11 DA NCM'#39'),'
          
            '    (1122, '#39'LIVROS, CONFORME DEFINIDO NO ART. 2'#186' DA LEI 10753/03' +
            ' (LEI 10865/04 - ART 8'#186', PAR 12, INC XII, C/C LEI 11033/04 - ART' +
            ' 6'#186')'#39'),'
          
            '    (1140, '#39'OBJETOS DE ARTE RECEBIDOS, EM DOA'#199#195'O, POR MUSEUS INS' +
            'TITU'#205'DOS E MANTIDOS PELO PODER P'#218'BLICO E OUTRAS ENTIDADES CULTUR' +
            'AIS, RECONHECIDAS COMO DE UTILIDADE P'#218'BLICA.'#39'),'
          
            '    (1147, '#39'REPES - REGIME ESPECIAL DE TRIBUTA'#199#195'O PARA A PLATAFO' +
            'RMA DE EXPORTA'#199#195'O DE SERVI'#199'OS DE TECNOLOGIA DA INFORMA'#199#195'O - PIS ' +
            'E COFINS'#39'),'
          
            '    (1148, '#39'RECAP - M'#193'QUINAS, APARELHOS, INSTRUMENTOS E EQUIPAME' +
            'NTOS NOVOS, IMPORTADOS DIRETAMENTE POR PESSOA JUR'#205'DICA BENEFICI'#193 +
            'RIA DO RECAP PARA INCORPORA'#199#195'O AO SEU ATIVO IMOBILIZADO - PIS E ' +
            'COFINS'#39'),'
          
            '    (1168, '#39'RECOM - REGIME ADUANEIRO ESPECIAL DE IMPORTA'#199#195'O DE I' +
            'NSUMOS DESTINADOS A INDUSTRIALIZA'#199#195'O POR ENCOMENDA DE PRODUTOS C' +
            'LASSIFICADOS NAS POSI'#199#213'ES 8701 A 8705 DA NCM IMPORTA'#199#195'O DE INSUM' +
            'OS (CHASSIS, CARRO'#199'ARIAS, PE'#199'AS, PARTES, COMPONENTES E ACESS'#211'RIO' +
            'S), SEM COBERTURA CAMBIAL, DESTINADOS A INDUSTRIALIZA'#199#195'O POR ENC' +
            'OMENDA DE PRODUTOS CLASSIFICADOS NAS POSI'#199#213'ES 8701 A 8705 DA NCM' +
            #39'),'
          
            '    (1180, '#39#211'LEO COMBUST'#205'VEL, QUANDO DESTINADOS '#192' NAVEGA'#199#195'O DE C' +
            'ABOTAGEM E DE APOIO PORTU'#193'RIO E MAR'#205'TIMO, DO TIPO BUNKER, MF (MA' +
            'RINE FUEL), CLASSIFICADO NO C'#211'DIGO 2710.19.22, '#211'LEO COMB'#39'),'
          
            '    (1186, '#39'Acetona, classificada no c'#243'digo 2914.11.00 da Tipi, ' +
            'destinada exclusivamente '#224' produ'#231#227'o de Mipa utilizada na elabora' +
            #231#227'o de defensivos agropecu'#225'rios classificados na posi'#231#227'o 38.08 d' +
            'a Tipi.'#39'),'
          
            '    (1189, '#39'REIDI - Regime Especial de Incentivos para o Desenvo' +
            'lvimento da Infraestrutura'#39'),'
          
            '    (1190, '#39'Equipamentos destinados aos portadores de necessidad' +
            'es especiais'#39'),'
          
            '    (1191, '#39'AAP - BRASIL x BOL'#205'VIA  Fornecimento de G'#225's Natural'#39 +
            '),'
          
            '    (1194, '#39'PADIS - Programa de Apoio ao Desenvolvimento Tecnol'#243 +
            'gico da Ind'#250'stria de Semicondutores'#39'),'
          '    (1202, '#39'CIDE-Combust'#237'veis'#39'),'
          '    (1300, '#39'Medida Antidumping'#39'),'
          '    (1301, '#39'Medida de Salvaguarda'#39'),'
          '    (1302, '#39'Medida Compensat'#243'ria'#39'),'
          
            '    (1303, '#39'II - pontos percentuais adicionais '#224' al'#237'quota TEC, c' +
            'om base no art. 8.2 do Acordo de Salvaguardas da OMC'#39'),'
          
            '    (1401, '#39'RETID - Regime Especial de Tributa'#231#227'o para a Ind'#250'str' +
            'ia de Defesa'#39'),'
          
            '    (1402, '#39'Retorno, ao Registro Especial Brasileiro - REB, de e' +
            'mbarca'#231#245'es constru'#237'das no Brasil e transferidas ao exterior, nas' +
            ' condi'#231#245'es estabelecidas em lei - II e IPI'#39'),'
          
            '    (1404, '#39'Adubos ou fertilizantes classificados no Cap'#237'tulo 31' +
            ', exceto os produtos de uso veterin'#225'rio'#39'),'
          
            '    (1405, '#39'Mat'#233'rias-primas utilizadas na produ'#231#227'o de adubos ou ' +
            'fertilizantes classificados no Cap'#237'tulo 31 da Tipi, exceto para ' +
            'os produtos de uso veterin'#225'rio'#39'),'
          
            '    (1406, '#39'Defensivos agropecu'#225'rios classificados na posi'#231#227'o 38' +
            '.08 da TIPI'#39'),'
          
            '    (1407, '#39'Mat'#233'rias-primas utilizadas na produ'#231#227'o de defensivos' +
            ' agropecu'#225'rios classificados na posi'#231#227'o 38.08 da TIPI'#39'),'
          
            '    (1408, '#39'Sementes e mudas destinadas '#224' semeadura e plantio, e' +
            'm conformidade com o disposto na Lei no 10.711/03, e produtos de' +
            ' natureza biol'#243'gica utilizados em sua produ'#231#227'o'#39'),'
          
            '    (1409, '#39'Corretivo de solo de origem mineral classificado no ' +
            'Cap'#237'tulo 25 da TIPI'#39'),'
          
            '    (1410, '#39'Legumes de vagem, secos, em gr'#227'o, mesmo pelados ou p' +
            'artidos; arroz; farinhas e s'#234'molas'#39'),'
          
            '    (1411, '#39'Inoculantes agr'#237'colas produzidos a partir de bact'#233'ri' +
            'as fixadoras de nitrog'#234'nio, classificados nos c'#243'digos 3002.49.99' +
            ', 3002.59.00, 3002.90.00 da Tipi'#39'),'
          
            '    (1412, '#39'Vacinas para medicina veterin'#225'ria - c'#243'digo 3002.42 d' +
            'a Tipi'#39'),'
          
            '    (1413, '#39'Farinha, grumos e s'#234'molas, gr'#227'os esmagados ou em flo' +
            'cos, de milho, classificados, respectivamente, nos c'#243'digos 1102.' +
            '20, 1103.13.00 e 1104.19.00, todos da Tipi'#39'),'
          '    (1414, '#39'Pintos de 1 (um) dia'#39'),'
          
            '    (1415, '#39'Leite fluido pasteurizado ou industrializado, na for' +
            'ma de ultrapasteurizado, destinados ao consumo humano ou utiliza' +
            'dos na industrializa'#231#227'o de produtos que se destinam ao consumo h' +
            'umano'#39'),'
          
            '    (1416, '#39'Leite em p'#243', integral ou desnatado, destinado ao con' +
            'sumo humano ou utilizados na industrializa'#231#227'o de produtos que se' +
            ' destinam ao consumo humano'#39'),'
          
            '    (1417, '#39'Queijos tipo mozarela, minas, prato, queijo de coalh' +
            'o, ricota, requeij'#227'o, queijo provolone, queijo parmes'#227'o, queijo ' +
            'fresco n'#227'o maturado e queijo do reino'#39'),'
          
            '    (1418, '#39'Leite em p'#243' semidesnatado, leite fermentado, bebidas' +
            ' e compostos l'#225'cteos e f'#243'rmulas infantis, assim definidas confor' +
            'me previs'#227'o legal espec'#237'fica, destinados ao consumo humano ou ut' +
            'ilizados na industrializa'#231#227'o de produtos que se destinam ao cons' +
            'umo humano'#39'),'
          
            '    (1419, '#39'Soro de leite fluido a ser empregado na industrializ' +
            'a'#231#227'o de produtos destinados ao consumo humano'#39'),'
          '    (1420, '#39'Farinha de trigo - C'#243'digo 1101.00.10 da Tipi'#39'),'
          '    (1421, '#39'Trigo classificado na posi'#231#227'o 10.01 da Tipi'#39'),'
          
            '    (1422, '#39'Pr'#233'-misturas pr'#243'prias para fabrica'#231#227'o de p'#227'o comum e' +
            ' p'#227'o comum - C'#243'digos 1901.20.00 Ex 01 e 1905.90.90 Ex 01 da Tipi' +
            #39'),'
          '    (1423, '#39'Massas aliment'#237'cias - Posi'#231#227'o 19.02 da Tipi'#39'),'
          
            '    (1424, '#39'Carnes bovina, su'#237'na, ovina, caprina e de aves e pro' +
            'dutos de origem animal,  carne de frango e miudezas comest'#237'veis ' +
            'de ovinos e caprinos classificados nos c'#243'digos da Tipi, conforme' +
            ' definido em lei'#39'),'
          
            '    (1425, '#39'Peixes e outros produtos classificados nos c'#243'digos d' +
            'a Tipi, conforme definido em lei.'#39'),'
          
            '    (1426, '#39'Caf'#233' classificado nos c'#243'digos 09.01 e 2101.1 da Tipi' +
            #39'),'
          
            '    (1427, '#39'A'#231#250'car classificado nos c'#243'digos 1701.14.00 e 1701.99' +
            '.00 da Tipi'#39'),'
          
            '    (1428, '#39#211'leo de soja classificado na posi'#231#227'o 15.07 da Tipi e' +
            ' outros '#243'leos vegetais classificados nas posi'#231#245'es 15.08 a 15.14 ' +
            'da Tipi'#39'),'
          
            '    (1429, '#39'Manteiga classificada no c'#243'digo 0405.10.00 da Tipi'#39')' +
            ','
          
            '    (1430, '#39'Margarina classificada no c'#243'digo 1517.10.00 da Tipi'#39 +
            '),'
          
            '    (1431, '#39'Sab'#245'es de toucador classificados no c'#243'digo 3401.11.9' +
            '0 Ex 01 da Tipi'#39'),'
          
            '    (1432, '#39'Produtos para higiene bucal ou dent'#225'ria classificado' +
            's na posi'#231#227'o 33.06 da Tipi'#39'),'
          
            '    (1433, '#39'Papel higi'#234'nico classificado no c'#243'digo 4818.10.00 da' +
            ' Tipi'#39'),'
          '    (1434, '#39'Ovos, classificados na posi'#231#227'o 04.07 da TIPI'#39'),'
          
            '    (1436, '#39'Projetores para exibi'#231#227'o cinematogr'#225'fica, classifica' +
            'dos no c'#243'digo 9007.2 da Tipi, e suas partes e acess'#243'rios, classi' +
            'ficados no c'#243'digo 9007.9 da Tipi'#39'),'
          '    (1437, '#39'Partes de aerogeradores'#39'),'
          
            '    (1439, '#39'Material de emprego militar classificado nas posi'#231#245'e' +
            's 87.10.00.00 e 89.06.10.00 da Tipi'#39'),'
          
            '    (1440, '#39'Partes, pe'#231'as, componentes, ferramentais, insumos, e' +
            'quipamentos e mat'#233'rias-primas a serem empregados na industrializ' +
            'a'#231#227'o, manuten'#231#227'o, moderniza'#231#227'o e convers'#227'o do material de empreg' +
            'o militar classificado nas posi'#231#245'es 87.10.00.00 e 89.06.10.00 da' +
            ' Tipi'#39'),'
          
            '    (1490, '#39'Redu'#231#227'o na base de c'#225'lculo - importa'#231#227'o, para revend' +
            'a, de m'#225'quinas e ve'#237'culos na forma definida pela Lei n'#186' 10.865, ' +
            'de 2004, art. 7'#186', '#167' 3'#186', inciso II.'#39'),'
          '    (6010, '#39'IPI - TIPI al'#237'quota reduzida'#39'),'
          '    (6011, '#39'IPI sobre cigarros - regime geral'#39'),'
          '    (6012, '#39'IPI sobre cigarros - regime especial - base mista'#39'),'
          
            '    (6122, '#39'IPI - Mat'#233'rias-primas (MP), produtos intermedi'#225'rios ' +
            '(PI) e material de embalagem (ME), destinados a estabelecimento ' +
            'que se dedique, preponderantemente, '#224' elabora'#231#227'o de produtos cla' +
            'ssificados nos Cap'#237'tulos 2, 3, 4, 7, 8, 9, 10, 11, 12, 15, 16, 1' +
            '7, 18, 19, 20, 23 (exceto c'#243'digos 2309.10.00 e 2309.90.30 e Ex-0' +
            '1 no c'#243'digo 2309.90.90), 28, 29, 30, 31 e 64, no c'#243'digo 2209.00.' +
            '00 e 2501.00.00, e nas posi'#231#245'es 21.01 a 21.05.00, da TIPI, inclu' +
            'sive aqueles a que corresponde a nota'#231#227'o NT (n'#227'o tributados)'#39'),'
          
            '    (6123, '#39'IPI - Mat'#233'rias-primas (MP), produtos intermedi'#225'rios ' +
            '(PI) e material de embalagem (ME), destinados a estabelecimento ' +
            'que se dedique, preponderantemente, '#224' elabora'#231#227'o de aeronaves e ' +
            'aparelhos espaciais classificados no cap'#237'tulo 88 da TIPI'#39'),'
          
            '    (6124, '#39'IPI - Mat'#233'rias-primas (MP), produtos intermedi'#225'rios ' +
            '(PI) e material de embalagem (ME), quando adquiridos por pessoas' +
            ' jur'#237'dicas preponderantemente exportadoras'#39'),'
          
            '    (6125, '#39'REB '#8211' Registro Especial Brasileiro '#8211' partes, pe'#231'as e' +
            ' componentes destinados ao emprego na conserva'#231#227'o, moderniza'#231#227'o ' +
            'e convers'#227'o de embarca'#231#245'es registradas no REB'#39'),'
          
            '    (6141, '#39'ZPE '#8211' Zonas de Processamento de Exporta'#231#227'o. Importa'#231 +
            #245'es de bens por empresa autorizada a operar em ZPE.'#39'),'
          
            '    (6145, '#39'IPI - Setor Automotivo- componentes, chassis, carro'#231 +
            'arias, acess'#243'rios, partes e pe'#231'as, importados diretamente pelo e' +
            'stabelecimento industrial, para emprego na industrializa'#231#227'o dos ' +
            'produtos autopropulsados classificados nos c'#243'digos 84.29, 84.32,' +
            ' 84.33, 87.01, 87.02, 87.03, 8704.10.00, 8704.2, 8704.3, 87.05, ' +
            '87.06 e 87.11'#39'),'
          
            '    (6147, '#39'IPI - Setor Automotivo - mat'#233'rias-primas, produtos i' +
            'ntermedi'#225'rios e materiais de embalagem, importados por estabelec' +
            'imentos industriais fabricantes, preponderantemente, de componen' +
            'tes, chassis, carro'#231'arias, partes e pe'#231'as para industrializa'#231#227'o ' +
            'dos produtos classificados nos C'#243'digos 73.09, 7310.29, 7612.90.1' +
            '2, 8424.81, 84.29, 8430.69.90, 84.32, 84.33, 84.34, 84.35, 84.36' +
            ', 84.37, 87.01, 87.02, 87.03, 87.04, 87.05, 87.06 e 8716.20.00 d' +
            'a TIPI'#39'),'
          
            '    (6151, '#39'REPES - importa'#231#227'o de bens novos, sem similar nacion' +
            'al, efetuada diretamente por pessoa jur'#237'dica benefici'#225'ria do reg' +
            'ime para incorpora'#231#227'o ao seu ativo imobilizado'#39'),'
          
            '    (6990, '#39'NC-IPI - percentual de redu'#231#227'o da al'#237'quota TIPI - ex' +
            'ceto para bebidas frias'#39'),'
          '    (6996, '#39'NOTA COMPLEMENTAR DA TIPI'#39'),'
          '    (6999, '#39'IPI - Tributa'#231#227'o normal ad valorem'#39'),'
          '    (9001, '#39'Imposto de Exporta'#231#227'o'#39'),'
          
            '    (9006, '#39'Exporta'#231#227'o Tempor'#225'ria - Artigo 92 do Decreto Lei 37/' +
            '66 / Artigo 431 do Decreto 6.759/2009'#39'),'
          
            '    (9007, '#39'Exporta'#231#227'o Tempor'#225'ria para aperfei'#231'oamento passivo -' +
            ' Artigo 93 do Decreto Lei 37/66 / Artigo 449 do Decreto 6.759/20' +
            '09'#39'),'
          
            '    (9008, '#39'Reexporta'#231#227'o - Artigo 75 do Decreto Lei 37/66 / Inci' +
            'so I, Artigo 367 do Decreto 6.759/2009'#39'),'
          
            '    (9009, '#39'DECRETO LEI 1.593/1977, ART. 12, PAR. 6, C/C IN RFB ' +
            '1.155/2011, ART. 6, PAR 1'#186#39')'
          ') AS S(Codigo, Descricao)'
          'ON (T.Codigo = S.Codigo)'
          'WHEN MATCHED THEN'
          '    UPDATE SET T.Descricao = S.Descricao'
          'WHEN NOT MATCHED THEN'
          '    INSERT (Codigo, Descricao)'
          '    VALUES (S.Codigo, S.Descricao);')
      end>
    Connection = DBCadastro
    ScriptOptions.CommandSeparator = '^'
    Params = <>
    Macros = <>
    Left = 98
    Top = 12
  end
  object sptSeedCL: TFDScript
    SQLScripts = <
      item
        Name = 'root'
        SQL.Strings = (
          '@INSERT_INTO_duimp_modalidades'
          '@INSERT_INTO_duimp_tipos_aplicacoes'
          '@INSERT_INTO_duimp_canais_consolidados'
          '@INSERT_INTO_duimp_cargas_tipos'
          '@INSERT_INTO_duimp_fob_tipos')
      end
      item
        Name = 'INSERT_INTO_duimp_modalidades'
        SQL.Strings = (
          'SET ANSI_WARNINGS OFF;'
          ''
          'DECLARE @Modalidades TABLE ('
          #9'Id VARCHAR(28),'
          #9'TipoProcessoCodigo INT'
          ');'
          ''
          'INSERT INTO @Modalidades'
          'VALUES'
          '('#39'IMPORTACAO_DIRETA'#39'           ,1),'
          '('#39'IMPORTACAO_POR_CONTA_E_ORDEM'#39',2),'
          '('#39'IMPORTACAO_POR_ENCOMENDA '#39'   ,3);'
          ''
          'INSERT INTO duimp.modalidades'
          'SELECT A.Id'
          ',A.TipoProcessoCodigo'
          'FROM @Modalidades AS A'
          'WHERE NOT EXISTS ('
          #9'SELECT 1'
          #9'FROM duimp.modalidades AS B'
          #9'WHERE B.Id = A.Id'
          ');'
          ''
          'SET ANSI_WARNINGS ON;')
      end
      item
        Name = 'INSERT_INTO_duimp_tipos_aplicacoes'
        SQL.Strings = (
          'SET ANSI_WARNINGS OFF;'
          ''
          'DECLARE @Aplicacoes TABLE ('
          '    Id VARCHAR(28),'
          #9'TipoItemCodigo INT'
          ');'
          ''
          'INSERT INTO @Aplicacoes'
          'VALUES'
          '('#39'CONSUMO'#39'                , 7),'
          '('#39'INCORPORACAO_ATIVO_FIXO'#39', 8),'
          '('#39'INDUSTRIALIZACAO '#39'      , 1),'
          '('#39'REVENDA '#39'               , 0),'
          '('#39'OUTRA '#39'                 ,99);'
          ''
          'INSERT INTO duimp.tipos_aplicacoes'
          'SELECT A.Id'
          ',A.TipoItemCodigo'
          'FROM @Aplicacoes AS A'
          'WHERE NOT EXISTS ('
          #9'SELECT 1'
          #9'FROM duimp.tipos_aplicacoes AS B'
          #9'WHERE B.Id = A.Id'
          ');'
          ''
          'SET ANSI_WARNINGS ON;')
      end
      item
        Name = 'INSERT_INTO_duimp_canais_consolidados'
        SQL.Strings = (
          'SET ANSI_WARNINGS OFF;'
          ''
          'DECLARE @CanaisConsolidados TABLE ('
          #9'Id VARCHAR(8),'
          #9'Exibicao VARCHAR(30),'
          #9'Valor VARCHAR(8)'
          ');'
          ''
          'INSERT INTO @CanaisConsolidados'
          'VALUES'
          '('#39'VERDE'#39'   ,'#39'Verde'#39'   ,'#39'VD'#39'),'
          '('#39'AMARELO'#39' ,'#39'Amarelo'#39' ,'#39'AM'#39'),'
          '('#39'VERMELHO'#39','#39'Vermelho'#39','#39'VM'#39'),'
          '('#39'CINZA '#39'  ,'#39'Cinza'#39'   ,'#39'CZ'#39');'
          ''
          'INSERT INTO duimp.canais_consolidados'
          'SELECT A.Id'
          ',A.Exibicao'
          ',A.Valor'
          'FROM @CanaisConsolidados AS A'
          'WHERE NOT EXISTS ('
          #9'SELECT 1'
          #9'FROM duimp.canais_consolidados AS B'
          #9'WHERE B.Id = A.Id'
          ');'
          ''
          'SET ANSI_WARNINGS ON;')
      end
      item
        Name = 'INSERT_INTO_duimp_cargas_tipos'
        SQL.Strings = (
          'SET ANSI_WARNINGS OFF;'
          ''
          'DECLARE @CargasTipos TABLE ('
          #9'Id VARCHAR(3),'
          #9'ViaTransporteCodigo INT'
          ');'
          ''
          'INSERT INTO @CargasTipos'
          'VALUES'
          '('#39'CE'#39' ,1),'
          '('#39'RUC'#39',4);'
          ''
          'INSERT INTO duimp.cargas_tipos'
          'SELECT A.Id'
          ',A.ViaTransporteCodigo'
          'FROM @CargasTipos AS A'
          'WHERE NOT EXISTS ('
          #9'SELECT 1'
          #9'FROM duimp.cargas_tipos AS B'
          #9'WHERE B.Id = A.Id'
          ');'
          ''
          'SET ANSI_WARNINGS ON;')
      end
      item
        Name = 'INSERT_INTO_duimp_fob_tipos'
        SQL.Strings = (
          'SET ANSI_WARNINGS OFF;'
          ''
          'DECLARE @FobTipos TABLE ('
          #9'Id VARCHAR(13)'
          ');'
          ''
          'INSERT INTO @FobTipos'
          'VALUES'
          '('#39'COM_VALORACAO'#39'),'
          '('#39'SEM_VALORACAO'#39');'
          ''
          'INSERT INTO duimp.fob_tipos'
          'SELECT A.Id'
          'FROM @FobTipos AS A'
          'WHERE NOT EXISTS ('
          #9'SELECT 1'
          #9'FROM duimp.fob_tipos AS B'
          #9'WHERE B.Id = A.Id'
          ');'
          ''
          'SET ANSI_WARNINGS ON;')
      end>
    Connection = DBCliente
    ScriptOptions.CommandSeparator = '^'
    Params = <>
    Macros = <>
    Left = 98
    Top = 68
  end
end
