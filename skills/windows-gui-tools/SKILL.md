---
description: Criar mini projetos C# (WinForms/WPF simples) que geram janelas gráficas personalizáveis para configurar, inserir credenciais, selecionar opções, conectar e automatizar tarefas do DIIX
tags: [windows, csharp, gui, automation, builder, custom]
version: "2.0.0-alpha"
---

# Skill — Windows GUI Mini App Builder

## Propósito

Criar rapidamente executáveis (.exe) ou DLLs simples com interface gráfica visual personalizada para:
- Inserir credenciais/APIs
- Configurar provedores (9Router, OpenRouter)
- Selecionar modelos/perfis
- Executar ações automatizadas com feedback visual
- Facilitar tudo que antes era manual

## Quando usar

- Sempre que uma configuração manual precisa ser repetida (chaves, URLs, perfis).
- Para criar ferramentas visuais simples para o cofre/projeto.
- Quando precisa de uma janela rápida para selecionar opções.

## Tecnologia

- **C# (.NET)** — WinForms simples (funciona no Windows sem instalação extra).
- **PowerShell** — script `build-mini-app.ps1` que compila o `.cs` automaticamente.
- **Saída** — `.exe` simples na pasta `dist/`.

## Template básico

Veja `configs/gui-template.cs`. Estrutura mínima:

```csharp
using System.Windows.Forms;
public class MiniApp : Form {
    public MiniApp() {
        this.Text = "DIIX Configurador";
        this.Width = 480; this.Height = 320;
        // Adicionar campos, botões e ações
    }
}
```

## Compilação rápida

```powershell
.\tools\powershell\build-mini-app.ps1 -Source "configs/gui-template.cs" -Output "dist/DIIX_Config.exe"
```

O script usa `csc.exe` (C# Compiler) disponível no Windows/.NET Framework.

## Personalização

- Altere `Text`, `Width`, `Height`.
- Adicione `TextBox`, `Button`, `ComboBox`, `Label`.
- No evento `Click` do botão, chame métodos do DIIX (`provider_manager`, `router`).
- A janela pode ser executada diretamente: `dist/DIIX_Config.exe`.

## Integração com DIIX

- Os `.exe` criados podem ser chamados pelo `diix-system-controller.ps1` (`-Mode control`).
- As configurações inseridas pela janela podem ser salvas no `.env` ou `~/.opencode/config.json`.
- O `telemetry/` registra quando uma janela de configuração é executada.

## Quando NÃO usar

- Quando precisa de uma aplicação completa e complexa (use o `packages/diix/src/diix/cli/`).
- Quando precisa de interface web (use documentação/instruções).
- Quando o ambiente não tem `.NET Framework` ou `csc.exe` disponível.

## Referências

- `configs/gui-template.cs`
- `instructions/build-csharp-gui.md`
- `core/STANDARDS.md`