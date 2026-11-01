param([string]$Source = "configs/gui-template.cs", [string]$Output = "dist/DIIX_Config.exe")
$distDir = "dist"
if (-not (Test-Path $distDir)) { New-Item -ItemType Directory -Path $distDir -Force | Out-Null }
$csc = "C:\Windows\Microsoft.NET\Framework64\v4.8.1\csc.exe"
if (-not (Test-Path $csc)) { $csc = "csc" }
Write-Host "Compilando $Source -> $Output ..." -ForegroundColor Cyan
& $csc /target:winexe /out:$Output $Source /reference:System.dll /reference:System.Windows.Forms.dll /reference:System.Drawing.dll 2>&1
if ($LASTEXITCODE -eq 0) { Write-Host "Sucesso: $Output" -ForegroundColor Green } else { Write-Host "Erro na compilacao" -ForegroundColor Red }
