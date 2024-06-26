    USE                Gestion_Riesgo_Crediticio;


    DELIMITER //

    CREATE PROCEDURE   SP_ActualizarEstadoPrestamo
    (
    IN                 prestamoID INT
    )
    COMMENT            'Este procedimiento almacenado actualiza el estado del prestamo cuando se efectua un pago.'
    BEGIN
    DECLARE            saldoPendiente DECIMAL(10, 2);
    DECLARE            estadoNuevo    VARCHAR(50);

    -- Calculo el saldo pendiente del prestamo
    SELECT             Monto - IFNULL((SELECT SUM(Monto) FROM Pagos_Prestamos WHERE Prestamos_ID = prestamoID), 0)
    INTO               saldoPendiente
    FROM               Prestamos
    WHERE              Prestamos_ID = prestamoID;

    -- Actualizo el estado del prestamo
    IF                 saldoPendiente <= 0 THEN
    SET                estadoNuevo = 'Inactivo';
    ELSE
    SET                estadoNuevo = 'Activo';
    END IF;

    UPDATE             Prestamos SET Estado = estadoNuevo WHERE Prestamos_ID = prestamoID;
    END //
    DELIMITER ;



    DELIMITER //

    CREATE PROCEDURE   SP_RegistrarPagoPrestamo
    (
    IN                 prestamoID INT,
    IN                 monto      DECIMAL(10, 2),
    IN                 fecha      DATE
    )
    COMMENT            'Este procedimiento almacenado registra un pago para un prestamo especifico.'
    BEGIN
    -- Inserto el nuevo pago de prestamo en la tabla Pagos_Prestamos
    INSERT INTO        Pagos_Prestamos (Prestamos_ID, Monto, Fecha)
    VALUES             (prestamoID, monto, fecha);

    -- Actualizo el estado del prestamo en caso de que corresponda
    CALL               SP_ActualizarEstadoPrestamo
    (prestamoID);
    END //
    DELIMITER ;
