# Table of content

- [MS SQL SERVER](#MS-SQL-by-docker)
- [Keycloak](#Keycloak-by-docker)


# MS SQL by docker

1) Pull repository from local docker hub
2) Execute following cmd:

```
docker run \
  -e "ACCEPT_EULA=Y" \
  -e "MSSQL_PID=Developer" \
  -e "MSSQL_SA_PASSWORD=thisisstrongpassword" \
  -p 1433:1433 --name local-mssql --hostname local-mssql \
  -d v1nnyb0y/local-images:mssql_2022
```

3) Then, connect using:

```
Login: sa
Password: thisisstrongpassword
```

# Keycloak by docker
