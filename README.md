![Portada](https://private-user-images.githubusercontent.com/138232526/331028667-5a7fbd6f-c44b-4886-bdea-45c2daf8d533.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MTU4Mjc4MjksIm5iZiI6MTcxNTgyNzUyOSwicGF0aCI6Ii8xMzgyMzI1MjYvMzMxMDI4NjY3LTVhN2ZiZDZmLWM0NGItNDg4Ni1iZGVhLTQ1YzJkYWY4ZDUzMy5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwNTE2JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDUxNlQwMjQ1MjlaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1kYzc0ODhkMWY4ZTQ2ZTc5OGMxYjdiYmQ4M2ZlNWUwZDYzN2NjNzBkZWFhOWUxNTkzNGQ4YTYxM2NhODk4NmM0JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.ruZCt_H7Ty9UiMFlcObmanrpl62Ud5G5zdNrOPNWsKU)

# Entrega final - Curso SQL Coderhouse


**@Alumno:**   Agustin Musanti

**@Comision:** 53180

**@Profesor:** Anderson Michel Ocaña Torres

**@Tutores:**   Carla Palermo - Santiago Angel Gonzalez



## Introducción

Este proyecto fue desarrollado en el marco del curso de SQL impartido por Coderhouse. Durante el curso, aprendimos a implementar los distintos componentes del lenguaje SQL, incluyendo **DCL** (_Data Control Language_), **DML** (_Data Manipulation Language_), **DDL** (_Data Definition Language_) y **TCL** (_Transaction Control Language_).

En este README se detallarán las tablas, funciones, triggers, vistas, procedimientos almacenados y demás componentes para ayudar a comprender la estructura de la base de datos, el por qué de su implementación y cuál es su utilidad.

Este proyecto no solo muestra la aplicación práctica de SQL, sino también cómo una base de datos bien diseñada puede servir como una herramienta poderosa para la toma de decisiones estratégicas y operativas.


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


## Diagrama Entidad-Relación (DER)

![DER](https://private-user-images.githubusercontent.com/138232526/331025784-387e87a3-04f5-4e88-9704-de27f127e2eb.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MTU4MjczNjIsIm5iZiI6MTcxNTgyNzA2MiwicGF0aCI6Ii8xMzgyMzI1MjYvMzMxMDI1Nzg0LTM4N2U4N2EzLTA0ZjUtNGU4OC05NzA0LWRlMjdmMTI3ZTJlYi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwNTE2JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDUxNlQwMjM3NDJaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT00OTU1ODZkODg1OWYyMWM0ZGEwYWFhY2IzNzBmZGRjOWJkOTk4MDFhMWE3MzgzZjc0ZTNhMGMzNzlkZjU1NDVmJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.TDOwhMH59RTNxhRWJTQUztG1ePIW7yixW0PuzV455cE)


## Listado de tablas y descripción

### Tabla Clientes

Esta tabla contiene información personal de los clientes como sus nombres, la dirección de sus domicilios, correo electrónico, número de teléfono, entre otros.

| **_Abreviatura_** | **_Nombre Completo_** |      **_Tipo de Datos_**      | **_Tipo de Clave_** |
|:---------------:|:-------------------:|:---------------------------:|:-----------------:|
|    Cliente_ID   |    ID del cliente   | INT NOT NULL AUTO_INCREMENT |   Clave Primaria  |
|      Nombre     |        Nombre       |         VARCHAR(100)        |         -         |
|     Apellido    |       Apellido      |         VARCHAR(100)        |         -         |
|    Direccion    |      Dirección      |         VARCHAR(255)        |         -         |
|     Telefono    |       Teléfono      |         VARCHAR(20)         |         -         |
|      Correo     |  Correo Electrónico |         VARCHAR(100)        |         -         |


### Tabla Cuentas

Esta tabla almacena detalles sobre las cuentas que los clientes poseen con la institución financiera como el número de cuenta, tipo de cuenta (corriente o de ahorro), saldo, fecha de apertura, entre otros.

| **_Abreviatura_** | **_Nombre Completo_** |     **_Tipo de Datos_**     | **_Tipo de Clave_** |
|:-----------------:|:---------------------:|:---------------------------:|:-------------------:|
|     Cuentas_ID    |   ID de las cuentas   | INT NOT NULL AUTO_INCREMENT |    Clave Primaria   |
|     Cliente_ID    |     ID del Cliente    |             INT             |    Clave Foránea    |
|       Numero      |    Número de Cuenta   |         VARCHAR(20)         |          -          |
|        Tipo       |     Tipo de Cuenta    |         VARCHAR(50)         |          -          |
|       Saldo       |         Saldo         |        DECIMAL(10,2)        |          -          |
|   FechaApertura   |   Fecha de Apertura   |             DATE            |          -          |


## Tabla Transacciones

Esta tabla registra todas las transacciones que efectúan los clientes, incluyendo la fecha, el monto, tipo de transacción (depósito, retiro, transferencia o transferencia (sobregiro)) y cualquier otro tipo de información relevante.

| **_Abreviatura_** |  **_Nombre Completo_**  |     **_Tipo de Datos_**     | **_Tipo de Clave_** |
|:-----------------:|:-----------------------:|:---------------------------:|:-------------------:|
|  Transacciones_ID | ID de las transacciones | INT NOT NULL AUTO_INCREMENT |    Clave Primaria   |
|     Cuentas_ID    |    ID de las cuentas    |             INT             |    Clave Fóranea    |
|        Tipo       |   Tipo de Transacción   |         VARCHAR(50)         |          -          |
|       Monto       |   Monto de Transacción  |        DECIMAL(10,2)        |          -          |
|       Fecha       |   Fecha de Transacción  |             DATE            |          -          |


## Tabla Prestamos

En esta tabla se almacena toda la información de los préstamos otorgados a los clientes, incluyendo el monto del préstamo, la tasa de interés, el plazo, el estado (activo, vencido, inactivo, etc) y cualquier garantía asociada a los mismos.

| **_Abreviatura_** | **_Nombre Completo_** |     **_Tipo de Datos_**     | **_Tipo de Clave_** |
|:-----------------:|:---------------------:|:---------------------------:|:-------------------:|
|    Prestamos_ID   |  ID de los préstamos  | INT NOT NULL AUTO_INCREMENT |    Clave Primaria   |
|     Cliente_ID    |     ID del Cliente    |             INT             |    Clave Foránea    |
|       Monto       |   Monto del Préstamo  |        DECIMAL(10,2)        |          -          |
|    TasaInteres    |    Tasa de Interés    |         DECIMAL(5,2)        |          -          |
|       Plazo       |   Plazo del Préstamo  |             INT             |          -          |
|       Estado      |  Estado del Préstamo  |         VARCHAR(50)         |          -          |


## Tabla Pagos_Prestamos

Esta tabla registra todos los pagos realizados por los clientes en relación con sus préstamos, incluyendo la fecha del pago, el monto, entre otros datos relevantes.

| **_Abreviatura_** |   **_Nombre Completo_**  |     **_Tipo de Datos_**     | **_Tipo de Clave_** |
|:-----------------:|:------------------------:|:---------------------------:|:-------------------:|
|   Pagos_Prest_ID  | ID de pagos de préstamos | INT NOT NULL AUTO_INCREMENT |    Clave Primaria   |
|    Prestamos_ID   |    ID de los préstamos   |             INT             |    Clave Foránea    |
|       Monto       |      Monto del Pago      |        DECIMAL(10,2)        |          -          |
|       Fecha       |      Fecha del Pago      |             DATE            |          -          |

## Tabla Historial_Credito

Esta tabla contiene información sobre el historial crediticio de los clientes como los puntajes de crédito y las observaciones correspondientes.

| **_Abreviatura_** |    **_Nombre Completo_**    |     **_Tipo de Datos_**     | **_Tipo de Clave_** |
|:-----------------:|:---------------------------:|:---------------------------:|:-------------------:|
|  Hist_Credito_ID  | ID del historial crediticio | INT NOT NULL AUTO_INCREMENT |    Clave Primaria   |
|     Cliente_ID    |        ID del Cliente       |             INT             |    Clave Foránea    |
|      Puntaje      |      Puntaje de Crédito     |             INT             |          -          |
|   Observaciones   |        Observaciones        |             TEXT            |          -          |


## Tabla Modelos_Riesgo

Esta tabla almacena los modelos de riesgo utilizados para evaluar la solvencia crediticia de los
clientes, incluyendo los coeficientes de los modelos, los parámetros utilizados, entre otros.

Esta tabla es independiente del resto ya que su fin es almacenar información.

| **_Abreviatura_** |  **_Nombre Completo_**  |     **_Tipo de Datos_**     | **_Tipo de Clave_** |
|:-----------------:|:-----------------------:|:---------------------------:|:-------------------:|
|   Mod_Riesgo_ID   | ID de modelos de riesgo | INT NOT NULL AUTO_INCREMENT |    Clave Primaria   |
|       Nombre      |    Nombre del Modelo    |         VARCHAR(100)        |          -          |
|    Descripción    |  Descripción del Modelo |             TEXT            |          -          |
|    Coeficientes   | Coeficientes del Modelo |             TEXT            |          -          |


## Tabla Eventos_Riesgo

Esta tabla registra cualquier evento de riesgo relevante como pagos atrasados, actividad sospechosa en la cuenta, cambios en el puntaje del crédito, entre otros.

Esta tabla es independiente del resto ya que su finalidad es almacenar información.

| **_Abreviatura_** |  **_Nombre Completo_**  |     **_Tipo de Datos_**     | **_Tipo de Clave_** |
|:-----------------:|:-----------------------:|:---------------------------:|:-------------------:|
|   Even_Riesgo_ID  | ID de eventos de riesgo | INT NOT NULL AUTO_INCREMENT |    Clave Primaria   |
|    Descripción    |  Descripción del Evento |             TEXT            |          -          |
|       Fecha       |     Fecha del Evento    |             DATE            |          -          |



## Estructura e ingesta de datos

- Se realiza en su totalidad por medio del archivo **population.sql**


## Objetos de la base de datos

### Documentanción de Vistas

### VistaClienteSaldoNegativo

**Descripción y tablas involucradas:** Esta vista muestra los clientes que tienen un saldo negativo en alguna de sus cuentas. 

- Realiza una unión entre las tablas **_Clientes_** y **_Cuentas_** utilizando el campo **Cliente_ID** como clave de unión.
- Selecciona las columnas **Cliente_ID**, **Nombre**, **Apellido** y **Saldo** de las tablas **_Clientes_** y **_Cuentas_**.
- Filtra las filas donde el saldo en la tabla Cuentas es menor que cero, lo que indica que se trata de un saldo negativo.

**Utilidad:** Esta vista es útil para identificar rápidamente a los clientes que están experimentando dificultades financieras debido a saldos negativos en sus cuentas. Puede ser utilizada por los departamentos de riesgo crediticio o de atención al cliente para tomar medidas correctivas o para ofrecer asistencia financiera adicional.

**Ejemplo de consulta:**

```sql
SELECT * FROM VistaClientesSaldoNegativo;
```


### VistaTransaccionesRecientes

**Descripción y tablas involucradas:** Esta vista muestra las transacciones financieras realizadas en los últimos 30 días.

- Selecciona las columnas **Cuentas_ID**, **Tipo**, **Monto** y **Fecha** de la tabla **_Transacciones_**.
-  Filtra las filas donde la fecha de la transacción es igual o posterior a la fecha actual menos 30 días, utilizando la función **DATE_SUB** en conjunto con **CURDATE()**

**Utilidad:** Esta vista proporciona una forma conveniente de ver las transacciones financieras recientes, lo que puede ser útil para el seguimiento de la actividad financiera.

**Ejemplo de consulta:**

```sql
SELECT * FROM VistaTransaccionesRecientes;
```


### VistaTransaccionesMontosAltos

**Descripción y tablas involucradas:** Esta vista muestra las transacciones financieras con montos superiores a **$3.000**

- Selecciona las columnas **Cuentas_ID**, **Tipo**, **Monto** y **Fecha** de la tabla **_Transacciones_**.
- Filtra las filas donde el monto de la transacción sea mayor que **$3.000**.

**Utilidad:** Esta vista puede ser útil para identificar transacciones inusuales o de gran valor, lo que podría requerir una mayor atención o verificación por parte de los analistas financieros.

**Ejemplo de consulta:**

```sql
SELECT * FROM VistaTransaccionesMontosAltos;
```


### VistaClientesHistorialCrediticioMalo

**Descripción y tablas involucradas:** Esta vista muestra los clientes cuyo historial crediticio es considerado malo, es decir, con un puntaje de crédito menor a **5 (cinco)**.

- Selecciona las columnas **Cliente_ID**, **Nombre**, **Apellido** y **Puntaje** de la tabla **_Clientes_** y la tabla **_Historial_Credito_**.
- Une las tablas **_Clientes_** e **_Historial_Credito_** usando el **Cliente_ID**.
- Filtra las filas donde el puntaje de crédito en el historial sea menor a **5**.

**Utilidad:** Esta vista puede ser útil para identificar a los clientes que tienen un historial crediticio negativo, lo que podría influir en las decisiones de otorgamiento de nuevos créditos o préstamos.

**Ejemplo de consulta:**

```sql
SELECT * FROM VistaClientesHistorialCrediticioMalo;
```


### VistaDetallePrestamosActivos

**Descripción y tablas involucradas:** Esta vista muestra los detalles de los préstamos que están actualmente activos.

- Realiza una unión entre las tablas **_Prestamos_** y **_Clientes_** utilizando el campo **Cliente_ID** como clave de unión.
- Selecciona las columnas **Prestamos_ID**, **Nombre** (del cliente), **Monto**, **TasaInteres**, **Plazo** y **Estado**.
- Filtra las filas donde el estado del préstamo en la tabla **_Prestamos_** figura como "Activo".

**Utilidad:** Esta vista es útil para obtener una lista de los préstamos activos y puede ser utilizada por los departamentos financieros para monitorear y administrar los préstamos en curso. 

**Ejemplo de consulta:**

```sql
SELECT * FROM VistaDetallePrestamosActivos;
```


## Documentación de Funciones

### FN_CalcularMontoTotalPagos

**Descripción:** Esta función calcula el monto total de los pagos asociados a un préstamo específico.

**Parámetros y retorno:** 

- Toma un parámetro de entrada, que es el ID del préstamo (prestamoID).
- Dentro de la función, declara una variable **montoTotal** para almacenar el monto total de los pagos.
- Realiza una consulta para sumar todos los montos de los pagos asociados al ID del préstamo proporcionado.
- Utiliza la función **COALESCE** para asegurarse de que, en caso de que no haya pagos asociados, el resultado sea cero.
- Devuelve el monto total de los pagos.

**Utilidad:** Esta función es útil para obtener de manera rápida y precisa el monto total de los pagos asociados a un préstamo específico, lo que puede ser utilizado en diversas partes del sistema para realizar cálculos y análisis relacionados con los préstamos.

**Ejemplo de uso:**

```sql
SELECT FN_CalcularMontoTotalPagos(1)
AS     MontoTotalPago;
```


### FN_CalcularSaldoPromedioCliente

**Descripción:** Esta función calcula el saldo promedio de todas las cuentas asociadas a un cliente específico.

**Parámetros y retorno:**

- Toma un parámetro de entrada, que es el ID del cliente (clienteID).
- Dentro de la función, declara una variable **saldoPromedio** para almacenar el saldo promedio.
- Realiza una consulta para obtener el saldo promedio de todas las cuentas asociadas al ID del cliente proporcionado.
- Utiliza la función **COALESCE** para asegurarse de que, en caso de que no haya cuentas asociadas, el resultado sea cero.
- Devuelve el saldo promedio de todas las cuentas asociadas al cliente.

**Utilidad:** Esta función es útil para obtener una medida del estado financiero promedio de un cliente, lo que puede ser utilizado en análisis y reportes relacionados con la gestión de clientes y cuentas.

**Ejemplo de uso:**

```sql
SELECT FN_CalcularSaldoPromedioCliente(1)
AS     SaldoPromedioCliente;
```


### FN_CalcularSaldoTotalPrestamos

**Descripción:** Esta función calcula el saldo total de todos los préstamos activos asociados a un cliente específico.

**Parámetros y retorno:**

- Toma un parámetro de entrada que es el ID del cliente (clienteID).
- Dentro de la función, declara una variable **saldoTotal** para almacenar el saldo total.
- Realiza una consulta para obtener la suma de los montos de todos los préstamos activos asociados al ID del cliente proporcionado.
- Utiliza la función **COALESCE** para asegurarse de que, en caso de que no haya préstamos activos asociados, el resultado sea cero.
- Devuelve el saldo total de todos los préstamos activos asociados al cliente.

**Utilidad:** Esta función es útil para calcular la carga financiera total de un cliente en términos de préstamos activos.

**Ejemplo de uso:**

```sql
SELECT FN_CalcularSaldoTotalPrestamos(1)
AS     SaldoTotalPrestamos;
```


## Documentación de Procedimientos Almacenados

### SP_ActualizarEstadoPrestamo

**Descripción:** Este procedimiento almacenado se encarga de actualizar el estado de un préstamo en la tabla **_Prestamos_** basado en su saldo pendiente.

**Parámetros y retorno:**

- El procedimiento toma como parámetro de entrada el ID del préstamo (prestamoID).
- Calcula el saldo pendiente del préstamo restando la suma total de los pagos asociados al mismo.
- Luego determina el nuevo estado del préstamo en función del saldo pendiente. Si el saldo pendiente es menor o igual a 
  cero, el estado se establece como **"Inactivo"**; de lo contrario, se establece como **"Activo"**.
- Finalmente, actualiza el estado del préstamo en la tabla Prestamos con el nuevo estado calculado.

**Utilidad:** Este procedimiento almacenado es útil para automatizar la actualización del estado de los préstamos en función de sus pagos y saldos pendientes, lo que proporciona una gestión más eficiente y precisa de los préstamos en el sistema. Por esta razón, este procedimiento va de la mano con el que se desarrollará luego.

**Ejemplo de uso:**

```sql
CALL SP_ActualizarEstadoPrestamo(1);
```


### SP_RegistrarPagoPrestamo

**Descripción:** Este procedimiento almacenado se encarga de registrar un pago para un préstamo específico y luego llama al procedimiento **SP_ActualizarEstadoPrestamo** (que se ha detallado anteriormente) para actualizar el estado del préstamo, en el caso de que corresponda.


**Parámetros y retorno:**

- Los parámetros de entrada son el ID del préstamo (prestamoID), el monto del pago (monto) y la fecha del pago (fecha).
- Inserta el nuevo pago del préstamo en la tabla **_Pagos_Prestamos_** con el ID del préstamo, el monto y la fecha proporcionados.
- Después de insertar el pago, llama al procedimiento almacenado **SP_ActualizarEstadoPrestamo** para actualizar el estado del préstamo en función de los pagos realizados.

**Utilidad:** Este procedimiento almacenado es útil para facilitar el registro de pagos para préstamos específicos y automatizar la actualización del estado del préstamo después de cada pago registrado. Esto garantiza una gestión eficiente y precisa de los pagos y estados de los préstamos en el sistema.

**Ejemplo de uso:**

```sql
CALL SP_RegistrarPagoPrestamo(6, 1646.25, CURDATE());
```


## Documentación de Triggers

### TR_ActualizarSaldoCuenta

**Descripción:** Este trigger se activa después de que se inserta una nueva fila en la tabla **_Transacciones_**. Su propósito principal es actualizar el saldo de la cuenta (de la tabla **_Cuentas_**) asociada a la transacción según el tipo de la misma. 

**Detalles:** Si la transacción es un retiro, el monto se resta del saldo actual de la cuenta. En cambio, si es otro tipo de transacción, el monto se suma al saldo de la cuenta.

**Utilidad:** Su implementación es importante para mantener la integridad de los datos en la tabla **_Cuentas_** y garantizar que el saldo se ajuste correctamente en función de las transacciones realizadas.


### TR_ValidarDatosPrestamo

**Descripción:** Este trigger se activa antes de insertar una nueva fila en la tabla **_Prestamos_**. Su objetivo es validar los datos del préstamo antes de que se realice la inserción en la base de datos.

**Detalles:** 

- Primero, verifica que el monto del préstamo sea mayor que cero. Si no es asi, se lanza una excepción con un mensaje indicando que el monto del préstamo debe ser mayor que cero.
- Luego, comprueba que la tasa de interés esté en el rango válido de 0 a 100. Si esto tampoco es asi, se lanza otra excepción con un mensaje que indica que la tasa de interés debe estar entre 0 y 100.

**Utilidad:** Este trigger es fundamental para garantizar la integridad de los datos, evitando asi la inserción de datos incorrectos o inválidos.


### TR_EliminarCliente

**Descripción:** Este trigger se activa antes de que se elimine una fila de la tabla **_Clientes_**. Su objetivo es prevenir la eliminación de clientes mediante la generación de un error personalizado.

**Detalles:** Cuando se intenta eliminar un cliente, el trigger se activa y genera un error personalizado con el mensaje **"No se permite eliminar clientes"**. Este error detiene la ejecución de la operación de eliminación y garantiza que los clientes no sean eliminados de la base de datos.

**Utilidad:** Este trigger es útil para mantener la integridad de los datos y evitar la eliminación accidental o no autorizada de clientes en la base de datos.


### TR_CrearCuentaClienteNuevo

**Descripción:** Este trigger se activa después de que se inserta una fila en la tabla **_Clientes_**. Su objetivo es crear automáticamente una nueva cuenta de ahorro en la tabla **_Cuentas_** para el cliente recién insertado.

**Detalles:** 
- Cuando se inserta un nuevo cliente, el trigger se activa y verifica si ya existen cuentas asociadas a ese cliente en la
tabla **_Cuentas_**.
- Si no hay cuentas existentes para el cliente, el trigger genera un número de cuenta de 4 dígitos único y lo inserta en la tabla **_Cuentas_**, junto con el tipo de cuenta (Ahorro), un saldo inicial de 0 (cero) y la fecha de apertura (la fecha
actual).
- El trigger garantiza que el número de cuenta generado sea único mediante la generación repetida de un nuevo número hasta que encuentre uno que no esté presente en la tabla de **_Cuentas_**.

**Utilidad:**  El trigger en cuestión es útil para automatizar el proceso de creación de cuentas de ahorro para nuevos clientes y garantizar que cada nuevo cliente tenga su cuenta de ahorro asociada en la base de datos de la institución financiera.


## Roles y permisos

`./objects/roles_users.sql`

Se genera tres roles:

1. `role_select_tablas`: Este rol tiene permisos solo para SELECT en las distintas tablas de la base de datos.
2. `role_crud_creditico`: Este rol tiene permisos para generar CRUD en distintas tablas de la base de datos.
3. `role_creacion_usuarios`: Este rol tiene permisos para crear y eliminar usuarios.

Por último, se creo un usuario para cada rol y fueron asignados los roles correspondientes.



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
