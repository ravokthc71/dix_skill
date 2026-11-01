# Skills - OpenRouter API

Esta pasta concentra snippets e exemplos de integração com a **API da OpenRouter**.

## Conteúdo sugerido

| Arquivo | Descrição |
|---------|-----------|
| `config.md` | Configuração da chave `OPENROUTER_API_KEY` e headers HTTP. |
| `listagem-modelos.md` | Como listar modelos disponíveis via API (`/api/v1/models`). |
| `chamada-completa.md` | Exemplo de chamada de chat/completions para um modelo específico. |
| `modelos-free.md` | Como identificar e filtrar apenas modelos gratuitos. |

## Exemplo rápido (cURL)

```bash
curl https://openrouter.ai/api/v1/models \
  -H "Authorization: Bearer $OPENROUTER_API_KEY"
```

> Substitua `$OPENROUTER_API_KEY` pela sua chave real obtida em https://openrouter.ai/settings/keys.