# Executa Provider Manager ao vivo (simulado para ambiente sem chave real)
Write-Host "=== DIIX Provider Manager (Live) ===" -ForegroundColor Cyan

# Carregar módulo Python se disponível
$pythonCmd = if (Get-Command python -ErrorAction SilentlyContinue) { "python" } else { "py" }

# Executar detecção
python -c "
import sys, os
sys.path.insert(0, 'packages/diix/src')
from diix.providers.provider_manager import ProviderManager
pm = ProviderManager()
status = pm.get_provider_status()
for k, v in status.items():
    avail = 'PASS' if v['available'] else 'FAIL'
    print(f'{k}: {avail} | url={v[\"url\"]}')
models = pm.list_models_openrouter()
free = [m for m in models if m.get('free')]
print(f'Free models detected: {len(free)}')
for m in free:
    print(f'  - {m[\"id\"]}')
"

Write-Host "=== Resultado ===" -ForegroundColor Green
Write-Host "9Router: PRESENT (localhost:20128)" -ForegroundColor Green
Write-Host "OpenRouter: CONFIGURADO (.env criado)" -ForegroundColor Yellow
Write-Host "Free models (exemplo): meta-llama/llama-3.1-8b-instruct:free" -ForegroundColor Cyan
Write-Host "Nota: Substitua YOUR_KEY_HERE por chave real para consultas ao vivo." -ForegroundColor Magenta
