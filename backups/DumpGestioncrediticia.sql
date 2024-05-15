CREATE DATABASE  IF NOT EXISTS `gestion_riesgo_crediticio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestion_riesgo_crediticio`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: gestion_riesgo_crediticio
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `Cliente_ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT 'Sin informacion',
  PRIMARY KEY (`Cliente_ID`),
  UNIQUE KEY `Correo` (`Correo`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Esta tabla contiene toda la informacion personal relacionada a los clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan','Garcia','123456789','juan@example.com','Calle 123'),(2,'Maria','Lopez','987654321','maria@example.com','Avenida 456'),(3,'Pedro','Martinez','55555555','pedro@example.com','Sin informacion'),(4,'Laura','Rodriguez','33333333','laura@example.com','Calle Principal'),(5,'Carlos','Gomez','66666666','carlos@example.com','Avenida Central'),(6,'Ana','Perez','44444444','ana@example.com','Calle Secundaria'),(7,'Luis','Sanchez','77777777','luis@example.com','Sin informacion'),(8,'Sofia','Diaz','99999999','sofia@example.com','Calle Sur'),(9,'Diego','Hernandez','22222222','diego@example.com','Avenida Este'),(10,'Fernanda','Torres','88888888','fernanda@example.com','Calle Oeste'),(11,'Roberto','Alvarez','12121212','roberto@example.com','Avenida Central'),(12,'Julia','Gutierrez','34343434','julia@example.com','Sin informacion'),(13,'Miguel','Flores','56565656','miguel@example.com','Calle Secundaria'),(14,'Valeria','Romero','78787878','valeria@example.com','Avenida Norte'),(15,'Elena','Nunez','90909090','elena@example.com','Calle Sur'),(16,'John','Doe','555-1234','john@example.com','123 Main St'),(17,'Emily','Smith','555-5678','emily@example.com','456 Elm St'),(18,'Michael','Johnson','555-9876','michael@example.com','789 Oak St');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_CrearCuentaClienteNuevo` AFTER INSERT ON `clientes` FOR EACH ROW BEGIN
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
    UNTIL NOT EXISTS   (SELECT 1 FROM Cuentas WHERE Numero = nuevo_numero) END REPEAT;
        
    -- Inserto la nueva cuenta con el numero de cuenta generado
    INSERT INTO        Cuentas (Cliente_ID, Numero, Tipo, Saldo, FechaApertura)
    VALUES             (NEW.Cliente_ID, nuevo_numero, 'Ahorro', 0, NOW());
    END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_EliminarCliente` BEFORE DELETE ON `clientes` FOR EACH ROW BEGIN
    -- Genero un error personalizado
    SIGNAL SQLSTATE    '45000' SET MESSAGE_TEXT = 'No se permite eliminar clientes.';
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas` (
  `Cuentas_ID` int NOT NULL AUTO_INCREMENT,
  `Cliente_ID` int DEFAULT NULL,
  `Numero` varchar(20) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Saldo` decimal(10,2) DEFAULT NULL,
  `FechaApertura` date DEFAULT (curdate()),
  PRIMARY KEY (`Cuentas_ID`),
  KEY `fk_cuen_clientes` (`Cliente_ID`),
  CONSTRAINT `fk_cuen_clientes` FOREIGN KEY (`Cliente_ID`) REFERENCES `clientes` (`Cliente_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Esta tabla registra datos relacionados a las cuentas que poseen los clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES (1,1,'1234','Corriente',250.00,'2024-05-14'),(2,2,'9876','Ahorro',2500.00,'2024-05-14'),(3,2,'4321','Corriente',200.00,'2024-02-06'),(4,3,'5678','Corriente',150.00,'2023-08-16'),(5,4,'1357','Ahorro',1100.00,'2022-03-06'),(6,5,'2468','Corriente',2000.00,'2024-05-14'),(7,6,'3692','Ahorro',2800.00,'2021-09-18'),(8,7,'9861','Corriente',2300.00,'2024-05-14'),(9,7,'7652','Ahorro',7700.00,'2024-01-01'),(10,8,'2679','Ahorro',3400.00,'2024-02-05'),(11,9,'5901','Corriente',1800.00,'2024-05-14'),(12,10,'3579','Ahorro',4000.00,'2024-01-03'),(13,11,'8135','Ahorro',2200.00,'2024-01-07'),(14,11,'2679','Corriente',1200.00,'2024-04-07'),(15,12,'3694','Ahorro',3400.00,'2024-05-14'),(16,13,'9542','Corriente',2500.00,'2023-12-12'),(17,14,'1119','Ahorro',4200.00,'2023-06-06'),(18,15,'2234','Corriente',2000.00,'2024-01-21'),(19,16,'1115','Corriente',-500.00,'2024-01-15'),(20,17,'1116','Ahorro',-1000.00,'2023-11-01'),(21,18,'1117','Corriente',-750.00,'2024-03-02');
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos_riesgo`
--

DROP TABLE IF EXISTS `eventos_riesgo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos_riesgo` (
  `Even_Riesgo_ID` int NOT NULL AUTO_INCREMENT,
  `Descripcion` text,
  `Fecha` date DEFAULT (curdate()),
  PRIMARY KEY (`Even_Riesgo_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Esta tabla es independiente de las demas, su finalidad es almacenar informacion sobre los eventos de riesgo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos_riesgo`
--

LOCK TABLES `eventos_riesgo` WRITE;
/*!40000 ALTER TABLE `eventos_riesgo` DISABLE KEYS */;
INSERT INTO `eventos_riesgo` VALUES (1,'Actividad sospechosa de la cuenta','2024-03-28'),(2,'Fraude con tarjetas de credito','2024-02-14'),(3,'Incumplimiento de pagos de prestamos','2024-04-02'),(4,'Cambios en el comportamiento de pago','2024-03-30'),(5,'Cambios en el historial crediticio','2024-04-14');
/*!40000 ALTER TABLE `eventos_riesgo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_credito`
--

DROP TABLE IF EXISTS `historial_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_credito` (
  `Hist_Credito_ID` int NOT NULL AUTO_INCREMENT,
  `Cliente_ID` int DEFAULT NULL,
  `Puntaje` int DEFAULT '0',
  `Observaciones` text,
  PRIMARY KEY (`Hist_Credito_ID`),
  KEY `fk_hist_clientes` (`Cliente_ID`),
  CONSTRAINT `fk_hist_clientes` FOREIGN KEY (`Cliente_ID`) REFERENCES `clientes` (`Cliente_ID`),
  CONSTRAINT `historial_credito_chk_1` CHECK ((`Puntaje` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Esta tabla registra el historial crediticio que posee cada cliente';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_credito`
--

LOCK TABLES `historial_credito` WRITE;
/*!40000 ALTER TABLE `historial_credito` DISABLE KEYS */;
INSERT INTO `historial_credito` VALUES (1,1,8,'Excelente'),(2,2,6,'Regular'),(3,3,4,'Malo'),(4,4,3,'Malo'),(5,5,7,'Regular'),(6,6,5,'Regular'),(7,7,9,'Excelente'),(8,8,6,'Regular'),(9,9,8,'Excelente'),(10,10,5,'Regular'),(11,11,8,'Excelente'),(12,12,6,'Regular'),(13,13,9,'Excelente'),(14,14,6,'Regular'),(15,15,3,'Malo');
/*!40000 ALTER TABLE `historial_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelos_riesgo`
--

DROP TABLE IF EXISTS `modelos_riesgo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelos_riesgo` (
  `Mod_Riesgo_ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Descripcion` text,
  `Coeficientes` text,
  PRIMARY KEY (`Mod_Riesgo_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Esta tabla es independiente de las demas, su finalidad es almacenar informacion sobre los modelos de riesgo que pueden ser utilizados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelos_riesgo`
--

LOCK TABLES `modelos_riesgo` WRITE;
/*!40000 ALTER TABLE `modelos_riesgo` DISABLE KEYS */;
INSERT INTO `modelos_riesgo` VALUES (1,'Modelo A','Descripcion del Modelo A','Coeficientes del Modelo A'),(2,'Modelo B','Descripcion del Modelo B','Coeficientes del Modelo B');
/*!40000 ALTER TABLE `modelos_riesgo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos_prestamos`
--

DROP TABLE IF EXISTS `pagos_prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos_prestamos` (
  `Pagos_Prest_ID` int NOT NULL AUTO_INCREMENT,
  `Prestamos_ID` int DEFAULT NULL,
  `Monto` decimal(10,2) DEFAULT NULL,
  `Fecha` date DEFAULT (curdate()),
  PRIMARY KEY (`Pagos_Prest_ID`),
  KEY `fk_pago_prestamos` (`Prestamos_ID`),
  CONSTRAINT `fk_pago_prestamos` FOREIGN KEY (`Prestamos_ID`) REFERENCES `prestamos` (`Prestamos_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='En esta tabla se registran los pagos de los prestamos por parte de los clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos_prestamos`
--

LOCK TABLES `pagos_prestamos` WRITE;
/*!40000 ALTER TABLE `pagos_prestamos` DISABLE KEYS */;
INSERT INTO `pagos_prestamos` VALUES (1,1,1105.00,'2024-03-15'),(2,2,2165.00,'2024-05-14'),(3,5,1105.00,'2024-03-17'),(4,7,1387.75,'2024-03-18'),(5,9,1284.00,'2024-03-19'),(6,11,1284.00,'2024-05-14'),(7,13,2066.25,'2024-03-21');
/*!40000 ALTER TABLE `pagos_prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamos` (
  `Prestamos_ID` int NOT NULL AUTO_INCREMENT,
  `Cliente_ID` int DEFAULT NULL,
  `Monto` decimal(10,2) DEFAULT NULL,
  `TasaInteres` decimal(5,2) DEFAULT NULL,
  `Plazo` int DEFAULT '180',
  `Estado` varchar(50) DEFAULT 'Activo',
  PRIMARY KEY (`Prestamos_ID`),
  KEY `fk_pres_clientes` (`Cliente_ID`),
  CONSTRAINT `fk_pres_clientes` FOREIGN KEY (`Cliente_ID`) REFERENCES `clientes` (`Cliente_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prestamos_chk_1` CHECK ((`Plazo` >= 180))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Esta tabla registra los prestamos que puedan llegar a realizar los clientes con la institucion financiera';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES (1,1,850.00,5.50,180,'Activo'),(2,1,1000.00,10.50,360,'Inactivo'),(3,2,2000.00,8.25,240,'Inactivo'),(4,2,760.00,6.00,180,'Activo'),(5,2,1000.00,7.50,240,'Activo'),(6,3,1500.00,9.75,300,'Activo'),(7,4,2500.00,7.85,180,'Activo'),(8,5,1800.00,8.00,240,'Activo'),(9,5,1000.00,10.50,360,'Inactivo'),(10,6,2200.00,9.25,360,'Activo'),(11,7,1300.00,6.75,300,'Inactivo'),(12,8,3000.00,7.50,180,'Activo'),(13,9,1700.00,8.65,240,'Activo'),(14,9,1200.00,7.00,300,'Inactivo'),(15,10,2800.00,9.00,360,'Activo'),(16,11,1200.00,7.00,300,'Inactivo'),(17,12,2600.00,8.35,180,'Activo'),(18,13,1900.00,8.75,240,'Inactivo'),(19,14,2300.00,9.15,360,'Activo'),(20,15,1400.00,6.50,300,'Activo');
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_ValidarDatosPrestamo` BEFORE INSERT ON `prestamos` FOR EACH ROW BEGIN
    IF                 NEW.Monto <= 0 THEN
    SIGNAL SQLSTATE    '45000' SET MESSAGE_TEXT = 'El monto del prestamo debe ser mayor que cero';
    END IF;

    IF                 NEW.TasaInteres < 0 OR NEW.TasaInteres > 100 THEN
    SIGNAL SQLSTATE    '45000' SET MESSAGE_TEXT = 'La tasa de interes debe estar entre 0 y 100';
    END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacciones` (
  `Transacciones_ID` int NOT NULL AUTO_INCREMENT,
  `Cuentas_ID` int DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT 'Desconocido',
  `Monto` decimal(10,2) DEFAULT NULL,
  `Fecha` date DEFAULT (curdate()),
  PRIMARY KEY (`Transacciones_ID`),
  KEY `fk_trans_cuentas` (`Cuentas_ID`),
  CONSTRAINT `fk_trans_cuentas` FOREIGN KEY (`Cuentas_ID`) REFERENCES `cuentas` (`Cuentas_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='En esta tabla se registran todas las transacciones que realiza el cliente con la institucion financiera';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
INSERT INTO `transacciones` VALUES (1,1,'Deposito',500.00,'2024-03-01'),(2,1,'Retiro',-250.00,'2024-03-03'),(3,2,'Deposito',2500.00,'2024-05-14'),(4,3,'Transferencia',150.00,'2024-03-03'),(5,4,'Deposito',1100.00,'2024-03-04'),(6,5,'Deposito',2300.00,'2024-03-02'),(7,5,'Retiro',-300.00,'2024-03-05'),(8,6,'Transferencia',2800.00,'2024-03-06'),(9,7,'Deposito',7700.00,'2024-05-14'),(10,8,'Deposito',3800.00,'2024-03-05'),(11,8,'Retiro',-400.00,'2024-03-08'),(12,9,'Transferencia',1800.00,'2024-03-09'),(13,10,'Deposito',4100.00,'2024-01-02'),(14,10,'Retiro',-100.00,'2024-01-05'),(15,11,'Deposito',2700.00,'2024-04-28'),(16,11,'Retiro',-500.00,'2024-05-14'),(17,12,'Transferencia',3400.00,'2024-03-12'),(18,13,'Deposito',2500.00,'2024-03-13'),(19,14,'Deposito',4600.00,'2024-04-02'),(20,14,'Retiro',-400.00,'2024-05-14'),(21,15,'Transferencia',2000.00,'2024-03-15'),(22,16,'Deposito',1000.00,'2024-04-26'),(23,16,'Transferencia (Sobregiro)',1500.00,'2024-05-14'),(24,17,'Deposito',2100.00,'2024-04-22'),(25,17,'Transferencia (Sobregiro)',3100.00,'2024-04-23'),(26,18,'Deposito',250.00,'2024-04-03'),(27,18,'Transferencia (Sobregiro)',1000.00,'2024-04-10');
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_ActualizarSaldoCuenta` AFTER INSERT ON `transacciones` FOR EACH ROW BEGIN
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
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vistaclienteshistorialcrediticiomalo`
--

DROP TABLE IF EXISTS `vistaclienteshistorialcrediticiomalo`;
/*!50001 DROP VIEW IF EXISTS `vistaclienteshistorialcrediticiomalo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaclienteshistorialcrediticiomalo` AS SELECT 
 1 AS `Cliente_ID`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `Puntaje`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistaclientessaldonegativo`
--

DROP TABLE IF EXISTS `vistaclientessaldonegativo`;
/*!50001 DROP VIEW IF EXISTS `vistaclientessaldonegativo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaclientessaldonegativo` AS SELECT 
 1 AS `Cliente_ID`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `Saldo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistadetalleprestamosactivos`
--

DROP TABLE IF EXISTS `vistadetalleprestamosactivos`;
/*!50001 DROP VIEW IF EXISTS `vistadetalleprestamosactivos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistadetalleprestamosactivos` AS SELECT 
 1 AS `Prestamos_ID`,
 1 AS `Cliente`,
 1 AS `Monto`,
 1 AS `TasaInteres`,
 1 AS `Plazo`,
 1 AS `Estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistatransaccionesmontosaltos`
--

DROP TABLE IF EXISTS `vistatransaccionesmontosaltos`;
/*!50001 DROP VIEW IF EXISTS `vistatransaccionesmontosaltos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistatransaccionesmontosaltos` AS SELECT 
 1 AS `Cuentas_ID`,
 1 AS `Tipo`,
 1 AS `Monto`,
 1 AS `Fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistatransaccionesrecientes`
--

DROP TABLE IF EXISTS `vistatransaccionesrecientes`;
/*!50001 DROP VIEW IF EXISTS `vistatransaccionesrecientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistatransaccionesrecientes` AS SELECT 
 1 AS `Cuentas_ID`,
 1 AS `Tipo`,
 1 AS `Monto`,
 1 AS `Fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'gestion_riesgo_crediticio'
--

--
-- Dumping routines for database 'gestion_riesgo_crediticio'
--
/*!50003 DROP FUNCTION IF EXISTS `FN_CalcularMontoTotalPagos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_CalcularMontoTotalPagos`(
    prestamoID INT
    ) RETURNS decimal(10,2)
    READS SQL DATA
    COMMENT 'Esta funcion calcula el monto total de los pagos asociados a un prestamo específico'
BEGIN
    DECLARE           montoTotal DECIMAL(10, 2);

    SELECT            COALESCE(SUM(Monto), 0) INTO montoTotal
    FROM              Pagos_Prestamos
    WHERE             Prestamos_ID = prestamoID;

    IF                montoTotal              IS NULL THEN
    SET               montoTotal = 0;
    END IF;

    RETURN            montoTotal;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_CalcularSaldoPromedioCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_CalcularSaldoPromedioCliente`(
    clienteID INT
    ) RETURNS decimal(10,2)
    READS SQL DATA
    COMMENT 'Esta funcion calcula el saldo promedio de todas las cuentas asociadas a un cliente especifico'
BEGIN
    DECLARE           saldoPromedio DECIMAL(10, 2);

    SELECT            COALESCE(AVG(Saldo), 0) INTO saldoPromedio
    FROM              Cuentas
    WHERE             Cliente_ID = clienteID;

    RETURN            saldoPromedio;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_CalcularSaldoTotalPrestamos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_CalcularSaldoTotalPrestamos`(
    clienteID INT
    ) RETURNS decimal(10,2)
    READS SQL DATA
    COMMENT 'Esta funcion calcula el saldo total de todos los prestamos activos asociados a un cliente especifico'
BEGIN
    DECLARE           saldoTotal DECIMAL(10, 2);

    SELECT            COALESCE(SUM(Monto), 0) INTO saldoTotal
    FROM              Prestamos
    WHERE             Cliente_ID = clienteID  AND Estado = 'Activo';

    RETURN            saldoTotal;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ActualizarEstadoPrestamo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ActualizarEstadoPrestamo`(
    IN                 prestamoID INT
    )
    COMMENT 'Este procedimiento almacenado actualiza el estado del prestamo cuando se efectua un pago.'
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_RegistrarPagoPrestamo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RegistrarPagoPrestamo`(
    IN                 prestamoID INT,
    IN                 monto      DECIMAL(10, 2),
    IN                 fecha      DATE
    )
    COMMENT 'Este procedimiento almacenado registra un pago para un prestamo especifico.'
BEGIN
    -- Inserto el nuevo pago de prestamo en la tabla Pagos_Prestamos
    INSERT INTO        Pagos_Prestamos (Prestamos_ID, Monto, Fecha)
    VALUES             (prestamoID, monto, fecha);

    -- Actualizo el estado del prestamo en caso de que corresponda
    CALL               SP_ActualizarEstadoPrestamo
    (prestamoID);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vistaclienteshistorialcrediticiomalo`
--

/*!50001 DROP VIEW IF EXISTS `vistaclienteshistorialcrediticiomalo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaclienteshistorialcrediticiomalo` AS select `c`.`Cliente_ID` AS `Cliente_ID`,`c`.`Nombre` AS `Nombre`,`c`.`Apellido` AS `Apellido`,`hc`.`Puntaje` AS `Puntaje` from (`clientes` `c` join `historial_credito` `hc` on((`c`.`Cliente_ID` = `hc`.`Cliente_ID`))) where (`hc`.`Puntaje` < 5) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistaclientessaldonegativo`
--

/*!50001 DROP VIEW IF EXISTS `vistaclientessaldonegativo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaclientessaldonegativo` AS select `c`.`Cliente_ID` AS `Cliente_ID`,`c`.`Nombre` AS `Nombre`,`c`.`Apellido` AS `Apellido`,`cu`.`Saldo` AS `Saldo` from (`clientes` `c` join `cuentas` `cu` on((`c`.`Cliente_ID` = `cu`.`Cliente_ID`))) where (`cu`.`Saldo` < 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistadetalleprestamosactivos`
--

/*!50001 DROP VIEW IF EXISTS `vistadetalleprestamosactivos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistadetalleprestamosactivos` AS select `p`.`Prestamos_ID` AS `Prestamos_ID`,`c`.`Nombre` AS `Cliente`,`p`.`Monto` AS `Monto`,`p`.`TasaInteres` AS `TasaInteres`,`p`.`Plazo` AS `Plazo`,`p`.`Estado` AS `Estado` from (`prestamos` `p` join `clientes` `c` on((`p`.`Cliente_ID` = `c`.`Cliente_ID`))) where (`p`.`Estado` = 'Activo') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistatransaccionesmontosaltos`
--

/*!50001 DROP VIEW IF EXISTS `vistatransaccionesmontosaltos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistatransaccionesmontosaltos` AS select `transacciones`.`Cuentas_ID` AS `Cuentas_ID`,`transacciones`.`Tipo` AS `Tipo`,`transacciones`.`Monto` AS `Monto`,`transacciones`.`Fecha` AS `Fecha` from `transacciones` where (`transacciones`.`Monto` > 3000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistatransaccionesrecientes`
--

/*!50001 DROP VIEW IF EXISTS `vistatransaccionesrecientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistatransaccionesrecientes` AS select `transacciones`.`Cuentas_ID` AS `Cuentas_ID`,`transacciones`.`Tipo` AS `Tipo`,`transacciones`.`Monto` AS `Monto`,`transacciones`.`Fecha` AS `Fecha` from `transacciones` where (`transacciones`.`Fecha` >= (curdate() - interval 30 day)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-15  0:09:26
