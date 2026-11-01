# Script de Automação - Gerar Questionário de Projeto

Este script PowerShell gera uma nova nota de projeto no cofre Obsidian (`C:\DIxavado\20_Projetos\`) usando o template global.

## Uso

```powershell
# Executar script com título do projeto
.\scripts\gerar-questionario.ps1 -Title "Novo Projeto"
```

## Código do Script

```powershell
param(
    [Parameter(Mandatory=$true)]
    [string]$Title,
    [string]$VaultPath = "C:\DIxavado\20_Projetos",
    [string]$TemplatePath = "C:\Users\Samuel\dix_skills\configs\questionario-projeto-template.md"
)

$dateStr = (Get-Date).ToString("yyyy-MM-dd")
$fileName = Join-Path $VaultPath "$Title.md"

# Ler template
$template = Get-Content $TemplatePath -Raw

# Substituir variáveis
$content = $template -replace "{{date}}", $dateStr -replace "{{title}}", $Title

# Escrever arquivo
$content | Out-File -FilePath $fileName -Encoding utf8

Write-Host "Nota criada: $fileName"
```

## Como Instalar

1. Criar pasta `scripts/` no repositório.
2. Salvar este arquivo como `scripts/gerar-questionario.ps1`.
3. Executar no PowerShell.

> Certifique-se de que o cofre Obsidian está acessível em `C:\DIxavado`.