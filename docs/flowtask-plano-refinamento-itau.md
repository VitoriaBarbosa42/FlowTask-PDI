# FlowTask — Plano de Estudos & Refinamento (Vaga Junior Itaú)

> 💡 **Visual Dashboard & System Design**: Para uma experiência interativa com Kanban Board (drag & drop, checklists interativos e persistência), roadmap visual de sprints e simulador da arquitetura, abra o arquivo [`index.html`](./index.html) diretamente no seu navegador.

## Parte 1 — Sprint Plan Sequencial

> Cada sprint = 1-2 semanas. Ordem pensada para construir dependências (ex: infra antes de observabilidade).

### Sprint 1-2 — Epic 5: Infraestrutura como Código (Terraform)
**Objetivo:** sair do docker-compose puro e provisionar via Terraform.
- Instalar Terraform + provider `kreuzwerker/docker`
- Modularizar: `modules/mongo`, `modules/postgres`, `modules/redis`, `modules/kafka`
- `terraform plan` / `apply` substituindo o `docker-compose up`
- (Stretch) LocalStack para simular S3/SQS

**Entregável:** repositório com pasta `infra/` versionada, README explicando decisões.

---

### Sprint 3-4 — Epic 1: Persistência Poliglota
**Objetivo:** justificar o uso de cada banco, não só "ter" cada um.
- Migrar dados transacionais do Kanban para PostgreSQL (JPA/Hibernate)
- Manter PDI em MongoDB (documento flexível — decisão consciente, não acidental)
- Redis como cache de leitura do board (`@Cacheable`)
- (Stretch) Oracle XE local para uma tabela de auditoria/log

**Entregável:** ADR (Architecture Decision Record) curto explicando por que cada dado foi para cada banco.

---

### Sprint 5-6 — Epic 2: Mensageria e Comunicação Assíncrona
**Objetivo:** Kafka como espinha dorsal de eventos entre Kanban e PDI.
- Evento `TarefaConcluidaEvent` publicado ao concluir card no Kanban
- Consumer no módulo PDI reage e atualiza progresso
- Configuração de tópicos, partições, consumer groups (aplicar o que já estudou de KRaft)

**Entregável:** diagrama de fluxo de eventos + testes de producer/consumer.

---

### Sprint 7 — Epic 3: Microsserviço em Go
**Objetivo:** comunicação poliglota real.
- Serviço em Go (Gin ou Echo) consumindo eventos do Kafka
- Candidato: serviço de notificações ("tarefa concluída → notifica")
- Health-check simples expondo métricas básicas

**Entregável:** serviço standalone com seu próprio Dockerfile, integrado ao Terraform da Sprint 1-2.

---

### Sprint 8 — Epic 4: Observabilidade
**Objetivo:** instrumentar, não só logar.
- Micrometer no Spring Boot (métricas de latência, contagem de eventos Kafka)
- Prometheus + Grafana local (substituto conceitual do Datadog)
- Se tiver acesso real ao Datadog no Itaú, comparar conceitos (tags, dashboards, APM)

**Entregável:** dashboard com pelo menos 3 métricas relevantes do FlowTask.

---

### Sprint 9-10 — Epic 6: CI/CD + Testes + Fechamento
**Objetivo:** pipeline completo + testes de integração reais.
- Testcontainers para Postgres/Mongo/Kafka em testes de integração
- GitHub Actions: lint → testes → build → `terraform plan` (validação, sem apply automático)
- Revisão geral: SOLID/Clean Code no código dos 6 épicos anteriores

**Entregável:** pipeline verde + README final do projeto contando a jornada (bom material pra portfólio/entrevista).

---

## Parte 2 — Backlog de Refinamento (Board)

### 🟦 Epic 1 — Persistência Poliglota

**História 1.1**
> Como desenvolvedora, quero migrar o módulo de tarefas do Kanban para PostgreSQL, para ter dados transacionais com integridade relacional.
- [ ] Modelagem de tabelas (tarefas, colunas, board)
- [ ] Configuração JPA/Hibernate no Spring Boot
- [ ] Migração de dados existentes (se houver) do Mongo pro Postgres
- [ ] Testes unitários dos repositories

**História 1.2**
> Como desenvolvedora, quero adicionar cache Redis nas consultas do board, para reduzir latência de leitura.
- [ ] `@Cacheable` na consulta de listagem de tarefas
- [ ] Estratégia de invalidação de cache ao atualizar/criar tarefa
- [ ] Teste validando cache hit/miss

