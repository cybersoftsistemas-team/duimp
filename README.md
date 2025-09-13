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

## ⚡ Signer.exe

| Comando | Descrição |
|---------|-------------|
| `signer.exe` | Executa usando os diretórios definidos no `.ini` (seção `Directories`). Console ativo. Sem log. Não recursivo. |
| `signer.exe -log` | Executa usando o `.ini`. Console ativo. Gera log padrão (`<base>.log`, onde `<base>` é o nome do executável/ini, ex: `signer.log`). Não recursivo. |
| `signer.exe -log=meuarquivo.log` | Executa usando o `.ini`. Console ativo. Gera log no arquivo especificado (aceita caminho absoluto ou relativo). Não recursivo. |
| `signer.exe -silent` | Executa usando o `.ini`. Console desativado. Sem log (a menos que `-log` também seja passado). Não recursivo. |
| `signer.exe -silent -log` | Executa usando o `.ini`. Console desativado. Gera log padrão (`signer.log`). Não recursivo. |
| `signer.exe -allsubdirs` | Executa usando o `.ini`. Processa recursivamente todas as subpastas dos diretórios configurados. Console ativo. Sem log. |
| `signer.exe -log -allsubdirs` | Executa recursivamente (subpastas) e gera log padrão (`signer.log`). Console ativo. |
| `signer.exe -silent -log=saida.log -allsubdirs` | Executa recursivamente, console desativado e grava log customizado `saida.log`. |
| `signer.exe -silent -allsubdirs` | Executa recursivamente, console desativado, sem log. |
| `signer.exe -directories=dir1;dir2` | **Sobrescreve** o `Directories` do `.ini`. Aceita múltiplos caminhos separados por `;`. Caminhos relativos são resolvidos a partir da pasta do `signer.exe`. Pode ser combinado com `-log`, `-silent`, `-allsubdirs`. Ex.: `signer.exe -directories=build\Win32\VCL;installers -log -allsubdirs` |

> **Observações importantes:**
>
> - Se `-directories` for informado, o `Directories` do `.ini` **é ignorado**.  
> - Os caminhos passados (no `.ini` ou via `-directories`) podem ser **relativos** (resolvidos a partir da pasta do `signer.exe`) ou **absolutos**.  
> - O `-log` sem argumento gera o log com o mesmo nome base do `.ini`/exe (ex.: `signer.log`). `-log=<file>` grava no arquivo indicado (relativo ou absoluto).  
> - A saída no console e no log mostra **caminhos relativos** (relativos ao diretório do `signer.exe`), não caminhos absolutos.  
> - O log inclui o **hash SHA256** do arquivo entre colchetes (`[...]`) para rastrear assinaturas anteriores (o programa evita reassinar arquivos cujo hash já consta no log).  
> - Ao chamar pelo PowerShell, você pode usar `-directories=path` sem aspas ou `-directories="p1;p2"` com aspas — o `signer.exe` remove aspas automaticamente.

## Exemplo de configuração (`signer.ini`)
```ini
[Config]
; Caminho do certificado PFX (relativo ou absoluto)
Certificate=build\Win32\VCL\CybersoftSistemas.pfx

; Senha do certificado
Password=123

; Diretórios com arquivos a assinar, múltiplos separados por ';'
Directories=build\Win32\VCL;installers

; Extensões de arquivos a assinar
Extensions=exe;dll

; URL do timestamp server (opcional)
Timestamp=http://timestamp.digicert.com

; Algoritmo de hash (opcional)
HashAlgorithm=SHA256

; Diretório/arquivo do signtool (opcional, padrão procura no PATH)
Signtool=C:\Program Files (x86)\Windows Kits\10\App Certification Kit\signtool.exe
```

### Explicação rápida dos campos:

- **Certificate** → Caminho para o arquivo `.pfx` do certificado digital. Pode ser absoluto ou relativo.
- **Password** → Senha do certificado PFX.
- **Directories** → Lista de diretórios onde estão os arquivos a assinar (separados por `;`).
- **Extensions** → Extensões de arquivos que serão assinados (`exe`, `dll`, etc).
- **Timestamp** → URL do servidor de carimbo do tempo (timestamp server).
- **HashAlgorithm** → Algoritmo de hash usado na assinatura (ex: `SHA256`).
- **Signtool** → Caminho completo para o `signtool.exe` (se não informado, será procurado no `PATH`).