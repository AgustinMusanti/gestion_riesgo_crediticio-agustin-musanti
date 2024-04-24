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
    ,Monto              DECIMAL(10,2)  
    ,Fecha              DATE           DEFAULT (CURDATE())
    )
	COMMENT "En esta tabla se registran todas las transacciones que realiza el cliente con la institucion financiera"
    ;
    
     
    CREATE TABLE        Prestamos 
    (
     Prestamos_ID       INT            NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Cliente_ID         INT
    ,Monto              DECIMAL(10,2)  
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
    ,Monto              DECIMAL(10,2)  
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
    FOREIGN KEY (Cuentas_ID)           REFERENCES Cuentas(Cuentas_ID)
    ON DELETE                          CASCADE
    ON UPDATE                          CASCADE;
   
    ALTER TABLE Prestamos              ADD CONSTRAINT fk_pres_clientes
    FOREIGN KEY (Cliente_ID)           REFERENCES Clientes(Cliente_ID)
    ON DELETE                          CASCADE
    ON UPDATE                          CASCADE;
     
    ALTER TABLE Pagos_Prestamos        ADD CONSTRAINT fk_pago_prestamos
    FOREIGN KEY (Prestamos_ID)         REFERENCES Prestamos(Prestamos_ID)
    ON DELETE                          CASCADE
    ON UPDATE                          CASCADE;
   
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
    ,('Elena', 'Nunez', '90909090', 'elena@example.com', 'Calle Sur')
    ,('John', 'Doe', '555-1234', 'john@example.com', '123 Main St')
    ,('Emily', 'Smith', '555-5678', 'emily@example.com', '456 Elm St')
    ,('Michael', 'Johnson', '555-9876', 'michael@example.com', '789 Oak St');

    INSERT INTO Cuentas (Cliente_ID, Numero, Tipo, Saldo, FechaApertura) 
    VALUES
     (1, '123456789', 'Corriente', 250.00, DEFAULT)
    ,(2, '987654321', 'Ahorro', 2500.00, DEFAULT)
    ,(2, '987654321', 'Corriente', 200.00, '2024-02-06')
    ,(3, '567890123', 'Corriente', 150.00, '2023-08-16')
    ,(4, '135792468', 'Ahorro', 1100.00, '2022-03-06')
    ,(5, '246813579', 'Corriente', 2000.00, DEFAULT)
    ,(6, '369258147', 'Ahorro', 2800.00, '2021-09-18')
    ,(7, '987654321', 'Corriente', 2300.00, DEFAULT)
    ,(7, '987652821', 'Ahorro', 7700.00, '2024-01-01')
    ,(8, '123456789', 'Ahorro', 3400.00, '2024-02-05')
    ,(9, '567890123', 'Corriente', 1800.00, DEFAULT)
    ,(10, '135792468', 'Ahorro', 4000.00, '2024-01-03')
    ,(11, '246813579', 'Ahorro', 2200.00, '2024-01-07')
    ,(11, '246813579', 'Corriente', 1200.00, '2024-04-07')
    ,(12, '369258147', 'Ahorro', 3400.00, DEFAULT)
    ,(13, '987654321', 'Corriente', 2500.00, '2023-12-12')
    ,(14, '123456789', 'Ahorro', 4200.00, '2023-06-06')
    ,(15, '567890123', 'Corriente', 2000.00, '2024-01-21')
    ,(16, '123456789', 'Corriente', -500.00, '2024-01-15')
    ,(17, '987654321', 'Ahorro', -1000.00, '2023-11-01')
    ,(18, '555555555', 'Corriente', -750.00, '2024-03-02');

    INSERT INTO Transacciones (Cuentas_ID, Tipo, Monto, Fecha) 
    VALUES
     (1, 'Deposito', 500.00, '2024-03-01')
    ,(1, 'Retiro', -250.00, '2024-03-03')
    ,(2, 'Deposito', 2500.00, DEFAULT)
    ,(3, 'Transferencia', 150.00, '2024-03-03')
    ,(4, 'Deposito', 1100.00, '2024-03-04')
    ,(5, 'Deposito', 2300.00, '2024-03-02')
    ,(5, 'Retiro', -300.00, '2024-03-05')
    ,(6, 'Transferencia', 2800.00, '2024-03-06')
    ,(7, 'Deposito', 7700.00, DEFAULT)
    ,(8, 'Deposito', 3800.00, '2024-03-05')
    ,(8, 'Retiro', -400.00, '2024-03-08')
    ,(9, 'Transferencia', 1800.00, '2024-03-09')
    ,(10, 'Deposito', 4100.00, '2024-01-02')
    ,(10, 'Retiro', -100.00, '2024-01-05')
    ,(11, 'Deposito', 2700.00, '2024-04-28')
    ,(11, 'Retiro', -500.00, DEFAULT)
    ,(12, 'Transferencia', 3400.00, '2024-03-12')
    ,(13, 'Deposito', 2500.00, '2024-03-13')
    ,(14, 'Deposito', 4600.00, '2024-04-02')
    ,(14, 'Retiro', -400.00, DEFAULT)
    ,(15, 'Transferencia', 2000.00, '2024-03-15')
    ,(16, 'Deposito', 1000.00, '2024-04-26')
    ,(16, 'Transferencia Sobregiro', 1500.00, DEFAULT)
    ,(17, 'Deposito', 2100.00, '2024-04-22')
    ,(17, 'Transferencia Sobregiro', 3100.00, '2024-04-23')
    ,(18, 'Deposito', 250.00, '2024-04-03')
    ,(18, 'Transferencia Sobregiro', 1000.00, '2024-04-10');
		   

    INSERT INTO Prestamos (Cliente_ID, Monto, TasaInteres, Plazo, Estado) 
    VALUES
     (1, 850.00, 5.5, 180, DEFAULT)
    ,(1, 1000.00, 10.5, 360, 'Inactivo')
    ,(2, 2000.00, 8.25, 240, 'Inactivo')
    ,(2, 760.00, 6.0, 180, DEFAULT)
    ,(2, 1000, 7.5, 240, DEFAULT)
    ,(3, 1500.00, 9.75, 300, 'Activo')
    ,(4, 2500.00, 7.85, 180, DEFAULT)
    ,(5, 1800.00, 8.0, 240, DEFAULT)
    ,(5, 1000.00, 10.5, 360, 'Inactivo')
    ,(6, 2200.00, 9.25, 360, 'Activo')
    ,(7, 1300.00, 6.75, 300, 'Inactivo')
    ,(8, 3000.00, 7.5, 180, 'Activo')
    ,(9, 1700.00, 8.65, 240, DEFAULT)
    ,(9, 1200.00, 7.0, 300, 'Inactivo')
    ,(10, 2800.00, 9.0, 360, 'Activo')
    ,(11, 1200.00, 7.0, 300, 'Inactivo')
    ,(12, 2600.00, 8.35, 180, 'Activo')
    ,(13, 1900.00, 8.75, 240, 'Inactivo')
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

    INSERT INTO Historial_Credito (Cliente_ID, Puntaje, Observaciones) 
    VALUES
     (1, 750, 'Excelente')
    ,(2, 700, 'Regular')
    ,(3, 620, 'Malo')
    ,(4, 620, 'Malo')
    ,(5, 720, 'Regular')
    ,(6, 690, 'Regular')
    ,(7, 760, 'Excelente')
    ,(8, 720, 'Regular')
    ,(9, 750, 'Excelente')
    ,(10, 690, 'Regular')
    ,(11, 770, 'Excelente')
    ,(12, 710, 'Regular')
    ,(13, 800, 'Excelente')
    ,(14, 720, 'Regular')
    ,(15, 740, 'Regular');

    INSERT INTO Modelos_Riesgo (Nombre, Descripcion, Coeficientes) 
    VALUES
     ('Modelo A', 'Descripcion del Modelo A', 'Coeficientes del Modelo A')
    ,('Modelo B', 'Descripcion del Modelo B', 'Coeficientes del Modelo B');

    INSERT INTO Eventos_Riesgo (Descripcion, Fecha) 
    VALUES
     ('Actividad sospechosa de la cuenta', '2024-03-28')
    ,('Fraude con tarjetas de credito', '2024-02-14')
    ,('Incumplimiento de pagos de prestamos', '2024-04-02')
    ,('Cambios en el comportamiento de pago', '2024-03-30')
    ,('Cambios en el historial crediticio', '2024-04-14');
	    

   -- Creación de Vistas

    CREATE VIEW VistaClientesSaldoNegativo 
    AS
    SELECT      c.Cliente_ID, c.Nombre, c.Apellido, cu.Saldo
    FROM        Clientes c
    JOIN        Cuentas cu ON c.Cliente_ID = cu.Cliente_ID
    WHERE       cu.Saldo < 0;


    CREATE VIEW VistaTransaccionesRecientes 
    AS
    SELECT      Cuentas_ID, Tipo, Monto, Fecha
    FROM        Transacciones
    WHERE       Fecha >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);


    CREATE VIEW VistaTransaccionesMontosAltos 
    AS
    SELECT      Cuentas_ID, Tipo, Monto, Fecha
    FROM        Transacciones
    WHERE       Monto > 1000;


    CREATE VIEW VistaClientesHistorialCrediticioMalo 
    AS
    SELECT      c.Cliente_ID, c.Nombre, c.Apellido, hc.Puntaje
    FROM        Clientes c
    JOIN        Historial_Credito hc ON c.Cliente_ID = hc.Cliente_ID
    WHERE       hc.Puntaje < 690;


    CREATE VIEW VistaDetallePrestamos 
    AS
    SELECT      p.Prestamos_ID, c.Nombre AS Cliente, p.Monto, p.TasaInteres, p.Plazo, p.Estado
    FROM        Prestamos p
    JOIN        Clientes c ON p.Cliente_ID = c.Cliente_ID;

