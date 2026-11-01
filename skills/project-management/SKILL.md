---
description: Sistema global de gerenciamento dinâmico de tarefas, próximos passos, progresso e todolist para múltiplos projetos
tags: [management, tasks, progress, todo, global]
version: "2.0.0-alpha"
---

# Skill — Global Task Manager

## Propósito

Criar, atualizar, consultar e evoluir listas de tarefas, próximos passos e progresso de forma dinâmica e reutilizável, independente do tipo de projeto.

## Quando usar

- Início de qualquer projeto (usar `templates/project/task-template.md`).
- Reuniões de revisão (atualizar `status`).
- Quando há mudança de escopo (mover itens, adicionar novos).
- Para manter histórico de progresso (`telemetry` + `knowledge/`).

## Estrutura global

```
projects/
  <nome-do-projeto>.md
  tasks/
    <data>-<titulo>.md
  progress/
    <ano-mes>.md
  templates/
    task-template.md
```

## Template de tarefa (mínimo)

```markdown
---
tipo: tarefa
criado: {{date}}
atualizado: {{date}}
status: pendente | em_andamento | concluido | pausado
tags: [projeto, prioridade]
---
# {{title}}

- **Projeto:** {{project}}
- **Responsável:** {{owner}}
- **Prioridade:** alta | media | baixa
- **Prazo:** {{date}}

## Descrição

## Próximos passos
- [ ] Ação 1
- [ ] Ação 2

## Progresso / Notas
-
```

## Comandos de controle (PowerShell)

```powershell
. .\tools\powershell\diix-tasks.ps1 -Action create -Title "Configuracao OpenRouter" -Project "dix_skills"
. .\tools\powershell\diix-tasks.ps1 -Action list -Project "dix_skills"
. .\tools\powershell\diix-tasks.ps1 -Action update -Title "Configuracao OpenRouter" -Status "concluido"
```

## Integração com DIIX

- Registra progresso em `knowledge/`.
- Usa `telemetry/` para registrar conclusão de tarefas.
- Atualiza `CHANGELOG.md` quando marcos são atingidos.
