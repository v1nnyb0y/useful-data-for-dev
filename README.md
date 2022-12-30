# Table of content

- [Azure SQL Edge](#Azure-SQL-Edge)
- [MS SQL](#MS-SQL-by-docker) - It's not supported right now
- [Keycloak](#Keycloak-by-docker)


# Azure SQL Edge

1) Execute following cmd:

```
docker run --cap-add SYS_PTRACE --name azuresqledge \
  -e 'ACCEPT_EULA=1' \
  -e 'MSSQL_SA_PASSWORD=Str#ng_Passw#rd' \
  -p 9080:1433 \
   v1nnyb0y/local-images:azuresqledge_2022
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
  v1nnyb0y/local-images:mssql_2022
```

2) Then, connect using:

```
Login: sa
Password: Str#ng_Passw#rd
```

# Keycloak by docker
