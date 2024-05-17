USE mysql;

CREATE USER IF NOT EXISTS 'admin_gestion'@'%' IDENTIFIED BY 'gestioncrediticio123'
COMMENT                   'Administrador de la base de datos';

ALTER USER                'admin_gestion'@'%' IDENTIFIED BY '2024gestion'
FAILED_LOGIN_ATTEMPTS      2
PASSWORD_LOCK_TIME         1;

GRANT ALL PRIVILEGES ON    Gestion_Riesgo_Crediticio.* 
TO                         'admin_gestion'@'%' WITH GRANT OPTION;


FLUSH PRIVILEGES;

USE   Gestion_Riesgo_Crediticio;

-- Creacion de roles

CREATE ROLE                Role_select_tablas;
CREATE ROLE                Role_crud_crediticio;
CREATE ROLE                Role_creacion_usuarios;


-- Asignacion de priviligeios al rol Role_select_tablas

GRANT SELECT ON            Clientes           TO   Role_select_tablas;
GRANT SELECT ON            Cuentas            TO   Role_select_tablas;
GRANT SELECT ON            Transacciones      TO   Role_select_tablas;
GRANT SELECT ON            Prestamos          TO   Role_select_tablas;
GRANT SELECT ON            Pagos_Prestamos    TO   Role_select_tablas;
GRANT SELECT ON            Historial_Credito  TO   Role_select_tablas;


-- Asignacion de privilegios al rol Role_crud_crediticio

GRANT ALL PRIVILEGES ON    Clientes           TO   Role_crud_crediticio;
GRANT ALL PRIVILEGES ON    Cuentas            TO   Role_crud_crediticio;
GRANT ALL PRIVILEGES ON    Transacciones      TO   Role_crud_crediticio;
GRANT ALL PRIVILEGES ON    Prestamos          TO   Role_crud_crediticio;
GRANT ALL PRIVILEGES ON    Pagos_Prestamos    TO   Role_crud_crediticio;
GRANT ALL PRIVILEGES ON    Historial_Credito  TO   Role_crud_crediticio;


-- Creacion de usuarios y asignacion de los roles correspondientes

CREATE USER 'juan_select'@'%'   IDENTIFIED   BY  'juan444'
COMMENT     'Usuario con permisos de vista';
GRANT        Role_select_tablas              TO  'juan_select'@'%';

CREATE USER 'thiago_crud'@'%'   IDENTIFIED   BY  'thiago999'
COMMENT     'Usuario con rol CRUD';
GRANT        Role_crud_crediticio            TO  'thiago_crud'@'%';

CREATE USER 'agus_usuarios'@'%' IDENTIFIED   BY  'bocajrs'
COMMENT     'Usuario con rol de creacion de usuarios';
GRANT        Role_creacion_usuarios           TO  'agus_usuarios'@'%';
FLUSH PRIVILEGES;
