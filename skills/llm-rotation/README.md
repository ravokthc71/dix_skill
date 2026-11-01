# Exemplos de Rotação de Modelos

## Exemplo 1: Rotação por Tipo de Tarefa (Manual)

```powershell
# Definir função de escolha de modelo
function Choose-Model($taskType) {
    switch ($taskType) {
        "simple" { return "meta-llama/llama-3.1-8b-instruct:free" }
        "medium" { return "openai/gpt-4o-mini" }
        "complex" { return "anthropic/claude-3.5-sonnet" }
        default { return "openai/gpt-4o-mini" }
    }
}

# Uso
$model = Choose-Model -taskType "complex"
opencode --model $model --prompt "Projete uma arquitetura de microsserviços"
```

## Exemplo 2: Rotação Automática por Orçamento

```powershell
# Verificar consumo diário
$usage = Invoke-RestMethod -Uri "https://openrouter.ai/api/v1/usage" -Headers @{Authorization = "Bearer $env:OPENROUTER_API_KEY"}

if ($usage.dailySpent -gt 5.00) {
    $model = "meta-llama/llama-3.1-8b-instruct:free"  # Fallback para free
} else {
    $model = "openai/gpt-4o-mini"
}
```

## Exemplo 3: Rotação por Disponibilidade (Fallback)

```powershell
# Lista de modelos de backup
$models = @(
    "openai/gpt-4o-mini",
    "meta-llama/llama-3.1-8b-instruct:free",
    "google/gemma-2-9b-it:free"
)

foreach ($m in $models) {
    try {
        $response = opencode --model $m --prompt "Teste" --max-tokens 10
        if ($response) { break }  # Usar o primeiro que responder
    } catch {
        Write-Host "Modelo $m indisponível"
    }
}
```

## Exemplo 4: Rotação por Tamanho de Contexto

```powershell
# Escolher modelo com base no tamanho do contexto necessário
$textLength = (Get-Content "arquivo_grande.md" -Raw).Length
if ($textLength -gt 50000) {
    $model = "anthropic/claude-3.5-sonnet"  # 200k contexto
} elseif ($textLength -gt 10000) {
    $model = "openai/gpt-4o-mini"  # 128k contexto
} else {
    $model = "meta-llama/llama-3.1-8b-instruct:free"  # Contexto menor
}
```

## Exemplo 5: Rotação por Horário do Dia

```powershell
$hour = (Get-Date).Hour
if ($hour -lt 9 -or $hour -gt 18) {
    $model = "meta-llama/llama-3.1-8b-instruct:free"  # Fora do horário, usar free
} else {
    $model = "openai/gpt-4o-mini"  # Horário comercial, usar médio
}
```

## Tabela de Rotação Recomendada

| Situação | Modelo Primário | Modelo Fallback | Motivo |
|----------|-----------------|-----------------|--------|
| Tarefa simples | Free leve | Outra free | Custo zero |
| Tarefa média | GPT-4o-mini | Free médio | Equilíbrio |
| Tarefa complexa | Claude-3.5 | GPT-4o-mini | Qualidade máxima |
| Orçamento esgotado | Free | Outra free | Evitar custo |
| Disponibilidade | GPT-4o-mini | Claude-3.5 | Fallback automático |

> Adicione novos exemplos conforme você testa diferentes cenários de rotat