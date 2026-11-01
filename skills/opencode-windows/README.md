# Skills - Exemplos Práticos de Uso do OpenCode no Windows

## Caminhos Padrão no Windows

| Local | Variável de Ambiente | Uso |
|-------|---------------------|-----|
| Perfil do usuário | `%USERPROFILE%` | Configurações do usuário |
| Dados do aplicativo | `%APPDATA%` | Dados persistentes |
| Cache local | `%LOCALAPPDATA%` | Cache e arquivos temporários |
| Perfil do usuário + OpenCode | `%USERPROFILE%\.opencode\` | Configuração principal |

## Exemplo de Script de Inicialização (PowerShell)

```powershell
# Inicializar o OpenCode no Windows
$env:OPENROUTER_API_KEY = "sua_chave_aqui"
$env:OPENROUTER_BASE_URL = "https://openrouter.ai/api/v1"

# Iniciar OpenCode
opencode
```

## Exemplo de Uso com Provider Específico

```powershell
# Usar um modelo específico via OpenRouter
opencode --model openai/gpt-4o-mini --prompt "Explique o que é OpenRouter"
```

## Exemplo de Configuração de Ambiente (Windows)

```powershell
# Adicionar ao registro ou ao perfil do PowerShell
$env:OPENROUTER_API_KEY = "sk-or-v1-..."
$env:OPENROUTER_BASE_URL = "https://openrouter.ai/api/v1"
```

## Exemplo de Integração com .env

```env
# .env
OPENROUTER_API_KEY=sk-or-v1-...
OPENROUTER_BASE_URL=https://openrouter.ai/api/v1
OPENROUTER_MODEL=openai/gpt-4o-mini
```

## Exemplo de Script de Backup de Configuração

```powershell
# Backup das configurações do OpenCode
$backupDir = "C:\Backups\opencode"
New-Item -ItemType Directory -Force -Path $backupDir | Out-Null
Copy-Item "$env:USERPROFILE\.opencode\*" "$backupDir" -Recurse -Force
```

## Exemplo de Uso com LLMs (Controle via Prompt)

```powershell
# Exemplo de prompt de sistema para OpenCode
$systemPrompt = "Você é um desenvolvedor sênior especializado em TypeScript e React. Responda em português do Brasil."
opencode --system-prompt $systemPrompt --model openai/gpt-4o-mini
```

## Exemplo de Rotina de Verificação de Status

```powershell
# Verificar se o OpenCode está instalado
if (Get-Command opencode -ErrorAction SilentlyContinue) {
    $version = opencode --version
    Write-Host "OpenCode versão: $version"
} else {
    Write-Host "OpenCode não encontrado. Execute: npm install -g @opencode/cli"
}
```

## Exemplo de Configuração de Proxy (se necessário)

```powershell
$env:HTTP_PROXY = "http://proxy.empresa.com:8080"
$env:HTTPS_PROXY = "http://proxy.empresa.com:8080"
$env:NO_PROXY = "localhost,127.0.0.1"
```

## Dicas de Uso no Windows

1. **Use o PowerShell ISE ou VS Code** para scripts complexos.
2. **Habilite a execução de scripts** se necessário: `Set-ExecutionPolicy RemoteSigned`.
3. **Use variáveis de ambiente** para chaves de API, nunca hardcode.
4. **Monitore o uso** em https://openrouter.ai/settings/usage regularmente.
5. **Mantenha backups** das configurações periodicamente.

> Consulte `instructions/setup-opencode-windows.md` para o guia completo de instalação.