-- MySQL dump 10.13  Distrib 9.0.1, for Win64 (x86_64)
--
-- Host: localhost    Database: hiratadb
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `camion_conductor`
--

DROP TABLE IF EXISTS `camion_conductor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camion_conductor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_camion` int NOT NULL,
  `id_conductor` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_camion` (`id_camion`),
  KEY `id_conductor` (`id_conductor`),
  CONSTRAINT `camion_conductor_ibfk_1` FOREIGN KEY (`id_camion`) REFERENCES `camiones` (`id_camion`),
  CONSTRAINT `camion_conductor_ibfk_2` FOREIGN KEY (`id_conductor`) REFERENCES `conductores` (`ID_conductor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camion_conductor`
--

LOCK TABLES `camion_conductor` WRITE;
/*!40000 ALTER TABLE `camion_conductor` DISABLE KEYS */;
INSERT INTO `camion_conductor` VALUES (7,16,19),(8,17,20);
/*!40000 ALTER TABLE `camion_conductor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camiones`
--

DROP TABLE IF EXISTS `camiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camiones` (
  `id_camion` int NOT NULL AUTO_INCREMENT,
  `patente` varchar(20) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `kilometraje` int NOT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `avisado` tinyint DEFAULT '0',
  PRIMARY KEY (`id_camion`),
  UNIQUE KEY `patente` (`patente`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camiones`
--

LOCK TABLES `camiones` WRITE;
/*!40000 ALTER TABLE `camiones` DISABLE KEYS */;
INSERT INTO `camiones` VALUES (16,'AAA111','Volvo FH',6000,'2026-04-13 17:35:51',1),(17,'BBB222','Scania R450',50000,'2026-04-13 17:35:51',1),(18,'CCC333','Mercedes Actros',5200,'2026-04-13 17:35:51',0),(19,'DDD444','MAN TGX',8000,'2026-04-13 17:35:51',0),(20,'EEE555','Iveco Stralis',300,'2026-04-13 17:35:51',0);
/*!40000 ALTER TABLE `camiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conductores`
--

DROP TABLE IF EXISTS `conductores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conductores` (
  `ID_conductor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) NOT NULL,
  `pass` varchar(64) NOT NULL,
  `telefono` varchar(32) NOT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` tinyint(1) DEFAULT '1',
  `admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID_conductor`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conductores`
--

LOCK TABLES `conductores` WRITE;
/*!40000 ALTER TABLE `conductores` DISABLE KEYS */;
INSERT INTO `conductores` VALUES (13,'admin','1234','12341234','2026-04-13 17:21:03',1,1),(19,'normal1','1234','111111111','2026-04-13 17:33:38',1,0),(20,'normal2','1234','222222222','2026-04-13 17:33:38',1,0),(21,'normal3','1234','333333333','2026-04-13 17:33:38',1,0),(22,'normal4','1234','444444444','2026-04-13 17:33:38',1,0),(23,'normal5','1234','555555555','2026-04-13 17:33:38',1,0);
/*!40000 ALTER TABLE `conductores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimientos`
--

DROP TABLE IF EXISTS `mantenimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantenimientos` (
  `id_mantenimiento` int NOT NULL AUTO_INCREMENT,
  `ultimo_kilometraje` int NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `descripcion` text,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(20) NOT NULL,
  `id_camion` int NOT NULL,
  PRIMARY KEY (`id_mantenimiento`),
  KEY `id_camion` (`id_camion`),
  CONSTRAINT `mantenimientos_ibfk_1` FOREIGN KEY (`id_camion`) REFERENCES `camiones` (`id_camion`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimientos`
--

LOCK TABLES `mantenimientos` WRITE;
/*!40000 ALTER TABLE `mantenimientos` DISABLE KEYS */;
INSERT INTO `mantenimientos` VALUES (18,100000,'Hola','123','2026-04-13 17:49:01','Completado',16),(19,1000,'Hola2','dasdasd','2026-04-13 17:49:08','Completado',17),(20,123,'123','dasdas','2026-04-13 17:49:19','Completado',18);
/*!40000 ALTER TABLE `mantenimientos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-13 17:59:18
