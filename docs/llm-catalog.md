# Catálogo de Modelos - OpenRouter

Este documento reúne informações sobre os modelos de linguagem disponíveis na OpenRouter, com foco na separação entre **modelos free** e **pagos**, suas qualidades, defeitos e cenários de uso.

> **Nota:** Os modelos e preços podem mudar. Sempre consulte https://openrouter.ai/models para a lista atualizada.

## Modelos Gratuitos (Free)

| Modelo | Provedor | Qualidades | Defeitos | Cenário adequado |
|--------|----------|------------|----------|------------------|
| (exemplo) `meta-llama/llama-3.1-8b-instruct:free` | Meta | Gratuito, razoável para tarefas gerais | Limite de contexto menor, menos preciso em raciocínio complexo | Resumos, formatação, snippets simples |
| (exemplo) `google/gemma-2-9b-it:free` | Google | Gratuito, bom para instruções diretas | Pode ser limitado em código complexo | Tradução, escrita simples, classificação |

*(Preencha esta tabela conforme você testa os modelos disponíveis na sua conta.)*

## Modelos Pagos

| Modelo | Provedor | Qualidades | Defeitos | Cenário adequado |
|--------|----------|------------|----------|------------------|
| `anthropic/claude-3.5-sonnet` | Anthropic | Excelente em código e raciocínio, janela ampla | Custo mais alto | Desenvolvimento, arquitetura, revisão de código |
| `openai/gpt-4o` | OpenAI | Muito capaz, multimodal, boa precisão | Custo elevado | Tarefas complexas, análise de requisitos |
| `meta-llama/llama-3.1-70b-instruct` | Meta | Bom equilíbrio custo/qualidade | Pode ser mais lento que modelos menores | Backend, documentação, ETL |

*(Preencha com os modelos que você realmente utiliza na OpenRouter.)*

## Como identificar modelos Free na API

Ao consultar `GET /api/v1/models`, verifique o campo `pricing`:

```json
{
  "id": "meta-llama/llama-3.1-8b-instruct:free",
  "pricing": {
    "prompt": "0",
    "completion": "0"
  }
}
```

Se `prompt` e `completion` forem `"0"`, o modelo é **gratuito**.

## Tabela de separação Free vs Pago

| Categoria | Identificação na API | Exemplo de uso |
|-----------|---------------------|----------------|
| Free | `pricing.prompt == "0"` | Tarefas diárias de baixo custo |
| Pago | `pricing.prompt > "0"` | Tarefas críticas, alta qualidade |

## Recomendação de uso

* Comece sempre testando com modelos **free**.
* Mude para modelos **pagos** somente quando o free não atender à qualidade ou atingir o limite de uso.
* Documente neste catálogo quais modelos você testou e em quais cenários funcionaram melhor.