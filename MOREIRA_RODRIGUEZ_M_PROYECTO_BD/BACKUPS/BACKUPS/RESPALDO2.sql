CREATE DATABASE  IF NOT EXISTS `LEJOS_TECH` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `LEJOS_TECH`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: sakura.proxy.rlwy.net    Database: LEJOS_TECH
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `auditoria_eliminaciones_productos`
--

DROP TABLE IF EXISTS `auditoria_eliminaciones_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_eliminaciones_productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `fecha_eliminacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_eliminaciones_productos`
--

LOCK TABLES `auditoria_eliminaciones_productos` WRITE;
/*!40000 ALTER TABLE `auditoria_eliminaciones_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_eliminaciones_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_precios`
--

DROP TABLE IF EXISTS `auditoria_precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_precios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int DEFAULT NULL,
  `precio_anterior` decimal(10,2) DEFAULT NULL,
  `precio_nuevo` decimal(10,2) DEFAULT NULL,
  `fecha_cambio` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_precios`
--

LOCK TABLES `auditoria_precios` WRITE;
/*!40000 ALTER TABLE `auditoria_precios` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Procesadores Gama Alta','Componentes de la categoria Procesadores - segmento Gama Alta'),(2,'Procesadores Gama Media','Componentes de la categoria Procesadores - segmento Gama Media'),(3,'Tarjetas Madre Gama Alta','Componentes de la categoria Tarjetas Madre - segmento Gama Alta'),(4,'Tarjetas Madre Gama Media','Componentes de la categoria Tarjetas Madre - segmento Gama Media'),(5,'Memorias RAM Gama Alta','Componentes de la categoria Memorias RAM - segmento Gama Alta'),(6,'Memorias RAM Gama Media','Componentes de la categoria Memorias RAM - segmento Gama Media'),(7,'Discos SSD Gama Alta','Componentes de la categoria Discos SSD - segmento Gama Alta'),(8,'Discos SSD Gama Media','Componentes de la categoria Discos SSD - segmento Gama Media'),(9,'Discos Duros HDD Gama Alta','Componentes de la categoria Discos Duros HDD - segmento Gama Alta'),(10,'Discos Duros HDD Gama Media','Componentes de la categoria Discos Duros HDD - segmento Gama Media'),(11,'Tarjetas de Video Gama Alta','Componentes de la categoria Tarjetas de Video - segmento Gama Alta'),(12,'Tarjetas de Video Gama Media','Componentes de la categoria Tarjetas de Video - segmento Gama Media'),(13,'Fuentes de Poder Gama Alta','Componentes de la categoria Fuentes de Poder - segmento Gama Alta'),(14,'Fuentes de Poder Gama Media','Componentes de la categoria Fuentes de Poder - segmento Gama Media'),(15,'Gabinetes Gama Alta','Componentes de la categoria Gabinetes - segmento Gama Alta'),(16,'Gabinetes Gama Media','Componentes de la categoria Gabinetes - segmento Gama Media'),(17,'Sistemas de Enfriamiento Gama Alta','Componentes de la categoria Sistemas de Enfriamiento - segmento Gama Alta'),(18,'Sistemas de Enfriamiento Gama Media','Componentes de la categoria Sistemas de Enfriamiento - segmento Gama Media'),(19,'Monitores Gama Alta','Componentes de la categoria Monitores - segmento Gama Alta'),(20,'Monitores Gama Media','Componentes de la categoria Monitores - segmento Gama Media'),(21,'Teclados Gama Alta','Componentes de la categoria Teclados - segmento Gama Alta'),(22,'Teclados Gama Media','Componentes de la categoria Teclados - segmento Gama Media'),(23,'Mouse Gama Alta','Componentes de la categoria Mouse - segmento Gama Alta'),(24,'Mouse Gama Media','Componentes de la categoria Mouse - segmento Gama Media'),(25,'Audifonos Gama Alta','Componentes de la categoria Audifonos - segmento Gama Alta'),(26,'Audifonos Gama Media','Componentes de la categoria Audifonos - segmento Gama Media'),(27,'Parlantes Gama Alta','Componentes de la categoria Parlantes - segmento Gama Alta'),(28,'Parlantes Gama Media','Componentes de la categoria Parlantes - segmento Gama Media'),(29,'Webcams Gama Alta','Componentes de la categoria Webcams - segmento Gama Alta'),(30,'Webcams Gama Media','Componentes de la categoria Webcams - segmento Gama Media'),(31,'Impresoras Gama Alta','Componentes de la categoria Impresoras - segmento Gama Alta'),(32,'Impresoras Gama Media','Componentes de la categoria Impresoras - segmento Gama Media'),(33,'Routers Gama Alta','Componentes de la categoria Routers - segmento Gama Alta'),(34,'Routers Gama Media','Componentes de la categoria Routers - segmento Gama Media'),(35,'Switches Gama Alta','Componentes de la categoria Switches - segmento Gama Alta'),(36,'Switches Gama Media','Componentes de la categoria Switches - segmento Gama Media'),(37,'Cables y Adaptadores Gama Alta','Componentes de la categoria Cables y Adaptadores - segmento Gama Alta'),(38,'Cables y Adaptadores Gama Media','Componentes de la categoria Cables y Adaptadores - segmento Gama Media'),(39,'Software Gama Alta','Componentes de la categoria Software - segmento Gama Alta'),(40,'Software Gama Media','Componentes de la categoria Software - segmento Gama Media'),(41,'Laptops Gama Alta','Componentes de la categoria Laptops - segmento Gama Alta'),(42,'Laptops Gama Media','Componentes de la categoria Laptops - segmento Gama Media'),(43,'Tablets Gama Alta','Componentes de la categoria Tablets - segmento Gama Alta'),(44,'Tablets Gama Media','Componentes de la categoria Tablets - segmento Gama Media'),(45,'Consolas Gama Alta','Componentes de la categoria Consolas - segmento Gama Alta'),(46,'Consolas Gama Media','Componentes de la categoria Consolas - segmento Gama Media'),(47,'Sillas Gamer Gama Alta','Componentes de la categoria Sillas Gamer - segmento Gama Alta'),(48,'Sillas Gamer Gama Media','Componentes de la categoria Sillas Gamer - segmento Gama Media'),(49,'Micrófonos Gama Alta','Componentes de la categoria Micrófonos - segmento Gama Alta'),(50,'Micrófonos Gama Media','Componentes de la categoria Micrófonos - segmento Gama Media');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `ciudad` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `num_documento` (`num_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Patricia Rojas','RUC','1235154329','0939421047','patricia.rojas@gmail.com','Calle Rodriguez 149','Portoviejo'),(2,'Carolina Zambrano','Cedula','1976705430','0945623285','carolina.zambrano@gmail.com','Calle Rios 129','Cuenca'),(3,'Emilio Jimenez','Cedula','1275919523','0974517123','emilio.jimenez@gmail.com','Calle Salgado 186','Babahoyo'),(4,'Monica Flores','Pasaporte','1392747974','0916048175','monica.flores@gmail.com','Calle Salgado 192','Babahoyo'),(5,'Monica Herrera','RUC','1883063850','0951370985','monica.herrera@gmail.com','Calle Pazmiño 57','Portoviejo'),(6,'Karina Lopez','RUC','1976447539','0946120047','karina.lopez@gmail.com','Calle Torres 25','Latacunga'),(7,'Gabriela Chavez','RUC','1487096273','0958692617','gabriela.chavez@gmail.com','Calle Pazmiño 105','Cuenca'),(8,'Sofia Rodriguez','RUC','1233291547','0977351585','sofia.rodriguez@gmail.com','Calle Martinez 102','Esmeraldas'),(9,'Sofia Ortiz','RUC','1098433586','0939005329','sofia.ortiz@gmail.com','Calle Suarez 18','Guayaquil'),(10,'Adriana Peña','Cedula','1629624046','0933529042','adriana.peña@gmail.com','Calle Ramirez 139','Machala'),(11,'Miguel Castro','Pasaporte','1930341337','0902053950','miguel.castro@gmail.com','Calle Castro 68','Guayaquil'),(12,'Ana Ramirez','RUC','1564880035','0911775891','ana.ramirez@gmail.com','Calle Salazar 129','Esmeraldas'),(13,'Ricardo Pazmiño','Pasaporte','1840983577','0984700766','ricardo.pazmiño@gmail.com','Calle Salgado 28','Quito'),(14,'Fernanda Cevallos','RUC','1078910051','0915921249','fernanda.cevallos@gmail.com','Calle Yepez 150','Tulcan'),(15,'Andrea Cevallos','RUC','1641444618','0984789611','andrea.cevallos@gmail.com','Calle Andrade 167','Loja'),(16,'Tomas Solis','Pasaporte','1929315303','0936736576','tomas.solis@gmail.com','Calle Cabrera 187','Machala'),(17,'Andres Guerrero','RUC','1714154134','0945271111','andres.guerrero@gmail.com','Calle Paredes 25','Riobamba'),(18,'Diana Mora','Cedula','1597398528','0909885165','diana.mora@gmail.com','Calle Quinde 193','Loja'),(19,'Valeria Zambrano','RUC','1644685429','0945198327','valeria.zambrano@gmail.com','Calle Rojas 28','Quito'),(20,'Alejandro Espinoza','Cedula','1818841563','0949368998','alejandro.espinoza@gmail.com','Calle Gomez 156','Loja'),(21,'Cecilia Quinde','Pasaporte','1287169808','0902445502','cecilia.quinde@gmail.com','Calle Diaz 145','Babahoyo'),(22,'Julian Flores','Cedula','1795609471','0901836675','julian.flores@gmail.com','Calle Vargas 95','Guayaquil'),(23,'Isabella Zambrano','Pasaporte','1640190407','0910229014','isabella.zambrano@gmail.com','Calle Salazar 170','Loja'),(24,'Valeria Campos','RUC','1444726404','0943815614','valeria.campos@gmail.com','Calle Salgado 174','Portoviejo'),(25,'Paula Campos','Pasaporte','1331162800','0903690034','paula.campos@gmail.com','Calle Suarez 197','Machala'),(26,'Diego Peña','RUC','1352318696','0910762268','diego.peña@gmail.com','Calle Cevallos 59','Manta'),(27,'Raul Espinoza','Pasaporte','1865650861','0951606071','raul.espinoza@gmail.com','Calle Guerrero 148','Babahoyo'),(28,'Valeria Bravo','Pasaporte','1687346882','0964160529','valeria.bravo@gmail.com','Calle Delgado 177','Riobamba'),(29,'Emilio Reyes','RUC','1906758176','0913696816','emilio.reyes@gmail.com','Calle Silva 191','Guayaquil'),(30,'Natalia Rojas','Cedula','1082011731','0981883552','natalia.rojas@gmail.com','Calle Morales 27','Loja'),(31,'Valentina Herrera','Cedula','1646820987','0921277997','valentina.herrera@gmail.com','Calle Salgado 145','Ambato'),(32,'Karina Yepez','RUC','1927978015','0952717744','karina.yepez@gmail.com','Calle Cordova 15','Portoviejo'),(33,'Alejandro Vega','RUC','1495792218','0970054119','alejandro.vega@gmail.com','Calle Villacis 130','Guayaquil'),(34,'David Delgado','Pasaporte','1850207886','0907935978','david.delgado@gmail.com','Calle Diaz 16','Portoviejo'),(35,'Oscar Fernandez','RUC','1766990485','0918203778','oscar.fernandez@gmail.com','Calle Rios 157','Santo Domingo'),(36,'Juan Reyes','RUC','1415985367','0965905151','juan.reyes@gmail.com','Calle Espinoza 174','Loja'),(37,'David Mendoza','Pasaporte','1914362309','0992519254','david.mendoza@gmail.com','Calle Andrade 179','Manta'),(38,'Julian Flores','Pasaporte','1761104727','0914865281','julian.flores@gmail.com','Calle Andrade 172','Cuenca'),(39,'Valeria Vega','Cedula','1389336282','0942357332','valeria.vega@gmail.com','Calle Diaz 20','Loja'),(40,'Jorge Fernandez','Pasaporte','1896703082','0980592962','jorge.fernandez@gmail.com','Calle Vargas 47','Machala'),(41,'Adriana Barros','Pasaporte','1868704078','0927065379','adriana.barros@gmail.com','Calle Mendoza 193','Santo Domingo'),(42,'Diana Salazar','Pasaporte','1256805216','0947359774','diana.salazar@gmail.com','Calle Solis 98','Ambato'),(43,'Raul Rios','Cedula','1877130288','0939240758','raul.rios@gmail.com','Calle Fernandez 183','Riobamba'),(44,'Nestor Rios','Cedula','1306084084','0912478261','nestor.rios@gmail.com','Calle Rojas 116','Babahoyo'),(45,'Tomas Aguilar','Cedula','1445492166','0906853615','tomas.aguilar@gmail.com','Calle Rojas 8','Tulcan'),(46,'Pedro Fernandez','Pasaporte','1697889971','0952204727','pedro.fernandez@gmail.com','Calle Salazar 158','Babahoyo'),(47,'Carlos Garcia','RUC','1231557515','0928986143','carlos.garcia@gmail.com','Calle Silva 32','Quito'),(48,'Ana Morales','Pasaporte','1852442674','0997117980','ana.morales@gmail.com','Calle Yepez 132','Riobamba'),(49,'Ivan Morales','Cedula','1312750915','0960953962','ivan.morales@gmail.com','Calle Quinde 172','Esmeraldas'),(50,'Laura Rios','Cedula','1564852025','0988880670','laura.rios@gmail.com','Calle Yepez 100','Loja'),(51,'Carolina Herrera','Cedula','1383426624','0915319520','carolina.herrera@gmail.com','Calle Aguilar 140','Esmeraldas'),(52,'Natalia Andrade','Pasaporte','1498885034','0972217043','natalia.andrade@gmail.com','Calle Rodriguez 52','Cuenca'),(53,'Tomas Rodriguez','RUC','1553388913','0968740345','tomas.rodriguez@gmail.com','Calle Solis 13','Loja'),(54,'Veronica Andrade','RUC','1133654018','0956676527','veronica.andrade@gmail.com','Calle Barros 128','Loja'),(55,'Carolina Rios','Cedula','1780697625','0961692845','carolina.rios@gmail.com','Calle Fernandez 21','Manta');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `compra_id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `proveedor_id` int NOT NULL,
  `empleado_id` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`compra_id`),
  KEY `fk_compras_proveedor` (`proveedor_id`),
  KEY `fk_compras_empleado` (`empleado_id`),
  CONSTRAINT `fk_compras_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `fk_compras_proveedor` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,'2024-05-09',23,14,12257.17),(2,'2023-10-20',29,10,2927.57),(3,'2025-08-14',40,16,14220.02),(4,'2023-02-09',36,31,10749.18),(5,'2026-04-21',25,9,6160.44),(6,'2023-07-26',34,16,41214.91),(7,'2026-09-26',46,23,22841.75),(8,'2025-07-09',32,23,6152.30),(9,'2025-10-08',12,2,12317.92),(10,'2025-01-26',2,50,9257.40),(11,'2025-10-08',31,34,2874.48),(12,'2024-11-08',11,7,4603.71),(13,'2023-04-19',18,35,18347.38),(14,'2024-03-08',25,23,17728.97),(15,'2025-10-01',38,21,4149.91),(16,'2025-10-19',46,45,12668.79),(17,'2024-08-18',10,37,19789.24),(18,'2026-01-03',20,12,20754.18),(19,'2024-01-17',4,15,18828.88),(20,'2025-10-07',31,1,18472.20),(21,'2024-06-02',9,22,15804.26),(22,'2024-02-28',2,10,25802.35),(23,'2023-06-23',34,24,11853.46),(24,'2023-06-10',43,26,7559.20),(25,'2024-12-14',21,9,23177.24),(26,'2025-03-23',41,32,4632.89),(27,'2025-04-22',36,45,6260.24),(28,'2026-05-24',38,12,26325.76),(29,'2024-03-24',45,19,8875.79),(30,'2026-10-02',1,45,1966.68),(31,'2025-10-08',12,39,973.26),(32,'2023-08-05',41,37,10220.88),(33,'2023-04-12',22,48,29729.72),(34,'2023-12-22',21,11,23036.34),(35,'2025-08-01',41,47,4870.24),(36,'2024-12-03',17,14,10001.29),(37,'2023-12-01',23,17,17680.17),(38,'2026-12-14',4,25,38740.34),(39,'2026-07-12',11,27,19365.36),(40,'2023-08-26',35,25,5956.60),(41,'2024-03-15',37,42,43516.40),(42,'2025-01-11',5,3,11029.74),(43,'2023-06-06',17,7,14331.16),(44,'2023-09-03',25,11,5658.66),(45,'2026-12-01',22,39,5899.27),(46,'2024-10-14',28,42,29822.36),(47,'2023-06-07',11,4,2159.05),(48,'2025-11-10',13,27,4916.70),(49,'2023-01-13',20,16,33654.98),(50,'2026-03-02',37,36,1505.42),(51,'2026-02-10',24,1,9714.85),(52,'2026-04-04',43,41,7705.65),(53,'2024-11-10',2,14,18806.97),(54,'2023-05-26',6,31,6818.46),(55,'2026-11-09',26,31,31103.52);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compras`
