# Catálogo Completo de Modelos - OpenRouter

Este documento contém informações detalhadas sobre modelos disponíveis na OpenRouter, com foco na separação entre **free** e **pagos**, qualidades, defeitos e cenários de uso adequados.

> **Nota:** Os modelos e preços podem mudar. Sempre consulte https://openrouter.ai/models para a lista atualizada.

---

## Modelos Gratuitos (Free)

### meta-llama/llama-3.1-8b-instruct:free

| Atributo | Descrição |
|----------|-----------|
| Provedor | Meta (Meta AI) |
| Tipo | Instrução / Chat |
| Qualidades | Gratuito, razoável para tarefas gerais, rápido |
| Defeitos | Limite de contexto menor (8k-32k tokens), precisão menor em raciocínio complexo, pode alucinar em tarefas técnicas |
| Cenário Adequado | Resumos simples, formatação de texto, respostas curtas, classificação básica |
| Não Recomendado | Arquitetura de software, análise de código complexo, geração de documentação técnica extensa |

### google/gemma-2-9b-it:free

| Atributo | Descrição |
|----------|-----------|
| Provedor | Google |
| Tipo | Instrução / Chat |
| Qualidades | Gratuito, bom para instruções diretas, leve |
| Defeitos | Capacidade limitada para código complexo, pode ser inconsistente em respostas longas |
| Cenário Adequado | Tradução simples, classificação, respostas curtas e diretas |
| Não Recomendado | Desenvolvimento de sistemas, análise de dados complexos |

### mistralai/mistral-7b-instruct:free

| Atributo | Descrição |
|----------|-----------|
| Provedor | Mistral AI |
| Tipo | Instrução / Chat |
| Qualidades | Gratuito, bom para tarefas de geração e resumo, rápido |
| Defeitos | Contexto limitado, pode ser impreciso em tarefas muito técnicas |
| Cenário Adequado | Resumos, geração de texto curto, tarefas de tradução |

### qwen/qwen-2.5-7b-instruct:free

| Atributo | Descrição |
|----------|-----------|
| Provedor | Qwen (Alibaba) |
| Tipo | Instrução / Chat |
| Qualidades | Gratuito, bom desempenho para código curto, rápido |
| Defeitos | Contexto limitado em algumas versões, pode alucinar em respostas longas |
| Cenário Adequado | Código simples, respostas diretas, testes rápidos |

---

## Modelos Pagos - Categoria Média

### openai/gpt-4o-mini

| Atributo | Descrição |
|----------|-----------|
| Provedor | OpenAI |
| Tipo | Chat / Completação |
| Qualidades | Excelente equilíbrio custo/qualidade, rápido, bom contexto (128k tokens), preciso em código |
| Defeitos | Custo por token, pode ser menos criativo que modelos maiores |
| Cenário Adequado | Desenvolvimento backend, revisão de código, documentação técnica, ETL simples |
| Limite de Contexto | 128.000 tokens |

### meta-llama/llama-3.1-70b-instruct

| Atributo | Descrição |
|----------|-----------|
| Provedor | Meta (Meta AI) |
| Tipo | Instrução / Chat |
| Qualidades | Capacidade alta para código e raciocínio, boa janela de contexto |
| Defeitos | Custo elevado por requisição, pode ser mais lento que modelos menores |
| Cenário Adequado | Arquitetura de sistemas, refatoração complexa, análise de requisitos |
| Limite de Contexto | 128.000 tokens |

---

## Modelos Pagos - Categoria Premium / Capaz

### anthropic/claude-3.5-sonnet

| Atributo | Descrição |
|----------|-----------|
| Provedor | Anthropic |
| Tipo | Chat / Completação |
| Qualidades | Excelente em código, raciocínio profundo, análise de contexto amplo, baixa taxa de alucinação |
| Defeitos | Custo mais alto, consumo de tokens maior, pode ser mais lento |
| Cenário Adequado | Design de sistemas, revisão arquitetural, refatoração complexa, resolução de problemas multi-etapas |
| Limite de Contexto | 200.000 tokens |

### openai/gpt-4o

| Atributo | Descrição |
|----------|-----------|
| Provedor | OpenAI |
| Tipo | Multimodal (texto, imagem, áudio) |
| Qualidades | Muito capaz, precisão alta, suporte a múltiplos formatos |
| Defeitos | Custo elevado, pode consumir muitos tokens em respostas longas |
| Cenário Adequado | Tarefas complexas que exigem análise multimodal, documentação técnica completa |
| Limite de Contexto | 128.000 tokens |

---

## Como Identificar Modelos Free na API

A API da OpenRouter retorna um objeto JSON para cada modelo. Verifique o campo `pricing`:

```json
{
  "id": "meta-llama/llama-3.1-8b-instruct:free",
  "pricing": {
    "prompt": "0",
    "completion": "0"
  }
}
```

Se ambos os valores forem `"0"`, o modelo é **gratuito**.

## Tabela Comparativa Rápida

| Modelo | Categoria | Custo | Contexto | Melhor Uso |
|--------|-----------|-------|----------|------------|
| meta-llama/llama-3.1-8b-instruct:free | Free | 0 | 32k | Tarefas simples |
| google/gemma-2-9b-it:free | Free | 0 | 8k | Respostas curtas |
| openai/gpt-4o-mini | Médio | Baixo | 128k | Desenvolvimento geral |
| meta-llama/llama-3.1-70b-instruct | Médio/Alto | Médio | 128k | Arquitetura |
| anthropic/claude-3.5-sonnet | Premium | Alto | 200k | Tarefas complexas |
| openai/gpt-4o | Premium | Alto | 128k | Multimodal / Complexo |

---

## Recomendação de Uso

1. **Sempre comece com modelos free** para testar conceitos.
2. **Mude para modelos médios** quando precisar de qualidade de código ou documentação.
3. **Use modelos premium** apenas para tarefas que exigem raciocínio profundo, análise arquitetural ou quando o custo é justificado pelo resultado.
4. **Monitore o consumo** em https://openrouter.ai/settings/usage regularmente.
5. **Ajuste o `max_tokens`** para evitar respostas excessivamente longas que aumentem o custo.

---

## Como Atualizar Este Catálogo

Sempre que testar um novo modelo:

1. Adicione uma nova entrada nesta tabela.
2. Documente qualidades, defeitos e cenários adequados.
3. Registre o consumo de tokens e o custo aproximado por tarefa.
4. Atualize a data de revisão no frontmatter.

> Consulte `skills/project-combos/` para ver como combinar esses modelos por tipo de projeto.