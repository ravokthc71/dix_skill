# Skills - Rotação de Modelos (LLM)

Esta pasta contém estratégias e exemplos de como **rotacionar entre diferentes modelos** de linguagem de forma eficiente.

## Quando rotacionar

* Custo: alternar entre modelos gratuitos e pagos conforme o orçamento.
* Qualidade: usar modelos mais capazes para tarefas complexas e modelos leves para tarefas simples.
* Disponibilidade: fallback automático quando um provider estiver fora do ar.
* Limites de tokens: mudar de modelo ao atingir o limite de contexto ou de uso.

## Padrão sugerido

```
Tarefa simples (resumo, formatação)  -> modelo free/leve
Tarefa média (código, revisão)       -> modelo médio/balanceado
Tarefa complexa (arquitetura, raciocínio) -> modelo mais capaz/pago
```

> Adicione aqui scripts ou prompts que implementem a lógica de rotação automática.