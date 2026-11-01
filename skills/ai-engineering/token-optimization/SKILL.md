---
description: Otimização de consumo de tokens para reduzir custos e respeitar limites
tags: [ai-engineering, optimization, tokens, limits]
version: "2.0.0-alpha"
---

# Skill — Token Optimization

## Propósito

Reduzir o consumo de tokens ao utilizar LLMs, respeitando limites de uso e orçamento.

## Quando usar

- Sempre antes de enviar requisições grandes.
- Quando o consumo diário está próximo do limite.

## Procedimento

1. Use prompts enxutos e diretos.
2. Envie apenas contexto relevante (não arquivos completos).
3. Escolha modelos com janela de contexto adequada (não use 128k para 2k tokens).
4. Defina `max_tokens` razoáveis.
5. Reutilize respostas já obtidas quando possível.
6. Evite pedir ao modelo para "pensar em voz alta" em tarefas simples.

## Referências

- `instructions/token-management.md`
- `skills/project-combos/`