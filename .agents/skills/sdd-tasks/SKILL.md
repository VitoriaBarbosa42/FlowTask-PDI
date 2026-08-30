---
name: sdd-tasks
description: >-
  Decompõe o plano técnico do SDD em uma lista ordenada de micro-tarefas atômicas, sequenciais e verificáveis com checklist persistente em HTML na pasta 'docs/refinamento-tecnico/'.
  Ative quando o usuário pedir para 'quebrar em tarefas', 'gerar tasks.md/html', 'criar checklist de implementação' ou avançar para a Fase 3 do SDD.
---

# SDD Tasks — Decomposição em Micro-Tarefas Atômicas

Esta skill atua como **Tech Lead / Engenheiro de Execução** para a **Fase 3 (Tarefas)** do ciclo SDD.

Seu objetivo é pegar o plano técnico (Fase 2) e quebrá-lo em uma lista estritamente ordenada de micro-passos pequenos, atômicos e **verificáveis isoladamente**, gerando um painel interativo em HTML na pasta `docs/refinamento-tecnico/`.

---

## 🛑 Regras para Construção de Tarefas

1. **Atomicidade Estrita**: Cada tarefa deve resolver uma única responsabilidade (ex: `Task 1.1: Criar tabela SQL via Flyway/Liquibase`, `Task 1.2: Criar Entity JPA`, `Task 1.3: Criar Repository com teste unitário`).
2. **Verificabilidade Imediata**: Toda tarefa deve ter um critério claro de validação (ex: *"Executar `./mvnw test -Dtest=TaskRepositoryTest` e garantir teste verde"*).
3. **Persistência Visual**: O arquivo HTML deve salvar o estado dos checkboxes no `localStorage` do navegador para que o desenvolvedor marque as tarefas concluídas.

---

## 📋 Estrutura da Lista de Tarefas

Cada grupo de tarefas deve seguir:

```text
[ ] Grupo 1: Banco de Dados & Modelagem
  [ ] Task 1.1: Migration SQL de criação da tabela
  [ ] Task 1.2: Entidade JPA e Mappers
  [ ] Task 1.3: Testes de persistência com Testcontainers

[ ] Grupo 2: Regras de Negócio & Service Layer
  [ ] Task 2.1: Service com validações de negócio dos RFs da spec
  [ ] Task 2.2: Testes unitários com Mockito cobrindo cenários de erro

[ ] Grupo 3: Camada de API & Controllers
  [ ] Task 3.1: Controller REST com anotações OpenAPI e Bean Validation
  [ ] Task 3.2: Handler global de exceções para status HTTP (ex: 422, 404)

[ ] Grupo 4: Mensageria & Integrações
  [ ] Task 4.1: Producer Kafka publicando evento TarefaConcluidaEvent
  [ ] Task 4.2: Teste de integração do consumer
```

---

## 🎨 Geração do Arquivo HTML

Após a validação com o usuário, a skill gera o arquivo na subpasta do respectivo épico:
📁 `docs/refinamento-tecnico/<epic-ou-area>/<slug-da-feature>-tasks.html`

Utilizando o template em [template-tasks.html](./resources/template-tasks.html) com checklist persistente em `localStorage`, barra de progresso em tempo real e comandos de validação.

---

## 🔗 Registro Automático no Hub
Ao criar o arquivo, atualize a lista `libraryDocuments` no arquivo `docs/index.html` com a categoria `refinamento` ("Refinamento & Specs") para indexação no Hub.
