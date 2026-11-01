# Instrução - Gerenciamento de Tokens

Técnicas para reduzir o consumo de tokens e respeitar os limites de uso dos modelos.

## Como reduzir o consumo

1. **Prompts enxutos**
   * Remova palavras de preenchimento.
   * Seja direto: "Faça X" em vez de "Eu gostaria que você pudesse fazer X, por favor".

2. **Contexto enxuto**
   * Envie apenas os arquivos ou trechos realmente necessários.
   * Use resumos em vez de colar arquivos inteiros.

3. **Escolha de modelo**
   * Não use um modelo de 128k tokens para uma tarefa de 2k tokens.
   * Prefira modelos com janela menor quando o contexto for pequeno.

4. **Controle de resposta**
   * Defina `max_tokens` para limitar o tamanho da resposta.
   * Peça respostas concisas ("responda em até 3 linhas").

5. **Cache e reutilização**
   * Reutilize respostas já obtidas para tarefas repetitivas.
   * Evite enviar o mesmo contexto várias vezes.

## Limites de uso (modelos Free na OpenRouter)

* Limite de requisições por dia/hora (varia por modelo).
* Limite de tokens de contexto por requisição.
* Limite de tokens totais por período.

Monitore seu consumo no painel da OpenRouter: https://openrouter.ai/settings/usage

## Checklist antes de enviar uma requisição

- [ ] O prompt está conciso?
- [ ] O contexto enviado é o mínimo necessário?
- [ ] O modelo escolhido é adequado ao tamanho da tarefa?
- [ ] Há um `max_tokens` definido para evitar respostas longas?
- [ ] O modelo free ainda tem cota disponível hoje?

> Consulte `skills/token-optimization/` para exemplos práticos de otimização.