<img src="https://blogs.upc.edu.pe/vida-universitaria/wp-content/uploads/sites/21/2023/01/cabecera-coderhouse.png" style="width: 100% ; aspect-ratio:16/9">

# Entrega final - Curso SQL Coderhouse


@Alumno:   Agustin Musanti

@Comision: 53180

@Profesor: Anderson Michel Ocaña Torres

@Tutores:   Carla Palermo - Santiago Angel Gonzalez


## Introducción

Este proyecto tiene como objetivo desarrollar una base de datos en MySQL diseñada para ayudar a las instituciones financieras a evaluar y gestionar el riesgo asociado con sus clientes en base a las transacciones que efectuan y a los préstamos que son otorgados a los mismos. 
La base de datos proporcionará una estructura sólida para almacenar información relevante sobre clientes, transacciones, préstamos y otros aspectos clave relacionados con la evaluación del riesgo crediticio.


## Contenido

- [Estructura completa de la base de datos](https://github.com/agustinmusanti/gestion_riesgo_crediticio-agustin-musanti/blob/main/Structure/Database%20Structure.sql)
- [Inserción de datos](https://github.com/agustinmusanti/gestion_riesgo_crediticio-agustin-musanti/blob/main/Structure/Population.sql)
- [Vistas](https://github.com/agustinmusanti/gestion_riesgo_crediticio-agustin-musanti/blob/main/Objects/Views.sql)
- [Funciones](https://github.com/agustinmusanti/gestion_riesgo_crediticio-agustin-musanti/blob/main/Objects/Functions.sql)
- [Stored Procedures](https://github.com/agustinmusanti/gestion_riesgo_crediticio-agustin-musanti/blob/main/Objects/Stored%20Procedures.sql)
- [Triggers](https://github.com/agustinmusanti/gestion_riesgo_crediticio-agustin-musanti/blob/main/Objects/Triggers.sql)
- [Glosario](https://github.com/agustinmusanti/gestion_riesgo_crediticio-agustin-musanti/blob/main/Documentation/Glossary.pdf)
- [Documentación](https://github.com/agustinmusanti/gestion_riesgo_crediticio-agustin-musanti/blob/main/Documentation/Documentation.pdf)



Este README proporciona una visión general del proyecto y sus componentes principales. 
Para obtener más detalles sobre la implementación y el funcionamiento de cada elemento, consulte el código fuente, la documentación y/o el glosario en el repositorio.


## Estructura de la Base de Datos

La base de datos está diseñada para gestionar la información relacionada con clientes, cuentas bancarias, préstamos, transacciones financieras, historial crediticio, modelos y eventos de riesgo. 
A continuación se detallan las principales tablas:

- **Clientes**: Contiene información personal de los clientes.
- **Cuentas**: Registra datos de las cuentas asociadas a los clientes.
- **Prestamos**: Almacena información sobre los préstamos otorgados a los clientes.
- **Transacciones**: Registra todas las transacciones financieras realizadas por los clientes.
- **Historial_Credito**: Guarda el historial crediticio de los clientes.
- **Modelos_Riesgo**: Contiene información sobre los modelos de riesgo utilizados.
- **Eventos_Riesgo**: Registra eventos de riesgo relevantes.

## Vistas

Se crearon vistas para proporcionar acceso simplificado a la información de la base de datos. 
Algunas vistas útiles incluyen:

- **VistaDetallePrestamosActivos**: Muestra un resumen de los detalles de los prestamos que se encuentran activos.
- **VistaClientesSaldoNegativo**: Muestra a los clientes con saldos negativos.
- **VistaTransaccionesRecientes**: Muestra las transacciones realizadas en los últimos 30 días.
- **VistaTransaccionesMontosAltos**: Muestra las transacciones con montos superiores a $3.000.
- **VistaClientesHistorialCrediticioMalo**: Muestra a los clientes con un historial crediticio considerado malo.

## Funciones

Se implementaron funciones para realizar cálculos y operaciones específicas en los datos de la base de datos. 
Algunas funciones importantes son:

- **FN_CalcularSaldoTotalPrestamos**: Calcula el saldo total de todos los prestamos activos que posee un cliente especifico.
- **FN_CalcularMontoTotalPagos**: Calcula el monto total de los pagos asociados a un préstamo.
- **FN_CalcularSaldoPromedioCliente**: Calcula el saldo promedio de todas las cuentas de un cliente.

## Stored Procedures

Se desarrollaron stored procedures para automatizar tareas recurrentes o complejas. 
Algunos ejemplos de stored procedures son:

- **SP_RegistrarPagoPrestamo**: Registra un pago para un préstamo específico.
- **SP_ActualizarEstadoPrestamo**: Actualiza el estado de un préstamo según su saldo pendiente.

## Triggers

Se utilizaron triggers para realizar acciones automáticamente cuando se modifican datos en la base de datos. 
Por ejemplo:

- **TR_ActualizarSaldoCuenta**: Actualiza el saldo total de una cuenta después de cada transacción.
- **TR_ValidarDatosPrestamo**: Valida que los valores insertados cumplan con las condiciones propuestas en la tabla.
- **TR_EliminarCliente**: Prohibie la eliminación de clientes de la base de datos.
- **TR_CrearCuentaClienteNuevo**: Cada vez que se registra un nuevo cliente, se registra una cuenta de "Ahorro" a su nombre.

Este README proporciona una visión general del proyecto y sus componentes principales. 
Para obtener más detalles sobre la implementación y el funcionamiento de cada elemento, consulte el código fuente y/o la documentación en el repositorio.
