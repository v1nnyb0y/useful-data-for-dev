# Table of content

- [Kafka YML](#Kafka)
- [PostgreSQL](#PostgreSQL)
- [Keycloak](#Keycloak-by-docker)

# Kafka

1) Create docker-compose.yml with:

```
version: '2'
services:
  zookeeper:
    image: confluentinc/cp-zookeeper:latest
    environment:
      ZOOKEEPER_CLIENT_PORT: 2181
      ZOOKEEPER_TICK_TIME: 2000
    ports:
      - 22181:2181

  kafka:
    image: confluentinc/cp-kafka:latest
    depends_on:
      - zookeeper
    ports:
      - 29092:29092
    environment:
      KAFKA_BROKER_ID: 1
      KAFKA_ZOOKEEPER_CONNECT: zookeeper:2181
      KAFKA_ADVERTISED_LISTENERS: PLAINTEXT://kafka:9092,PLAINTEXT_HOST://localhost:29092
      KAFKA_LISTENER_SECURITY_PROTOCOL_MAP: PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT
      KAFKA_INTER_BROKER_LISTENER_NAME: PLAINTEXT
      KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR: 1
```

2) Then, execute command:

```
docker-compose up
```

# PostgreSQL

1) Execute following cmd:

```
docker run -d --rm --name postgresql \
  -e POSTGRES_PASSWORD=password \
  -p 5432:5432 \
  -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data \
  postgres:13
```

2) Then, connect using:

```
Login: postgres
Password: password
```

# Keycloak by docker

1) Execute following cmd:

Comments:
- DB_VENDOR values: mssql; postgres
```
docker run --name keycloak \
  -e 'KC_HEALTH_ENABLED=true' \
  -e 'KC_METRICS_ENABLED=true' \
  -e 'KEYCLOAK_ADMIN=admin' \
  -e 'KEYCLOAK_ADMIN_PASSWORD=admin' \
  -e 'PORT_KEYCLOAK=8080' \
  -e 'KC_DB=mssql' \
  -e 'KC_DB_URL=jdbc:sqlserver://localhost:9080;database=keycloak' \
  -e 'KC_DB_USERNAME=sa' \
  -e 'KC_DB_PASSWORD=Str#ng_Passw#rd' \
  -p 9090:8080 \
  quay.io/keycloak/keycloak:latest
```

2) Then, connect using:

```
Login: admin
Password: admin
```
