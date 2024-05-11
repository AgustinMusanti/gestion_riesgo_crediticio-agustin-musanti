    USE                 Gestion_Riesgo_Crediticio;


    CREATE VIEW     VistaClientesSaldoNegativo 
    AS
    SELECT          c.Cliente_ID, c.Nombre, c.Apellido, cu.Saldo
    FROM            Clientes c
    JOIN            Cuentas cu ON c.Cliente_ID = cu.Cliente_ID
    WHERE           cu.Saldo < 0;



    CREATE VIEW     VistaTransaccionesRecientes 
    AS
    SELECT          Cuentas_ID, Tipo, Monto, Fecha
    FROM            Transacciones
    WHERE           Fecha >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);



    CREATE VIEW     VistaTransaccionesMontosAltos 
    AS
    SELECT          Cuentas_ID, Tipo, Monto, Fecha
    FROM            Transacciones
    WHERE           Monto > 3000;



    CREATE VIEW     VistaClientesHistorialCrediticioMalo 
    AS
    SELECT          c.Cliente_ID, c.Nombre, c.Apellido, hc.Puntaje
    FROM            Clientes c
    JOIN            Historial_Credito hc ON c.Cliente_ID = hc.Cliente_ID
    WHERE           hc.Puntaje < 5;



    CREATE VIEW     VistaDetallePrestamosActivos
    AS
    SELECT          p.Prestamos_ID, c.Nombre AS Cliente, p.Monto, p.TasaInteres, p.Plazo, p.Estado
    FROM            Prestamos p
    JOIN            Clientes c ON p.Cliente_ID = c.Cliente_ID
    WHERE           p.Estado = 'Activo';
