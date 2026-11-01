# DIIX Provider Manager v2.0.0-alpha
# Detecta provedores, lista modelos, classifica por preço, identifica free.

class ProviderManager:
    def __init__(self):
        self.providers = ["9router", "openrouter", "cloudflare", "openai-compat"]
        self.detected = {}

    def detect_9router(self):
        import os
        return os.path.exists("C:/DIX_MU/repos/openmu")

    def detect_openrouter(self):
        import os
        return bool(os.environ.get("OPENROUTER_API_KEY"))

    def list_models_openrouter(self):
        # Placeholder: em produção, chamar https://openrouter.ai/api/v1/models
        return [{"id": "meta-llama/llama-3.1-8b-instruct:free", "free": True}, {"id": "anthropic/claude-3.5-sonnet", "free": False}]

    def get_provider_status(self):
        status = {}
        status["9router"] = {"available": self.detect_9router(), "url": "http://localhost:20128/v1"}
        status["openrouter"] = {"available": self.detect_openrouter(), "url": "https://openrouter.ai/api/v1"}
        return status