--

DROP TABLE IF EXISTS `detalle_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compras` (
  `detalle_compra_id` int NOT NULL AUTO_INCREMENT,
  `compra_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`detalle_compra_id`),
  KEY `fk_detcompras_compra` (`compra_id`),
  KEY `fk_detcompras_producto` (`producto_id`),
  CONSTRAINT `fk_detcompras_compra` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`compra_id`),
  CONSTRAINT `fk_detcompras_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compras`
--

LOCK TABLES `detalle_compras` WRITE;
/*!40000 ALTER TABLE `detalle_compras` DISABLE KEYS */;
INSERT INTO `detalle_compras` VALUES (1,1,70,721.01,17,12257.17),(2,2,48,172.21,17,2927.57),(3,3,24,435.82,19,8280.58),(4,3,6,456.88,13,5939.44),(5,4,60,368.66,13,4792.58),(6,4,29,458.20,13,5956.60),(7,5,8,163.89,9,1475.01),(8,5,13,579.39,7,4055.73),(9,5,45,20.99,30,629.70),(10,6,53,750.68,29,21769.72),(11,6,30,757.23,22,16659.06),(12,6,8,163.89,17,2786.13),(13,7,54,138.17,22,3039.74),(14,7,61,102.27,23,2352.21),(15,7,31,872.49,20,17449.80),(16,8,11,20.65,17,351.05),(17,8,5,276.25,21,5801.25),(18,9,67,74.45,30,2233.50),(19,9,19,230.24,8,1841.92),(20,9,58,824.25,10,8242.50),(21,10,28,308.58,30,9257.40),(22,11,17,479.08,6,2874.48),(23,12,11,20.65,26,536.90),(24,12,56,369.71,11,4066.81),(25,13,19,230.24,24,5525.76),(26,13,34,646.10,15,9691.50),(27,13,9,447.16,7,3130.12),(28,14,51,539.12,22,11860.64),(29,14,42,451.41,13,5868.33),(30,15,59,162.21,5,811.05),(31,15,67,74.45,30,2233.50),(32,15,54,138.17,8,1105.36),(33,16,20,892.63,9,8033.67),(34,16,13,579.39,8,4635.12),(35,17,13,579.39,30,17381.70),(36,17,37,92.26,22,2029.72),(37,17,45,20.99,18,377.82),(38,18,50,263.07,25,6576.75),(39,18,63,616.41,23,14177.43),(40,19,61,102.27,6,613.62),(41,19,23,806.89,13,10489.57),(42,19,52,858.41,9,7725.69),(43,20,52,858.41,6,5150.46),(44,20,51,539.12,15,8086.80),(45,20,31,872.49,6,5234.94),(46,21,61,102.27,13,1329.51),(47,21,48,172.21,5,861.05),(48,21,44,453.79,30,13613.70),(49,22,40,704.56,13,9159.28),(50,22,63,616.41,27,16643.07),(51,23,13,579.39,12,6952.68),(52,23,18,251.58,14,3522.12),(53,23,57,47.54,29,1378.66),(54,24,35,151.54,28,4243.12),(55,24,54,138.17,24,3316.08),(56,25,12,148.66,11,1635.26),(57,25,57,47.54,11,522.94),(58,25,53,750.68,28,21019.04),(59,26,67,74.45,16,1191.20),(60,26,8,163.89,21,3441.69),(61,27,9,447.16,14,6260.24),(62,28,65,323.27,17,5495.59),(63,28,18,251.58,29,7295.82),(64,28,68,588.45,23,13534.35),(65,29,23,806.89,11,8875.79),(66,30,8,163.89,12,1966.68),(67,31,59,162.21,6,973.26),(68,32,26,534.53,13,6948.89),(69,32,48,172.21,19,3271.99),(70,33,51,539.12,25,13478.00),(71,33,16,611.52,26,15899.52),(72,33,4,29.35,12,352.20),(73,34,63,616.41,24,14793.84),(74,34,58,824.25,10,8242.50),(75,35,45,20.99,16,335.84),(76,35,21,348.80,13,4534.40),(77,36,12,148.66,14,2081.24),(78,36,4,29.35,17,498.95),(79,36,7,742.11,10,7421.10),(80,37,28,308.58,12,3702.96),(81,37,29,458.20,26,11913.20),(82,37,27,158.77,13,2064.01),(83,38,53,750.68,21,15764.28),(84,38,3,291.94,29,8466.26),(85,38,2,725.49,20,14509.80),(86,39,23,806.89,24,19365.36),(87,40,29,458.20,13,5956.60),(88,41,40,704.56,27,19023.12),(89,41,36,849.52,18,15291.36),(90,41,49,575.12,16,9201.92),(91,42,33,533.50,11,5868.50),(92,42,60,368.66,14,5161.24),(93,43,67,74.45,24,1786.80),(94,43,51,539.12,23,12399.76),(95,43,14,28.92,5,144.60),(96,44,48,172.21,22,3788.62),(97,44,37,92.26,14,1291.64),(98,44,14,28.92,20,578.40),(99,45,44,453.79,13,5899.27),(100,46,42,451.41,13,5868.33),(101,46,34,646.10,25,16152.50),(102,46,39,709.23,11,7801.53),(103,47,67,74.45,29,2159.05),(104,48,8,163.89,30,4916.70),(105,49,52,858.41,26,22318.66),(106,49,41,165.08,26,4292.08),(107,49,18,251.58,28,7044.24),(108,50,64,107.53,14,1505.42),(109,51,54,138.17,17,2348.89),(110,51,50,263.07,28,7365.96),(111,52,25,513.71,15,7705.65),(112,53,29,458.20,26,11913.20),(113,53,69,169.39,25,4234.75),(114,53,61,102.27,26,2659.02),(115,54,65,323.27,14,4525.78),(116,54,22,88.18,26,2292.68),(117,55,24,435.82,14,6101.48),(118,55,13,579.39,20,11587.80),(119,55,17,479.08,28,13414.24);
/*!40000 ALTER TABLE `detalle_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ventas` (
  `detalle_id` int NOT NULL AUTO_INCREMENT,
  `venta_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`detalle_id`),
  KEY `fk_detventas_venta` (`venta_id`),
  KEY `fk_detventas_producto` (`producto_id`),
  CONSTRAINT `fk_detventas_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`),
  CONSTRAINT `fk_detventas_venta` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`venta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ventas`
