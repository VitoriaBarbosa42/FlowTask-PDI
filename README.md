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
```
2) Levantar infra (Postgres + pgAdmin) com Docker Compose
```bash
docker-compose up -d
Verificar containers:
```
```bash
docker ps
docker-compose logs -f

Acesso:

Postgres: localhost:5432
POSTGRES_USER=nome
POSTGRES_PASSWORD=senha
POSTGRES_DB=flowtask
pgAdmin: http://localhost:5050 — login admin@admin.com / senha admin
Build e execução da aplicação (local)
bash
cd flowtask
# build (pula testes se desejar)
./mvnw clean package -DskipTests

# ou rodar diretamente em modo de desenvolvimento
./mvnw spring-boot:run

```

3) Executar o JAR (após build)
```bash
# no diretório flowtask
java -jar target/*.jar
Configuração do banco (observações)

Verifique flowtask/src/main/resources/application.properties ou application.yml para ver qual banco está sendo usado (Postgres via JPA ou MongoDB). O pom.xml contém dependências tanto para MongoDB quanto para JPA/Postgres — ajuste as propriedades de acordo.
Se a app for executada localmente e conectar ao container Postgres, use:
JDBC: jdbc:postgresql://localhost:5432/flowtask
Usuário/senha: postgres / postgres
Se você containerizar a app no mesmo docker-compose, a URL JDBC pode usar o hostname do serviço: jdbc:postgresql://postgres:5432/flowtask.
```

4) Como parar e limpar
Parar os serviços do docker-compose:

```bash
docker-compose down
Parar e remover volumes (reset do DB):
```
```bash
docker-compose down -v
```
Remover containers manualmente:

```bash
docker rm -f flowtask-postgres flowtask-pgadmin
```
Comandos úteis
Logs dos containers:
```bash
docker-compose logs -f
```
Entrar no psql do container:
```bash
docker exec -it flowtask-postgres psql -U postgres -d flowtask
```
Ver volumes:
```bash
docker volume ls
```
