# Proyecto de Gestión del Riesgo Crediticio

En este proyecto desarrollé una base de datos para la gestión del riesgo crediticio, que incluye tablas para clientes, cuentas, préstamos, transacciones, historial de crédito, modelos de riesgo y eventos de riesgo. Además de las tablas principales, se crearon vistas, funciones, stored procedures y triggers para mejorar la funcionalidad y la automatización del sistema.
Este proyecto fue desarrollado para la entrega final del curso de SQL de Coderhouse.

## Contenido

- [Estructura de la Base de Datos](#estructura-de-la-base-de-datos)
- [Vistas](#vistas)
- [Funciones](#funciones)
- [Stored Procedures](#stored-procedures)
- [Triggers](#triggers)
- [Documentación](#documentacion-gestiondelriesgocrediticioconsql-agustinmusanti.pdf)

## Estructura de la Base de Datos

La base de datos está diseñada para gestionar la información relacionada con clientes, cuentas bancarias, préstamos, transacciones financieras, historial crediticio, modelos y eventos de riesgo. A continuación se detallan las principales tablas:

- **Clientes**: Contiene información personal de los clientes.
- **Cuentas**: Registra datos de las cuentas asociadas a los clientes.
- **Prestamos**: Almacena información sobre los préstamos otorgados a los clientes.
- **Transacciones**: Registra todas las transacciones financieras realizadas por los clientes.
- **Historial_Credito**: Guarda el historial crediticio de los clientes.
- **Modelos_Riesgo**: Contiene información sobre los modelos de riesgo utilizados.
- **Eventos_Riesgo**: Registra eventos de riesgo relevantes.

## Vistas

Se crearon vistas para proporcionar acceso simplificado a la información de la base de datos. Algunas vistas útiles incluyen:

- **VistaDetallePrestamos**: Muestra un resumen de los detalles de los prestamos.
- **VistaClientesSaldoNegativo**: Muestra a los clientes con saldos negativos.
- **VistaTransaccionesRecientes**: Muestra las transacciones realizadas en los últimos 30 días.
- **VistaTransaccionesMontosAltos**: Muestra las transacciones con montos superiores a $1000.
- **VistaClientesHistorialCrediticioMalo**: Muestra a los clientes con un historial crediticio considerado malo.

## Funciones

Se implementaron funciones para realizar cálculos y operaciones específicas en los datos de la base de datos. Algunas funciones importantes son:

- **FN_CalcularSaldoTotalPrestamos**: Calcula el saldo total de todos los prestamos activos que posee un cliente especifico.
- **FN_CalcularMontoTotalPagos**: Calcula el monto total de los pagos asociados a un préstamo.
- **FN_CalcularSaldoPromedioCliente**: Calcula el saldo promedio de todas las cuentas de un cliente.

## Stored Procedures

Se desarrollaron stored procedures para automatizar tareas recurrentes o complejas. Algunos ejemplos de stored procedures son:

- **SP_RegistrarPagoPrestamo**: Registra un pago para un préstamo específico.
- **SP_ActualizarEstadoPrestamo**: Actualiza el estado de un préstamo según su saldo pendiente.

## Triggers

Se utilizaron triggers para realizar acciones automáticamente cuando se modifican datos en la base de datos. Por ejemplo:

- **TR_ActualizarSaldoCuenta**: Actualiza el saldo total de una cuenta después de cada transacción.
- **TR_ValidarDatosPrestamo**: Valida que los valores insertados cumplan con las condiciones propuestas en la tabla.
- **TR_EliminarCliente**: Prohibie la eliminación de clientes de la base de datos.
- **TR_CrearCuentaClienteNuevo**: Cada vez que se registra un nuevo cliente, se registra una cuenta de "Ahorro" a su nombre.

Este README proporciona una visión general del proyecto y sus componentes principales. 
Para obtener más detalles sobre la implementación y el funcionamiento de cada elemento, consulte el código fuente en el repositorio.
