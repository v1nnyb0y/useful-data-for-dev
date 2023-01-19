# Table of content

- [PostgreSQL](#PostgreSQL)
- [Azure SQL Edge](#Azure-SQL-Edge)
- [MS SQL](#MS-SQL-by-docker) - It's not supported right now
- [Keycloak](#Keycloak-by-docker)

# PostgreSQL

1) Execute following cmd:

```
docker run -d --rm --name pg-docker \
  -e POSTGRES_PASSWORD=password \
  -p 5432:5432 \
  -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data \
  postgres:latest
```

2) Then, connect using:

```
Login: postgres
Password: password
```


# Azure SQL Edge

1) Execute following cmd:

```
docker run --cap-add SYS_PTRACE --name azuresqledge \
  -e 'ACCEPT_EULA=1' \
  -e 'MSSQL_SA_PASSWORD=Str#ng_Passw#rd' \
  -p 9080:1433 \
   mcr.microsoft.com/azure-sql-edge:latest
```

2) Then, connect using:

```
Login: sa
Password: Str#ng_Passw#rd
```

# MS SQL by docker

1) Execute following cmd:

```
docker run \
  -e "ACCEPT_EULA=Y" \
  -e "MSSQL_PID=Developer" \
  -e "MSSQL_SA_PASSWORD=Str#ng_Passw#rd" \
  -p 1433:1433 --name local-mssql --hostname local-mssql \
  mcr.microsoft.com/mssql/server:latest
```

2) Then, connect using:

```
Login: sa
Password: Str#ng_Passw#rd
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
