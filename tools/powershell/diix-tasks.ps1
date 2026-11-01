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
    $dateStr = Get-Date -Format 'yyyy-MM-dd'
    $fileName = ($Title -replace ' ','_') + "-" + (Get-Date -Format 'yyyyMMdd') + ".md"
    $content = "---`ntipo: tarefa`ncriado: $dateStr`natualizado: $dateStr`nstatus: $Status`ntags: [$Project, $Priority]`n---`n# $Title`n- **Projeto:** $Project`n- **Prioridade:** $Priority`n- **Status:** $Status`n## Proximos passos`n- [ ] Definir objetivo`n- [ ] Executar`n- [ ] Validar`n"
    if (-not (Test-Path "projects/$Project/tasks")) { New-Item -ItemType Directory -Path "projects/$Project/tasks" -Force | Out-Null }
    $content | Out-File -FilePath "projects/$Project/tasks/$fileName" -Encoding utf8
    Write-Host "Tarefa criada: projects/$Project/tasks/$fileName"
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
