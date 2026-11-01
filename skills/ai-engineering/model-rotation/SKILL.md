---
description: Rotação e fallback automático de modelos conforme perfil, orçamento e disponibilidade
tags: [ai-engineering, llm, rotation, fallback]
version: "2.0.0-alpha"
---

# Skill — LLM Rotation

## Propósito

Implementar rotação de modelos baseada em critérios verificáveis: orçamento, disponibilidade, contexto e perfil da tarefa.

## Quando usar

- Quando o modelo primário está indisponível ou com baixo desempenho.
- Quando o orçamento diário foi atingido.
- Quando a janela de contexto é insuficiente para o arquivo enviado.

## Quando NÃO usar

- Quando não há critérios definidos para a seleção.

## Procedimento

1. Defina o perfil primário (`coding`, `reasoning`, etc.).
2. Verifique a disponibilidade do provedor (`providers/` + `tools/`).
3. Se o primário falhar, consulte o perfil de fallback.
4. Se o orçamento for excedido, mude para modelos gratuitos (`knowledge/models/`).
5. Registre a escolha e o consumo para análise (`tests/validation/`).

## Referências

- `skills/ai-engineering/llm-selection/`
- `tools/powershell/` — scripts de verificação
- `knowledge/models/`