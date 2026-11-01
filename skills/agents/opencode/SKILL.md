---
description: Configuração e controle do OpenCode no ambiente Windows
tags: [agent, opencode, windows, setup]
version: "2.0.0-alpha"
---

# Skill — OpenCode Windows

## Propósito

Configurar, diagnosticar e utilizar o OpenCode no Windows com integração ao cofre Obsidian (`C:\DIxavado`).

## Quando usar

- Ao configurar um novo ambiente Windows.
- Quando há problemas de conexão, configuração ou execução.

## Procedimento

1. Verifique a instalação (`opencode --version`).
2. Configure variáveis de ambiente (`OPENROUTER_API_KEY`, etc.).
3. Crie/atualize `%USERPROFILE%\.opencode\config.json`.
4. Teste a conexão com o provider configurado.
5. Consulte `skills/opencode-windows/` para exemplos.

## Referências

- `skills/opencode-windows/README.md`
- `instructions/setup-opencode-windows.md`