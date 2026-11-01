# Instrução — Criar Mini Aplicativos Gráficos em C# (WinForms)

Esta instrução ensina a criar uma janela gráfica simples com C# para configurar o DIIX, inserir credenciais ou selecionar opções.

## Pré-requisitos (Windows)

- `.NET Framework` (geralmente já instalado no Windows).
- `csc.exe` (C# Compiler) — disponível em `C:\Windows\Microsoft.NET\Framework64\v4.x`.
- `PowerShell 5.1+`.

## Passo 1 — Template básico

Veja `configs/gui-template.cs`.

## Passo 2 — Compilar

```powershell
.\tools\powershell\build-mini-app.ps1 -Source configs/gui-template.cs -Output dist/DIIX_Config.exe
```

## Passo 3 — Executar

```powershell
.\dist\DIIX_Config.exe
```

A janela aparecerá com os campos definidos no `.cs`.

## Passo 4 — Personalizar

Edite `configs/gui-template.cs`:
- Adicione `TextBox` para credenciais.
- Adicione `Button` com evento `click` que salva `.env`.
- Adicione `ComboBox` para selecionar perfis (`simple`, `coding`, etc.).
- Altere cores, fontes, ícones (`this.Icon = ...`).

Exemplo de adicionar um campo de chave:

```csharp
TextBox txtKey = new TextBox();
txtKey.Width = 300; txtKey.Top = 60;
this.Controls.Add(txtKey);
```

Exemplo de salvar no `.env` ao clicar no botão:

```csharp
buttonSave.Click += (s, e) => {
    System.IO.File.WriteAllText(".env", "OPENROUTER_API_KEY=" + txtKey.Text);
};
```

## Passo 5 — Integrar com DIIX

- Coloque o `.exe` em `dist/`.
- Chame a partir de `diix-system-controller.ps1` quando quiser configurar visualmente.
- Registre a execução no `telemetry/`.

## Próximos passos sugeridos

- Criar `dist/DIIX_Provider_Config.exe` para selecionar 9Router vs OpenRouter.
- Criar `dist/DIIX_Model_Selector.exe` para selecionar modelo por perfil.
- Criar `dist/DIIX_Project_Questionnaire.exe` para preencher questionário de projeto.

> Consulte `skills/windows-gui-tools/` para a skill completa e exemplos.