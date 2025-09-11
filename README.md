# Conexão com o Siscomex

Para acessar os serviços do Siscomex, utilize as seguintes propriedades de conexão:

## Propriedades da Conexão

| Propriedade            | Descrição |
|-------------------------|-----------|
| **URL Base do serviço** | Endereço raiz do serviço Siscomex |
| **Caminho de autenticação** | Endpoint para autenticação |

### Valores copiáveis

**URL Base do serviço:**
```text
portalunico.siscomex.gov.br
```

**Caminho de autenticação:**
```text
portal/api/autenticar
```

# Signer.exe

| Comando | Descrição |
|---------|------------|
| `signer.exe` | Executa na(s) pasta(s) configurada(s) no `.ini`. Console ativo. Sem log. Não recursivo. |
| `signer.exe -log` | Executa na(s) pasta(s) configurada(s). Console ativo. Gera log padrão (`signer.log`). Não recursivo. |
| `signer.exe -log=meuarquivo.log` | Executa na(s) pasta(s) configurada(s). Console ativo. Gera log customizado (`meuarquivo.log`). Não recursivo. |
| `signer.exe -silent` | Executa na(s) pasta(s) configurada(s). Console desativado. Sem log. Não recursivo. |
| `signer.exe -silent -log` | Executa na(s) pasta(s) configurada(s). Console desativado. Gera log padrão (`signer.log`). Não recursivo. |
| `signer.exe -allsubdirs` | Executa na(s) pasta(s) configurada(s) e em todas as subpastas. Console ativo. Sem log. |
| `signer.exe -log -allsubdirs` | Executa na(s) pasta(s) configurada(s) e subpastas. Console ativo. Gera log padrão (`signer.log`). |
| `signer.exe -silent -log=saida.log -allsubdirs` | Executa na(s) pasta(s) configurada(s) e subpastas. Console desativado. Gera log customizado (`saida.log`). |
| `signer.exe -silent -allsubdirs` | Executa na(s) pasta(s) configurada(s) e subpastas. Console desativado. Sem log. |

> **Observações importantes:**  
> - Diretórios e extensões de arquivos são configurados no `.ini`.  
> - Caminhos relativos no `.ini` são resolvidos a partir da pasta do executável `signer.exe`.  
> - `-allsubdirs` permite percorrer recursivamente subpastas.  
> - `-silent` e `-log` podem ser combinados para pipelines CI/CD, mantendo a saída limpa e gerando log detalhado.