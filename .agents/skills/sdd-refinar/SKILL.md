---
name: sdd-refinar
description: >-
  Orquestra o refinamento técnico completo de um épico ou funcionalidade no ciclo SDD (Entrevista ➔ Spec ➔ Plano ➔ Tasks),
  gerando a documentação visual integrada em HTML em 'docs/refinamento-tecnico/' e indexando no Hub Visual.
  Ative quando o usuário pedir para 'fazer refinamento técnico completo', 'refinar épico', 'rodar ciclo de refinamento SDD' ou preparar uma sprint.
---

# SDD Refinar — Orquestrador de Refinamento Técnico Completo

Esta skill atua como **Arquiteto & Lead de Refinamento Ágil** para conduzir o ciclo completo de preparação técnica antes da codificação.

---

## 🎯 Fluxo de Execução do Refinamento SDD (3 Arquivos por Incremento)

Para cada funcionalidade ou épico refinado, o ciclo gera **3 arquivos HTML separados e interconectados** dentro de `docs/refinamento-tecnico/`:

### 📄 1. Especificação Macro (`<slug>-spec.html`)
- Ingestão do texto bruto ou transcrição fornecida pelo usuário.
- Extração de Objetivo, Escopo e RFs.
- Formulação de perguntas diretas para preencher lacunas de RNFs numéricos, Out-of-Scope e Critérios de Aceite.
- **Saída:** `docs/refinamento-tecnico/<feature>-spec.html`.

### 📄 2. Planejamento Técnico & Arquitetura (`<slug>-plan.html`)
- Mapeamento de todos os arquivos afetados (`[NOVO]`, `[ALTERAR]`, `[EXCLUIR]`).
- Matriz de Decisões de Design (Mini-ADRs) e trade-offs fundamentados.
- Diagrama arquitetural Mermaid.js e gestão de riscos.
- **Saída:** `docs/refinamento-tecnico/<feature>-plan.html`.

### 📄 3. Decomposição em Micro-Tarefas (`<slug>-tasks.html`)
- Lista ordenada de tarefas atômicas sequenciais e verificáveis com checklist persistente via `localStorage`.
- Critérios de validação (comandos de teste e assertions) por tarefa.
- **Saída:** `docs/refinamento-tecnico/<feature>-tasks.html`.

---

## 🔗 Registro Automático no Hub Visual
Ao concluir a geração dos 3 arquivos:
1. Registra os 3 documentos no array `libraryDocuments` em `docs/index.html`.
2. Adiciona os links correspondentes no `README.md`.
