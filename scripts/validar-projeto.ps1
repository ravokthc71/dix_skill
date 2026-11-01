# CI / Validação - Validação de Links e Frontmatter

Este script valida os arquivos Markdown do cofre e do repositório.

## Uso

```powershell
.\scripts\validar-projeto.ps1
```

## Código

```powershell
$errors = @()

# Validar frontmatter em arquivos do cofre
Get-ChildItem "C:\DIxavado" -Recurse -Filter *.md | Where-Object { $_.FullName -notmatch '\\.obsidian\\' } | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    if (-not ($content -match '---\r?\n')) {
        $errors += "Falta frontmatter: $($_.FullName)"
    }
}

# Validar links internos (wikilinks)
Get-ChildItem "C:\Users\Samuel\dix_skills" -Recurse -Filter *.md | ForEach-Object {
    $links = Select-String -Path $_.FullName -Pattern '\[\[[^\]]+\]\]' | Select-Object -ExpandProperty Line
    foreach ($link in $links) {
        $linkText = ($link -replace '.*\[\[([^
\]]+)\]\].*', '$1').Trim()
        $target = "C:\DIxavado\10_Notas\$linkText.md"
        if (-not (Test-Path $target)) {
            # Tentar em outras pastas
            $found = Get-ChildItem "C:\DIxavado" -Recurse -Filter "$linkText.md" -ErrorAction SilentlyContinue
            if (-not $found) {
                $errors += "Link quebrado: [$linkText] em $($_.FullName)"
            }
        }
    }
}

if ($errors.Count -gt 0) {
    Write-Host "ERROS ENCONTRADOS:"
    $errors | ForEach-Object { Write-Host "  - $_" }
    exit 1
} else {
    Write-Host "Validação OK. Nenhum erro encontrado."
    exit 0
}
```

## Integração com GitHub Actions (Opcional)

```yaml
name: Validar Projeto
on: [push]
jobs:
  validate:
    runs-on: windows-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run validation
        shell: pwsh
        run: .\scripts\validar-projeto.ps1
```

> Adicione `.github/workflows/validate.yml` se quiser ativar o CI no GitHub.