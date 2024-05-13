    USE               Gestion_Riesgo_Crediticio;


    DELIMITER //

    CREATE FUNCTION   FN_CalcularMontoTotalPagos
    (
    prestamoID INT
    ) 
    RETURNS           DECIMAL(10, 2)
    READS SQL DATA
    COMMENT           'Esta funcion calcula el monto total de los pagos asociados a un prestamo específico'    
    BEGIN
    DECLARE           montoTotal DECIMAL(10, 2);

    SELECT            COALESCE(SUM(Monto), 0) INTO montoTotal
    FROM              Pagos_Prestamos
    WHERE             Prestamos_ID = prestamoID;

    IF                montoTotal              IS NULL THEN
    SET               montoTotal = 0;
    END IF;

    RETURN            montoTotal;
    END //
   
    DELIMITER ;


    
    DELIMITER //

    CREATE FUNCTION   FN_CalcularSaldoPromedioCliente
    (
    clienteID INT
    ) 
    RETURNS           DECIMAL(10, 2)
    READS SQL DATA
    COMMENT           'Esta funcion calcula el saldo promedio de todas las cuentas asociadas a un cliente especifico'
    BEGIN
    DECLARE           saldoPromedio DECIMAL(10, 2);

    SELECT            COALESCE(AVG(Saldo), 0) INTO saldoPromedio
    FROM              Cuentas
    WHERE             Cliente_ID = clienteID;

    RETURN            saldoPromedio;
    END //
    DELIMITER ;



    DELIMITER //

    CREATE FUNCTION   FN_CalcularSaldoTotalPrestamos
    (
    clienteID INT
    ) 
    RETURNS           DECIMAL(10, 2)
    READS SQL DATA
    COMMENT           'Esta funcion calcula el saldo total de todos los prestamos activos asociados a un cliente especifico'
    BEGIN
    DECLARE           saldoTotal DECIMAL(10, 2);

    SELECT            COALESCE(SUM(Monto), 0) INTO saldoTotal
    FROM              Prestamos
    WHERE             Cliente_ID = clienteID  AND Estado = 'Activo';

    RETURN            saldoTotal;
    END //
    
    DELIMITER ;
