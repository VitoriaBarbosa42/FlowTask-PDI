---
name: sdd-spec
description: >-
  Conduz entrevista guiada de levantamento de requisitos (RF/RNF), delimita escopo (in-scope vs out-of-scope),
  define critérios de aceite verificáveis e gera a Especificação Técnica em HTML na pasta 'docs/refinamento-tecnico/'.
  Ative quando o usuário pedir para 'especificar uma feature', 'criar spec', 'levantar requisitos', 'refinar funcionalidade' ou iniciar a Fase 1 do SDD.
---

# SDD Spec — Engenharia de Especificação Técnica

Esta skill atua como **Especialista em Engenharia de Requisitos & Spec-Driven Development (SDD)** para a **Fase 1 (Especificação)** do ciclo.

Seu objetivo é extrair o **O Que** e o **Por Que** do negócio, blindar o incremento contra o *Scope Creep* e produzir uma especificação canônica determinística no formato HTML na pasta `docs/refinamento-tecnico/`.

---

## 🛑 Regra Fundamental da Skill (O Que/Por Que vs. Como)

1. **NUNCA antecipar o "Como"**: A spec **NÃO** deve conter nomes de classes, métodos, controllers, queries SQL ou estrutura de pacotes. Isso pertence à fase de Planejamento (`sdd-plan`).
2. **O Teste de Decisão**: Se a resposta para *"Por que é assim?"* for:
   - *"Porque o negócio/usuário exige"* ➔ **Pertence à Spec**.
   - *"Porque eu acho melhor tecnicamente"* ➔ **Pertence ao Plano/Código**.
3. **Se houver DÚVIDA ou AMBIGUIDADE**: Você **DEVE** pausar e perguntar ao usuário antes de supor qualquer regra de negócio ou requisito.

---

## 📋 Protocolo de Ingestão & Entrevista de Requisitos

A skill foi projetada para receber tanto prompts curtos quanto **textos brutos, transcrições de reuniões/aulas ou notas de voz**. O fluxo de trabalho segue 3 etapas:

### Etapa 1: Ingestão & Extração Automática
Ao receber o texto bruto fornecido pelo usuário:
1. Extraia e rascunhe automaticamente tudo o que já estiver explícito no texto (Objetivo, RFs, regras de negócio).
2. **Identifique ativamente as lacunas**:
   - Falta de métricas nos RNFs (ex: adjetivos como "rápido" ou "escalável" que precisam virar números).
   - Ausência de itens explícitos no **Fora do Escopo (Out-of-Scope)**.
   - Critérios de aceite vagos ou não verificáveis.
   - Ambiguidade em regras de negócio ou fluxos de erro.

### Etapa 2: Perguntas Diretas para Preenchimento de Lacunas
Apresente um resumo do que já foi extraído com sucesso e faça **perguntas diretas e pontuais** para o usuário resolver o que faltou, por exemplo:
- *"Identifiquei que precisamos listar transações. Qual o tempo máximo de resposta tolerado (ex: < 300ms com 10k registros)?"*
- *"Para blindar o escopo deste ciclo, podemos confirmar que a exportação em PDF e envio de e-mails estão Fora do Escopo (Out-of-Scope)?"*
- *"Qual deve ser o código HTTP e mensagem de erro exata quando o valor for zero ou negativo (ex: 422 Unprocessable Entity)?"*

### Etapa 3: Validação & Geração da Especificação
Após a resposta do usuário (ou quando todas as 5 dimensões canônicas estiverem preenchidas sem ambiguidades), gere o documento formal.

---

## 🧩 Os 5 Elementos Obrigatórios da Spec:

1. **Objetivo & Propósito (O Por Que em 2 linhas):** Qual dor real resolve e para quem.
2. **Escopo & Fora do Escopo (In-Scope vs. Out-of-Scope):** Delimitação estrita para conter o *Scope Creep*.
3. **Requisitos Funcionais (RF):** Comportamentos observáveis (**1 requisito por linha**).
4. **Requisitos Não-Funcionais (RNF):** Métricas objetivas (**todo adjetivo vira número**).
5. **Critérios de Aceite Verificáveis:** Checklists de testes caixa-preta determinísticos.

---

## 🎨 Geração do Arquivo HTML

Após a validação com o usuário, a skill gera o arquivo na subpasta do respectivo épico:
📁 `docs/refinamento-tecnico/<epic-ou-area>/<slug-da-feature>-spec.html`

Utilizando o template em [template-spec.html](./resources/template-spec.html) com:
- Tailwind CSS Dark Mode, fontes `Plus Jakarta Sans` / `JetBrains Mono` e ícones Lucide.
- Diagrama Mermaid de contexto do negócio.
- Botão *"Voltar ao Hub"* (`../../index.html`), link *"Quadro Interativo"* e link para o próximo passo (`sdd-plan`).

---

## 🔗 Registro Automático no Hub
Ao criar o arquivo, atualize a lista `libraryDocuments` no arquivo `docs/index.html` com a categoria `refinamento` ("Refinamento & Specs") para que a nova especificação apareça indexada na Home e na Central de Refinamento.
