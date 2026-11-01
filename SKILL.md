---
description: Ecosistema modular de conhecimento, ferramentas, automação e integração para agentes de IA
tags: [diix, ai-engineering, toolkit, universal, modular]
version: "2.0.0-alpha"
created: 2026-11-01
updated: 2026-11-01
---

# DIIX AI Engineering Toolkit

## Propósito

O DIIX é uma infraestrutura de conhecimento e automação para agentes de inteligência artificial. Ele fornece:

- **Skills**: habilidades portáveis para procedimentos específicos.
- **Tools**: scripts executáveis para automação, diagnóstico e validação.
- **Providers**: integração e gerenciamento de provedores de modelos.
- **Knowledge**: catálogo de modelos, benchmarks e documentação técnica.
- **Integrations**: adaptadores para OpenCode, Codex, Claude Code, Hermes.

## Quando usar

- Configurar novos projetos com questionário padrão.
- Selecionar, rotacionar ou avaliar modelos de linguagem.
- Configurar e diagnosticar provedores (9Router, OpenRouter, etc.).
- Automatizar tarefas de desenvolvimento e engenharia de IA.

## Quando NÃO usar

- Substituir agentes completos (OpenCode, Codex, Claude Code, Hermes).
- Implementar gateways de roteamento de modelos (priorizar o 9Router para isso).
- Treinar modelos próprios (fora do escopo inicial).

## Procedimento principal

1. Leia `core/PRINCIPLES.md` para entender os princípios arquiteturais.
2. Consulte `skills/` para habilidades específicas.
3. Use `tools/` para automação e validação.
4. Configure provedores em `providers/` e `integrations/`.
5. Atualize o conhecimento em `knowledge/` conforme testes realizados.

## Princípios obrigatórios

Veja `core/STANDARDS.md` para os 10 princípios (Universalidade, Modularidade, Portabilidade, etc.).

## Estrutura de referência

```
dii/
  core/             Princípios, padrões, segurança
  skills/           SKILL.md por categoria
  tools/            Scripts PowerShell/Python/Node
  providers/        Configurações e testes de provedores
  knowledge/        Catálogo, benchmarks, decisões
  integrations/     Adaptadores para agentes
  templates/        Templates reutilizáveis
  tests/            Contratos, integração, validação
```

## Segurança

- Nenhuma chave de API real é armazenada no repositório.
- Scripts destrutivos exigem confirmação (`--dry-run` disponível quando aplicável).
- Configurações pessoais são preservadas em backups antes de modificação.

## Referências

- `core/ARCHITECTURE.md` — arquitetura completa.
- `core/SECURITY.md` — modelo de segurança.
- `core/WORKFLOW.md` — fluxo de trabalho recomendado.
- `README.md` — visão geral e roadmap.