--

LOCK TABLES `detalle_ventas` WRITE;
/*!40000 ALTER TABLE `detalle_ventas` DISABLE KEYS */;
INSERT INTO `detalle_ventas` VALUES (1,1,57,75.46,3,226.38),(2,2,28,463.56,2,927.12),(3,2,53,921.58,5,4607.90),(4,2,57,75.46,2,150.92),(5,3,13,911.71,2,1823.42),(6,4,50,398.38,3,1195.14),(7,5,41,223.24,2,446.48),(8,5,32,308.26,3,924.78),(9,6,11,25.92,2,51.84),(10,6,37,126.62,1,126.62),(11,6,39,1096.11,2,2192.22),(12,7,66,400.52,2,801.04),(13,7,51,764.61,3,2293.83),(14,7,7,1177.43,2,2354.86),(15,8,50,398.38,1,398.38),(16,8,31,1160.89,4,4643.56),(17,9,10,69.13,5,345.65),(18,9,2,1080.23,3,3240.69),(19,9,41,223.24,2,446.48),(20,10,54,182.54,3,547.62),(21,10,70,1046.84,2,2093.68),(22,11,10,69.13,1,69.13),(23,11,9,700.59,1,700.59),(24,12,28,463.56,1,463.56),(25,12,8,248.78,4,995.12),(26,13,37,126.62,5,633.10),(27,13,54,182.54,4,730.16),(28,13,52,1188.60,1,1188.60),(29,14,69,214.12,5,1070.60),(30,14,20,1303.20,3,3909.60),(31,14,11,25.92,3,77.76),(32,15,66,400.52,2,801.04),(33,16,69,214.12,3,642.36),(34,17,9,700.59,3,2101.77),(35,17,56,518.57,2,1037.14),(36,18,32,308.26,1,308.26),(37,19,15,925.15,4,3700.60),(38,19,8,248.78,3,746.34),(39,20,23,1264.93,1,1264.93),(40,20,2,1080.23,2,2160.46),(41,20,2,1080.23,2,2160.46),(42,21,45,28.51,5,142.55),(43,21,67,90.67,3,272.01),(44,22,48,234.08,2,468.16),(45,23,35,205.47,1,205.47),(46,23,4,41.72,3,125.16),(47,23,55,526.09,3,1578.27),(48,24,9,700.59,3,2101.77),(49,24,10,69.13,4,276.52),(50,24,59,234.40,5,1172.00),(51,25,8,248.78,4,995.12),(52,25,22,135.63,3,406.89),(53,26,33,721.31,1,721.31),(54,27,15,925.15,2,1850.30),(55,27,66,400.52,1,400.52),(56,27,6,667.89,1,667.89),(57,28,6,667.89,4,2671.56),(58,29,50,398.38,2,796.76),(59,29,23,1264.93,1,1264.93),(60,30,54,182.54,2,365.08),(61,30,42,553.12,2,1106.24),(62,30,54,182.54,3,547.62),(63,31,10,69.13,5,345.65),(64,31,48,234.08,1,234.08),(65,32,7,1177.43,2,2354.86),(66,32,29,728.41,5,3642.05),(67,32,6,667.89,4,2671.56),(68,33,60,553.39,3,1660.17),(69,34,42,553.12,1,553.12),(70,34,59,234.40,1,234.40),(71,35,26,802.28,3,2406.84),(72,35,39,1096.11,5,5480.55),(73,36,60,553.39,3,1660.17),(74,37,64,146.93,2,293.86),(75,37,70,1046.84,2,2093.68),(76,37,20,1303.20,1,1303.20),(77,38,4,41.72,2,83.44),(78,38,70,1046.84,3,3140.52),(79,39,2,1080.23,3,3240.69),(80,39,1,386.96,4,1547.84),(81,39,40,1049.75,1,1049.75),(82,40,68,865.53,2,1731.06),(83,41,63,909.93,1,909.93),(84,41,19,340.50,3,1021.50),(85,42,6,667.89,2,1335.78),(86,43,53,921.58,3,2764.74),(87,43,59,234.40,1,234.40),(88,43,13,911.71,5,4558.55),(89,44,51,764.61,1,764.61),(90,45,8,248.78,4,995.12),(91,45,17,621.07,2,1242.14),(92,45,38,131.51,3,394.53),(93,46,51,764.61,3,2293.83),(94,46,41,223.24,4,892.96),(95,47,30,1011.84,1,1011.84),(96,47,26,802.28,2,1604.56),(97,48,14,40.86,2,81.72),(98,48,14,40.86,2,81.72),(99,48,58,1025.16,4,4100.64),(100,49,53,921.58,1,921.58),(101,49,69,214.12,3,642.36),(102,50,58,1025.16,3,3075.48),(103,51,34,796.52,1,796.52),(104,51,12,191.40,2,382.80),(105,52,39,1096.11,5,5480.55),(106,52,6,667.89,2,1335.78),(107,52,42,553.12,2,1106.24),(108,53,32,308.26,3,924.78),(109,54,66,400.52,1,400.52),(110,54,39,1096.11,3,3288.33),(111,55,4,41.72,4,166.88),(112,56,32,308.26,1,308.26),(113,56,60,553.39,1,553.39),(114,57,16,931.02,1,931.02),(115,58,29,728.41,2,1456.82),(116,59,52,1188.60,3,3565.80),(117,60,11,25.92,5,129.60),(118,60,34,796.52,1,796.52),(119,60,3,355.67,1,355.67),(120,61,57,75.46,2,150.92),(121,62,43,545.90,1,545.90),(122,63,60,553.39,1,553.39),(123,64,56,518.57,4,2074.28),(124,65,4,41.72,4,166.88),(125,65,55,526.09,2,1052.18);
/*!40000 ALTER TABLE `detalle_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `empleado_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `cargo` varchar(40) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `salario` decimal(10,2) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  PRIMARY KEY (`empleado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Pedro Quinde','Administrador','0996275705','pedro.quinde@lejostech.com',863.77,'2025-05-21'),(2,'Gonzalo Martinez','Tecnico de Ensamblaje','0965820297','gonzalo.martinez@lejostech.com',1356.10,'2019-03-03'),(3,'Gabriela Solis','Soporte Tecnico','0990927557','gabriela.solis@lejostech.com',938.90,'2020-10-05'),(4,'Ximena Reyes','Gerente de Ventas','0943102786','ximena.reyes@lejostech.com',874.42,'2020-05-25'),(5,'Miguel Cevallos','Contador','0994731217','miguel.cevallos@lejostech.com',739.67,'2021-12-15'),(6,'Laura Salgado','Soporte Tecnico','0918844225','laura.salgado@lejostech.com',1351.58,'2022-02-07'),(7,'Gonzalo Ramirez','Bodeguero','0905895782','gonzalo.ramirez@lejostech.com',1517.00,'2020-02-10'),(8,'Mariana Cevallos','Contador','0969125177','mariana.cevallos@lejostech.com',1159.69,'2024-03-27'),(9,'Patricia Espinoza','Jefe de Bodega','0926801824','patricia.espinoza@lejostech.com',695.65,'2021-03-11'),(10,'Cecilia Cevallos','Bodeguero','0984143842','cecilia.cevallos@lejostech.com',917.13,'2023-10-18'),(11,'Laura Vega','Cajero','0992299590','laura.vega@lejostech.com',1248.94,'2019-02-02'),(12,'Karina Solis','Jefe de Bodega','0939690784','karina.solis@lejostech.com',807.29,'2023-08-08'),(13,'Elena Salgado','Gerente de Ventas','0910276773','elena.salgado@lejostech.com',851.54,'2024-10-05'),(14,'Pedro Cevallos','Soporte Tecnico','0956258815','pedro.cevallos@lejostech.com',1441.17,'2022-08-04'),(15,'Sofia Salazar','Bodeguero','0904696325','sofia.salazar@lejostech.com',640.18,'2024-04-25'),(16,'Juan Campos','Auxiliar de Inventario','0947016873','juan.campos@lejostech.com',1080.20,'2022-10-12'),(17,'Ana Martinez','Administrador','0974801624','ana.martinez@lejostech.com',1118.11,'2024-07-12'),(18,'Jose Flores','Vendedor','0935841687','jose.flores@lejostech.com',1219.88,'2023-10-22'),(19,'Melissa Torres','Cajero','0965585239','melissa.torres@lejostech.com',1766.36,'2025-09-02'),(20,'Jose Rodriguez','Cajero','0978729825','jose.rodriguez@lejostech.com',1413.35,'2024-03-13'),(21,'Melissa Mora','Administrador','0988879470','melissa.mora@lejostech.com',1251.53,'2024-06-22'),(22,'Camila Cabrera','Jefe de Bodega','0909749930','camila.cabrera@lejostech.com',865.37,'2026-03-17'),(23,'Esteban Zambrano','Jefe de Bodega','0962309130','esteban.zambrano@lejostech.com',1495.72,'2026-06-14'),(24,'Valentina Cabrera','Bodeguero','0997028385','valentina.cabrera@lejostech.com',1004.01,'2026-09-13'),(25,'Pedro Castro','Contador','0958549733','pedro.castro@lejostech.com',1681.37,'2023-09-10'),(26,'Ricardo Silva','Administrador','0975758441','ricardo.silva@lejostech.com',1401.62,'2025-07-27'),(27,'Alejandro Solis','Cajero','0941574733','alejandro.solis@lejostech.com',842.11,'2023-09-23'),(28,'Sofia Ramirez','Tecnico de Ensamblaje','0993308330','sofia.ramirez@lejostech.com',1281.16,'2020-07-11'),(29,'Silvia Navarro','Tecnico de Ensamblaje','0920826773','silvia.navarro@lejostech.com',1369.61,'2023-06-10'),(30,'Karina Martinez','Tecnico de Ensamblaje','0938026206','karina.martinez@lejostech.com',1330.60,'2026-03-24'),(31,'Veronica Mendoza','Vendedor','0999154788','veronica.mendoza@lejostech.com',462.51,'2026-03-28'),(32,'Raul Delgado','Administrador','0915274205','raul.delgado@lejostech.com',710.30,'2023-10-22'),(33,'Rodrigo Ortiz','Cajero','0966851612','rodrigo.ortiz@lejostech.com',1274.79,'2021-08-11'),(34,'Cecilia Morales','Vendedor','0937454990','cecilia.morales@lejostech.com',802.06,'2023-11-12'),(35,'Felipe Morales','Vendedor','0974268414','felipe.morales@lejostech.com',1351.51,'2024-10-08'),(36,'Ricardo Ramirez','Contador','0995687833','ricardo.ramirez@lejostech.com',656.80,'2020-09-15'),(37,'Ximena Cevallos','Soporte Tecnico','0991088398','ximena.cevallos@lejostech.com',555.44,'2021-03-11'),(38,'Nestor Rios','Contador','0939718707','nestor.rios@lejostech.com',606.92,'2021-09-14'),(39,'Lucia Bravo','Vendedor','0940640391','lucia.bravo@lejostech.com',1204.38,'2019-07-12'),(40,'Felipe Lopez','Auxiliar de Inventario','0917046226','felipe.lopez@lejostech.com',1792.07,'2024-07-15'),(41,'Veronica Cruz','Gerente de Ventas','0982512868','veronica.cruz@lejostech.com',558.34,'2021-12-08'),(42,'Adriana Perez','Vendedor','0978686337','adriana.perez@lejostech.com',1770.96,'2024-03-09'),(43,'Fernando Zambrano','Tecnico de Ensamblaje','0969033119','fernando.zambrano@lejostech.com',493.49,'2019-08-20'),(44,'Monica Cevallos','Vendedor','0906738302','monica.cevallos@lejostech.com',780.39,'2023-04-27'),(45,'Emilio Zambrano','Jefe de Bodega','0995342836','emilio.zambrano@lejostech.com',880.52,'2023-05-02'),(46,'Andrea Cordova','Cajero','0968705685','andrea.cordova@lejostech.com',1295.09,'2025-07-05'),(47,'Isabella Cruz','Cajero','0973342708','isabella.cruz@lejostech.com',1468.46,'2025-07-18'),(48,'Ximena Ramirez','Gerente de Ventas','0935175183','ximena.ramirez@lejostech.com',777.86,'2019-05-13'),(49,'Monica Villacis','Jefe de Bodega','0913983735','monica.villacis@lejostech.com',503.39,'2023-01-07'),(50,'Cecilia Ortiz','Tecnico de Ensamblaje','0973936385','cecilia.ortiz@lejostech.com',1458.29,'2023-07-15');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo_componentes`
--

DROP TABLE IF EXISTS `equipo_componentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo_componentes` (
  `equipo_componente_id` int NOT NULL AUTO_INCREMENT,
  `equipo_id` int NOT NULL,
  `producto_id` int NOT NULL,
  PRIMARY KEY (`equipo_componente_id`),
  KEY `fk_equipocomp_equipo` (`equipo_id`),
  KEY `fk_equipocomp_producto` (`producto_id`),
  CONSTRAINT `fk_equipocomp_equipo` FOREIGN KEY (`equipo_id`) REFERENCES `equipos_ensamblados` (`equipo_id`),
  CONSTRAINT `fk_equipocomp_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo_componentes`
--

LOCK TABLES `equipo_componentes` WRITE;
/*!40000 ALTER TABLE `equipo_componentes` DISABLE KEYS */;
INSERT INTO `equipo_componentes` VALUES (1,1,43),(2,1,12),(3,1,29),(4,1,46),(5,2,26),(6,2,44),(7,2,53),(8,2,59),(9,3,52),(10,3,55),(11,3,62),(12,3,50),(13,3,1),(14,3,5),(15,4,46),(16,4,25),(17,4,22),(18,4,52),(19,4,3),(20,4,30),(21,5,16),(22,5,33),(23,5,61),(24,5,20),(25,5,27),(26,5,2),(27,6,46),(28,6,53),(29,6,38),(30,6,21),(31,7,34),(32,7,60),(33,7,7),(34,7,13),(35,7,23),(36,8,22),(37,8,15),(38,8,17),(39,8,8),(40,8,21),(41,8,14),(42,9,45),(43,9,50),(44,9,20),(45,9,7),(46,9,2),(47,9,21),(48,10,12),(49,10,64),(50,10,58),(51,10,41),(52,10,16),(53,10,69),(54,11,43),(55,11,61),(56,11,47),(57,11,58),(58,11,15),(59,11,13),(60,12,58),(61,12,59),(62,12,65),(63,13,36),(64,13,51),(65,13,44),(66,13,38),(67,14,54),(68,14,69),(69,14,37),(70,14,55),(71,14,2),(72,14,14),(73,15,50),(74,15,31),(75,15,66),(76,15,37),(77,16,49),(78,16,6),(79,16,55),(80,17,63),(81,17,46),(82,17,10),(83,17,41),(84,17,68),(85,18,6),(86,18,42),(87,18,49),(88,18,15),(89,19,14),(90,19,27),(91,19,56),(92,19,10),(93,19,20),(94,19,4),(95,20,41),(96,20,3),(97,20,50),(98,20,16),(99,20,1),(100,20,9),(101,21,6),(102,21,1),(103,21,51),(104,22,33),(105,22,13),(106,22,26),(107,23,20),(108,23,47),(109,23,41),(110,23,55),(111,23,22),(112,24,18),(113,24,69),(114,24,26),(115,24,34),(116,24,10),(117,25,18),(118,25,60),(119,25,65),(120,25,66),(121,25,12),(122,26,50),(123,26,61),(124,26,59),(125,26,6),(126,26,42),(127,27,28),(128,27,20),(129,27,24),(130,27,21),(131,27,47),(132,28,8),(133,28,22),(134,28,34),(135,28,24),(136,29,22),(137,29,44),(138,29,59),(139,29,9),(140,29,30),(141,30,62),(142,30,17),(143,30,70),(144,31,25),(145,31,1),(146,31,67),(147,31,16),(148,31,49),(149,32,53),(150,32,62),(151,32,23),(152,32,48),(153,33,9),(154,33,34),(155,33,29),(156,34,31),(157,34,1),(158,34,21),(159,34,12),(160,34,36),(161,35,44),(162,35,15),(163,35,66),(164,35,33),(165,35,69),(166,36,34),(167,36,32),(168,36,37),(169,37,26),(170,37,31),(171,37,69),(172,37,34),(173,37,27),(174,37,30),(175,38,36),(176,38,63),(177,38,24),(178,38,66),(179,38,70),(180,38,51),(181,39,44),(182,39,47),(183,39,24),(184,39,64),(185,39,55),(186,39,27),(187,40,19),(188,40,20),(189,40,61),(190,40,2),(191,41,45),(192,41,3),(193,41,53),(194,41,16),(195,41,26),(196,42,35),(197,42,57),(198,42,47),(199,42,67),(200,42,58),(201,42,53),(202,43,57),(203,43,17),(204,43,68),(205,43,22),(206,43,4),(207,44,39),(208,44,2),(209,44,1),(210,44,67),(211,45,67),(212,45,35),(213,45,37),(214,45,69),(215,46,3),(216,46,20),(217,46,7),(218,46,69),(219,46,24),(220,47,24),(221,47,25),(222,47,33),(223,47,49),(224,47,2),(225,47,16),(226,48,47),(227,48,7),(228,48,28),(229,48,15),(230,49,32),(231,49,21),(232,49,64),(233,50,57),(234,50,25),(235,50,3),(236,50,49),(237,50,46),(238,51,24),(239,51,3),(240,51,47),(241,51,31),(242,51,42),(243,51,9),(244,52,63),(245,52,68),(246,52,33),(247,52,7),(248,52,47),(249,52,29);
/*!40000 ALTER TABLE `equipo_componentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo_servicios`
--

DROP TABLE IF EXISTS `equipo_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo_servicios` (
  `servicio_id` int NOT NULL AUTO_INCREMENT,
  `equipo_id` int NOT NULL,
  `empleado_id` int NOT NULL,
  `fecha_servicio` date NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  PRIMARY KEY (`servicio_id`),
  KEY `fk_equiposerv_equipo` (`equipo_id`),
  KEY `fk_equiposerv_empleado` (`empleado_id`),
  CONSTRAINT `fk_equiposerv_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `fk_equiposerv_equipo` FOREIGN KEY (`equipo_id`) REFERENCES `equipos_ensamblados` (`equipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo_servicios`
--

LOCK TABLES `equipo_servicios` WRITE;
/*!40000 ALTER TABLE `equipo_servicios` DISABLE KEYS */;
INSERT INTO `equipo_servicios` VALUES (1,1,17,'2025-08-28',18.24,'Ensamblaje e instalacion de sistema operativo'),(2,1,41,'2023-08-07',45.03,'Optimizacion y limpieza de software'),(3,2,22,'2024-06-21',14.06,'Optimizacion y limpieza de software'),(4,2,18,'2024-03-19',63.51,'Optimizacion y limpieza de software'),(5,3,1,'2024-04-23',71.39,'Mantenimiento preventivo'),(6,3,9,'2023-07-17',51.21,'Instalacion de componentes adicionales'),(7,3,5,'2023-05-10',41.91,'Configuracion de red y perifericos'),(8,4,46,'2023-07-21',27.91,'Configuracion de red y perifericos'),(9,4,40,'2023-10-02',56.34,'Ensamblaje e instalacion de sistema operativo'),(10,5,33,'2023-05-04',64.93,'Optimizacion y limpieza de software'),(11,6,16,'2023-01-22',16.23,'Ensamblaje e instalacion de sistema operativo'),(12,6,37,'2026-03-03',64.57,'Ensamblaje e instalacion de sistema operativo'),(13,7,8,'2023-01-01',69.64,'Instalacion de componentes adicionales'),(14,7,22,'2025-08-20',28.78,'Ensamblaje e instalacion de sistema operativo'),(15,7,24,'2025-03-04',38.05,'Optimizacion y limpieza de software'),(16,8,2,'2024-08-16',17.91,'Optimizacion y limpieza de software'),(17,8,29,'2023-02-09',55.85,'Ensamblaje e instalacion de sistema operativo'),(18,8,46,'2024-11-28',33.68,'Configuracion de red y perifericos'),(19,9,22,'2025-01-17',25.59,'Optimizacion y limpieza de software'),(20,10,39,'2025-09-18',24.48,'Optimizacion y limpieza de software'),(21,11,7,'2023-03-16',19.83,'Optimizacion y limpieza de software'),(22,11,7,'2025-10-07',23.13,'Optimizacion y limpieza de software'),(23,11,14,'2026-04-23',33.66,'Optimizacion y limpieza de software'),(24,12,48,'2023-09-14',68.72,'Optimizacion y limpieza de software'),(25,12,33,'2024-12-19',22.16,'Instalacion de componentes adicionales'),(26,12,7,'2026-11-20',52.43,'Mantenimiento preventivo'),(27,13,45,'2025-12-18',70.25,'Configuracion de red y perifericos'),(28,13,41,'2024-04-07',53.69,'Mantenimiento preventivo'),(29,13,44,'2025-11-05',78.69,'Instalacion de componentes adicionales'),(30,14,49,'2024-05-22',27.54,'Ensamblaje e instalacion de sistema operativo'),(31,14,45,'2025-04-25',47.88,'Mantenimiento preventivo'),(32,15,21,'2023-01-24',27.59,'Configuracion de red y perifericos'),(33,15,50,'2026-04-21',59.32,'Mantenimiento preventivo'),(34,15,49,'2024-12-07',30.59,'Instalacion de componentes adicionales'),(35,16,38,'2025-01-11',42.64,'Instalacion de componentes adicionales'),(36,17,35,'2026-02-12',25.48,'Instalacion de componentes adicionales'),(37,17,43,'2025-06-12',30.55,'Configuracion de red y perifericos'),(38,17,34,'2026-09-27',62.65,'Ensamblaje e instalacion de sistema operativo'),(39,18,50,'2025-09-26',45.61,'Optimizacion y limpieza de software'),(40,18,3,'2025-11-07',32.42,'Ensamblaje e instalacion de sistema operativo'),(41,18,7,'2024-09-18',10.51,'Ensamblaje e instalacion de sistema operativo'),(42,19,17,'2023-10-27',25.94,'Mantenimiento preventivo'),(43,20,6,'2025-08-13',37.66,'Ensamblaje e instalacion de sistema operativo'),(44,20,31,'2024-09-08',19.55,'Optimizacion y limpieza de software'),(45,20,35,'2025-11-05',30.86,'Mantenimiento preventivo'),(46,21,48,'2025-04-14',73.39,'Configuracion de red y perifericos'),(47,21,10,'2024-03-08',53.18,'Mantenimiento preventivo'),(48,21,13,'2023-03-22',65.98,'Ensamblaje e instalacion de sistema operativo'),(49,22,43,'2024-02-10',53.37,'Instalacion de componentes adicionales'),(50,23,24,'2024-11-24',33.21,'Optimizacion y limpieza de software'),(51,23,30,'2026-06-25',31.38,'Configuracion de red y perifericos'),(52,24,36,'2025-09-18',43.05,'Instalacion de componentes adicionales'),(53,25,9,'2026-03-06',49.65,'Configuracion de red y perifericos'),(54,25,43,'2024-12-24',43.85,'Mantenimiento preventivo'),(55,25,3,'2024-08-08',14.40,'Mantenimiento preventivo'),(56,26,25,'2025-10-21',72.88,'Ensamblaje e instalacion de sistema operativo'),(57,26,34,'2025-07-08',46.15,'Mantenimiento preventivo'),(58,26,23,'2026-08-20',10.46,'Instalacion de componentes adicionales'),(59,27,44,'2026-08-07',51.36,'Optimizacion y limpieza de software'),(60,27,2,'2024-01-05',50.14,'Instalacion de componentes adicionales'),(61,28,29,'2026-08-06',25.36,'Optimizacion y limpieza de software'),(62,29,34,'2026-03-20',16.74,'Optimizacion y limpieza de software'),(63,30,3,'2026-04-26',43.75,'Optimizacion y limpieza de software'),(64,30,23,'2023-07-05',27.82,'Instalacion de componentes adicionales'),(65,31,28,'2025-05-28',47.53,'Configuracion de red y perifericos'),(66,32,26,'2024-11-04',62.35,'Optimizacion y limpieza de software'),(67,32,45,'2024-02-07',45.58,'Mantenimiento preventivo'),(68,32,36,'2023-03-13',77.52,'Ensamblaje e instalacion de sistema operativo'),(69,33,25,'2026-10-21',46.47,'Configuracion de red y perifericos'),(70,33,4,'2024-11-16',40.73,'Instalacion de componentes adicionales'),(71,33,43,'2025-04-02',64.88,'Configuracion de red y perifericos'),(72,34,1,'2023-02-18',29.91,'Configuracion de red y perifericos'),(73,34,38,'2025-06-27',29.36,'Configuracion de red y perifericos'),(74,34,13,'2026-07-19',10.33,'Instalacion de componentes adicionales'),(75,35,50,'2026-11-15',72.76,'Ensamblaje e instalacion de sistema operativo'),(76,35,31,'2023-05-03',36.79,'Instalacion de componentes adicionales'),(77,36,36,'2024-08-11',34.75,'Configuracion de red y perifericos'),(78,37,44,'2026-10-01',63.50,'Configuracion de red y perifericos'),(79,38,23,'2026-11-25',22.24,'Ensamblaje e instalacion de sistema operativo'),(80,38,45,'2026-06-23',10.59,'Instalacion de componentes adicionales'),(81,38,25,'2023-06-12',52.89,'Mantenimiento preventivo'),(82,39,37,'2024-10-22',26.00,'Ensamblaje e instalacion de sistema operativo'),(83,40,34,'2025-08-10',27.57,'Configuracion de red y perifericos'),(84,40,4,'2026-02-23',21.43,'Instalacion de componentes adicionales'),(85,40,17,'2026-11-04',41.49,'Mantenimiento preventivo'),(86,41,29,'2023-07-20',30.06,'Instalacion de componentes adicionales'),(87,41,11,'2025-07-21',52.86,'Optimizacion y limpieza de software'),(88,41,5,'2023-03-11',25.98,'Mantenimiento preventivo'),(89,42,45,'2023-04-06',37.79,'Ensamblaje e instalacion de sistema operativo'),(90,42,5,'2026-09-02',11.85,'Optimizacion y limpieza de software'),(91,42,34,'2023-02-09',53.27,'Ensamblaje e instalacion de sistema operativo'),(92,43,18,'2026-03-23',47.75,'Configuracion de red y perifericos'),(93,43,39,'2026-11-24',54.51,'Configuracion de red y perifericos'),(94,43,28,'2025-06-16',47.78,'Ensamblaje e instalacion de sistema operativo'),(95,44,1,'2026-08-10',10.64,'Optimizacion y limpieza de software'),(96,44,19,'2024-01-18',36.16,'Optimizacion y limpieza de software'),(97,44,36,'2026-07-08',21.43,'Optimizacion y limpieza de software'),(98,45,9,'2025-02-21',41.87,'Optimizacion y limpieza de software'),(99,46,1,'2024-02-05',11.03,'Instalacion de componentes adicionales'),(100,46,22,'2026-05-26',65.96,'Mantenimiento preventivo'),(101,46,30,'2023-06-03',69.05,'Instalacion de componentes adicionales'),(102,47,48,'2023-09-22',78.75,'Optimizacion y limpieza de software'),(103,47,25,'2025-06-06',54.04,'Ensamblaje e instalacion de sistema operativo'),(104,48,18,'2023-07-26',27.02,'Ensamblaje e instalacion de sistema operativo'),(105,49,23,'2024-12-18',65.40,'Instalacion de componentes adicionales'),(106,50,19,'2026-04-19',23.06,'Mantenimiento preventivo'),(107,50,21,'2026-05-28',68.19,'Configuracion de red y perifericos'),(108,50,11,'2023-09-05',41.46,'Mantenimiento preventivo'),(109,51,42,'2025-02-04',46.62,'Ensamblaje e instalacion de sistema operativo'),(110,51,3,'2024-03-28',12.19,'Ensamblaje e instalacion de sistema operativo'),(111,52,4,'2025-09-24',75.68,'Optimizacion y limpieza de software'),(112,52,24,'2023-10-09',47.03,'Ensamblaje e instalacion de sistema operativo'),(113,52,20,'2023-04-17',16.80,'Instalacion de componentes adicionales');
/*!40000 ALTER TABLE `equipo_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos_ensamblados`
--

DROP TABLE IF EXISTS `equipos_ensamblados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos_ensamblados` (
  `equipo_id` int NOT NULL AUTO_INCREMENT,
  `nombre_equipo` varchar(60) NOT NULL,
  `cliente_id` int NOT NULL,
  `precio_total` decimal(10,2) NOT NULL,
  `fecha_ensamble` date NOT NULL,
  `empleado_id` int NOT NULL,
  PRIMARY KEY (`equipo_id`),
  KEY `fk_equipos_cliente` (`cliente_id`),
  KEY `fk_equipos_empleado` (`empleado_id`),
  CONSTRAINT `fk_equipos_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `fk_equipos_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos_ensamblados`
--

LOCK TABLES `equipos_ensamblados` WRITE;
/*!40000 ALTER TABLE `equipos_ensamblados` DISABLE KEYS */;
INSERT INTO `equipos_ensamblados` VALUES (1,'PC Gamer / Oficina #1',17,2020.92,'2025-07-02',47),(2,'PC Gamer / Oficina #2',55,2614.74,'2023-03-20',10),(3,'PC Gamer / Oficina #3',28,3656.64,'2025-07-22',41),(4,'PC Gamer / Oficina #4',9,3870.16,'2023-12-04',22),(5,'PC Gamer / Oficina #5',27,4373.37,'2024-10-07',29),(6,'PC Gamer / Oficina #6',50,2093.27,'2023-05-21',17),(7,'PC Gamer / Oficina #7',15,4703.98,'2025-07-23',30),(8,'PC Gamer / Oficina #8',55,2456.46,'2023-07-22',31),(9,'PC Gamer / Oficina #9',47,4472.72,'2026-04-03',16),(10,'PC Gamer / Oficina #10',30,2731.87,'2025-06-27',29),(11,'PC Gamer / Oficina #11',4,3944.57,'2023-11-27',15),(12,'PC Gamer / Oficina #12',44,1691.85,'2026-07-20',38),(13,'PC Gamer / Oficina #13',45,2723.15,'2025-12-04',49),(14,'PC Gamer / Oficina #14',49,2170.46,'2026-02-20',23),(15,'PC Gamer / Oficina #15',44,2086.41,'2023-03-06',48),(16,'PC Gamer / Oficina #16',48,2106.76,'2023-03-11',33),(17,'PC Gamer / Oficina #17',39,2623.04,'2023-11-12',4),(18,'PC Gamer / Oficina #18',29,3058.94,'2024-11-21',16),(19,'PC Gamer / Oficina #19',50,2179.28,'2026-07-15',14),(20,'PC Gamer / Oficina #20',41,2995.86,'2023-09-28',26),(21,'PC Gamer / Oficina #21',36,1819.46,'2026-11-18',10),(22,'PC Gamer / Oficina #22',5,2435.30,'2025-08-15',19),(23,'PC Gamer / Oficina #23',22,2593.00,'2023-03-21',40),(24,'PC Gamer / Oficina #24',39,2223.89,'2025-07-08',6),(25,'PC Gamer / Oficina #25',50,1919.44,'2024-01-22',38),(26,'PC Gamer / Oficina #26',14,1985.60,'2026-03-08',34),(27,'PC Gamer / Oficina #27',5,3187.67,'2024-11-17',33),(28,'PC Gamer / Oficina #28',3,1712.03,'2024-10-27',37),(29,'PC Gamer / Oficina #29',50,2738.94,'2023-09-17',12),(30,'PC Gamer / Oficina #30',49,2471.34,'2023-05-20',8),(31,'PC Gamer / Oficina #31',35,2944.64,'2025-10-09',27),(32,'PC Gamer / Oficina #32',44,3224.02,'2023-03-16',26),(33,'PC Gamer / Oficina #33',39,2225.52,'2024-10-06',28),(34,'PC Gamer / Oficina #34',44,3394.77,'2026-09-04',3),(35,'PC Gamer / Oficina #35',36,2917.58,'2024-06-14',5),(36,'PC Gamer / Oficina #36',23,1231.40,'2025-03-24',34),(37,'PC Gamer / Oficina #37',44,4191.45,'2023-08-12',13),(38,'PC Gamer / Oficina #38',40,4823.55,'2024-09-09',21),(39,'PC Gamer / Oficina #39',16,2471.24,'2025-04-18',18),(40,'PC Gamer / Oficina #40',28,2855.74,'2025-06-12',25),(41,'PC Gamer / Oficina #41',36,3039.06,'2025-12-09',36),(42,'PC Gamer / Oficina #42',39,2723.18,'2026-05-08',42),(43,'PC Gamer / Oficina #43',16,1739.41,'2026-05-12',48),(44,'PC Gamer / Oficina #44',27,2653.97,'2026-04-09',17),(45,'PC Gamer / Oficina #45',6,636.88,'2025-12-20',28),(46,'PC Gamer / Oficina #46',32,3581.52,'2023-05-25',13),(47,'PC Gamer / Oficina #47',26,4799.65,'2023-05-16',5),(48,'PC Gamer / Oficina #48',41,2970.98,'2026-12-20',20),(49,'PC Gamer / Oficina #49',10,940.16,'2026-04-11',24),(50,'PC Gamer / Oficina #50',36,2522.33,'2025-08-01',42),(51,'PC Gamer / Oficina #51',50,3706.21,'2026-04-04',41),(52,'PC Gamer / Oficina #52',3,4807.45,'2026-04-07',37);
/*!40000 ALTER TABLE `equipos_ensamblados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `marca_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `pais_origen` varchar(50) NOT NULL,
  `sitio_web` varchar(100) DEFAULT NULL,
  `telefono_contacto` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`marca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Intel','Alemania','www.intel.com','0910433218'),(2,'AMD','Estados Unidos','www.amd.com','0996001338'),(3,'NVIDIA','Japon','www.nvidia.com','0908386379'),(4,'Asus','China','www.asus.com','0902654235'),(5,'MSI','Estados Unidos','www.msi.com','0916155940'),(6,'Gigabyte','Alemania','www.gigabyte.com','0978161849'),(7,'Corsair','Vietnam','www.corsair.com','0959310341'),(8,'Kingston','Vietnam','www.kingston.com','0931647525'),(9,'Western Digital','China','www.westerndigital.com','0934192832'),(10,'Seagate','Corea del Sur','www.seagate.com','0964835030'),(11,'Samsung','Vietnam','www.samsung.com','0956413953'),(12,'EVGA','Alemania','www.evga.com','0976724238'),(13,'Cooler Master','Japon','www.coolermaster.com','0949696532'),(14,'NZXT','Japon','www.nzxt.com','0971012269'),(15,'Logitech','Estados Unidos','www.logitech.com','0966978480'),(16,'Razer','Alemania','www.razer.com','0918451462'),(17,'HyperX','Corea del Sur','www.hyperx.com','0904828148'),(18,'Crucial','Japon','www.crucial.com','0932528809'),(19,'ADATA','China','www.adata.com','0970154303'),(20,'Thermaltake','Japon','www.thermaltake.com','0911718227'),(21,'Antec','Japon','www.antec.com','0924896383'),(22,'Zotac','Alemania','www.zotac.com','0946578713'),(23,'PNY','Taiwan','www.pny.com','0915098393'),(24,'SanDisk','Estados Unidos','www.sandisk.com','0910310518'),(25,'TP-Link','Taiwan','www.tp-link.com','0947382997'),(26,'Lenovo','Taiwan','www.lenovo.com','0976311656'),(27,'HP','Corea del Sur','www.hp.com','0970106513'),(28,'Dell','Taiwan','www.dell.com','0938726247'),(29,'Acer','Taiwan','www.acer.com','0917810801'),(30,'Apple','Vietnam','www.apple.com','0932677360'),(31,'Xiaomi','Taiwan','www.xiaomi.com','0960647468'),(32,'Huawei','Alemania','www.huawei.com','0972343098'),(33,'Sony','Estados Unidos','www.sony.com','0950097882'),(34,'Toshiba','Estados Unidos','www.toshiba.com','0981219136'),(35,'LG','Estados Unidos','www.lg.com','0993990916'),(36,'BenQ','Alemania','www.benq.com','0999854353'),(37,'ViewSonic','China','www.viewsonic.com','0962475107'),(38,'Aoc','Japon','www.aoc.com','0991183842'),(39,'Genius','China','www.genius.com','0913542784'),(40,'Redragon','Japon','www.redragon.com','0980841241'),(41,'SteelSeries','Estados Unidos','www.steelseries.com','0982449353'),(42,'Trust','Alemania','www.trust.com','0948740164'),(43,'Belkin','Estados Unidos','www.belkin.com','0905242786'),(44,'Netgear','Japon','www.netgear.com','0901128059'),(45,'D-Link','Japon','www.d-link.com','0926204505'),(46,'Fractal Design','Taiwan','www.fractaldesign.com','0931586923'),(47,'BeQuiet','Vietnam','www.bequiet.com','0922602563'),(48,'Sapphire','China','www.sapphire.com','0921607337'),(49,'XFX','China','www.xfx.com','0943303654'),(50,'PowerColor','Vietnam','www.powercolor.com','0914586850');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `descripcion` varchar(120) DEFAULT NULL,
  `categoria_id` int NOT NULL,
  `marca_id` int NOT NULL,
  `proveedor_id` int NOT NULL,
  `precio_compra` decimal(10,2) NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`producto_id`),
  KEY `fk_productos_categoria` (`categoria_id`),
  KEY `fk_productos_marca` (`marca_id`),
  KEY `fk_productos_proveedor` (`proveedor_id`),
  CONSTRAINT `fk_productos_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`),
  CONSTRAINT `fk_productos_marca` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`marca_id`),
  CONSTRAINT `fk_productos_proveedor` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Procesador Ryzen 5 Trust','Componente Procesador Ryzen 5 de la marca Trust',35,42,23,287.95,386.96,112),(2,'Procesador Core i5 Apple','Componente Procesador Core i5 de la marca Apple',32,30,7,725.49,1080.23,97),(3,'Procesador Ryzen 7 NZXT','Componente Procesador Ryzen 7 de la marca NZXT',21,14,24,291.94,355.67,110),(4,'Procesador Core i7 Sapphire','Componente Procesador Core i7 de la marca Sapphire',15,48,10,29.35,41.72,74),(5,'Tarjeta Madre ATX BeQuiet','Componente Tarjeta Madre ATX de la marca BeQuiet',38,47,27,276.25,353.18,29),(6,'Tarjeta Madre Micro-ATX ViewSonic','Componente Tarjeta Madre Micro-ATX de la marca ViewSonic',25,37,16,456.88,667.89,87),(7,'Memoria RAM 8GB DDR4 HyperX','Componente Memoria RAM 8GB DDR4 de la marca HyperX',22,17,49,742.11,1177.43,82),(8,'Memoria RAM 16GB DDR4 Huawei','Componente Memoria RAM 16GB DDR4 de la marca Huawei',48,32,30,163.89,248.78,21),(9,'Memoria RAM 32GB DDR5 BeQuiet','Componente Memoria RAM 32GB DDR5 de la marca BeQuiet',9,47,35,447.16,700.59,69),(10,'SSD 480GB Asus','Componente SSD 480GB de la marca Asus',42,4,34,44.93,69.13,120),(11,'SSD 1TB NVMe Asus','Componente SSD 1TB NVMe de la marca Asus',43,4,49,20.65,25.92,80),(12,'HDD 1TB MSI','Componente HDD 1TB de la marca MSI',15,5,46,148.66,191.40,58),(13,'HDD 2TB Asus','Componente HDD 2TB de la marca Asus',24,4,40,579.39,911.71,116),(14,'Tarjeta de Video RTX 4060 Belkin','Componente Tarjeta de Video RTX 4060 de la marca Belkin',31,43,32,28.92,40.86,52),(15,'Tarjeta de Video RTX 4070 AMD','Componente Tarjeta de Video RTX 4070 de la marca AMD',1,2,34,654.14,925.15,36),(16,'Tarjeta de Video RX 6600 Sony','Componente Tarjeta de Video RX 6600 de la marca Sony',2,33,45,611.52,931.02,116),(17,'Fuente de Poder 650W Corsair','Componente Fuente de Poder 650W de la marca Corsair',12,7,7,479.08,621.07,79),(18,'Fuente de Poder 750W HyperX','Componente Fuente de Poder 750W de la marca HyperX',34,17,23,251.58,341.84,47),(19,'Gabinete ATX RGB Apple','Componente Gabinete ATX RGB de la marca Apple',26,30,37,230.24,340.50,38),(20,'Gabinete Micro-ATX Gigabyte','Componente Gabinete Micro-ATX de la marca Gigabyte',44,6,42,892.63,1303.20,4),(21,'Cooler Aire Lenovo','Componente Cooler Aire de la marca Lenovo',6,26,25,348.80,484.97,81),(22,'Cooler Liquido 240mm D-Link','Componente Cooler Liquido 240mm de la marca D-Link',1,45,11,88.18,135.63,82),(23,'Monitor 24 pulgadas ViewSonic','Componente Monitor 24 pulgadas de la marca ViewSonic',22,37,7,806.89,1264.93,29),(24,'Monitor 27 pulgadas Curvo D-Link','Componente Monitor 27 pulgadas Curvo de la marca D-Link',14,45,37,435.82,531.10,9),(25,'Teclado Mecanico RGB Crucial','Componente Teclado Mecanico RGB de la marca Crucial',44,18,35,513.71,623.21,118),(26,'Mouse Optico Gamer AMD','Componente Mouse Optico Gamer de la marca AMD',21,2,14,534.53,802.28,91),(27,'Audifonos Gamer 7.1 MSI','Componente Audifonos Gamer 7.1 de la marca MSI',26,5,20,158.77,205.80,106),(28,'Parlantes 2.1 Netgear','Componente Parlantes 2.1 de la marca Netgear',25,44,35,308.58,463.56,17),(29,'Webcam Full HD BeQuiet','Componente Webcam Full HD de la marca BeQuiet',45,47,6,458.20,728.41,6),(30,'Impresora Multifuncional Dell','Componente Impresora Multifuncional de la marca Dell',7,28,15,757.23,1011.84,98),(31,'Router WiFi 6 Genius','Componente Router WiFi 6 de la marca Genius',40,39,26,872.49,1160.89,81),(32,'Switch 8 puertos Acer','Componente Switch 8 puertos de la marca Acer',18,29,32,216.90,308.26,48),(33,'Cable HDMI 2.1 EVGA','Componente Cable HDMI 2.1 de la marca EVGA',28,12,44,533.50,721.31,98),(34,'Adaptador USB-C ADATA','Componente Adaptador USB-C de la marca ADATA',40,19,16,646.10,796.52,19),(35,'Silla Gamer Ergonomica Fractal Design','Componente Silla Gamer Ergonomica de la marca Fractal Design',25,46,41,151.54,205.47,46),(36,'Microfono Condensador Gigabyte','Componente Microfono Condensador de la marca Gigabyte',7,6,1,849.52,1170.55,97),(37,'Procesador Ryzen 5 Corsair','Componente Procesador Ryzen 5 de la marca Corsair',18,7,9,92.26,126.62,71),(38,'Procesador Core i5 Sony','Componente Procesador Core i5 de la marca Sony',36,33,27,106.41,131.51,70),(39,'Procesador Ryzen 7 Genius','Componente Procesador Ryzen 7 de la marca Genius',6,39,39,709.23,1096.11,1),(40,'Procesador Core i7 HP','Componente Procesador Core i7 de la marca HP',19,27,25,704.56,1049.75,71),(41,'Tarjeta Madre ATX ViewSonic','Componente Tarjeta Madre ATX de la marca ViewSonic',16,37,34,165.08,223.24,17),(42,'Tarjeta Madre Micro-ATX Thermaltake','Componente Tarjeta Madre Micro-ATX de la marca Thermaltake',18,20,18,451.41,553.12,55),(43,'Memoria RAM 8GB DDR4 HP','Componente Memoria RAM 8GB DDR4 de la marca HP',18,27,20,443.54,545.90,32),(44,'Memoria RAM 16GB DDR4 BeQuiet','Componente Memoria RAM 16GB DDR4 de la marca BeQuiet',16,47,41,453.79,656.48,58),(45,'Memoria RAM 32GB DDR5 Western Digital','Componente Memoria RAM 32GB DDR5 de la marca Western Digital',7,9,20,20.99,28.51,107),(46,'SSD 480GB TP-Link','Componente SSD 480GB de la marca TP-Link',40,25,22,404.60,555.21,105),(47,'SSD 1TB NVMe Genius','Componente SSD 1TB NVMe de la marca Genius',42,39,9,280.89,404.84,88),(48,'HDD 1TB Xiaomi','Componente HDD 1TB de la marca Xiaomi',13,31,21,172.21,234.08,40),(49,'HDD 2TB Sapphire','Componente HDD 2TB de la marca Sapphire',19,48,45,575.12,912.78,100),(50,'Tarjeta de Video RTX 4060 Antec','Componente Tarjeta de Video RTX 4060 de la marca Antec',16,21,25,263.07,398.38,46),(51,'Tarjeta de Video RTX 4070 ViewSonic','Componente Tarjeta de Video RTX 4070 de la marca ViewSonic',8,37,13,539.12,764.61,87),(52,'Tarjeta de Video RX 6600 BenQ','Componente Tarjeta de Video RX 6600 de la marca BenQ',50,36,2,858.41,1188.60,90),(53,'Fuente de Poder 650W Acer','Componente Fuente de Poder 650W de la marca Acer',14,29,19,750.68,921.58,108),(54,'Fuente de Poder 750W Netgear','Componente Fuente de Poder 750W de la marca Netgear',27,44,32,138.17,182.54,32),(55,'Gabinete ATX RGB Seagate','Componente Gabinete ATX RGB de la marca Seagate',43,10,46,389.47,526.09,57),(56,'Gabinete Micro-ATX Xiaomi','Componente Gabinete Micro-ATX de la marca Xiaomi',39,31,38,369.71,518.57,117),(57,'Cooler Aire HP','Componente Cooler Aire de la marca HP',45,27,35,47.54,75.46,89),(58,'Cooler Liquido 240mm Genius','Componente Cooler Liquido 240mm de la marca Genius',35,39,41,824.25,1025.16,31),(59,'Monitor 24 pulgadas Belkin','Componente Monitor 24 pulgadas de la marca Belkin',43,43,23,162.21,234.40,72),(60,'Monitor 27 pulgadas Curvo Netgear','Componente Monitor 27 pulgadas Curvo de la marca Netgear',42,44,42,368.66,553.39,101),(61,'Teclado Mecanico RGB Corsair','Componente Teclado Mecanico RGB de la marca Corsair',28,7,1,102.27,131.81,95),(62,'Mouse Optico Gamer BenQ','Componente Mouse Optico Gamer de la marca BenQ',34,36,38,623.58,803.43,47),(63,'Audifonos Gamer 7.1 Apple','Componente Audifonos Gamer 7.1 de la marca Apple',26,30,50,616.41,909.93,19),(64,'Parlantes 2.1 AMD','Componente Parlantes 2.1 de la marca AMD',23,2,31,107.53,146.93,10),(65,'Webcam Full HD BeQuiet','Componente Webcam Full HD de la marca BeQuiet',8,47,10,323.27,432.29,100),(66,'Impresora Multifuncional Toshiba','Componente Impresora Multifuncional de la marca Toshiba',14,34,31,323.25,400.52,92),(67,'Router WiFi 6 Acer','Componente Router WiFi 6 de la marca Acer',45,29,21,74.45,90.67,90),(68,'Switch 8 puertos AMD','Componente Switch 8 puertos de la marca AMD',8,2,22,588.45,865.53,21),(69,'Cable HDMI 2.1 Razer','Componente Cable HDMI 2.1 de la marca Razer',48,16,34,169.39,214.12,71),(70,'Adaptador USB-C Apple','Componente Adaptador USB-C de la marca Apple',28,30,15,721.01,1046.84,23);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `proveedor_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `ciudad` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`),
  UNIQUE KEY `nit` (`nit`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Distribuidora Torres Import Export','1787925434001','0940196556','distribuidora1@proveedores.com','Av. Villacis N75-24','Cuenca'),(2,'Distribuidora Cruz Global','1744188276001','0906088356','distribuidora2@proveedores.com','Av. Lopez N95-52','Ambato'),(3,'Distribuidora Pazmiño Import Export','1726726926001','0948465648','distribuidora3@proveedores.com','Av. Ramirez N34-63','Latacunga'),(4,'Distribuidora Quinde Tech Supply','1733357554001','0999468044','distribuidora4@proveedores.com','Av. Suarez N65-84','Latacunga'),(5,'Distribuidora Villacis Import Export','1769295515001','0973872148','distribuidora5@proveedores.com','Av. Quinde N91-89','Ibarra'),(6,'Distribuidora Medina S.A.','1741523529001','0943320037','distribuidora6@proveedores.com','Av. Pazmiño N19-68','Babahoyo'),(7,'Distribuidora Cabrera Global','1761536717001','0976320163','distribuidora7@proveedores.com','Av. Castro N99-76','Ambato'),(8,'Distribuidora Delgado S.A.','1743446826001','0917278895','distribuidora8@proveedores.com','Av. Peña N66-88','Machala'),(9,'Distribuidora Zambrano Global','1783534128001','0972774348','distribuidora9@proveedores.com','Av. Campos N90-40','Riobamba'),(10,'Distribuidora Jimenez Tech Supply','1748349783001','0934558122','distribuidora10@proveedores.com','Av. Rojas N59-98','Guayaquil'),(11,'Distribuidora Diaz Cia Ltda','1765682626001','0965876036','distribuidora11@proveedores.com','Av. Cruz N84-99','Guayaquil'),(12,'Distribuidora Gomez Global','1774019136001','0905466889','distribuidora12@proveedores.com','Av. Rojas N72-38','Riobamba'),(13,'Distribuidora Jimenez Tech Supply','1713895645001','0965627298','distribuidora13@proveedores.com','Av. Gomez N60-85','Ibarra'),(14,'Distribuidora Bravo S.A.','1796268397001','0962720465','distribuidora14@proveedores.com','Av. Suarez N68-51','Guayaquil'),(15,'Distribuidora Medina Tech Supply','1766581473001','0941708053','distribuidora15@proveedores.com','Av. Andrade N18-93','Manta'),(16,'Distribuidora Rodriguez S.A.','1736757737001','0909232719','distribuidora16@proveedores.com','Av. Suarez N69-99','Ambato'),(17,'Distribuidora Herrera Import Export','1791321540001','0991241904','distribuidora17@proveedores.com','Av. Bravo N96-58','Cuenca'),(18,'Distribuidora Flores Cia Ltda','1789470029001','0931491905','distribuidora18@proveedores.com','Av. Chavez N64-94','Guayaquil'),(19,'Distribuidora Reyes S.A.','1796911784001','0950671657','distribuidora19@proveedores.com','Av. Cevallos N29-65','Machala'),(20,'Distribuidora Castro Global','1746249845001','0998776945','distribuidora20@proveedores.com','Av. Morales N21-45','Latacunga'),(21,'Distribuidora Salazar Cia Ltda','1772372114001','0999650752','distribuidora21@proveedores.com','Av. Campos N37-55','Santo Domingo'),(22,'Distribuidora Herrera Import Export','1790014570001','0948083136','distribuidora22@proveedores.com','Av. Campos N81-40','Manta'),(23,'Distribuidora Barros Tech Supply','1775876924001','0970143634','distribuidora23@proveedores.com','Av. Quinde N84-57','Latacunga'),(24,'Distribuidora Navarro Global','1756138336001','0968557444','distribuidora24@proveedores.com','Av. Rojas N25-34','Machala'),(25,'Distribuidora Guerrero S.A.','1781922443001','0923374989','distribuidora25@proveedores.com','Av. Mendoza N22-34','Esmeraldas'),(26,'Distribuidora Mendoza Cia Ltda','1734084236001','0940824008','distribuidora26@proveedores.com','Av. Mendoza N99-26','Loja'),(27,'Distribuidora Yepez Tech Supply','1711646234001','0994777520','distribuidora27@proveedores.com','Av. Herrera N71-24','Guayaquil'),(28,'Distribuidora Lopez Tech Supply','1719943140001','0990229413','distribuidora28@proveedores.com','Av. Torres N81-63','Ibarra'),(29,'Distribuidora Villacis Global','1793002706001','0938677496','distribuidora29@proveedores.com','Av. Silva N82-89','Santo Domingo'),(30,'Distribuidora Martinez Global','1723318904001','0933412328','distribuidora30@proveedores.com','Av. Lopez N30-10','Esmeraldas'),(31,'Distribuidora Cabrera Tech Supply','1789699989001','0974034471','distribuidora31@proveedores.com','Av. Salgado N39-43','Esmeraldas'),(32,'Distribuidora Yepez Global','1736550845001','0961832421','distribuidora32@proveedores.com','Av. Martinez N31-49','Latacunga'),(33,'Distribuidora Villacis Global','1748736657001','0971746488','distribuidora33@proveedores.com','Av. Campos N66-20','Tulcan'),(34,'Distribuidora Villacis S.A.','1767985905001','0959401399','distribuidora34@proveedores.com','Av. Gomez N96-44','Tulcan'),(35,'Distribuidora Bravo S.A.','1733513701001','0978742967','distribuidora35@proveedores.com','Av. Garcia N70-54','Santo Domingo'),(36,'Distribuidora Cabrera Import Export','1799943797001','0912567468','distribuidora36@proveedores.com','Av. Rodriguez N68-21','Loja'),(37,'Distribuidora Guerrero Import Export','1725558733001','0968087603','distribuidora37@proveedores.com','Av. Rios N56-89','Loja'),(38,'Distribuidora Peña Tech Supply','1769329732001','0903482477','distribuidora38@proveedores.com','Av. Torres N13-90','Latacunga'),(39,'Distribuidora Villacis Cia Ltda','1731257157001','0948086131','distribuidora39@proveedores.com','Av. Delgado N25-92','Esmeraldas'),(40,'Distribuidora Diaz Tech Supply','1749172995001','0984677378','distribuidora40@proveedores.com','Av. Diaz N59-34','Tulcan'),(41,'Distribuidora Villacis Global','1728321839001','0914658404','distribuidora41@proveedores.com','Av. Zambrano N48-85','Esmeraldas'),(42,'Distribuidora Cordova Tech Supply','1729944139001','0978755886','distribuidora42@proveedores.com','Av. Delgado N51-34','Babahoyo'),(43,'Distribuidora Barros Cia Ltda','1761401477001','0936057662','distribuidora43@proveedores.com','Av. Campos N14-26','Portoviejo'),(44,'Distribuidora Vega Global','1723470708001','0971870262','distribuidora44@proveedores.com','Av. Lopez N70-43','Loja'),(45,'Distribuidora Medina Global','1763349308001','0915865780','distribuidora45@proveedores.com','Av. Pazmiño N18-40','Esmeraldas'),(46,'Distribuidora Yepez Import Export','1722130508001','0961172400','distribuidora46@proveedores.com','Av. Guerrero N17-47','Ambato'),(47,'Distribuidora Aguilar Import Export','1729538047001','0938692221','distribuidora47@proveedores.com','Av. Pazmiño N58-89','Riobamba'),(48,'Distribuidora Salgado Cia Ltda','1788270025001','0923747407','distribuidora48@proveedores.com','Av. Mendoza N96-79','Ibarra'),(49,'Distribuidora Vargas S.A.','1756381032001','0994647436','distribuidora49@proveedores.com','Av. Navarro N23-40','Ibarra'),(50,'Distribuidora Cruz Global','1787149951001','0944064090','distribuidora50@proveedores.com','Av. Villacis N73-46','Loja');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `venta_id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `cliente_id` int NOT NULL,
  `empleado_id` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`venta_id`),
  KEY `fk_ventas_cliente` (`cliente_id`),
  KEY `fk_ventas_empleado` (`empleado_id`),
  CONSTRAINT `fk_ventas_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `fk_ventas_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,'2026-07-01',41,43,226.38),(2,'2024-08-19',48,40,5685.94),(3,'2023-12-07',28,25,1823.42),(4,'2023-10-04',14,18,1195.14),(5,'2024-06-11',52,35,1371.26),(6,'2023-05-22',13,30,2370.68),(7,'2025-10-13',32,34,5449.73),(8,'2023-06-12',40,26,5041.94),(9,'2024-11-23',55,30,4032.82),(10,'2023-11-05',52,20,2641.30),(11,'2024-05-04',21,8,769.72),(12,'2024-09-13',12,24,1458.68),(13,'2024-10-13',27,39,2551.86),(14,'2026-11-18',28,12,5057.96),(15,'2024-09-06',45,42,801.04),(16,'2024-03-11',32,19,642.36),(17,'2023-06-01',54,29,3138.91),(18,'2024-07-18',32,9,308.26),(19,'2026-07-22',33,42,4446.94),(20,'2026-08-06',32,27,5585.85),(21,'2023-04-10',6,37,414.56),(22,'2024-09-10',3,18,468.16),(23,'2026-10-24',11,50,1908.90),(24,'2026-09-17',50,50,3550.29),(25,'2023-05-25',8,37,1402.01),(26,'2023-12-15',35,24,721.31),(27,'2026-02-24',35,14,2918.71),(28,'2024-05-28',54,42,2671.56),(29,'2025-06-28',3,29,2061.69),(30,'2026-02-25',53,6,2018.94),(31,'2024-12-19',52,16,579.73),(32,'2026-03-20',45,23,8668.47),(33,'2024-01-19',9,14,1660.17),(34,'2025-10-18',23,35,787.52),(35,'2025-05-19',11,21,7887.39),(36,'2023-03-25',18,33,1660.17),(37,'2023-05-28',51,27,3690.74),(38,'2024-04-05',42,9,3223.96),(39,'2024-11-13',46,21,5838.28),(40,'2025-11-14',32,10,1731.06),(41,'2023-11-26',25,29,1931.43),(42,'2026-09-24',50,6,1335.78),(43,'2025-08-16',18,45,7557.69),(44,'2023-12-03',21,38,764.61),(45,'2025-02-26',47,30,2631.79),(46,'2024-07-27',35,26,3186.79),(47,'2025-06-27',14,32,2616.40),(48,'2024-10-28',19,22,4264.08),(49,'2023-01-04',32,22,1563.94),(50,'2023-02-28',41,30,3075.48),(51,'2026-01-14',11,29,1179.32),(52,'2024-11-10',13,45,7922.57),(53,'2023-11-12',11,18,924.78),(54,'2025-11-21',17,6,3688.85),(55,'2026-11-10',11,4,166.88),(56,'2024-07-21',47,45,861.65),(57,'2023-01-07',6,46,931.02),(58,'2024-10-08',31,5,1456.82),(59,'2026-01-01',34,44,3565.80),(60,'2023-07-23',45,22,1281.79),(61,'2023-04-13',9,31,150.92),(62,'2023-02-11',6,47,545.90),(63,'2024-07-25',24,20,553.39),(64,'2024-11-22',53,49,2074.28),(65,'2023-10-21',10,5,1219.06);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_catalogo_productos`
--

DROP TABLE IF EXISTS `vista_catalogo_productos`;
/*!50001 DROP VIEW IF EXISTS `vista_catalogo_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_catalogo_productos` AS SELECT 
 1 AS `producto_id`,
 1 AS `producto`,
 1 AS `categoria`,
 1 AS `marca`,
 1 AS `proveedor`,
 1 AS `proveedor_telefono`,
 1 AS `precio_compra`,
 1 AS `precio_venta`,
 1 AS `stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_compras_proveedor`
--

DROP TABLE IF EXISTS `vista_compras_proveedor`;
/*!50001 DROP VIEW IF EXISTS `vista_compras_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_compras_proveedor` AS SELECT 
 1 AS `compra_id`,
 1 AS `fecha`,
 1 AS `proveedor`,
 1 AS `empleado`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_detalle_ventas_completo`
--

DROP TABLE IF EXISTS `vista_detalle_ventas_completo`;
/*!50001 DROP VIEW IF EXISTS `vista_detalle_ventas_completo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_detalle_ventas_completo` AS SELECT 
 1 AS `detalle_id`,
 1 AS `venta_id`,
 1 AS `fecha`,
 1 AS `producto`,
 1 AS `precio_unitario`,
 1 AS `cantidad`,
 1 AS `subtotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_equipos_completos`
--

DROP TABLE IF EXISTS `vista_equipos_completos`;
/*!50001 DROP VIEW IF EXISTS `vista_equipos_completos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_equipos_completos` AS SELECT 
 1 AS `equipo_id`,
 1 AS `nombre_equipo`,
 1 AS `cliente`,
 1 AS `empleado_ensamblador`,
 1 AS `fecha_ensamble`,
 1 AS `precio_total`,
 1 AS `num_componentes`,
 1 AS `costo_servicios`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_historial_ventas`
--

DROP TABLE IF EXISTS `vista_historial_ventas`;
/*!50001 DROP VIEW IF EXISTS `vista_historial_ventas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_historial_ventas` AS SELECT 
 1 AS `venta_id`,
 1 AS `fecha`,
 1 AS `cliente`,
 1 AS `cliente_telefono`,
 1 AS `empleado`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_catalogo_productos`
--

/*!50001 DROP VIEW IF EXISTS `vista_catalogo_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_catalogo_productos` AS select `p`.`producto_id` AS `producto_id`,`p`.`nombre` AS `producto`,`c`.`nombre` AS `categoria`,`m`.`nombre` AS `marca`,`pr`.`nombre` AS `proveedor`,`pr`.`telefono` AS `proveedor_telefono`,`p`.`precio_compra` AS `precio_compra`,`p`.`precio_venta` AS `precio_venta`,`p`.`stock` AS `stock` from (((`productos` `p` join `categorias` `c` on((`p`.`categoria_id` = `c`.`categoria_id`))) join `marcas` `m` on((`p`.`marca_id` = `m`.`marca_id`))) join `proveedores` `pr` on((`p`.`proveedor_id` = `pr`.`proveedor_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_compras_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `vista_compras_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_compras_proveedor` AS select `c`.`compra_id` AS `compra_id`,`c`.`fecha` AS `fecha`,`pr`.`nombre` AS `proveedor`,`e`.`nombre` AS `empleado`,`c`.`total` AS `total` from ((`compras` `c` join `proveedores` `pr` on((`c`.`proveedor_id` = `pr`.`proveedor_id`))) join `empleados` `e` on((`c`.`empleado_id` = `e`.`empleado_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_detalle_ventas_completo`
--

/*!50001 DROP VIEW IF EXISTS `vista_detalle_ventas_completo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_detalle_ventas_completo` AS select `dv`.`detalle_id` AS `detalle_id`,`dv`.`venta_id` AS `venta_id`,`v`.`fecha` AS `fecha`,`p`.`nombre` AS `producto`,`dv`.`precio_unitario` AS `precio_unitario`,`dv`.`cantidad` AS `cantidad`,`dv`.`subtotal` AS `subtotal` from ((`detalle_ventas` `dv` join `ventas` `v` on((`dv`.`venta_id` = `v`.`venta_id`))) join `productos` `p` on((`dv`.`producto_id` = `p`.`producto_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_equipos_completos`
--

/*!50001 DROP VIEW IF EXISTS `vista_equipos_completos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_equipos_completos` AS select `ee`.`equipo_id` AS `equipo_id`,`ee`.`nombre_equipo` AS `nombre_equipo`,`cl`.`nombre` AS `cliente`,`e`.`nombre` AS `empleado_ensamblador`,`ee`.`fecha_ensamble` AS `fecha_ensamble`,`ee`.`precio_total` AS `precio_total`,(select count(0) from `equipo_componentes` `ec` where (`ec`.`equipo_id` = `ee`.`equipo_id`)) AS `num_componentes`,coalesce((select sum(`es`.`costo`) from `equipo_servicios` `es` where (`es`.`equipo_id` = `ee`.`equipo_id`)),0) AS `costo_servicios` from ((`equipos_ensamblados` `ee` join `clientes` `cl` on((`ee`.`cliente_id` = `cl`.`cliente_id`))) join `empleados` `e` on((`ee`.`empleado_id` = `e`.`empleado_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_historial_ventas`
--

/*!50001 DROP VIEW IF EXISTS `vista_historial_ventas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_historial_ventas` AS select `v`.`venta_id` AS `venta_id`,`v`.`fecha` AS `fecha`,`cl`.`nombre` AS `cliente`,`cl`.`telefono` AS `cliente_telefono`,`e`.`nombre` AS `empleado`,`v`.`total` AS `total` from ((`ventas` `v` join `clientes` `cl` on((`v`.`cliente_id` = `cl`.`cliente_id`))) join `empleados` `e` on((`v`.`empleado_id` = `e`.`empleado_id`))) */;
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

-- Dump completed on 2026-07-22 21:07:45
