# Instrução Completa - Gerenciamento de Tokens

Este guia detalhado ensina a reduzir o consumo de tokens ao utilizar LLMs via OpenCode e OpenRouter.

## Entendendo Tokens

Tokens são unidades de texto que os modelos processam. Aproximadamente:
- 1 token ≈ 4 caracteres em inglês
- 1 token ≈ 0.75 palavras em português
- 1000 tokens ≈ 750 palavras

## Técnicas de Redução de Consumo

### Técnica 1: Prompts Enxutos

**Antes:**
> "Eu gostaria que você pudesse analisar este documento e me fornecer um resumo completo de todas as seções, incluindo detalhes técnicos e observações importantes, por favor."

**Depois:**
> "Resuma o documento em até 3 parágrafos, destacando pontos técnicos."

### Técnica 2: Contexto Mínimo

- Envie apenas arquivos ou trechos realmente necessários.
- Use resumos em vez de colar arquivos inteiros.
- Remova código não relacionado à pergunta.

### Técnica 3: Escolha Correta de Modelo

- Não use um modelo de 128k tokens para uma tarefa de 2k tokens.
- Prefira modelos com janela menor quando o contexto for pequeno.
- Use modelos gratuitos para tarefas simples.

### Técnica 4: Controle de Resposta

Defina `max_tokens` razoáveis:

```powershell
opencode --model openai/gpt-4o-mini --max-tokens 500 --prompt "Explique OpenRouter"
```

Peça respostas concisas:
> "Responda em até 3 linhas."

### Técnica 5: Cache e Reutilização

- Reutilize respostas já obtidas para tarefas repetitivas.
- Evite enviar o mesmo contexto várias vezes.
- Crie um arquivo de respostas frequentes (`respostas-frequentes.md`).

### Técnica 6: Evite Pensamento em Voz Alta

- Não peça ao modelo para "pensar em voz alta" em tarefas simples.
- Use prompts diretos: "Faça X" em vez de "Como você faria X? Pense passo a passo."

### Técnica 7: Uso de Formatos Estruturados

- Use JSON ou listas para respostas curtas e diretas.
- Evite pedidos de formatação complexa quando não necessária.

## Limites de Uso (Modelos Free)

| Modelo | Limite Diário | Limite de Contexto | Observação |
|--------|--------------|-------------------|------------|
| llama-3.1-8b | Variável | 32k | Pode ser limitado por rate |
| gemma-2-9b | Variável | 8k | Contexto muito limitado |

## Monitoramento de Consumo

Acesse https://openrouter.ai/settings/usage para verificar:
- Requisições por dia
- Tokens consumidos
- Custo aproximado

## Checklist Antes de Enviar

- [ ] O prompt está conciso (menos de 200 palavras quando possível)?
- [ ] O contexto enviado é o mínimo necessário?
- [ ] O modelo escolhido é adequado ao tamanho da tarefa?
- [ ] Há um `max_tokens` definido?
- [ ] O modelo free ainda tem cota disponível?
- [ ] Há algum contexto repetido que pode ser removido?

## Técnicas Avançadas

### Uso de Embeddings para Contexto Relevante

Em vez de enviar todo o contexto, use embeddings para encontrar os trechos relevantes:

```python
# Pseudocódigo
relevant_chunks = get_relevant_chunks(query, docs)
context = "\n".join(relevant_chunks)
response = ask_model(context + query)
```

### Compressão de Contexto

Resuma o contexto antes de enviar:

```powershell
# Primeiro, sumarize
$summary = opencode --model openai/gpt-4o-mini --max-tokens 200 --prompt "Resuma este texto em 3 linhas: $(Get-Content doc.md -Raw)"
# Depois, use o resumo como contexto
opencode --context $summary --model openai/gpt-4o-mini --prompt "Responda com base neste contexto: $summary"
```

## Registro de Economia

Documente os resultados em `skills/token-optimization/`:

```markdown
| Data | Tarefa | Modelo | Tokens Utilizados | Economia Estimada |
|------|--------|--------|-------------------|-------------------|
| 2026-11-01 | Resumo | Free | 150 | 80% vs GPT-4 |
```

> Consulte `skills/token-optimization/` para templates de registro.