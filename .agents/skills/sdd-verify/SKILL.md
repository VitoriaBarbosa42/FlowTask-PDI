---
name: sdd-verify
description: >-
  Realiza a verificação estrita do incremento implementado contra 100% dos critérios de aceite da especificação SDD,
  executando testes automatizados e gerando relatório de auditoria/QA em HTML na pasta 'docs/refinamento-tecnico/'.
  Ative quando o usuário pedir para 'verificar critérios de aceite', 'validar entrega SDD', 'rodar testes e QA' ou finalizar a Fase 5 do SDD.
---

# SDD Verify — Verificação & Auditoria de Qualidade

Esta skill atua como **Especialista em QA & Auditoria de Entrega** para a **Fase 5 (Verificação)** do ciclo SDD.

Seu objetivo é auditar o incremento implementado exclusivamente contra a **Especificação Técnica** (`sdd-spec`), rodando os critérios de aceite 1 a 1 e gerando um relatório em HTML na pasta `docs/refinamento-tecnico/`.

---

## 🛑 Princípio da Verificação Objetiva

- **Verificação contra a Spec, NUNCA contra gosto pessoal:** A auditoria julga se a entrega atende a 100% dos Requisitos Funcionais, Requisitos Não-Funcionais e Critérios de Aceite definidos na `spec.html`.
- Se um critério falhar: O ciclo volta para a implementação (`sdd-implement`) para correção.
- Se o teste passou, mas não resolve o problema original: O ciclo volta para a especificação (`sdd-spec`).

---

## 📋 Protocolo de Auditoria

1. **Leitura dos Critérios de Aceite:**
   - Carrega `docs/refinamento-tecnico/<feature>-spec.html`.
2. **Execução de Bateria de Testes:**
   - Testes unitários (JUnit / Mockito / Go testing).
   - Testes de integração com Testcontainers (Postgres, Mongo, Kafka).
3. **Auditoria dos Requisitos Não-Funcionais:**
   - Métricas de latência, consumo de memória, persistência após reboot.
4. **Geração do Relatório de Auditoria:**
   - Salva em `docs/refinamento-tecnico/<feature>-relatorio-qa.html`.

---

## 🎨 Geração do Relatório HTML
Utiliza o template [template-relatorio-qa.html](./resources/template-relatorio-qa.html) com badges de status (Aprovado/Reprovado), gráficos e logs de teste.
