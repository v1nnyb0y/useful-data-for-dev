EXEC sp_sqljdbc_xa_install
GO
    
create database keycloak;
create login keycloak with password = 'Password!23'
GO
    
use master;
EXEC sp_grantdbaccess 'keycloak', 'keycloak';
EXEC sp_addrolemember [SqlJDBCXAUser], 'keycloak'
GO
    
use keycloak;
create user keycloak for login keycloak;
EXEC sp_addrolemember N'db_owner', N'keycloak'
go
