# FlowTask + PDI

Resumo
------
FlowTask é um projeto pessoal de estudo: backend em Java (Spring Boot + Maven) com foco em um módulo de Plano de Desenvolvimento Individual (PDI). O repositório contém a aplicação Java em `flowtask/` e um `docker-compose.yaml` (branch `develop`) que levanta Postgres + pgAdmin para desenvolvimento local.

O que já foi feito
------------------
- Estrutura Maven em `flowtask/` com `mvnw` (wrapper) e `pom.xml`.
- Dependências principais no `pom.xml`: Spring Boot (webmvc, data-jpa, data-mongodb), driver PostgreSQL e Lombok.
- `docker-compose.yaml` (raiz) com serviços:
  - `postgres` (postgres:15-alpine) — usuário `postgres`, senha `postgres`, DB `flowtask`.
  - `pgadmin` (dpage/pgadmin4) — acesso em `http://localhost:5050` (admin@flowtask.com / admin).
- Código-fonte em `flowtask/src` (estrutura de projeto Spring Boot). Ainda não há serviço da aplicação no `docker-compose` — a app é executada via mvnw/localmente ou por container se você adicionar um serviço `app` no compose.

Stack
-----
- Language(s): Java (100%)
- Framework / runtime: Spring Boot (parent 4.1.0), Maven (wrapper disponível)
- Notable libraries: spring-boot-starter-webmvc, spring-boot-starter-data-mongodb, spring-boot-starter-data-jpa, postgresql driver, lombok

Como rodar (do zero)
--------------------

Requisitos
- Git
- Docker & Docker Compose (ou Docker Desktop)
- JDK compatível (o `pom.xml` declara `java.version` 25; se usar o wrapper, o Maven wrapper resolve o Maven, mas o JDK deve existir)
- (Opcional) Maven local

1) Clonar repositório
```bash
git clone https://github.com/VitoriaBarbosa42/FlowTask-PDI.git
cd FlowTask-PDI
