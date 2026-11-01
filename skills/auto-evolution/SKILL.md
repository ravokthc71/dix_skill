---
description: Habilidade de o sistema observar, analisar, adaptar e evoluir com base em resultados
tags: [auto-evolution, learning, adaptation, feedback]
version: "2.0.0-alpha"
---

# Skill — Auto-Evolution

## Propósito

Permitir que o DIIX aprenda com cada execução e se altere para máxima precisão.

## Quando usar

- Após cada execução significativa (diagnóstico, seleção de modelo, automação).
- Quando o desempenho de um perfil cai abaixo do esperado.
- Quando novos modelos ou provedores são adicionados.

## Quando NÃO usar

- Quando não há registro de execução (`telemetry`).
- Quando a alteração seria destrutiva sem backup.

## Procedimento

1. Executar `DIIXTelemetry.log()` após cada operação.
2. Revisar `~/.diix/logs/telemetry-YYYY-MM-DD.jsonl`.
3. Se falhas repetidas: atualizar `skills/ai-engineering/llm-selection/` ou `models/`.
4. Ajustar `core/STANDARDS.md` se necessário.
5. Executar `diix-system-controller.ps1 -Mode learn` para validar.
6. Commitar a evolução com descrição clara.

## Referências

- `core/WORKFLOW.md`
- `packages/diix/src/diix/core/intelligence.py`
- `core/PRINCIPLES.md`