--  Funciones
   
    DELIMITER //

    CREATE FUNCTION FN_CalcularMontoTotalPagos(prestamoID INT) RETURNS DECIMAL(10, 2)
    READS SQL DATA
    BEGIN
    DECLARE         montoTotal DECIMAL(10, 2);

    SELECT          COALESCE(SUM(Monto), 0) INTO montoTotal
    FROM            Pagos_Prestamos
    WHERE           Prestamos_ID = prestamoID;

    IF              montoTotal IS NULL THEN
    SET             montoTotal = 0;
    END IF;

    RETURN          montoTotal;
    END //
    COMMENT         'Esta funcion calcula el monto total de los pagos asociados a un préstamo específico'
    DELIMITER ;


    DELIMITER //

    CREATE FUNCTION FN_CalcularSaldoPromedioCliente(clienteID INT) RETURNS DECIMAL(10, 2)
    READS SQL DATA
    BEGIN
    DECLARE         saldoPromedio DECIMAL(10, 2);

    SELECT          COALESCE(AVG(Saldo), 0) INTO saldoPromedio
    FROM            Cuentas
    WHERE           Cliente_ID = clienteID;

    RETURN          saldoPromedio;
    END //
    COMMENT         'Esta funcion calcula el saldo promedio de todas las cuentas asociadas a un cliente especifico'
    DELIMITER ;



    DELIMITER //

    CREATE FUNCTION FN_CalcularSaldoTotalPrestamos(clienteID INT) RETURNS DECIMAL(10, 2)
    READS SQL DATA
    BEGIN
    DECLARE         saldoTotal DECIMAL(10, 2);

    SELECT          COALESCE(SUM(Monto), 0) INTO saldoTotal
    FROM            Prestamos
    WHERE           Cliente_ID = clienteID AND Estado = 'Activo';

    RETURN          saldoTotal;
    END //
    COMMENT         'Esta funcion calcula el saldo total de todos los prestamos activos asociados a un cliente especifico'
    DELIMITER ;


    -- Stored Procedures

    DELIMITER //

    CREATE PROCEDURE SP_ActualizarEstadoPrestamo(IN prestamoID INT)
    BEGIN
    DECLARE          saldoPendiente DECIMAL(10, 2);
    DECLARE          estadoNuevo    VARCHAR(50);

    -- Calcular el saldo pendiente del prestamo
    SELECT           Monto - IFNULL((SELECT SUM(Monto) FROM Pagos_Prestamos WHERE Prestamos_ID = prestamoID), 0)
    INTO             saldoPendiente
    FROM             Prestamos
    WHERE            Prestamos_ID = prestamoID;

    -- Actualizar el estado del prestamo
    IF               saldoPendiente <= 0 THEN
    SET              estadoNuevo = 'Inactivo';
    ELSE
    SET              estadoNuevo = 'Activo';
    END IF;

    UPDATE           Prestamos SET Estado = estadoNuevo WHERE Prestamos_ID = prestamoID;
    END //
    COMMENT          'Este procedimiento almacenado actualiza el estado de un prestamo basado en su saldo pendiente'
    DELIMITER ;


   -- SP 2

    DELIMITER //

    CREATE PROCEDURE SP_RegistrarPagoPrestamo(
    IN               prestamoID INT,
    IN               monto DECIMAL(10, 2),
    IN               fecha DATE
    )
    BEGIN
    -- Insertar el nuevo pago de prestamo en la tabla Pagos_Prestamos
    INSERT INTO      Pagos_Prestamos (Prestamos_ID, Monto, Fecha)
    VALUES           (prestamoID, monto, fecha);

    -- Actualizar el estado del prestamo si corresponde
    CALL             SP_ActualizarEstadoPrestamo(prestamoID);
    END //
    COMMENT          'Este procedimiento almacenado registra un pago para un prestamo especifico.'
    DELIMITER ;


   -- Triggers
    DELIMITER //

    CREATE TRIGGER   ActualizarSaldoCuenta
    AFTER INSERT ON  Transacciones
    FOR EACH ROW
    BEGIN
    DECLARE          saldoActual DECIMAL(10, 2);
    
    -- Obtener el saldo actual de la cuenta
    SELECT           Saldo INTO saldoActual
    FROM             Cuentas
    WHERE            Cuentas_ID = NEW.Cuentas_ID;
    
    -- Verificar el tipo de transacción
    IF               NEW.Tipo = 'Retiro' THEN
    -- Restar el monto de la transacción al saldo de la cuenta
    UPDATE           Cuentas
    SET              Saldo = saldoActual - NEW.Monto
    WHERE            Cuentas_ID = NEW.Cuentas_ID;
    ELSE
    -- Sumar el monto de la transacción al saldo de la cuenta
    UPDATE           Cuentas
    SET              Saldo = saldoActual + NEW.Monto
    WHERE            Cuentas_ID = NEW.Cuentas_ID;
    END IF;
    END //

    DELIMITER ;

-- trigger 2

    DELIMITER //

    CREATE TRIGGER   ValidarDatosPrestamo
    BEFORE INSERT ON Prestamos
    FOR EACH ROW
    BEGIN
    IF               NEW.Monto <= 0 THEN
    SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'El monto del préstamo debe ser mayor que cero';
    END IF;

    IF               NEW.TasaInteres < 0 OR NEW.TasaInteres > 100 THEN
    SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'La tasa de interés debe estar entre 0 y 100';
    END IF;
    END//

    DELIMITER ;
