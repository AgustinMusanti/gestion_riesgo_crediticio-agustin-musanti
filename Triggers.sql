    DELIMITER //

    CREATE TRIGGER     TR_ActualizarSaldoCuenta
    AFTER INSERT ON    Transacciones
    FOR EACH ROW
    BEGIN
    DECLARE            saldoActual DECIMAL(10, 2);
    
    -- Primero obtengo el saldo actual de la cuenta
    SELECT             Saldo INTO saldoActual
    FROM               Cuentas
    WHERE              Cuentas_ID = NEW.Cuentas_ID;
    
    -- Luego verifico el tipo de transaccion
    IF                 NEW.Tipo = 'Retiro' THEN
    -- Resto el monto de la transaccion en caso de que se trate de un "Retiro"
    UPDATE             Cuentas
    SET                Saldo = saldoActual - NEW.Monto
    WHERE              Cuentas_ID = NEW.Cuentas_ID;
    ELSE
    -- Sumo el monto de la transaccion al saldo de la cuenta en caso que sea otro tipo de transaccion
    UPDATE             Cuentas
    SET                Saldo = saldoActual + NEW.Monto
    WHERE              Cuentas_ID = NEW.Cuentas_ID;
    END IF;
    END //

    DELIMITER ;

    

    DELIMITER //

    CREATE TRIGGER     TR_ValidarDatosPrestamo
    BEFORE INSERT ON   Prestamos
    FOR EACH ROW
    BEGIN
    IF                 NEW.Monto <= 0 THEN
    SIGNAL SQLSTATE    '45000' SET MESSAGE_TEXT = 'El monto del prestamo debe ser mayor que cero';
    END IF;

    IF                 NEW.TasaInteres < 0 OR NEW.TasaInteres > 100 THEN
    SIGNAL SQLSTATE    '45000' SET MESSAGE_TEXT = 'La tasa de interes debe estar entre 0 y 100';
    END IF;
    END//

    DELIMITER ;

    

    DELIMITER //

    CREATE TRIGGER     TR_EliminarCliente
    BEFORE DELETE ON   Clientes
    FOR EACH ROW
    BEGIN
    -- Genero un error personalizado
    SIGNAL SQLSTATE    '45000' SET MESSAGE_TEXT = 'No se permite eliminar clientes.';
    END //

    DELIMITER ;



    DELIMITER //

    CREATE TRIGGER     TR_CrearCuentaClienteNuevo
    AFTER INSERT ON    Clientes
    FOR EACH ROW
    BEGIN
    DECLARE            cuenta_existente INT;
    DECLARE            nuevo_numero INT;
    
    -- Verifico si hay cuentas existentes para el cliente recien insertado
    SELECT COUNT(*)    INTO cuenta_existente
    FROM               Cuentas
    WHERE              Cliente_ID = NEW.Cliente_ID;
    
    -- Si no hay cuentas existentes para el cliente, insertamos una nueva cuenta 
    IF                 cuenta_existente = 0 THEN
    -- Genero un numero de cuenta de 4 digitos, que sea unico
    REPEAT
    SET                nuevo_numero = FLOOR(RAND() * 9000) + 1000;
    UNTIL NOT EXISTS (SELECT 1 FROM Cuentas WHERE Numero = nuevo_numero) END REPEAT;
        
    -- Inserto la nueva cuenta con el numero de cuenta generado
    INSERT INTO        Cuentas (Cliente_ID, Numero, Tipo, Saldo, FechaApertura)
    VALUES             (NEW.Cliente_ID, nuevo_numero, 'Ahorro', 0, NOW());
    END IF;
    END //

    DELIMITER ;
