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

## 📋 Protocolo de Entrevista de Requisitos (Passo a Passo)

Ao ser acionada, se o usuário fornecer apenas uma ideia bruta ou parcial, a skill deve conduzir a entrevista cobrindo as 4 dimensões obrigatórias:

### 1. Objetivo & Propósito (O Por Que em 2 linhas)
- Qual a dor real do usuário que este incremento resolve?
- Quem é o usuário/consumidor dessa funcionalidade?
- *Exemplo:* *"Permitir que o usuário filtre tarefas por tags para localizar rapidamente itens de alta prioridade."*

### 2. Escopo & Fora do Escopo (Out-of-Scope)
- **In-Scope:** O que será entregue obrigatoriamente neste ciclo.
- **Out-of-Scope (Obrigatório):** O que está expressamente **fora** deste ciclo (impede crescimento descontrolado e suposições da IA).

### 3. Requisitos Funcionais (RF) — 1 Requisito por Linha
- Cada RF deve descrever um comportamento observável único.
- *Proibido agrupar requisitos:* Requisitos agrupados não podem ser aceitos ou rejeitados separadamente.

### 4. Requisitos Não-Funcionais (RNF) — O Antídoto do Adjetivo
- **Proibido usar adjetivos vagos:** *"rápido"*, *"seguro"*, *"escalável"*, *"intuitivo"*.
- **Todo adjetivo vira número/métrica:**
  - *Desempenho:* `p95 < 200ms com 10.000 registros`
  - *Segurança:* `JWT Bearer validado via JWKS, segredos injetados via ENV`
  - *Persistência:* `dados persistem após reinício da instância`

### 5. Critérios de Aceite Verificáveis (Definition of Done)
- Cenários caixa-preta objetivos (entradas inválidas, códigos de retorno HTTP, mensagens de erro, persistência).

---

## 🎨 Geração do Arquivo HTML

Após a validação com o usuário, a skill gera o arquivo:
📁 `docs/refinamento-tecnico/<slug-da-feature>-spec.html`

Utilizando o template em [template-spec.html](./resources/template-spec.html) com:
- Tailwind CSS Dark Mode, fontes `Plus Jakarta Sans` / `JetBrains Mono` e ícones Lucide.
- Diagrama Mermaid de contexto do negócio.
- Botão *"Voltar ao Hub"* (`../index.html`) e link para o próximo passo (`sdd-plan`).

---

## 🔗 Registro Automático no Hub
Ao criar o arquivo, atualize a lista `libraryDocuments` no arquivo `docs/index.html` para que a nova especificação apareça no catálogo da aba **"Anotações & Docs"**.