**História 1.3 (stretch)**
> Como desenvolvedora, quero registrar auditoria de alterações em Oracle, para praticar a sintaxe PL/SQL.
- [ ] Container Oracle XE local
- [ ] Tabela de log de auditoria (quem alterou, quando, o quê)
- [ ] Trigger ou service gravando o log

---

### 🟦 Epic 2 — Mensageria e Comunicação Assíncrona

**História 2.1**
> Como desenvolvedora, quero publicar um evento Kafka ao concluir uma tarefa, para desacoplar o Kanban do módulo PDI.
- [ ] Definição do schema do evento (`TarefaConcluidaEvent`)
- [ ] Producer configurado no serviço de Kanban
- [ ] Tópico criado com partições adequadas

**História 2.2**
> Como desenvolvedora, quero consumir esse evento no módulo PDI, para atualizar o progresso automaticamente.
- [ ] Consumer group configurado
- [ ] Lógica de atualização do PDI ao receber evento
- [ ] Teste de integração producer → consumer

---

### 🟦 Epic 3 — Microsserviço em Go

**História 3.1**
> Como desenvolvedora, quero criar um serviço de notificações em Go, para praticar comunicação poliglota entre serviços.
- [ ] Setup do projeto Go (Gin/Echo)
- [ ] Consumer Kafka em Go lendo `TarefaConcluidaEvent`
- [ ] Endpoint de health-check

**História 3.2**
> Como desenvolvedora, quero que o serviço Go seja containerizado e provisionado via Terraform, para manter consistência com o resto da infra.
- [ ] Dockerfile do serviço Go
- [ ] Módulo Terraform incluindo o novo serviço

---

### 🟦 Epic 4 — Observabilidade

**História 4.1**
> Como desenvolvedora, quero expor métricas do Spring Boot via Micrometer, para monitorar latência e throughput.
- [ ] Dependência Micrometer + endpoint `/actuator/prometheus`
- [ ] Métricas customizadas (ex: eventos Kafka processados)

**História 4.2**
> Como desenvolvedora, quero visualizar essas métricas em um dashboard, para simular o que seria feito no Datadog.
- [ ] Prometheus configurado (via Terraform, se possível)
- [ ] Dashboard Grafana com 3+ métricas
- [ ] Documentação comparando conceitos com Datadog (tags, APM, dashboards)

---

### 🟦 Epic 5 — Infraestrutura como Código

**História 5.1**
> Como desenvolvedora, quero provisionar Mongo, Postgres, Redis e Kafka via Terraform, para substituir o docker-compose manual.
- [ ] Módulos separados por serviço
- [ ] Variáveis parametrizadas (portas, credenciais)
- [ ] `terraform plan`/`apply` documentado no README

**História 5.2 (stretch)**
> Como desenvolvedora, quero simular recursos cloud com LocalStack, para praticar Terraform em um cenário mais próximo de produção.
- [ ] LocalStack configurado
- [ ] Pelo menos 1 recurso simulado (S3 ou SQS)

---

### 🟦 Epic 6 — CI/CD e Testes

**História 6.1**
> Como desenvolvedora, quero testes de integração com Testcontainers, para validar comportamento real dos bancos e do Kafka.
- [ ] Testcontainers para Postgres
- [ ] Testcontainers para MongoDB
- [ ] Testcontainers para Kafka

**História 6.2**
> Como desenvolvedora, quero um pipeline CI/CD completo, para automatizar validação e build a cada push.
- [ ] Etapa de lint
- [ ] Etapa de testes (unitários + integração)
- [ ] Etapa de build
- [ ] Etapa `terraform plan` (validação, sem apply automático)

**História 6.3**
> Como desenvolvedora, quero revisar o código dos épicos anteriores aplicando SOLID/Clean Code, para consolidar boas práticas antes de finalizar.
- [ ] Checklist de revisão por módulo
- [ ] Refatorações registradas em commits separados (bom para mostrar evolução em entrevista)

---

## Notas finais
- Marque cada história com o Epic correspondente no seu board (GitHub Projects, se já usa lá no FlowTask).
- Priorize sempre "Entregável" sobre "Stretch" — os stretches são bônus caso sobre tempo.
- Ao final de cada epic, vale escrever 2-3 linhas no seu GitHub Pages de estudos conectando teoria → prática no FlowTask — reforça aprendizado e vira portfólio.
