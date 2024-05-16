<img src="https://blogs.upc.edu.pe/vida-universitaria/wp-content/uploads/sites/21/2023/01/cabecera-coderhouse.png" style="width: 100% ; aspect-ratio:16/9">

# Entrega final - Curso SQL Coderhouse


@Alumno:   Agustin Musanti

@Comision: 53180

@Profesor: Anderson Michel Ocaña Torres

@Tutores:   Carla Palermo - Santiago Angel Gonzalez


## Introducción

Este proyecto fue desarrollado en el marco del curso de SQL impartido por Coderhouse. Durante el curso, aprendimos a implementar los distintos componentes del lenguaje SQL, incluyendo **DCL** (_Data Control Language_), **DML** (_Data Manipulation Language_), **DDL** (_Data Definition Language_) y **TCL** (_Transaction Control Language_).

En este README, se proporcionará una visión general del proyecto y de todos sus componentes. Se detallarán las funciones, triggers, vistas, procedimientos almacenados y demás implementaciones para ayudar a comprender la estructura de la base de datos y el por qué de su implementación y utilidad.
Este proyecto no solo muestra la aplicación práctica de SQL, sino también cómo una base de datos bien diseñada puede servir como una herramienta poderosa para la toma de decisiones estratégicas y operativas..


## Contenido

- [Estructura de la base de datos](https://github.com/agustinmusanti/gestion_riesgo_crediticio-agustin-musanti/blob/main/structure/database_structure.sql)
- [Inserción de datos](https://github.com/agustinmusanti/gestion_riesgo_crediticio-agustin-musanti/blob/main/structure/population.sql)
- [Vistas](https://github.com/agustinmusanti/gestion_riesgo_crediticio-agustin-musanti/blob/main/objects/views.sql)
- [Funciones](https://github.com/agustinmusanti/gestion_riesgo_crediticio-agustin-musanti/blob/main/objects/functions.sql)
- [Stored Procedures](https://github.com/agustinmusanti/gestion_riesgo_crediticio-agustin-musanti/blob/main/objects/stored_procedures.sql)
- [Triggers](https://github.com/agustinmusanti/gestion_riesgo_crediticio-agustin-musanti/blob/main/objects/triggers.sql)
- [Backup](https://github.com/agustinmusanti/gestion_riesgo_crediticio-agustin-musanti/blob/main/backup/backup.md)
- [Glosario](https://github.com/agustinmusanti/gestion_riesgo_crediticio-agustin-musanti/blob/main/documentation/glossary.pdf)
- [Documentación](https://github.com/agustinmusanti/gestion_riesgo_crediticio-agustin-musanti/blob/main/documentation/documentation.pdf)

## Temática del proyecto

Este proyecto se centra en la **Gestión del Riesgo Crediticio en instituciones financieras**. A través de la implementación de una base de datos en MySQL, el proyecto busca ofrecer una solución integral para almacenar, procesar y analizar la información financiera de los clientes.
En esencia, este proyecto proporciona una base de datos robusta y eficiente para la gestión del riesgo crediticio, permitiendo a las instituciones financieras optimizar sus procesos de evaluación y seguimiento, y reducir la exposición a riesgos financieros.

## Modelo de Negocio

### Gestión de Clientes
La base de datos debe permitir registrar y gestionar la información de los clientes, incluyendo datos personales como nombre, dirección, contacto y detalles financieros. Esto es crucial para evaluar el riesgo crediticio y tomar decisiones informadas sobre la concesión de préstamos y otros productos financieros.

### Gestión de Cuentas
Es fundamental llevar un registro detallado de las cuentas de los clientes, que incluya el tipo de cuenta (ahorros, corriente, etc.), el saldo actual y la fecha de apertura. La base de datos debe facilitar la creación automática de cuentas de ahorro para nuevos clientes y la actualización de saldos en función de las transacciones realizadas.

### Gestión de Préstamos
La base de datos debe gestionar información detallada sobre los préstamos otorgados, incluyendo el monto del préstamo, la tasa de interés, el plazo, el estado del préstamo (activo o inactivo) y la fecha (en caso de que el préstamo haya sido pagado). Esto permitirá evaluar el rendimiento de los préstamos y gestionar el riesgo de impagos.

### Registro de Transacciones
Es esencial tener un registro detallado de todas las transacciones realizadas por los clientes, incluyendo depósitos, retiros y pagos de préstamos. La base de datos debe actualizar automáticamente el saldo de las cuentas en función de estas transacciones y validar la integridad de los datos ingresados.

### Evaluación del Riesgo Crediticio
La base de datos debe almacenar y gestionar el puntaje crediticio de los clientes y monitorear los clientes con historial crediticio considerado malo para brindar el seguimiento adecuado.

### Monitorización de Cuentas con Saldo Negativo
La base de datos debe permitir la identificación rápida de cuentas con saldo negativo, ayudando a los departamentos de riesgo a tomar medidas preventivas o correctivas.

### Generación de Informes
La base de datos debe soportar la generación de informes detallados sobre la situación financiera de los clientes, el estado de los préstamos y el riesgo crediticio general. Estos informes son cruciales para la toma de decisiones estratégicas y operativas.


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

## Como levantar el proyecto en CodeSpaces GitHub
* env: Archivo con contraseñas y data secretas
* Makefile: Abstracción de creacción del proyecto
* docker-compose.yml: Permite generar las bases de datos en forma de contenedores

#### Pasos para arrancar el proyecto

* En la terminal de linux escribir :
    - `make` _si te da un error de que no existe conexion al socket, volver al correr el comando `make`_
    - `make clean-db` limpiar la base de datos
    - `make test-db` para mirar los datos de cada tabla
    - `make backup-db` para realizar un backup de mi base de datos
    - `make access-db` para acceder a la base de datos
