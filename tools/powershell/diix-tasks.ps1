#!/usr/bin/env pwsh
param(
    [string]$Action = "list",  # create | list | update | delete
    [string]$Title = "",
    [string]$Project = "dix_skills",
    [string]$Status = "pendente",
    [string]$Priority = "media"
)

$taskFile = "projects/$Project/tasks/$($Title -replace ' ','_')-$(Get-Date -Format 'yyyyMMdd').md"

if ($Action -eq "create") {
    $content = @"---
tipo: tarefa
criado: $(Get-Date -Format 'yyyy-MM-dd')
atualizado: $(Get-Date -Format 'yyyy-MM-dd')
status: $Status
tags: [$Project, $Priority]
---
# $Title
- **Projeto:** $Project
- **Prioridade:** $Priority
- **Status:** $Status
## Próximos passos
- [ ] Definir objetivo
- [ ] Executar
- [ ] Validar
"@
    if (-not (Test-Path "projects/$Project/tasks")) { New-Item -ItemType Directory -Path "projects/$Project/tasks" -Force | Out-Null }
    $content | Out-File -FilePath $taskFile -Encoding utf8
    Write-Host "Tarefa criada: $taskFile"
} elseif ($Action -eq "list") {
    Get-ChildItem "projects/$Project/tasks" -Filter *.md -ErrorAction SilentlyContinue | ForEach-Object {
        $line = Get-Content $_.FullName -First 10
        $name = $_.Name
        Write-Host "$name"
    }
} elseif ($Action -eq "update") {
    $file = Get-ChildItem "projects/$Project/tasks" -Filter *$Title* | Select-Object -First 1
    if ($file) {
        $content = Get-Content $file.FullName -Raw
        $content = $content -replace "status: .+", "status: $Status"
        $content | Out-File -FilePath $file.FullName -Encoding utf8
        Write-Host "Tarefa atualizada: $($file.Name) -> $Status"
    } else {
        Write-Host "Tarefa nao encontrada."
    }
}
