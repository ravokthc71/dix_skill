# Instrução - Seleção de Modelos (LLM)

Como escolher o modelo certo para cada tarefa, considerando qualidades, defeitos e cenários adequados.

## Critérios de seleção

| Critério | Pergunta-chave |
|----------|----------------|
| Custo | O modelo é free ou pago? Cabe no orçamento? |
| Velocidade | Preciso de resposta imediata ou posso esperar? |
| Qualidade | A tarefa exige raciocínio complexo ou é simples? |
| Contexto | Quanto de texto preciso enviar ao modelo? |
| Disponibilidade | O provider está online e com limites disponíveis? |

## Qualidades e defeitos por categoria

### Modelos Free
* **Qualidades:** custo zero, bons para tarefas simples, boa disponibilidade para testes.
* **Defeitos:** limites de requisições menores, janela de contexto menor, podem ser mais lentos ou menos precisos em raciocínio complexo.
* **Cenários adequados:** resumos, formatação, geração de snippets simples, testes rápidos.

### Modelos Pagos (Médios)
* **Qualidades:** equilíbrio entre custo e qualidade, bom para código e revisão.
* **Defeitos:** consomem orçamento, podem ter limites de rate limit.
* **Cenários adequados:** desenvolvimento backend, escrita de documentação, revisão de código.

### Modelos Pagos (Capazes / Premium)
* **Qualidades:** maior capacidade de raciocínio, janela de contexto ampla, melhores em arquitetura e resolução de problemas complexos.
* **Defeitos:** custo mais alto, consumo de tokens maior.
* **Cenários adequados:** design de sistemas, refatoração complexa, análise de requisitos, raciocínio multi-etapas.

## Fluxo de decisão

1. Defina o tipo da tarefa (simples, média, complexa).
2. Verifique o orçamento disponível (free vs pago).
3. Escolha o modelo com a janela de contexto adequada.
4. Teste e ajuste conforme necessário.

> Consulte `docs/llm-catalog.md` para a lista detalhada de modelos disponíveis na OpenRouter.