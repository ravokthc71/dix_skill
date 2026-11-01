# Instrução Completa - Instalação do OpenCode no Windows

Este guia completo cobre desde a instalação até a configuração avançada do OpenCode no Windows.

## Pré-requisitos

- Windows 10/11 (64 bits)
- Node.js 18+ instalado
- Acesso à internet
- Conta no GitHub
- Conta na OpenRouter

## Passo a Passo Detalhado

### Passo 1: Instalar Node.js

Baixe em https://nodejs.org/ e instale a versão LTS.

Verifique: `node -v`

### Passo 2: Instalar OpenCode

```powershell
npm install -g @opencode/cli
```

### Passo 3: Verificar Instalação

```powershell
opencode --version
opencode --help
```

### Passo 4: Configurar Caminhos

O OpenCode usa:
- `%USERPROFILE%\.opencode\` (configuração principal)
- `%APPDATA%\.opencode\` (dados do aplicativo)
- `%LOCALAPPDATA%\.opencode\` (cache local)

Crie a pasta se não existir:
```powershell
mkdir "%USERPROFILE%\.opencode"
```

### Passo 5: Criar Arquivo de Configuração

Crie `%USERPROFILE%\.opencode\config.json`:

```json
{
  "version": "1.0.0",
  "providers": [
    {
      "name": "openrouter",
      "baseUrl": "https://openrouter.ai/api/v1",
      "apiKeyEnv": "OPENROUTER_API_KEY"
    }
  ],
  "defaultProvider": "openrouter",
  "defaultModel": "openai/gpt-4o-mini",
  "maxTokens": 2000,
  "temperature": 0.7
}
```

### Passo 6: Configurar Variáveis de Ambiente

Crie `.env` na raiz do projeto:

```env
OPENROUTER_API_KEY=sua_chave_aqui
OPENROUTER_BASE_URL=https://openrouter.ai/api/v1
OPENROUTER_MODEL=openai/gpt-4o-mini
```

No Windows, configure permanentemente:
```powershell
[Environment]::SetEnvironmentVariable("OPENROUTER_API_KEY", "sua_chave", "User")
```

### Passo 7: Testar a Conexão

```powershell
opencode --model openai/gpt-4o-mini --prompt "Teste de conexão"
```

Se funcionar, o OpenCode está configurado corretamente.

## Controle via LLMs (Avançado)

### Definir Prompt de Sistema

```powershell
opencode --system-prompt "Você é um assistente especializado em desenvolvimento de software." --model openai/gpt-4o-mini
```

### Usar Contexto de Arquivo

```powershell
opencode --file "caminho\para\arquivo.md" --prompt "Resuma este documento"
```

### Configurar Automação

Crie scripts `.ps1` para tarefas repetitivas:

```powershell
# script: gerar-readme.ps1
opencode --system-prompt "Você é um expert em documentação técnica." `
  --prompt "Gere um README completo para este projeto com seções de instalação, uso e contribuições." `
  --model openai/gpt-4o-mini > README.md
```

## Resolução de Problemas

| Problema | Solução |
|----------|---------|
| Erro de chave API | Verifique se `OPENROUTER_API_KEY` está configurada |
| Erro de conexão | Verifique `OPENROUTER_BASE_URL` e a conexão com a internet |
| Modelo não encontrado | Verifique se o modelo existe na OpenRouter |
| Lentidão | Reduza `maxTokens` ou mude para modelo mais leve |

## Próximos Passos

1. Explore `skills/opencode-windows/` para exemplos práticos.
2. Configure a OpenRouter seguindo `instructions/setup-openrouter.md`.
3. Crie seu primeiro projeto com o template de questionário.