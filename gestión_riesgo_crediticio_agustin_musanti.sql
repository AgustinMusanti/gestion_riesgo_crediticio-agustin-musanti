    DROP   DATABASE IF EXISTS gestión_riesgo_crediticio;

    CREATE DATABASE gestión_riesgo_crediticio;

    USE gestión_riesgo_crediticio;

    CREATE TABLE  Clientes 
    (
     ID           INT            NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Nombre       VARCHAR(100)   NOT NULL
    ,Apellido     VARCHAR(100)   NOT NULL
    ,Telefono     VARCHAR(20)    NOT NULL  
    ,Correo       VARCHAR(100)   UNIQUE 
    ,Direccion    VARCHAR(255)   DEFAULT  'Sin información'
    )
	COMMENT "Esta tabla contiene toda la información personal relacionada a los clientes"
    ;

    
    CREATE TABLE   Cuentas 
    (
     ID            INT           NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Cliente_ID    INT
    ,Numero        VARCHAR(20)
    ,Tipo          VARCHAR(50)
    ,Saldo         DECIMAL(10,2)
    ,FechaApertura DATE
    )
	COMMENT "Esta tabla registra datos relacionados a las cuentas que poseen los clientes"
    ;
     
     
    CREATE TABLE   Transacciones 
    (
     ID            INT           NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Cuenta_ID     INT
    ,Tipo          VARCHAR(50)   DEFAULT 'Desconocido' 
    ,Monto         DECIMAL(10,2) DEFAULT 0.00 CHECK (Monto > 0)
    ,Fecha         DATE
    )
	COMMENT "En esta tabla se registran todas las transacciones que realiza el cliente con la institución financiera"
    ;
    
     
    CREATE TABLE   Prestamos 
    (
     ID            INT           NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Cliente_ID    INT
    ,Monto         DECIMAL(10,2) DEFAULT 0.00 CHECK (Monto > 0)
    ,TasaInteres   DECIMAL(5,2)
    ,Plazo         INT           DEFAULT 180 CHECK (Plazo >= 180)
    ,Estado        VARCHAR(50)   DEFAULT 'Activo'
    )
	COMMENT "Esta tabla registra los préstamos que puedan llegar a realizar los clientes con la institución financiera"
    ;
    
     
    CREATE TABLE   Pagos_Prestamos 
    (
     ID            INT           NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Prestamo_ID   INT
    ,Monto         DECIMAL(10,2) DEFAULT 0.00 CHECK (Monto > 0)
    ,Fecha         DATE
    )
	COMMENT "En esta tabla se registran los pagos de los préstamos por parte de los clientes"
    ;
     
     
    CREATE TABLE   Historial_Credito 
    (
     ID            INT           NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Cliente_ID    INT
    ,Puntaje       INT           DEFAULT 0 CHECK (Puntaje >= 0)
    ,Observaciones TEXT           
    )
	COMMENT "Esta tabla registra el historial crediticio que posee cada cliente"
    ;
   
     
    CREATE TABLE   Modelos_Riesgo 
    (
     ID            INT           NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Nombre        VARCHAR(100)
    ,Descripcion   TEXT
    ,Coeficientes  TEXT
    )
	COMMENT "Esta tabla es independiente de las demás, su finalidad es almacenar información sobre los modelos de riesgo que pueden ser utilizados"
    ;
     
   
    CREATE TABLE   Eventos_Riesgo 
    (
     ID            INT           NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Descripcion   TEXT
    ,Fecha         DATE
    )
	COMMENT "Esta tabla es independiente de las demás, su finalidad es almacenar información sobre los eventos de riesgo"
    ;
   
   
    ALTER TABLE Cuentas            ADD CONSTRAINT fk_cuen_clientes
    FOREIGN KEY (Cliente_ID)       REFERENCES Clientes(ID);
     
    ALTER TABLE Transacciones      ADD CONSTRAINT fk_trans_cuentas
    FOREIGN KEY (Cuenta_ID)        REFERENCES Cuentas(ID);
   
    ALTER TABLE Prestamos          ADD CONSTRAINT fk_pres_clientes
    FOREIGN KEY (Cliente_ID)       REFERENCES Clientes(ID);
     
    ALTER TABLE Pagos_Prestamos    ADD CONSTRAINT fk_pago_prestamos
    FOREIGN KEY (Prestamo_ID)      REFERENCES Prestamos(ID); 
   
    ALTER TABLE Historial_Credito  ADD CONSTRAINT fk_hist_clientes
    FOREIGN KEY (Cliente_ID)       REFERENCES Clientes(ID);