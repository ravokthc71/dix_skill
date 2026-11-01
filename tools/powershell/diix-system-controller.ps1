#!/usr/bin/env pwsh
# DIIX System Controller v2.0.0-alpha
# Executa diagnóstico completo, identifica componentes, propõe ações.

param(
    [string]$Profile = "default",
    [string]$Mode = "diagnose",  # diagnose | control | repair | learn
    [string]$Provider = "auto", # auto | 9router | openrouter | cloudflare
    [switch]$AutoRepair = $false,
    [switch]$LearnMode = $false
)

# --- CORE: Identificação do ambiente ---
$envInfo = @{
    os = [System.Environment]::OSVersion.Platform
    machine = [System.Environment]::MachineName
    user = $env:USERNAME
    python = (python --version 2>&1) -replace '.*\s+', ''
    powershell = $PSVersionTable.PSVersion.ToString()
    cofre = Test-Path "C:\DIxavado"
    opencode = (Get-Command opencode -ErrorAction SilentlyContinue) ? 'OK' : 'MISSING'
    openrouter_key = [bool]$env:OPENROUTER_API_KEY
    nine_router = (Test-Path "C:\DIX_MU\repos\openmu") ? 'PRESENT' : 'ABSENT'
    git = (git --version 2>&1) ? 'OK' : 'MISSING'
    node = (node --version 2>&1) ? 'OK' : 'MISSING'
}

Write-Host "=== DIIX SYSTEM CONTROLLER ===" -ForegroundColor Cyan
Write-Host "Profile: $Profile | Mode: $Mode | Provider: $Provider"
Write-Host "--- Ambiente ---"
$envInfo.GetEnumerator() | ForEach-Object { Write-Host "  $($_.Key): $($_.Value)" }

# --- DIAGNÓSTICO ---
if ($Mode -eq "diagnose") {
    $status = @()
    $envInfo.GetEnumerator() | ForEach-Object {
        if ($_.Value -match 'MISSING|ABSENT' -or ($_.Key -eq 'python' -and $_.Value -match '^\s*$')) {
            $status += @{key=$_.Key; status='FAIL'; action="Reparar ou instalar"}
        } elseif ($_.Value -eq 'OK' -or $_.Value -match 'PRESENT' -or $_.Key -eq 'cofre' -and $_.Value -eq $true) {
            $status += @{key=$_.Key; status='PASS'; action="Nenhuma"}
        } else {
            $status += @{key=$_.Key; status='WARN'; action="Verificar"}
        }
    }
    $status | Format-Table -Property @{N='Componente';E={$_.key}},@{N='Status';E={$_.status}},@{N='Ação';E={$_.action}}
}

# --- CONTROLE ---
if ($Mode -eq "control") {
    Write-Host "Controle do sistema ativado."
    if ($Provider -eq "9router") {
        Write-Host "Configurando roteamento via 9Router (localhost:20128)..."
        $env:OPENROUTER_API_KEY = $env:DIXX_9ROUTER_API_KEY ?? $env:OPENROUTER_API_KEY
    }
    Write-Host "Perfil selecionado: $Profile"
}

# --- REPAIR ---
if ($Mode -eq "repair" -or $AutoRepair) {
    Write-Host "Iniciando reparo automático (dry-run por padrão)..."
    if (-not $AutoRepair) { Write-Host "Use -AutoRepair para aplicar correções."; return }
    # Implementar reparos: criar .env se faltar, corrigir config, validar links
}

# --- APRENDIZADO ---
if ($LearnMode -or $Mode -eq "learn") {
    $log = @{
        timestamp = [DateTime]::Now.ToString('o')
        profile = $Profile
        provider = $Provider
        env = $envInfo
        actions = @()
    }
    # Salvar log para evolução
    $logDir = "C:\Users\$envInfo.user\.diix\logs"
    if (-not (Test-Path $logDir)) { New-Item -ItemType Directory -Path $logDir -Force | Out-Null }
    $log | ConvertTo-Json -Depth 3 | Out-File -FilePath (Join-Path $logDir "learn-$(Get-Date -Format 'yyyyMMdd-HHmmss').json") -Encoding utf8
    Write-Host "Log de aprendizado salvo em $logDir"
}

Write-Host "=== DIIX Controller concluído ===" -ForegroundColor Green
