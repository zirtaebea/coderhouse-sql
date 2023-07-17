CREATE DATABASE  IF NOT EXISTS `Gamers` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Gamers`;
-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Gamers
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `CLASS`
--

DROP TABLE IF EXISTS `CLASS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLASS` (
  `id_level` int NOT NULL,
  `id_class` int NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id_class`,`id_level`),
  KEY `FK_CLASS_LEVEL_GAME` (`id_level`),
  CONSTRAINT `FK_CLASS_LEVEL_GAME` FOREIGN KEY (`id_level`) REFERENCES `LEVEL_GAME` (`id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLASS`
--

LOCK TABLES `CLASS` WRITE;
/*!40000 ALTER TABLE `CLASS` DISABLE KEYS */;
INSERT INTO `CLASS` VALUES (10,1,'TRAKPAD BT'),(10,5,'TRAKPAD BT'),(13,14,'Children'),(2,18,'Comedy'),(8,19,'Romance'),(8,20,'Drama'),(8,22,'Documentary'),(1,25,'Fantasy'),(15,29,'Sci-Fi'),(12,31,'Animation'),(11,34,'War'),(9,36,'Horror'),(4,39,'Musical'),(11,41,'Adventure'),(2,50,'Documentary'),(9,72,'IMAX'),(8,73,'Action'),(5,77,'Poetic Documentary'),(11,80,'Expository Documentary'),(8,81,'Reflexive Documentary'),(6,89,'Observational Documentary'),(11,90,'Performative Documentary'),(10,91,'TRAKPAD BT'),(13,93,'Adventure'),(1,101,'Military Action'),(9,102,'Spy'),(8,106,'Espionage Action'),(14,108,'Martial Arts Action'),(14,112,'Action Hybrid Genres'),(12,115,'Children  literary adaptations'),(3,118,'Romance  literary adaptations'),(5,121,'Satire'),(14,122,'Straight drama'),(13,131,'Psychological drama'),(7,135,'Comedy-drama'),(15,137,'Mystery'),(5,141,'Hyperdrama'),(2,143,'Traditional animation '),(7,145,'2D Digital Animation'),(10,146,'TRAKPAD BT'),(6,153,'Motion Graphics'),(9,157,'Stop-Motion animation'),(15,162,'Typography Animation'),(2,165,'Clay animation'),(6,170,'Digital 2D animation'),(11,173,'Digital 3D animation'),(1,174,'Mechanical Animation'),(4,175,'Chuckimation'),(5,180,'Puppetry Animation'),(4,181,'Crime'),(5,185,'Crime comedy'),(7,192,'Suspense-thriller'),(13,195,'Police'),(1,197,'Gangster'),(4,198,'Pirate adventure'),(1,203,'Horror adventure'),(14,205,'War adventure'),(9,207,'Action adventure'),(15,208,'Scary'),(1,217,'Psychological horror'),(15,223,'Classical musical'),(3,231,'First musical'),(8,236,'Golden age musical'),(14,238,'Spanish musical'),(4,240,'Soviet musical'),(3,243,'Opera musical'),(4,245,'American comedy'),(7,246,'Mafia comedy'),(6,257,'Indian comedy'),(10,258,'TRAKPAD BT'),(11,260,'Slapstick comedy'),(7,264,'Stand-up'),(11,273,'Situational comedy'),(2,275,'Surreal comedy'),(2,276,'Martial Arts Action'),(8,281,'Fantasy comedy'),(2,285,'Comedy horror'),(2,286,'Romantic comedy'),(11,294,'Sport comedy'),(12,297,'Italian comedy'),(11,300,'British comedy'),(1,1000,'class 1000'),(2,1000,'class 1000'),(3,1000,'class 1000'),(4,1000,'class 1000'),(5,1000,'class 1000'),(6,1000,'class 1000'),(7,1000,'class 1000'),(8,1000,'class 1000');
/*!40000 ALTER TABLE `CLASS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-17 17:53:31
