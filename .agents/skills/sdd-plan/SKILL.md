---
name: sdd-plan
description: >-
  Elabora o Planejamento Técnico e Arquitetural (O Como) a partir de uma especificação SDD,
  mapeando decisões de design, arquivos afetados, trade-offs, riscos e diagramas Mermaid em HTML na pasta 'docs/refinamento-tecnico/'.
  Ative quando o usuário pedir para 'planejar a implementação', 'gerar plano técnico', 'fazer architecture plan' ou seguir para a Fase 2 do SDD.
---

# SDD Plan — Planejamento Técnico & Arquitetura

Esta skill atua como **Arquiteto de Software & Engenheiro Sênior** para a **Fase 2 (Planejamento)** do ciclo SDD.

Seu objetivo é transformar a especificação canônica (Fase 1) em uma abordagem técnica executável, determinando **O Como** antes de qualquer código ser escrito.

---

## 🛑 Diretrizes da Skill

1. **O "Como" Nasce Aqui**: Ao contrário da spec, aqui você deve detalhar pacotes, classes, modelos de dados, endpoints REST, tópicos Kafka e scripts de infraestrutura.
2. **Justificativa de Decisões (ADRs & Trade-offs)**: Explique o porquê de cada escolha técnica (ex: por que JPA vs MongoDB, por que evento assíncrono vs chamada síncrona).
3. **Diagramas Visuais Obrigatórios**: Toda documentação de plano deve conter diagramas Mermaid.js ilustrando o fluxo de dados, sequência de chamadas ou modelo de entidades.
4. **Se a abordagem técnica encontrar um bloqueio de negócio**: Pausar e alertar o usuário para atualizar a especificação (`sdd-spec`) antes de prosseguir.

---

## 📋 Estrutura do Planejamento Técnico

O plano gerado deve contemplar:

### 1. Resumo da Abordagem Técnica
- Visão geral da arquitetura proposta e como ela atende a 100% dos requisitos funcionais e métricas de qualidade da spec.

### 2. Mapeamento de Arquivos Afetados
- `[NOVO]` Arquivos a serem criados (Controllers, Services, DTOs, Mappers, Repositories, Migrations SQL, Dockerfiles, Terraform).
- `[ALTERAR]` Arquivos existentes modificados.
- `[EXCLUIR]` Arquivos depreciados.

### 3. Matriz de Decisões de Design & Trade-offs (Mini-ADR)
- **Decisão:** Escolha adotada.
- **Alternativa Descartada:** Opção avaliada e rejeitada.
- **Justificativa / Por Que:** Motivo técnico e impacto em performance/manutenibilidade.

### 4. Diagrama de Arquitetura / Sequência (Mermaid.js)
- Diagrama claro de sequência ou blocos evidenciando o fluxo de dados.

### 5. Análise de Riscos & Estratégia de Mitigação
- Possíveis gargalos, quebras de compatibilidade ou dependências externas e como serão mitigados.

---

## 🎨 Geração do Arquivo HTML

Após a validação com o usuário, a skill gera o arquivo na subpasta do respectivo épico:
📁 `docs/refinamento-tecnico/<epic-ou-area>/<slug-da-feature>-plan.html`

Utilizando o template em [template-plan.html](./resources/template-plan.html) com diagramas Mermaid, mapeamento de arquivos e matriz de decisões.

---

## 🔗 Registro Automático no Hub
Ao criar o arquivo, atualize a lista `libraryDocuments` no arquivo `docs/index.html` com a categoria `refinamento` ("Refinamento & Specs") para indexação no Hub.
