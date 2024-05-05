    INSERT INTO    Clientes (Nombre, Apellido, Telefono, Correo, Direccion) 
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


    INSERT INTO    Cuentas (Cliente_ID, Numero, Tipo, Saldo, FechaApertura) 
    VALUES
     (1, '1234', 'Corriente', 250.00, DEFAULT)
    ,(2, '9876', 'Ahorro', 2500.00, DEFAULT)
    ,(2, '4321', 'Corriente', 200.00, '2024-02-06')
    ,(3, '5678', 'Corriente', 150.00, '2023-08-16')
    ,(4, '1357', 'Ahorro', 1100.00, '2022-03-06')
    ,(5, '2468', 'Corriente', 2000.00, DEFAULT)
    ,(6, '3692', 'Ahorro', 2800.00, '2021-09-18')
    ,(7, '9861', 'Corriente', 2300.00, DEFAULT)
    ,(7, '7652', 'Ahorro', 7700.00, '2024-01-01')
    ,(8, '2679', 'Ahorro', 3400.00, '2024-02-05')
    ,(9, '5901', 'Corriente', 1800.00, DEFAULT)
    ,(10, '3579', 'Ahorro', 4000.00, '2024-01-03')
    ,(11, '8135', 'Ahorro', 2200.00, '2024-01-07')
    ,(11, '2679', 'Corriente', 1200.00, '2024-04-07')
    ,(12, '3694', 'Ahorro', 3400.00, DEFAULT)
    ,(13, '9542', 'Corriente', 2500.00, '2023-12-12')
    ,(14, '1119', 'Ahorro', 4200.00, '2023-06-06')
    ,(15, '2234', 'Corriente', 2000.00, '2024-01-21')
    ,(16, '1115', 'Corriente', -500.00, '2024-01-15')
    ,(17, '1116', 'Ahorro', -1000.00, '2023-11-01')
    ,(18, '1117', 'Corriente', -750.00, '2024-03-02');


    INSERT INTO    Transacciones (Cuentas_ID, Tipo, Monto, Fecha) 
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
    ,(16, 'Transferencia (Sobregiro)', 1500.00, DEFAULT)
    ,(17, 'Deposito', 2100.00, '2024-04-22')
    ,(17, 'Transferencia (Sobregiro)', 3100.00, '2024-04-23')
    ,(18, 'Deposito', 250.00, '2024-04-03')
    ,(18, 'Transferencia (Sobregiro)', 1000.00, '2024-04-10');
		   

    INSERT INTO    Prestamos (Cliente_ID, Monto, TasaInteres, Plazo, Estado) 
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


    INSERT INTO    Pagos_Prestamos (Prestamos_ID, Monto, Fecha) 
    VALUES
     (1, 1105.00, '2024-03-15')
    ,(2, 2165.00, DEFAULT)
    ,(5, 1105.00, '2024-03-17')
    ,(7, 1387.75, '2024-03-18')
    ,(9, 1284.00, '2024-03-19')
    ,(11, 1284.00, DEFAULT)
    ,(13, 2066.25, '2024-03-21');


    INSERT INTO    Historial_Credito (Cliente_ID, Puntaje, Observaciones) 
    VALUES
     (1, 8, 'Excelente')
    ,(2, 6, 'Regular')
    ,(3, 4, 'Malo')
    ,(4, 3, 'Malo')
    ,(5, 7, 'Regular')
    ,(6, 5, 'Regular')
    ,(7, 9, 'Excelente')
    ,(8, 6, 'Regular')
    ,(9, 8, 'Excelente')
    ,(10, 5, 'Regular')
    ,(11, 8, 'Excelente')
    ,(12, 6, 'Regular')
    ,(13, 9, 'Excelente')
    ,(14, 6, 'Regular')
    ,(15, 3, 'Malo');


    INSERT INTO    Modelos_Riesgo (Nombre, Descripcion, Coeficientes) 
    VALUES
     ('Modelo A', 'Descripcion del Modelo A', 'Coeficientes del Modelo A')
    ,('Modelo B', 'Descripcion del Modelo B', 'Coeficientes del Modelo B');


    INSERT INTO    Eventos_Riesgo (Descripcion, Fecha) 
    VALUES
     ('Actividad sospechosa de la cuenta', '2024-03-28')
    ,('Fraude con tarjetas de credito', '2024-02-14')
    ,('Incumplimiento de pagos de prestamos', '2024-04-02')
    ,('Cambios en el comportamiento de pago', '2024-03-30')
    ,('Cambios en el historial crediticio', '2024-04-14');
