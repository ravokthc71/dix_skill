# DIIX Intelligence Core — Routing, Diagnostics, Telemetry
# Requisitos: Python 3.12+

class DIIXRouter:
    """Roteador inteligente de modelos com perfis e fallback."""
    PROFILES = {
        "simple": {"free": True, "primary": "openai/gpt-4o-mini", "fallback": "meta-llama/llama-3.1-8b-instruct:free"},
        "coding": {"free": False, "primary": "anthropic/claude-3.5-sonnet", "fallback": "openai/gpt-4o-mini"},
        "reasoning": {"free": False, "primary": "anthropic/claude-3.5-sonnet", "fallback": "openai/gpt-4o"},
        "review": {"free": False, "primary": "openai/gpt-4o", "fallback": "openai/gpt-4o-mini"},
    }

    def recommend(self, profile="simple", budget="low", availability="auto"):
        p = self.PROFILES.get(profile, self.PROFILES["simple"])
        # Seleção baseada em critérios (simplificado para demonstração)
        return {"profile": profile, "model": p["primary"], "fallback": p["fallback"], "budget": budget}

class DIIXDiagnostics:
    """Diagnóstico do ambiente e configuração."""
    def check_opencode(self):
        import subprocess, sys
        try:
            subprocess.run(["opencode", "--version"], capture_output=True, check=True)
            return "PASS"
        except Exception:
            return "FAIL"

    def check_config(self, path="%USERPROFILE%/.opencode/config.json"):
        import os
        return "PASS" if os.path.exists(os.path.expandvars(path)) else "WARN"

class DIIXTelemetry:
    """Registro de execução para evolução e aprendizado."""
    def log(self, event, result, model=None):
        import json, datetime, pathlib, os
        log_dir = pathlib.Path.home() / ".diix" / "logs"
        log_dir.mkdir(parents=True, exist_ok=True)
        entry = {
            "ts": datetime.datetime.now().isoformat(),
            "event": event,
            "result": result,
            "model": model
        }
        with open(log_dir / f"telemetry-{datetime.date.today()}.jsonl", "a", encoding="utf-8") as f:
            f.write(json.dumps(entry) + "\n")
