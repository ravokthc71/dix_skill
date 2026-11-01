# Skills - Redução de Consumo de Tokens

Esta pasta reúne técnicas e boas práticas para **economizar tokens** ao utilizar LLMs via OpenCode e OpenRouter.

## Técnicas principais

* Use prompts concisos e diretos.
* Corte contexto desnecessário antes de enviar para o modelo.
* Escolha modelos com janela de contexto adequada (não use um modelo de 128k para uma tarefa de 2k tokens).
* Reutilize respostas em cache quando possível.
* Defina `max_tokens` razoáveis para evitar respostas excessivamente longas.
* Evite pedir ao modelo para "pensar em voz alta" em tarefas simples.

## Limites comuns

* Modelos free geralmente têm limites diários/mensais de requisições e tokens.
* Verifique o limite de contexto (ex.: 4k, 8k, 32k, 128k tokens) antes de enviar arquivos grandes.

> Documente aqui as métricas de economia obtidas em cada projeto.