---
description: Seleção inteligente de modelos com base em perfil, orçamento e contexto
tags: [ai-engineering, llm, selection, models]
version: "2.0.0-alpha"
---

# Skill — LLM Selection

## Propósito

Selecionar o modelo mais adequado para uma tarefa, considerando capacidade, custo, disponibilidade e contexto.

## Quando usar

- Antes de iniciar uma tarefa de desenvolvimento ou análise.
- Quando o orçamento ou limite de uso foi atingido.
- Quando a qualidade do modelo atual não atende.

## Quando NÃO usar

- Quando já há um perfil configurado e a tarefa é padrão.

## Procedimento

1. Defina o perfil: `simple` | `coding` | `reasoning` | `review` | `documentation` | `vision` | `embedding`
2. Verifique disponibilidade em `providers/` (9Router / OpenRouter / Cloudflare).
3. Verifique orçamento e limites de uso.
4. Selecione o modelo com base em `knowledge/models/`.
5. Configure `max_tokens` e `temperature` conforme a tarefa.
6. Execute e valide o resultado.

## Referências

- `knowledge/models/` — catálogo estruturado
- `skills/ai-engineering/llm-benchmarking/` — benchmarks
- `skills/ai-engineering/model-rotation/` — rotação entre modelos