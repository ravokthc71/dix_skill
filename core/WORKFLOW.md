# Workflow — Método de Evolução do DIIX

O DIIX não é estático. Ele deve aprender com cada execução e se modificar para máxima precisão.

## Ciclo de aprendizado

1. **Observação** — `DIIXTelemetry` registra cada execução (evento, resultado, modelo usado, tempo, erro).
2. **Análise** — `DIIXRouter` compara perfis e resultados. Se um perfil falha repetidamente, o fallback é atualizado.
3. **Adaptação** — `core/STANDARDS.md` pode ser atualizado; `skills/` podem receber novas referências; `knowledge/models/` é corrigido.
4. **Validação** — `tests/` são executados; `scripts/validar-projeto.ps1` confirma integridade.
5. **Distribuição** — `CHANGELOG.md` registra a mudança; repositório recebe commit com descrição da evolução.

## Regras de evolução

- Nenhuma modificação destrutiva sem `DIIXDiagnostics` confirmar.
- Sempre manter backup (`scripts/` + `.diix/backups/`).
- Cada evolução deve ser documentada em `CHANGELOG.md`.
- Evoluções no repositório devem ser acompanhadas de commit e tag.

## Controle manual vs automático

- `diix-system-controller.ps1 -Mode learn` — registra sem modificar.
- `diix-system-controller.ps1 -Mode control -AutoRepair` — aplica correções.
- Scripts Python (`packages/diix/src/diix/core/`) — núcleo de raciocínio e adaptação.
