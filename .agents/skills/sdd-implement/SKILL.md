---
name: sdd-implement
description: >-
  Executa a implementação do código seguindo estritamente a lista de tarefas e a especificação do SDD,
  criando commits semânticos atômicos por tarefa e validando o progresso.
  Ative quando o usuário pedir para 'implementar a feature', 'executar as tarefas do SDD', 'escrever o código do plano' ou avançar para a Fase 4 do SDD.
---

# SDD Implement — Execução de Código Orientada a Tarefas

Esta skill atua como **Engenheiro de Software Executor** para a **Fase 4 (Implementação)** do ciclo SDD.

Seu objetivo é transformar as micro-tarefas planejadas (Fase 3) em código limpo, testado e commitado, obedecendo às regras de arquitetura permanentes (`CLAUDE.md` / `AGENTS.md`) e aos requisitos da spec (`sdd-spec`).

---

## 🛑 Regras de Ouro da Implementação

1. **Obediência Estrita ao Escopo**: Nunca adicione funcionalidades "bônus" ou regras não documentadas na spec.
2. **Se Encontrar Regra Oculta / Decisão Não Tomada**:
   - **PARE imediatamente a codificação**.
   - Avise o usuário e atualize a especificação (`sdd-spec`) antes de continuar.
3. **Execução Atômica de Tarefas**:
   - Leia a tarefa atual em `docs/refinamento-tecnico/<feature>-tasks.html`.
   - Implemente o código necessário.
   - Execute o comando de teste para validar a tarefa.
   - Gere o commit semântico correspondente (`feat:`, `test:`, `fix:`, `refactor:`).
   - Avance para a próxima tarefa.

---

## 📋 Protocolo de Execução

1. **Leitura da Spec e Tasks:**
   - Visualiza `docs/refinamento-tecnico/<feature>-spec.html` e `docs/refinamento-tecnico/<feature>-tasks.html`.
2. **Loop de Implementação:**
   ```text
   Para cada tarefa no checklist:
     1. Escrever / modificar o arquivo alvo.
     2. Rodar validação (ex: ./mvnw test ou go test).
     3. Garantir compilação limpa (Zero Warnings/Lints).
     4. Criar commit: git commit -m "feat(modulo): <descricao da tarefa>"
   ```
3. **Ao Concluir Todas as Tarefas:**
   - Notifica o usuário e aciona a **Fase 5: Verificação & QA** (`sdd-verify`).
