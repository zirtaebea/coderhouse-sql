-- tabelas inclusas no backup:
-- alunos
-- financeiro
-- historico_alunos
-- LOG_ALUNOS
-- LOG_HISTORICO_ALUNOS
-- pedidos
-- turmas

CREATE DATABASE  IF NOT EXISTS `Projeto_final` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Projeto_final`;
-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Projeto_final
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
-- Table structure for table `LOG_ALUNOS`
--

DROP TABLE IF EXISTS `LOG_ALUNOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOG_ALUNOS` (
  `id_aluno` int NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOG_ALUNOS`
--

LOCK TABLES `LOG_ALUNOS` WRITE;
/*!40000 ALTER TABLE `LOG_ALUNOS` DISABLE KEYS */;
INSERT INTO `LOG_ALUNOS` VALUES (6,'Laís Silveira','root@localhost','2023-07-06 22:08:38'),(7,'Maiana Oliveira','root@localhost','2023-07-06 22:15:59'),(8,'Renato Borges','root@localhost','2023-07-06 22:23:19'),(9,'Pamela Gonçalves','root@localhost','2023-07-08 20:15:45');
/*!40000 ALTER TABLE `LOG_ALUNOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOG_HISTORICO_ALUNOS`
--

DROP TABLE IF EXISTS `LOG_HISTORICO_ALUNOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOG_HISTORICO_ALUNOS` (
  `id_pedido` int DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOG_HISTORICO_ALUNOS`
--

LOCK TABLES `LOG_HISTORICO_ALUNOS` WRITE;
/*!40000 ALTER TABLE `LOG_HISTORICO_ALUNOS` DISABLE KEYS */;
INSERT INTO `LOG_HISTORICO_ALUNOS` VALUES (4,'root@localhost','2023-07-06 22:10:09'),(5,'root@localhost','2023-07-06 22:16:43');
/*!40000 ALTER TABLE `LOG_HISTORICO_ALUNOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunos` (
  `id_aluno` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `data_nascimento` date NOT NULL,
  `id_turma` int NOT NULL,
  PRIMARY KEY (`id_aluno`),
  KEY `FK_ALUNOS_ID_TURMA` (`id_turma`),
  CONSTRAINT `FK_ALUNOS_ID_TURMA` FOREIGN KEY (`id_turma`) REFERENCES `turmas` (`id_turma`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (1,'Bruno Rubinato','1988-12-05',1),(2,'Laura Silva','1990-10-31',2),(3,'Marina Fernandes','1992-05-05',1);
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_LOG_ALUNOS` AFTER INSERT ON `alunos` FOR EACH ROW -- CORPO DO TRIGGER
INSERT INTO LOG_ALUNOS (id_aluno, nome, user, data_alteracao) 
VALUES (NEW.id_aluno, NEW.nome, SESSION_USER(), NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `alunos_por_turma`
--

DROP TABLE IF EXISTS `alunos_por_turma`;
/*!50001 DROP VIEW IF EXISTS `alunos_por_turma`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alunos_por_turma` AS SELECT 
 1 AS `n_alunos`,
 1 AS `id_turma`,
 1 AS `horario_turma`,
 1 AS `qt_aulas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `alunos_turma`
--

DROP TABLE IF EXISTS `alunos_turma`;
/*!50001 DROP VIEW IF EXISTS `alunos_turma`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alunos_turma` AS SELECT 
 1 AS `n_matricula`,
 1 AS `nome`,
 1 AS `id_turma`,
 1 AS `horario_turma`,
 1 AS `frequencia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `contatos`
--

DROP TABLE IF EXISTS `contatos`;
/*!50001 DROP VIEW IF EXISTS `contatos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contatos` AS SELECT 
 1 AS `n_matricula`,
 1 AS `nome`,
 1 AS `id_turma`,
 1 AS `data_insc`,
 1 AS `contato`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `expectativas_experiencia`
--

DROP TABLE IF EXISTS `expectativas_experiencia`;
/*!50001 DROP VIEW IF EXISTS `expectativas_experiencia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `expectativas_experiencia` AS SELECT 
 1 AS `n_matricula`,
 1 AS `nome`,
 1 AS `experiencia`,
 1 AS `expectativas`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `financeiro`
--

DROP TABLE IF EXISTS `financeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financeiro` (
  `id_transacao` int NOT NULL AUTO_INCREMENT,
  `metodo_pagamento` varchar(20) NOT NULL,
  `total_pago` int NOT NULL,
  `vt_estornaveis` int NOT NULL DEFAULT '0',
  `vt_n_estornaveis` int DEFAULT '0',
  `v_liquido` int NOT NULL,
  `estornado` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_transacao`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financeiro`
--

LOCK TABLES `financeiro` WRITE;
/*!40000 ALTER TABLE `financeiro` DISABLE KEYS */;
INSERT INTO `financeiro` VALUES (1,'creditcard',500,25,1,475,0),(2,'boleto',500,25,1,475,0),(3,'pix',500,25,1,475,0),(4,'credito',500,25,1,475,0),(5,'boleto',500,25,1,475,0),(6,'boleto',500,25,1,475,0);
/*!40000 ALTER TABLE `financeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_alunos`
--

DROP TABLE IF EXISTS `historico_alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_alunos` (
  `n_matricula` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_turma` int NOT NULL,
  `id_aluno` int NOT NULL,
  `data_insc` date NOT NULL,
  `contato` varchar(20) NOT NULL,
  `experiencia` bit(1) NOT NULL,
  `expectativas` varchar(200) DEFAULT 'Não respondeu',
  `frequencia` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`n_matricula`),
  KEY `FK_HISTORICO_ALUNOS_ID_TURMA` (`id_turma`),
  KEY `FK_HISTORICO_ALUNOS_ID_ALUNO` (`id_aluno`),
  KEY `FK_HISTORICO_ALUNOS_ID_PEDIDO` (`id_pedido`),
  CONSTRAINT `FK_HISTORICO_ALUNOS_ID_ALUNO` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`) ON DELETE CASCADE,
  CONSTRAINT `FK_HISTORICO_ALUNOS_ID_PEDIDO` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE,
  CONSTRAINT `FK_HISTORICO_ALUNOS_ID_TURMA` FOREIGN KEY (`id_turma`) REFERENCES `turmas` (`id_turma`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_alunos`
--

LOCK TABLES `historico_alunos` WRITE;
/*!40000 ALTER TABLE `historico_alunos` DISABLE KEYS */;
INSERT INTO `historico_alunos` VALUES (1,1,2,1,'2022-10-11','5571999295556',_binary '\0','blabla',4),(2,2,2,2,'2023-06-05','5521999999999',_binary '','Andar na perna de pau',1),(3,3,1,3,'2023-06-05','5521988888888',_binary '','Realizar um sonho',6);
/*!40000 ALTER TABLE `historico_alunos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_LOG_HISTORICO` BEFORE INSERT ON `historico_alunos` FOR EACH ROW BEGIN 
    -- VERIFIQUE SE O STATUS DO PEDIDO ESTÁ PAGO OU PENDENTE, CASO NÃO, APAREÇA O ERRO
    -- CORPO DO TRIGGER
    DECLARE PEDIDO VARCHAR(20);
    SET PEDIDO = (SELECT p.status_pagamento 
                FROM pedidos p 
                WHERE p.id_pedido = NEW.id_pedido);

    IF PEDIDO = 'recusado' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ALUNO NÃO REALIZOU O PAGAMENTO';
    ELSE
        INSERT INTO LOG_HISTORICO_ALUNOS VALUES (NEW.id_pedido, SESSION_USER(), NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `pagamento_alunos`
--

DROP TABLE IF EXISTS `pagamento_alunos`;
/*!50001 DROP VIEW IF EXISTS `pagamento_alunos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pagamento_alunos` AS SELECT 
 1 AS `n_matricula`,
 1 AS `id_pedido`,
 1 AS `nome`,
 1 AS `contato`,
 1 AS `metodo_pagamento`,
 1 AS `status_pagamento`,
 1 AS `total_pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_transacao` int NOT NULL,
  `status_pagamento` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `FK_PEDIDOS_ID_TRANSACAO` (`id_transacao`),
  CONSTRAINT `FK_PEDIDOS_ID_TRANSACAO` FOREIGN KEY (`id_transacao`) REFERENCES `financeiro` (`id_transacao`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'pago'),(2,2,'pendente'),(3,3,'pago'),(4,4,'recusado'),(5,5,'recusado'),(6,6,'recusado');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turmas`
--

DROP TABLE IF EXISTS `turmas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turmas` (
  `id_turma` int NOT NULL AUTO_INCREMENT,
  `horario_turma` varchar(10) NOT NULL,
  `qt_aulas` int NOT NULL,
  PRIMARY KEY (`id_turma`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turmas`
--

LOCK TABLES `turmas` WRITE;
/*!40000 ALTER TABLE `turmas` DISABLE KEYS */;
INSERT INTO `turmas` VALUES (1,'08h',6),(2,'11h',6),(3,'14h',6);
/*!40000 ALTER TABLE `turmas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Projeto_final'
--

--
-- Dumping routines for database 'Projeto_final'
--
/*!50003 DROP FUNCTION IF EXISTS `receita_total` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `receita_total`(v_liquido INT, vt_n_estornaveis INT) RETURNS char(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE resultado INT;
    SET resultado = (v_liquido - vt_n_estornaveis);
    RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `total_taxas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `total_taxas`(vt_estornaveis INT, vt_n_estornaveis INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE resultado INT;
    SET resultado = (vt_estornaveis + vt_n_estornaveis);
    RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `novo_aluno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `novo_aluno`(a_nome VARCHAR(50), a_dnasc DATE, turma INT)
BEGIN
    INSERT INTO alunos (nome, data_nascimento, id_turma) VALUES
    (a_nome, a_dnasc, turma);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ordem_tabela` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ordem_tabela`(t_nome VARCHAR(30), col_campo VARCHAR(30), ordem VARCHAR(5))
BEGIN
    IF ordem = 'ASC' THEN
        SET @ordenamento = CONCAT('SELECT * FROM ', t_nome, ' ORDER BY ', col_campo, ' ASC;');
    ELSE
        SET @ordenamento = CONCAT('SELECT * FROM ', t_nome, ' ORDER BY ', col_campo, ' DESC;');
    END IF;

    PREPARE stmt FROM @ordenamento;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `alunos_por_turma`
--

/*!50001 DROP VIEW IF EXISTS `alunos_por_turma`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alunos_por_turma` AS select count(`a`.`id_turma`) AS `n_alunos`,`t`.`id_turma` AS `id_turma`,`t`.`horario_turma` AS `horario_turma`,`t`.`qt_aulas` AS `qt_aulas` from (`alunos` `a` join `turmas` `t` on((`t`.`id_turma` = `a`.`id_turma`))) group by `a`.`id_turma` order by `t`.`id_turma` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `alunos_turma`
--

/*!50001 DROP VIEW IF EXISTS `alunos_turma`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alunos_turma` AS select `h`.`n_matricula` AS `n_matricula`,`a`.`nome` AS `nome`,`a`.`id_turma` AS `id_turma`,`t`.`horario_turma` AS `horario_turma`,`h`.`frequencia` AS `frequencia` from ((`alunos` `a` join `turmas` `t` on((`t`.`id_turma` = `a`.`id_turma`))) join `historico_alunos` `h` on((`h`.`id_aluno` = `a`.`id_aluno`))) where (`a`.`id_turma` = `t`.`id_turma`) order by `h`.`n_matricula` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contatos`
--

/*!50001 DROP VIEW IF EXISTS `contatos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contatos` AS select `h`.`n_matricula` AS `n_matricula`,`a`.`nome` AS `nome`,`a`.`id_turma` AS `id_turma`,`h`.`data_insc` AS `data_insc`,`h`.`contato` AS `contato` from (`alunos` `a` join `historico_alunos` `h` on((`h`.`id_aluno` = `a`.`id_aluno`))) order by `h`.`n_matricula` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `expectativas_experiencia`
--

/*!50001 DROP VIEW IF EXISTS `expectativas_experiencia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `expectativas_experiencia` AS select `h`.`n_matricula` AS `n_matricula`,`a`.`nome` AS `nome`,`h`.`experiencia` AS `experiencia`,`h`.`expectativas` AS `expectativas` from (`alunos` `a` join `historico_alunos` `h` on((`h`.`id_aluno` = `a`.`id_aluno`))) order by `h`.`n_matricula` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pagamento_alunos`
--

/*!50001 DROP VIEW IF EXISTS `pagamento_alunos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pagamento_alunos` AS select `h`.`n_matricula` AS `n_matricula`,`p`.`id_pedido` AS `id_pedido`,`a`.`nome` AS `nome`,`h`.`contato` AS `contato`,`f`.`metodo_pagamento` AS `metodo_pagamento`,`p`.`status_pagamento` AS `status_pagamento`,`f`.`total_pago` AS `total_pago` from (((`alunos` `a` join `historico_alunos` `h` on((`a`.`id_aluno` = `h`.`id_aluno`))) join `pedidos` `p` on((`p`.`id_pedido` = `h`.`id_pedido`))) join `financeiro` `f` on((`f`.`id_transacao` = `p`.`id_transacao`))) where (`a`.`id_aluno` = `h`.`id_aluno`) */;
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

-- Dump completed on 2023-07-17 20:14:01
