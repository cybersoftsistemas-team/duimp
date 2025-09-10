# Conexão com o Siscomex

Para acessar os serviços do Siscomex, utilize as seguintes propriedades de conexão:

## Propriedades da Conexão

- **URL Base do serviço:**  
  https://```text<br>portalunico.siscomex.gov.br<br>```

- **Caminho de autenticação:**  
  ```text<br>portal/api/autenticar<br>```

## Exemplo de Configuração

```yaml
siscomex:
  base_url: "https://portalunico.siscomex.gov.br"
  auth_path: "portal/api/autenticar"
