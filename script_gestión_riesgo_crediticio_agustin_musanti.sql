    DROP   DATABASE IF EXISTS Gestion_Riesgo_Crediticio;

    CREATE DATABASE Gestion_Riesgo_Crediticio;

    USE Gestion_Riesgo_Crediticio;

    CREATE TABLE        Clientes 
    (
     Cliente_ID         INT            NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Nombre             VARCHAR(100)   NOT NULL
    ,Apellido           VARCHAR(100)   NOT NULL
    ,Telefono           VARCHAR(20)    NOT NULL  
    ,Correo             VARCHAR(100)   UNIQUE 
    ,Direccion          VARCHAR(255)   DEFAULT  'Sin informacion'
    )
	COMMENT "Esta tabla contiene toda la informacion personal relacionada a los clientes"
    ;

    
    CREATE TABLE        Cuentas 
    (
     Cuentas_ID         INT            NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Cliente_ID         INT
    ,Numero             VARCHAR(20)
    ,Tipo               VARCHAR(50)
    ,Saldo              DECIMAL(10,2)
    ,FechaApertura      DATE           DEFAULT (CURDATE())
    )
	COMMENT "Esta tabla registra datos relacionados a las cuentas que poseen los clientes"
    ;
     
     
    CREATE TABLE        Transacciones 
    (
     Transacciones_ID   INT            NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Cuentas_ID         INT
    ,Tipo               VARCHAR(50)    DEFAULT 'Desconocido' 
    ,Monto              DECIMAL(10,2)  DEFAULT 0.00 CHECK (Monto > 0)
    ,Fecha              DATE           DEFAULT (CURDATE())
    )
	COMMENT "En esta tabla se registran todas las transacciones que realiza el cliente con la institucion financiera"
    ;
    
     
    CREATE TABLE        Prestamos 
    (
     Prestamos_ID       INT            NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Cliente_ID         INT
    ,Monto              DECIMAL(10,2)  DEFAULT 0.00 CHECK (Monto > 0)
    ,TasaInteres        DECIMAL(5,2)
    ,Plazo              INT            DEFAULT 180  CHECK (Plazo >= 180)
    ,Estado             VARCHAR(50)    DEFAULT 'Activo'
    )
	COMMENT "Esta tabla registra los prestamos que puedan llegar a realizar los clientes con la institucion financiera"
    ;
    
     
    CREATE TABLE        Pagos_Prestamos 
    (
     Pagos_Prest_ID     INT            NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Prestamos_ID       INT
    ,Monto              DECIMAL(10,2)  DEFAULT 0.00 CHECK (Monto > 0)
    ,Fecha              DATE           DEFAULT (CURDATE())
    )
	COMMENT "En esta tabla se registran los pagos de los prestamos por parte de los clientes"
    ;
     
     
    CREATE TABLE        Historial_Credito 
    (
     Hist_Credito_ID    INT            NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Cliente_ID         INT
    ,Puntaje            INT            DEFAULT 0 CHECK (Puntaje >= 0)
    ,Observaciones      TEXT           
    )
	COMMENT "Esta tabla registra el historial crediticio que posee cada cliente"
    ;
   
     
    CREATE TABLE        Modelos_Riesgo 
    (
     Mod_Riesgo_ID      INT            NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Nombre             VARCHAR(100)
    ,Descripcion        TEXT
    ,Coeficientes       TEXT
    )
	COMMENT "Esta tabla es independiente de las demas, su finalidad es almacenar informacion sobre los modelos de riesgo que pueden ser utilizados"
    ;
     
   
    CREATE TABLE        Eventos_Riesgo 
    (
     Even_Riesgo_ID     INT            NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Descripcion        TEXT
    ,Fecha              DATE           DEFAULT (CURDATE())
    )
	COMMENT "Esta tabla es independiente de las demas, su finalidad es almacenar informacion sobre los eventos de riesgo"
    ;
   
   
    ALTER TABLE Cuentas                ADD CONSTRAINT fk_cuen_clientes
    FOREIGN KEY (Cliente_ID)           REFERENCES Clientes(Cliente_ID);
     
    ALTER TABLE Transacciones          ADD CONSTRAINT fk_trans_cuentas
    FOREIGN KEY (Cuentas_ID)           REFERENCES Cuentas(Cuentas_ID);
   
    ALTER TABLE Prestamos              ADD CONSTRAINT fk_pres_clientes
    FOREIGN KEY (Cliente_ID)           REFERENCES Clientes(Cliente_ID);
     
    ALTER TABLE Pagos_Prestamos        ADD CONSTRAINT fk_pago_prestamos
    FOREIGN KEY (Prestamos_ID)         REFERENCES Prestamos(Prestamos_ID); 
   
    ALTER TABLE Historial_Credito      ADD CONSTRAINT fk_hist_clientes
    FOREIGN KEY (Cliente_ID)           REFERENCES Clientes(Cliente_ID);

    INSERT INTO Clientes (Nombre, Apellido, Telefono, Correo, Direccion) 
    VALUES 
	     ('Juan', 'Garcia', '123456789', 'juan@example.com', 'Calle 123')
            ,('Maria', 'Lopez', '987654321', 'maria@example.com', 'Avenida 456')
            ,('Pedro', 'Martinez', '55555555', 'pedro@example.com', DEFAULT)
            ,('Laura', 'Rodriguez', '33333333', 'laura@example.com', 'Calle Principal')
            ,('Carlos', 'Gomez', '66666666', 'carlos@example.com', 'Avenida Central')
            ,('Ana', 'Perez', '44444444', 'ana@example.com', 'Calle Secundaria')
            ,('Luis', 'Sanchez', '77777777', 'luis@example.com', DEFAULT)
            ,('Sofia', 'Diaz', '99999999', 'sofia@example.com', 'Calle Sur')
            ,('Diego', 'Hernandez', '22222222', 'diego@example.com', 'Avenida Este')
            ,('Fernanda', 'Torres', '88888888', 'fernanda@example.com', 'Calle Oeste')
            ,('Roberto', 'Alvarez', '12121212', 'roberto@example.com', 'Avenida Central')
            ,('Julia', 'Gutierrez', '34343434', 'julia@example.com', DEFAULT)
            ,('Miguel', 'Flores', '56565656', 'miguel@example.com', 'Calle Secundaria')
            ,('Valeria', 'Romero', '78787878', 'valeria@example.com', 'Avenida Norte')
            ,('Elena', 'Nunez', '90909090', 'elena@example.com', 'Calle Sur');

    INSERT INTO Cuentas (Cliente_ID, Numero, Tipo, Saldo, FechaApertura) 
    VALUES
            (1, '123456789', 'Corriente', 1500.00, DEFAULT)
           ,(1, '123423229', 'Ahorro', 15890.00, '2024-01-02')
	   ,(2, '987654321', 'Ahorro', 2500.00, DEFAULT)
           ,(3, '567890123', 'Corriente', 1800.00, '2023-08-16')
           ,(4, '135792468', 'Ahorro', 3000.00, '2022-03-06')
           ,(5, '246813579', 'Corriente', 2000.00, DEFAULT)
           ,(6, '369258147', 'Ahorro', 2800.00, '2021-09-18')
           ,(7, '987654321', 'Corriente', 2300.00, DEFAULT)
           ,(7, '987652821', 'Ahorro', 7700.00, '2024-01-01')
           ,(8, '123456789', 'Ahorro', 3200.00, '2024-02-05')
           ,(9, '567890123', 'Corriente', 1800.00, DEFAULT)
           ,(10, '135792468', 'Ahorro', 4000.00, '2024-01-03')
           ,(11, '246813579', 'Corriente', 2200.00, '2024-01-07')
           ,(12, '369258147', 'Ahorro', 3400.00, DEFAULT)
           ,(13, '987654321', 'Corriente', 2500.00, '2023-12-12')
           ,(14, '123456789', 'Ahorro', 3700.00, '2023-06-06')
           ,(15, '567890123', 'Corriente', 2000.00, '2024-01-21');

    INSERT INTO Transacciones (Cuentas_ID, Tipo, Monto, Fecha) 
    VALUES
            (1, 'Depósito', 500.00, '2024-03-01')
           ,(1, 'Retiro', 250.00, '2024-03-03')
           ,(2, 'Retiro', 200.00, DEFAULT)
           ,(3, 'Transferencia', 150.00, '2024-03-03')
           ,(4, 'Depósito', 1000.00, '2024-03-04')
           ,(5, 'Retiro', 300.00, '2024-03-05')
           ,(6, 'Transferencia', 200.00, '2024-03-06')
           ,(7, 'Depósito', 700.00, DEFAULT)
           ,(8, 'Retiro', 400.00, '2024-03-08')
           ,(9, 'Transferencia', 250.00, '2024-03-09')
           ,(10, 'Depósito', 1200.00, '2024-01-02')
           ,(10, 'Retiro', 100.00, '2024-01-05')
           ,(11, 'Retiro', 500.00, DEFAULT)
           ,(12, 'Transferencia', 300.00, '2024-03-12')
           ,(13, 'Depósito', 800.00, '2024-03-13')
           ,(14, 'Retiro', 600.00, DEFAULT)
           ,(15, 'Transferencia', 350.00, '2024-03-15');

    INSERT INTO Prestamos (Cliente_ID, Monto, TasaInteres, Plazo, Estado) 
    VALUES
            (1, 1000.00, 10.5, 360, DEFAULT)
           ,(2, 2000.00, 8.25, 240, 'Activo')
           ,(3, 1500.00, 9.75, 300, 'Activo')
           ,(4, 2500.00, 7.85, 180, 'Activo')
           ,(5, 1800.00, 8.0, 240, DEFAULT)
           ,(5, 1000.00, 10.5, 360, 'Inactivo')
           ,(6, 2200.00, 9.25, 360, 'Activo')
           ,(7, 1300.00, 6.75, 300, 'Activo')
           ,(8, 3000.00, 7.5, 180, 'Activo')
           ,(9, 1700.00, 8.65, 240, DEFAULT)
           ,(9, 1200.00, 7.0, 300, 'Inactivo')
           ,(10, 2800.00, 9.0, 360, 'Activo')
           ,(11, 1200.00, 7.0, 300, 'Activo')
           ,(12, 2600.00, 8.35, 180, 'Activo')
           ,(13, 1900.00, 8.75, 240, DEFAULT)
           ,(14, 2300.00, 9.15, 360, 'Activo')
           ,(15, 1400.00, 6.5, 300, 'Activo');

    INSERT INTO Pagos_Prestamos (Prestamos_ID, Monto, Fecha) 
    VALUES
            (1, 1105.00, '2024-03-15')
           ,(2, 2165.00, DEFAULT)
           ,(5, 1105.00, '2024-03-17')
           ,(7, 1387.75, '2024-03-18')
           ,(9, 1284.00, '2024-03-19')
           ,(11, 1284.00, DEFAULT)
           ,(13, 2066.25, '2024-03-21');
