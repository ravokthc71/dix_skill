#!/usr/bin/env pwsh
param([string]$Skill, [string]$Agent = "opencode", [string]$Destination = ".agents/skills/$Skill")
Write-Host "Instalando skill $Skill para $Agent..." -ForegroundColor Cyan
# Copiar SKILL.md + references/ para destino
if (-not (Test-Path $Destination)) { New-Item -ItemType Directory -Path $Destination -Force | Out-Null }
Copy-Item -Path "skills/$Skill/SKILL.md" -Destination $Destination -Force
if (Test-Path "skills/$Skill/references/") { Copy-Item -Path "skills/$Skill/references/*" -Destination $Destination -Recurse -Force }
Write-Host "Skill $Skill instalada." -ForegroundColor Green
