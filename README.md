# dix_skill

> Repositório oficial de skills, instruções, métodos e práticas para uso do **OpenCode no Windows** e controle de modelos de linguagem via **OpenRouter**.

---

## Sobre o projeto

Este projeto concentra diversos diretórios, cada um dedicado a um tema, skill, instrução ou método diferente. O objetivo é servir como base de conhecimento e referência prática para:

* Configurar e utilizar o **OpenCode no Windows**, incluindo caminhos, automação e controle via LLMs.
* Configurar, gerenciar e rotacionar modelos de linguagem através da **OpenRouter** (API, conexões, listagem de modelos).
* Identificar modelos **free** da OpenRouter e separá-los dos modelos pagos.
* Conhecer qualidades, defeitos e cenários adequados para cada LLM.
* Reduzir o consumo de tokens e respeitar limites de uso.
* Combinar e alternar modelos de acordo com o tipo de projeto e função.

---

## O que contém até o momento

Abaixo está a estrutura inicial do repositório:

| Diretório | Propósito |
|-----------|-----------|
| `skills/` | Skills prontas e snippets para diferentes cenários de uso (OpenCode, OpenRouter, rotação, otimização de tokens, combinações por projeto). |
| `instructions/` | Instruções passo a passo de configuração e uso. |
| `configs/` | Exemplos de arquivos de configuração para OpenCode e OpenRouter. |
| `docs/` | Documentação detalhada: catálogo de modelos, referências de API, guia de rotação e gerenciamento de tokens. |
| `.github/` | Templates de issues e configurações do repositório (opcional). |
| `README.md` | Este arquivo: visão geral do projeto e como utilizá-lo. |
| `LICENSE` | Licença do repositório. |
| `.gitignore` | Arquivos e pastas ignorados pelo Git. |

---

## Como utilizar este projeto

1. **Clone o repositório**
   ```bash
   git clone https://github.com/ravokthc71/dix_skill.git
   cd dix_skill
   ```

2. **Explore as pastas**
   Navegue pelas subpastas conforme a necessidade:
   * `skills/` → cópia e adapte os snippets para seu fluxo.
   * `instructions/` → siga os guias passo a passo.
   * `configs/` → use os arquivos como modelo para seus próprios `.json`, `.yaml` ou `.env`.
   * `docs/` → consulte a referência detalhada antes de tomar decisões de arquitetura de modelos.

3. **Adicione suas próprias skills**
   Crie novos arquivos dentro de `skills/` seguindo o padrão existente:
   ```
   skills/<categoria>/<nome-da-skill>.md
   ```

4. **Mantenha o repositório atualizado**
   ```bash
   git add .
   git commit -m "feat: adiciona skill de exemplo para OpenRouter"
   git push origin main
   ```

---

## Principais áreas abordadas

### OpenCode no Windows
* Instalação e caminhos padrão (`%USERPROFILE%\.opencode`, `%APPDATA%\.opencode`, etc.).
* Como utilizar e controlar o OpenCode via LLMs.
* Configuração de providers, modelos e conexões.

### OpenRouter
* Configuração da API e gerenciamento de chaves (`OPENROUTER_API_KEY`).
* Listagem de modelos disponíveis via API.
* Separação e identificação de modelos **free** vs pagos.
* Qualidades, defeitos e cenários adequados por LLM.
* Rotação de modelos (qual usar, quando e por quê).
* Redução de consumo de tokens e limites de uso.

### Combinações e alternâncias
* Instruções para combinar modelos conforme o tipo de projeto (frontend, backend, dados, DevOps, escrita, etc.).
* Alternância automática ou manual entre modelos para otimizar custo e qualidade.

---

## Próximos passos sugeridos

* [ ] Preencher `skills/opencode-windows/` com exemplos práticos de uso no Windows.
* [ ] Preencher `instructions/setup-opencode-windows.md` com guia de instalação passo a passo.
* [ ] Preencher `docs/llm-catalog.md` com o catálogo detalhado de modelos OpenRouter (free/pago).
* [ ] Adicionar exemplos de rotação de modelos em `skills/llm-rotation/`.
* [ ] Adicionar técnicas de redução de tokens em `instructions/token-management.md`.

---

## Licença

Este projeto está sob a licença [MIT](./LICENSE). Sinta-se à vontade para usar, modificar e distribuir.

---

*Mantido por ravokthc71 — GitHub: https://github.com/ravokthc71*