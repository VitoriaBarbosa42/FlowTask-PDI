import os
import json
import requests
from pathlib import Path

GITHUB_TOKEN = os.environ["GITHUB_TOKEN"]
ENDPOINT = "https://models.inference.ai.azure.com"
MODEL = "gpt-4o-mini"


def ler_arquivos(diretorio: str, extensoes: list[str], limite: int = 20) -> list[dict]:
    arquivos = []
    base = Path(diretorio)

    if not base.exists():
        return arquivos

    for caminho in sorted(base.rglob("*")):
        if caminho.is_file() and caminho.suffix in extensoes:
            arquivos.append({
                "caminho": str(caminho),
                "conteudo": caminho.read_text(encoding="utf-8", errors="ignore")
            })
        if len(arquivos) >= limite:
            break

    return arquivos


def chamar_ia(prompt: str) -> str:
    headers = {
        "Authorization": f"Bearer {GITHUB_TOKEN}",
        "Content-Type": "application/json"
    }

    body = {
        "model": MODEL,
        "messages": [{"role": "user", "content": prompt}],
        "max_tokens": 4096
    }

    response = requests.post(
        f"{ENDPOINT}/chat/completions",
        headers=headers,
        json=body
    )

    if not response.ok:
        raise Exception(f"Erro na API: {response.status_code} — {response.text}")

    return response.json()["choices"][0]["message"]["content"]


def montar_contexto() -> str:
    partes = []

    java_files = ler_arquivos("backend/src", [".java"], limite=20)
    if java_files:
        conteudo = "\n\n".join(f"### {f['caminho']}\n{f['conteudo']}" for f in java_files)
        partes.append(f"## Arquivos Java\n{conteudo}")

    ts_files = ler_arquivos("frontend/src", [".ts"], limite=10)
    if ts_files:
        conteudo = "\n\n".join(f"### {f['caminho']}\n{f['conteudo']}" for f in ts_files)
        partes.append(f"## Arquivos TypeScript\n{conteudo}")

    docs_files = ler_arquivos("docs", [".md"])
    if docs_files:
        conteudo = "\n\n".join(f"### {f['caminho']}\n{f['conteudo']}" for f in docs_files)
        partes.append(f"## Docs existentes\n{conteudo}")

    docker = Path("docker-compose.yml")
    if docker.exists():
        partes.append(f"## docker-compose.yml\n{docker.read_text()}")

    return "\n\n".join(partes)


def gerar_readme():
    print("Lendo arquivos do projeto...")
    contexto = montar_contexto()

    prompt = f"""Você é um assistente técnico. Analise o projeto abaixo e gere um README.md completo e atualizado.

O README deve conter:
- Descrição do projeto
- Tecnologias utilizadas (Java, Spring Boot, MongoDB, Angular)
- Como rodar localmente com Docker
- Estrutura de pastas
- Links para a pasta docs/

Escreva em português, retorne apenas o markdown, sem explicações adicionais.

{contexto}"""

    print("Chamando IA...")
    readme = chamar_ia(prompt)

    Path("README.md").write_text(readme, encoding="utf-8")
    print("README.md atualizado com sucesso!")

    Path("docs").mkdir(exist_ok=True)


if __name__ == "__main__":
    gerar_readme()