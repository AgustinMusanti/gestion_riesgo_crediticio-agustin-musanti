USE mysql;

CREATE USER IF NOT EXISTS 'admin_gestion'@'%' IDENTIFIED BY 'gestioncrediticio123'
COMMENT 'Administrador de la base de datos';

ALTER USER 'admin_gestion'@'%' IDENTIFIED BY '2024gestion'
FAILED_LOGIN_ATTEMPTS 2
PASSWORD_LOCK_TIME 1;

GRANT ALL PRIVILEGES ON Gestion_Riesgo_Crediticio.* TO 'admin_gestion'@'%' WITH GRANT OPTION;

GRANT CREATE USER ON Gestion_Riesgo_Crediticio TO 'admin_gestion'@'%';

FLUSH PRIVILEGES;

USE Gestion_Riesgo_Crediticio;

-- Creacion de roles

CREATE ROLE Role_Select_Tablas;
CREATE ROLE Role_Crud_Crediticio;


-- Asignacion de priviligeios al rol Role_Select_Tablas

GRANT SELECT ON Clientes TO Role_Select_Tablas;
GRANT SELECT ON Cuentas TO Role_Select_Tablas;
GRANT SELECT ON Transacciones TO Role_Select_Tablas;
GRANT SELECT ON Prestamos TO Role_Select_Tablas;
GRANT SELECT ON Pagos_Prestamos TO Role_Select_Tablas;
GRANT SELECT ON Historial_Credito TO Role_Select_Tablas;


-- Asignacion de privilegios al rol Role_Crud_Crediticio

GRANT ALL PRIVILEGES ON Clientes TO Role_Crud_Crediticio;
GRANT ALL PRIVILEGES ON Cuentas TO Role_Crud_Crediticio;
GRANT ALL PRIVILEGES ON Transacciones TO Role_Crud_Crediticio;
GRANT ALL PRIVILEGES ON Prestamos TO Role_Crud_Crediticio;
GRANT ALL PRIVILEGES ON Pagos_Prest TO Role_Crud_Crediticio;
GRANT ALL PRIVILEGES ON Historial_Credito TO Role_Crud_Crediticio;


-- Creacion de usuarios y asignacion de los roles correspondientes

CREATE USER 'juan_select'@'%' IDENTIFIED BY 'juan444'
COMMENT 'Usuario con permisos de vista';
GRANT Role_Select_Tablas TO 'juan_select'@'%';

CREATE USER 'Thiago_Crud'@'%' IDENTIFIED BY 'thiago999'
COMMENT 'Usuario con rol CRUD';
GRANT Role_Crud_Crediticio TO 'thiago_crud'@'%';


FLUSH PRIVILEGES;
