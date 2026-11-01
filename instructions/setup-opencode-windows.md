# Instrução - Instalação do OpenCode no Windows

Siga este guia para configurar o OpenCode em um ambiente Windows.

## Pré-requisitos

* Windows 10 ou 11.
* Node.js instalado (recomendado: versão LTS).
* Conta no GitHub (para autenticação do Copilot/OpenCode, se aplicável).
* Conta na OpenRouter (para uso de modelos externos).

## Passo a passo

1. **Instale o OpenCode**
   ```powershell
   npm install -g @opencode/cli
   # ou conforme a documentação oficial do OpenCode
   ```

2. **Verifique a instalação**
   ```powershell
   opencode --version
   ```

3. **Configure os caminhos**
   O OpenCode armazena configurações em:
   * `%USERPROFILE%\.opencode\`
   * `%APPDATA%\.opencode\`

4. **Defina variáveis de ambiente**
   Crie um arquivo `.env` na raiz do projeto:
   ```env
   OPENROUTER_API_KEY=sua_chave_aqui
   OPENROUTER_BASE_URL=https://openrouter.ai/api/v1
   ```

5. **Inicie o OpenCode**
   ```powershell
   opencode
   ```

## Controle via LLMs

* Use prompts de sistema para definir o comportamento do OpenCode.
* Ajuste o modelo padrão no arquivo de configuração do OpenCode.
* Habilite/desabilite sugestões automáticas conforme a necessidade.

> Consulte `skills/opencode-windows/caminhos.md` para detalhes dos caminhos no Windows.