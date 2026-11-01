# Referência de API - OpenRouter

Principais endpoints e exemplos de uso da API da OpenRouter.

## Autenticação

Todos os requisitos exigem o header:

```
Authorization: Bearer <SUA_CHAVE_API>
```

## Endpoints principais

### Listar modelos
```
GET https://openrouter.ai/api/v1/models
```

Retorna a lista completa de modelos disponíveis, incluindo preços e provedores.

### Chat / Completions
```
POST https://openrouter.ai/api/v1/chat/completions
```

Corpo da requisição (exemplo):

```json
{
  "model": "openai/gpt-4o-mini",
  "messages": [
    { "role": "system", "content": "Você é um assistente útil." },
    { "role": "user", "content": "Explique o que é OpenRouter." }
  ],
  "max_tokens": 500,
  "temperature": 0.7
}
```

## Exemplo com cURL

```bash
curl https://openrouter.ai/api/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -d '{
    "model": "openai/gpt-4o-mini",
    "messages": [
      { "role": "user", "content": "Olá, como você está?" }
    ],
    "max_tokens": 100
  }'
```

## Dicas de conexão

* Defina `OPENROUTER_BASE_URL=https://openrouter.ai/api/v1` no seu `.env`.
* Use variáveis de ambiente para a chave de API, nunca commite o `.env` no Git.
* Monitore o uso em https://openrouter.ai/settings/usage.

> Consulte `skills/openrouter-api/` para snippets prontos de integração.