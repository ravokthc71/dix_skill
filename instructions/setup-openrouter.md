# Instrução - Configuração da OpenRouter

Este guia ensina a configurar, conectar e utilizar a **OpenRouter** a partir do OpenCode ou de scripts próprios.

## 1. Obter a chave de API

1. Acesse https://openrouter.ai/settings/keys.
2. Crie uma nova chave de API.
3. Copie o valor e armazene em um local seguro (ex.: gerenciador de senhas ou variável de ambiente).

## 2. Configurar variáveis de ambiente

Crie um arquivo `.env` na raiz do projeto:

```env
OPENROUTER_API_KEY=sk-or-v1-xxxxxxxxxxxxxxxx
OPENROUTER_BASE_URL=https://openrouter.ai/api/v1
```

No Windows (PowerShell):
```powershell
$env:OPENROUTER_API_KEY="sk-or-v1-xxxxxxxxxxxxxxxx"
```

## 3. Testar a conexão

```bash
curl https://openrouter.ai/api/v1/models \
  -H "Authorization: Bearer $OPENROUTER_API_KEY"
```

Se retornar uma lista JSON de modelos, a conexão está funcionando.

## 4. Listar modelos e identificar os gratuitos

A resposta da API inclui um campo indicando se o modelo é gratuito. Filtre por:
* `pricing.prompt == "0"` e `pricing.completion == "0"` → modelo **free**.
* Caso contrário → modelo **pago**.

Consulte `docs/llm-catalog.md` para a tabela completa de modelos e suas categorias.

## 5. Configurar no OpenCode

Edite o arquivo de configuração do OpenCode (geralmente em `%USERPROFILE%\.opencode\config.json`) e adicione o provider OpenRouter:

```json
{
  "providers": [
    {
      "name": "openrouter",
      "baseUrl": "https://openrouter.ai/api/v1",
      "apiKeyEnv": "OPENROUTER_API_KEY"
    }
  ]
}
```

> Reinicie o OpenCode após alterar o arquivo de configuração.