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

## 🎯 Fluxo de Execução do Refinamento SDD

1. **Entrevista de Requisitos (`sdd-spec`):**
   - Entrevista o usuário para extrair Objetivo (O Que e Por Que), Escopo, Fora do Escopo, RFs e RNFs (com números).
   - Se houver dúvida, **pergunta ao usuário**.
   - Gera `docs/refinamento-tecnico/<feature>-spec.html`.

2. **Planejamento Técnico & ADRs (`sdd-plan`):**
   - Mapeia arquitetura, arquivos afetados, trade-offs técnicos e diagrama Mermaid.
   - Gera `docs/refinamento-tecnico/<feature>-plan.html`.

3. **Decomposição em Micro-Tarefas (`sdd-tasks`):**
   - Quebra o plano em tarefas atômicas sequenciais e verificáveis com checklist persistente em `localStorage`.
   - Gera `docs/refinamento-tecnico/<feature>-tasks.html`.

4. **Indexação no Hub Visual:**
   - Adiciona os novos links no catálogo de `docs/index.html` e atualiza o `README.md`.
