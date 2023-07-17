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
-- Table structure for table `GAME`
--

DROP TABLE IF EXISTS `GAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GAME` (
  `id_game` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `id_level` int NOT NULL,
  `id_class` int NOT NULL,
  PRIMARY KEY (`id_game`),
  KEY `GAME_CLASS` (`id_class`,`id_level`),
  CONSTRAINT `GAME_CLASS` FOREIGN KEY (`id_class`, `id_level`) REFERENCES `CLASS` (`id_class`, `id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GAME`
--

LOCK TABLES `GAME` WRITE;
/*!40000 ALTER TABLE `GAME` DISABLE KEYS */;
INSERT INTO `GAME` VALUES (1,'Forza Horizon 5','odio donec',2,143),(2,'Call of Duty: Vanguard','morbi non',6,153),(3,'Shin Megami Tensei 5','turpis integer aliquet massa id',3,243),(4,'Marvels Guardianes de la Galaxia','lobortis sapien sapien non mi',4,245),(5,'Age of Empires IV','',2,50),(6,'Football Manager 22','nulla suspendisse potenti',8,236),(7,'Football Manager 22','mauris lacinia sapien quis libero',11,173),(8,'Blue Reflection: Second Light','libero rutrum ac lobortis',2,18),(9,'Darkest Dungeon II','erat nulla',11,90),(10,'Voice of Cards','parturient montes nascetur',2,275),(11,'Elden Ring','et ultrices posuere cubilia curae',15,208),(12,'FIFA 22: Ultimate Team','suspendisse',14,205),(13,'New World','potenti cras in',15,208),(14,'Gran Turismo 7','',7,192),(15,'Kingdoms of Amalur: Re-Reckoning','sit amet sapien dignissim',7,246),(16,'Project Zero: Maiden of Black Water','',14,205),(17,'Mario Party Superstars','pellentesque ultrices phasellus id',7,145),(18,'Far Cry 6','ante vel ipsum praesent blandit',15,223),(19,'Marvels Guardianes de la Galaxia','in ante vestibulum ante ipsum',14,112),(20,'Riders Republic','in',7,264),(21,'Forza Horizon 5','congue eget',5,185),(22,'Poppy Playtime','nulla elit ac nulla',2,165),(23,'The Dark Pictures: House Of Ashes','',8,20),(24,'DokeV','vel',11,300),(25,'Call of Duty: Vanguard','in felis eu sapien',3,118),(26,'Disciples: Liberation','non lectus aliquam sit amet',13,131),(27,'Iron Harvest: Complete Edition','pellentesque eget nunc donec quis',13,93),(28,'Leyendas Pokémon: Arceus','vitae consectetuer eget rutrum at',11,260),(29,'The Elder Scrolls V: Skyrim Anniversary Edition','proin at',14,108),(30,'Assassins Creed Valhalla','vivamus',9,207),(31,'Inscryption','',11,273),(32,'Metroid Dread','',11,34),(33,'Call of Duty: Vanguard','proin eu',5,141),(34,'Elden Ring','nec molestie sed justo',6,153),(35,'Resident Evil 4 VR','magna',2,275),(36,'Far Cry 6','',4,181),(37,'Pokémon Diamante Brillante / Perla Reluciente','imperdiet et commodo',1,203),(38,'Grand Theft Auto: The Trilogy - The Definitive Edition','praesent',3,231),(39,'Crysis Remastered Trilogy','volutpat convallis',9,102),(40,'Jurassic World Evolution 2','',8,281),(41,'Lost Ark','sapien quis libero',13,93),(42,'Marvels Guardianes de la Galaxia','lectus suspendisse',10,91),(43,'Dungeon Encounters','',8,73),(44,'First CLASSTrouble','',4,39),(45,'FIFA 22','tempor convallis nulla neque libero',8,106),(46,'Alan Wake Remastered','dui luctus rutrum nulla tellus',15,137),(47,'Disco Elysium','in tempor',13,195),(48,'Back 4 Blood','ornare imperdiet sapien urna pretium',4,198),(49,'FIFA 22: Ultimate Team','habitasse',13,14),(50,'Far Cry 6','quis libero nullam sit',4,240),(51,'Battlefield 2042','',6,153),(52,'Knockout City','',6,89),(53,'God of War','sit amet diam in',5,121),(54,'Kena: Bridge of Spirits','pellentesque at',1,101),(55,'Kimetsu no Yaiba - The Hinokami Chronicles','',10,1),(56,'PES 2022','mi pede',2,276),(57,'Elden Ring','etiam pretium iaculis',10,5),(58,'Grand Theft Auto: The Trilogy - The Definitive Edition','integer tincidunt',12,115),(59,'Battlefield 2042','pede libero',12,31),(60,'Jurassic World Evolution 2','',8,106),(61,'Echo Generation','elementum ligula',6,257),(62,'Knights of the Old Republic','ipsum primis in faucibus orci',1,197),(63,'Starfield','diam',11,294),(64,'My Friend Peppa Pig','vel',12,297),(65,'Youtubers Life 2','lacus morbi quis',8,22),(66,'Ghost Recon: Frontline','habitasse',2,286),(67,'Aven Colony','sollicitudin ut',14,238),(68,'Saints & Sinners','placerat ante nulla justo',15,29),(69,'The Dark Pictures: House Of Ashes','',10,91),(70,'Rainbow Six: Siege','curae duis faucibus accumsan',9,72),(71,'The Good Life','ultrices phasellus id sapien in',6,170),(72,'Grand Theft Auto: The Trilogy - The Definitive Edition','ac consequat metus sapien ut',14,112),(73,'Elden Ring','elementum pellentesque',15,208),(74,'Back 4 Blood','pulvinar',9,36),(75,'Marvels Guardianes de la Galaxia','commodo placerat praesent blandit nam',4,175),(76,'Fast & Furious: Spy Racers El Retorno de SH1FT3R','ligula sit amet eleifend pede',9,157),(77,'Dragon Ball Z Kakarot','lorem',1,174),(78,'Insurgency: Sandstorm','morbi a ipsum',6,153),(79,'Grand Theft Auto: The Trilogy - The Definitive Edition','eu tincidunt in leo',8,106),(80,'Kimetsu no Yaiba - The Hinokami Chronicles','sagittis dui',3,231),(81,'Mafia: Edición Definitiva','augue vel accumsan',8,81),(82,'Xbox GAME Pass','eleifend pede libero quis',14,112),(83,'The Last of Us 2','quam turpis adipiscing',14,122),(84,'Dragon Age: Inquisition','auctor gravida sem praesent id',10,146),(85,'Harry Potter: Magic Awakened','sed tristique in tempus',5,180),(86,'Riders Republic','lobortis est',4,39),(87,'First CLASSTrouble','ipsum primis in faucibus orci',1,25),(88,'It Takes Two','',13,195),(89,'UnMetal','at turpis',11,41),(90,'Ghost of Tsushima','purus',2,285),(91,'Bright Memory: Infinite','',5,77),(92,'Project Zero: Maiden of Black Water','',7,135),(93,'Blast Brigade','in sapien iaculis congue vivamus',8,19),(94,'Until You Fall','sollicitudin ut suscipit a feugiat',10,258),(95,'The Dark Pictures: House Of Ashes','aenean lectus pellentesque eget nunc',11,80),(96,'Project Zero: Maiden of Black Water','ac nulla',15,162),(97,'Actraiser Renaissance','viverra eget congue',3,231),(98,'Call of Duty: Vanguard','odio donec vitae nisi',13,14),(99,'Chernobylite','fermentum donec ut mauris eget',1,217),(100,'Cyberpunk 2077','',12,115),(150,'Mortal Kombat','play_station',2,143);
/*!40000 ALTER TABLE `GAME` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_ADD_NEW_GAME` AFTER INSERT ON `GAME` FOR EACH ROW -- CORPO DO TRIGGER
INSERT INTO NEW_GAMES (id_game, name, description) VALUES (NEW.id_game, NEW.name, NEW.description) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-17 17:53:28
