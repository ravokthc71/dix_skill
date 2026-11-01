# Instrução - Rotação de Modelos

Como rotacionar entre modelos de forma estratégica para equilibrar custo, qualidade e disponibilidade.

## Estratégias de rotação

### 1. Por tipo de tarefa
* Tarefas simples → modelo free/leve.
* Tarefas médias → modelo médio (free ou pago).
* Tarefas complexas → modelo capaz (pago).

### 2. Por orçamento
* Comece com modelos free.
* Mude para pagos somente quando o free atingir o limite ou não entregar qualidade suficiente.

### 3. Por disponibilidade (fallback)
* Se o provider principal estiver fora do ar, alterne para um modelo alternativo.
* Mantenha uma lista de modelos de backup configurados.

## Exemplo de rotação semanal

| Dia | Tarefa | Modelo sugerido |
|-----|--------|-----------------|
| Segunda | Reunião de planejamento, docs | modelo free leve |
| Terça | Desenvolvimento de funcionalidades | modelo médio |
| Quarta | Revisão de código e testes | modelo médio |
| Quinta | Arquitetura e decisões técnicas | modelo capaz (pago) |
| Sexta | Ajustes finais, limpeza | modelo free/médio |

## Implementação prática

Crie um script ou arquivo de configuração que selecione o modelo com base em:
* Variável de ambiente `LLM_ROLE` (ex.: `simple`, `medium`, `complex`).
* Horário do dia ou dia da semana.
* Contador de tokens já consumidos no período.

> Consulte `skills/llm-rotation/` para exemplos de scripts de rotação.