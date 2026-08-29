# FlowTask + PDI 🚀

[![Java 25](https://img.shields.io/badge/Java-25-orange.svg?style=flat-square&logo=openjdk)](https://openjdk.org/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.x%20%2F%204.x-6DB33F.svg?style=flat-square&logo=springboot)](https://spring.io/projects/spring-boot)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-4169E1.svg?style=flat-square&logo=postgresql)](https://www.postgresql.org/)
[![MongoDB](https://img.shields.io/badge/MongoDB-7.0-47A248.svg?style=flat-square&logo=mongodb)](https://www.mongodb.com/)
[![Apache Kafka](https://img.shields.io/badge/Apache%20Kafka-KRaft-231F20.svg?style=flat-square&logo=apachekafka)](https://kafka.apache.org/)
[![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC.svg?style=flat-square&logo=terraform)](https://www.terraform.io/)
[![Keycloak](https://img.shields.io/badge/Keycloak-IAM%20%26%20OAuth2-00838F.svg?style=flat-square&logo=keycloak)](https://www.keycloak.org/)

> **FlowTask** é um ecossistema backend moderno desenvolvido em **Java (Spring Boot)** e **Go**, combinando **gestão ágil de tarefas (Kanban)** com um módulo de **Plano de Desenvolvimento Individual (PDI)**. O projeto adota **persistência poliglota consciente**, **comunicação assíncrona orientada a eventos (EDA)** e **práticas corporativas de observabilidade e infraestrutura como código**.

---

## 🎯 Hub Visual de Sprints, Releases & System Design

Para acompanhar o planejamento completo de sprints, checklists interativos e o simulador interativo de arquitetura:

👉 **[Abrir Hub Visual Interativo (`docs/index.html`)](docs/index.html)**

- 📋 **Quadro Kanban Interativo**: Com suporte a *drag & drop*, filtros por épicos e salvamento automático do progresso no navegador.
- 📅 **Sprint Roadmap & Milestones**: Planejamento sequencial dos 6 ciclos de entrega e metas *Stretch*.
- 🏛️ **System Design Explorer**: Diagrama visual interativo com simulação de eventos e justificativas de cada tecnologia para entrevistas técnicas.
- ⚖️ **Matriz de Trade-offs & ADRs**: Comparativo prático de decisões (ex: Postgres vs Mongo, Kafka vs RabbitMQ, Go vs Java para workers).

---

## 🏛️ Arquitetura do Sistema

```mermaid
flowchart TD
    subgraph Ingress ["1. Entrada & Segurança"]
        Client["SPA Web / Mobile Client"]
        Keycloak["Keycloak IAM<br/>(OAuth2 / OIDC / JWT)"]
        LocalStack["LocalStack AWS (Stretch)<br/>(S3 / SQS)"]
    end

    subgraph BackendCore ["2. Backend Core (Spring Boot)"]
        API["REST Controllers"]
        KanbanModule["Módulo Kanban<br/>(Spring Data JPA)"]
        PDIModule["Módulo PDI<br/>(Spring Data Mongo)"]
        Producer["Kafka Event Producer"]
        Actuator["Micrometer / Actuator"]
    end

    subgraph Messaging ["3. Mensageria & Microsserviços"]
        Kafka["Apache Kafka (KRaft)<br/>Topic: tarefa-concluida"]
        GoService["Go Notifier Microservice<br/>(Gin Engine / Kafka Consumer)"]
    end

    subgraph Storage ["4. Persistência Poliglota"]
        Postgres[(PostgreSQL 15<br/>Relacional / ACID)]
        Mongo[(MongoDB 7<br/>Documentos PDI)]
        Redis[(Redis 7<br/>Cache @Cacheable)]
        Oracle[(Oracle XE<br/>Auditoria PL/SQL)]
    end

    subgraph Ops ["5. Observabilidade & IaC"]
        Prometheus["Prometheus / Grafana"]
        Terraform["Terraform Modules"]
        CI["GitHub Actions + Testcontainers"]
    end

    Client -->|Bearer JWT| API
    Keycloak -.->|Validação Token JWKS| API
    API --> KanbanModule
    API --> PDIModule

    KanbanModule -->|ACID Transactions| Postgres
    KanbanModule -->|Cache Sub-ms| Redis
    PDIModule -->|Schemaless Docs| Mongo

    KanbanModule -->|Publica TarefaConcluidaEvent| Producer
    Producer --> Kafka

    Kafka -->|Consome Evento| PDIModule
    Kafka -->|Consome Evento| GoService

    Actuator --> Prometheus
```

---

## 🛠️ Stack Tecnológica

| Camada | Tecnologias & Ferramentas |
| :--- | :--- |
| **Backend Core** | Java 25, Spring Boot 3.x / 4.x, Spring Data JPA, Spring Data MongoDB, Spring Kafka, Lombok |
| **Microsserviço** | Go (Golang), Gin Web Framework, Sarama Kafka Client |
| **Bancos de Dados** | PostgreSQL 15, MongoDB 7.0, Redis 7 (In-Memory Cache), Oracle Database XE *(Stretch)* |
| **Mensageria** | Apache Kafka (KRaft Mode sem ZooKeeper) |
| **Segurança & IAM** | Keycloak IAM, OAuth2.0, OpenID Connect, Spring Security JWT Bearer |
| **Observabilidade** | Micrometer, Prometheus, Grafana, Mapeamento conceitual Datadog |
| **Infra & DevOps** | Docker, Docker Compose, Terraform (Provider Docker/LocalStack), Testcontainers, GitHub Actions |

---

## 🚀 Como Rodar o Projeto

### Pré-requisitos
- **Git** instalado
- **Docker & Docker Compose** (ou Docker Desktop)
- **JDK 21+ ou JDK 25** instalado

---

### 1. Clonar o repositório
```bash
git clone https://github.com/VitoriaBarbosa42/FlowTask-PDI.git
cd FlowTask-PDI
```

---

### 2. Subir a infraestrutura (PostgreSQL, pgAdmin e Keycloak)
```bash
docker-compose up -d
```

Verifique o status dos containers:
```bash
docker-compose ps
```

#### 🌐 Serviços e Portas Locais:
- **PostgreSQL**: `localhost:5432` *(User: `postgres` | Senha: `postgres` | DB: `flowtask`)*
- **pgAdmin 4**: [http://localhost:5050](http://localhost:5050) *(Login: `admin@flowtask.com` | Senha: `admin`)*
- **Keycloak IAM**: [http://localhost:8080](http://localhost:8080) *(Login: `admin` | Senha: `admin`)*
- **Hub Visual (Board)**: abra o arquivo [`docs/index.html`](docs/index.html) no navegador

---

### 3. Executar o Backend Spring Boot

Acesse o diretório da aplicação:
```bash
cd flowtask
```

Executar em modo desenvolvimento via Maven Wrapper:
```bash
# No Linux / macOS:
./mvnw spring-boot:run

# No Windows (PowerShell / CMD):
.\mvnw.cmd spring-boot:run
```

Ou compilar o pacote JAR e executar:
```bash
# Build (pulando testes se necessário)
./mvnw clean package -DskipTests

# Execução do JAR gerado
java -jar target/*.jar
```

---

### 4. Parar e limpar o ambiente

Para pausar os containers:
```bash
docker-compose down
```

Para remover os volumes persistentes e resetar a base de dados:
```bash
docker-compose down -v
```

---

## 🗺️ Roadmap de Sprints & Épicos

| Sprint | Épico | Foco Principal | Entregável Chave |
| :---: | :--- | :--- | :--- |
| **Sprint 1-2** | **Epic 5: Infraestrutura como Código** | Terraform com provider Docker modularizado (`modules/postgres`, `mongo`, `redis`, `kafka`) | Pasta `infra/` versionada com `terraform plan/apply` |
| **Sprint 3-4** | **Epic 1: Persistência Poliglota** | Migração do Kanban para PostgreSQL (JPA), PDI em MongoDB e cache Redis (`@Cacheable`) | ADR documentando a escolha de cada banco |
| **Sprint 5-6** | **Epic 2: Mensageria & Eventos** | Apache Kafka KRaft desacoplando conclusão de tarefas e atualização do PDI | Fluxo de eventos assíncrono + testes de integração |
| **Sprint 7** | **Epic 3: Microsserviço em Go** | Serviço leve de notificações em Go (Gin) consumindo eventos Kafka | Serviço standalone com Dockerfile multi-stage |
| **Sprint 8** | **Epic 4: Observabilidade** | Instrumentação Micrometer, endpoints Prometheus e dashboards Grafana | Dashboard com métricas de latência e throughput |
| **Sprint 9-10** | **Epic 6: CI/CD & Clean Architecture** | Pipeline GitHub Actions com Testcontainers e revisão SOLID | Pipeline verde automatizada e documentação de portfólio |

---

## 📁 Estrutura do Repositório

```text
FlowTask-PDI/
├── docs/
│   ├── index.html                           # 🌟 Hub Visual (Kanban Board & System Design)
│   └── flowtask-plano-refinamento-itau.md   # Documento base de refinamento técnico
├── flowtask/                                # Aplicação Spring Boot (Java 25)
│   ├── src/main/java/br/com/flowtask/       # Controllers, Services, Models e Security
│   ├── src/main/resources/                  # application.yaml e schema.sql
│   ├── mvnw / mvnw.cmd                      # Maven Wrapper
│   └── pom.xml                              # Dependências do projeto
├── keycloak-config/
│   └── flowtask-realm.json                  # Realm pré-configurado do Keycloak
├── docker-compose.yaml                      # Orquestração local dos containers
└── README.md                                # Documentação principal
```

---

## 📚 Documentações Complementares
- 📖 [Plano de Refinamento Técnico Completo](docs/flowtask-plano-refinamento-itau.md)
- 📊 [Dashboard Interativo & System Design](docs/index.html)
