    DROP   DATABASE     IF EXISTS Gestion_Riesgo_Crediticio;

    CREATE DATABASE     Gestion_Riesgo_Crediticio;

    USE                 Gestion_Riesgo_Crediticio;

    CREATE TABLE        Clientes 
    (
     Cliente_ID         INT                NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Nombre             VARCHAR(100)       NOT NULL
    ,Apellido           VARCHAR(100)       NOT NULL
    ,Telefono           VARCHAR(20)        NOT NULL  
    ,Correo             VARCHAR(100)       UNIQUE 
    ,Direccion          VARCHAR(255)       DEFAULT  'Sin informacion'
    )
	COMMENT "Esta tabla contiene toda la informacion personal relacionada a los clientes"
    ;

    
    CREATE TABLE        Cuentas 
    (
     Cuentas_ID         INT                NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Cliente_ID         INT
    ,Numero             VARCHAR(20)
    ,Tipo               VARCHAR(50)
    ,Saldo              DECIMAL(10,2)
    ,FechaApertura      DATE               DEFAULT (CURDATE())
    )
	COMMENT "Esta tabla registra datos relacionados a las cuentas que poseen los clientes"
    ;
     
     
    CREATE TABLE        Transacciones 
    (
     Transacciones_ID   INT                NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Cuentas_ID         INT
    ,Tipo               VARCHAR(50)        DEFAULT 'Desconocido' 
    ,Monto              DECIMAL(10,2)  
    ,Fecha              DATE               DEFAULT (CURDATE())
    )
	COMMENT "En esta tabla se registran todas las transacciones que realiza el cliente con la institucion financiera"
    ;
    
     
    CREATE TABLE        Prestamos 
    (
     Prestamos_ID       INT                NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Cliente_ID         INT
    ,Monto              DECIMAL(10,2)  
    ,TasaInteres        DECIMAL(5,2)
    ,Plazo              INT                DEFAULT 180  CHECK (Plazo >= 180)
    ,Estado             VARCHAR(50)        DEFAULT 'Activo'
    )
	COMMENT "Esta tabla registra los prestamos que puedan llegar a realizar los clientes con la institucion financiera"
    ;
    
     
    CREATE TABLE        Pagos_Prestamos 
    (
     Pagos_Prest_ID     INT                NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Prestamos_ID       INT
    ,Monto              DECIMAL(10,2)  
    ,Fecha              DATE               DEFAULT (CURDATE())
    )
	COMMENT "En esta tabla se registran los pagos de los prestamos por parte de los clientes"
    ;
     
     
    CREATE TABLE        Historial_Credito 
    (
     Hist_Credito_ID    INT                NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Cliente_ID         INT
    ,Puntaje            INT                DEFAULT 0 CHECK (Puntaje >= 0)
    ,Observaciones      TEXT           
    )
	COMMENT "Esta tabla registra el historial crediticio que posee cada cliente"
    ;
   
     
    CREATE TABLE        Modelos_Riesgo 
    (
     Mod_Riesgo_ID      INT                NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Nombre             VARCHAR(100)
    ,Descripcion        TEXT
    ,Coeficientes       TEXT
    )
	COMMENT "Esta tabla es independiente de las demas, su finalidad es almacenar informacion sobre los modelos de riesgo que pueden ser utilizados"
    ;
     
   
    CREATE TABLE        Eventos_Riesgo 
    (
     Even_Riesgo_ID     INT                NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Descripcion        TEXT
    ,Fecha              DATE               DEFAULT (CURDATE())
    )
	COMMENT "Esta tabla es independiente de las demas, su finalidad es almacenar informacion sobre los eventos de riesgo"
    ;
   
   
    ALTER TABLE         Cuentas            ADD CONSTRAINT fk_cuen_clientes
    FOREIGN KEY         (Cliente_ID)       REFERENCES Clientes(Cliente_ID);

     
    ALTER TABLE         Transacciones      ADD CONSTRAINT fk_trans_cuentas
    FOREIGN KEY         (Cuentas_ID)       REFERENCES Cuentas(Cuentas_ID)
    ON DELETE                              CASCADE
    ON UPDATE                              CASCADE;


    ALTER TABLE         Prestamos          ADD CONSTRAINT fk_pres_clientes
    FOREIGN KEY         (Cliente_ID)       REFERENCES Clientes(Cliente_ID)
    ON DELETE                              CASCADE
    ON UPDATE                              CASCADE;


    ALTER TABLE         Pagos_Prestamos    ADD CONSTRAINT fk_pago_prestamos
    FOREIGN KEY         (Prestamos_ID)     REFERENCES Prestamos(Prestamos_ID)
    ON DELETE                              CASCADE
    ON UPDATE                              CASCADE;


    ALTER TABLE         Historial_Credito  ADD CONSTRAINT fk_hist_clientes
    FOREIGN KEY         (Cliente_ID)       REFERENCES Clientes(Cliente_ID);

