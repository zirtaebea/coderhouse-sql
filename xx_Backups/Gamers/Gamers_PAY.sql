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
-- Table structure for table `PAY`
--

DROP TABLE IF EXISTS `PAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAY` (
  `id_pay` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `date_pay` date DEFAULT NULL,
  `pay_type` varchar(50) DEFAULT NULL,
  `id_system_user` int DEFAULT NULL,
  `id_game` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAY`
--

LOCK TABLES `PAY` WRITE;
/*!40000 ALTER TABLE `PAY` DISABLE KEYS */;
INSERT INTO `PAY` VALUES (1,250,'U$S','2021-07-22','Paypal',850,77),(2,0,'U$S','2021-07-22','',127,91),(3,250,'U$S','2021-07-22','Paypal',850,77),(4,3700,'Pesos Arg','2021-07-22','Visa',38,31),(5,180,'Libras','2021-07-22','Transfer',175,16),(6,250,'U$S','2021-07-22','Paypal',850,77),(7,500,'U$S','2021-07-23','Credit Card',900,88),(8,750,'U$S','2021-07-24','Bank Transfer',950,99),(9,1000,'U$S','2021-07-25','Paypal',1000,110),(10,1250,'U$S','2021-07-26','Credit Card',1050,121),(11,1500,'U$S','2021-07-27','Bank Transfer',1100,132),(12,1750,'U$S','2021-07-28','Paypal',1150,143),(13,2000,'U$S','2021-07-29','Credit Card',1200,154),(14,2250,'U$S','2021-07-30','Bank Transfer',1250,165),(15,2500,'U$S','2021-07-31','Paypal',1300,176),(16,2750,'U$S','2021-08-01','Credit Card',1350,187),(17,3000,'U$S','2021-08-02','Bank Transfer',1400,198),(18,3250,'U$S','2021-08-03','Paypal',1450,209),(19,3500,'U$S','2021-08-04','Credit Card',1500,220),(20,3750,'U$S','2021-08-05','Bank Transfer',1550,231);
/*!40000 ALTER TABLE `PAY` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-17 17:53:28
