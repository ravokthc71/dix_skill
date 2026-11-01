# DIIX — AI Engineering Toolkit

> Universal, modular e reutilizável. Conhecimento, ferramentas, automação e integração para agentes de IA.

---

## Direção Arquitetural (v2)

Este repositório está sendo reconstruído como um ecossistema modular (`Universal`) com os seguintes subsistemas:

| Subsistema | Propósito |
|------------|-----------|
| `core/` | Princípios, padrões, segurança, arquitetura e workflow |
| `skills/` | Habilidades portáveis em Markdown (`SKILL.md`) |
| `tools/` | Scripts executáveis (PowerShell, Python, Node) |
| `providers/` | Integração com 9Router, OpenRouter, Cloudflare AI, OpenAI-compatible |
| `knowledge/` | Catálogo de modelos, benchmarks, protocolos e decisões |
| `integrations/` | Adaptadores para OpenCode, Codex, Claude Code, Hermes |
| `automation/` | Diagnósticos, validação, backup, CI/CD |

---

## Posicionamento

- **Universal**: funciona com OpenCode, Codex, Claude Code, Hermes e outros agentes.
- **Agent Agnostic**: não depende de um único agente.
- **Provider Agnostic**: funciona com 9Router, OpenRouter, Cloudflare Workers AI e APIs compatíveis.
- **Modular**: cada componente pode ser usado independentemente.

---

## Estrutura Atual

O conteúdo anterior foi preservado. A reconstrução está em progresso (Fase M0 + M1):

- `skills/` — reorganizado com SKILL.md por categoria.
- `core/` — princípios, arquitetura, segurança, padrões.
- `integrations/` — adaptadores para cada agente.
- `providers/` — configuração e testes de provedores.
- `knowledge/` — catálogo de modelos, protocolos e decisões arquiteturais.
- `templates/` — templates de projetos, agentes, skills e documentação.
- `tests/` — testes de contrato, integração e validação.

---

## Próximos Passos (Roadmap)

- M0 — Auditoria e preservação ✅
- M1 — Foundation (em progresso)
- M2 — Skill Engine
- M3 — Provider Manager
- M4 — Model Intelligence
- M5 — DIIX CLI e automação
- M6 — Agent Ecosystem
- M7 — Release e expansão

---

## Licença

MIT — veja `LICENSE`.

---

*Mantido por ravokthc71 — Repositório: https://github.com/ravokthc71/dix_skill*