---
description: Integração com a API OpenRouter para listagem, configuração e uso de modelos
tags: [provider, openrouter, api, models]
version: "2.0.0-alpha"
---

# Skill — OpenRouter

## Propósito

Configurar, listar e utilizar modelos disponíveis via API OpenRouter.

## Procedimento

1. Configure a chave (`OPENROUTER_API_KEY`).
2. Teste a conexão (`curl /api/v1/models`).
3. Filtre modelos por preço (`pricing.prompt == "0"`).
4. Selecione o modelo conforme o perfil (`knowledge/models/`).
5. Monitore consumo em `https://openrouter.ai/settings/usage`.

## Referências

- `skills/openrouter-api/README.md`
- `docs/api-reference.md`
- `docs/llm-catalog.md`