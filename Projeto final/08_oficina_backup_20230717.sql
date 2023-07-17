-- DADOS DAS TABELAS
-- LOG_ALUNOS, LOG_HISTORICO_ALUNOS, ALUNOS, FINANCEIRO, HISTORICO_ALUNOS, PEDIDOS E TURMAS

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
-- Dumping data for table `LOG_ALUNOS`
--

LOCK TABLES `LOG_ALUNOS` WRITE;
/*!40000 ALTER TABLE `LOG_ALUNOS` DISABLE KEYS */;
INSERT INTO `LOG_ALUNOS` VALUES (6,'Laís Silveira','root@localhost','2023-07-06 22:08:38'),(7,'Maiana Oliveira','root@localhost','2023-07-06 22:15:59'),(8,'Renato Borges','root@localhost','2023-07-06 22:23:19'),(9,'Pamela Gonçalves','root@localhost','2023-07-08 20:15:45');
/*!40000 ALTER TABLE `LOG_ALUNOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `LOG_HISTORICO_ALUNOS`
--

LOCK TABLES `LOG_HISTORICO_ALUNOS` WRITE;
/*!40000 ALTER TABLE `LOG_HISTORICO_ALUNOS` DISABLE KEYS */;
INSERT INTO `LOG_HISTORICO_ALUNOS` VALUES (4,'root@localhost','2023-07-06 22:10:09'),(5,'root@localhost','2023-07-06 22:16:43');
/*!40000 ALTER TABLE `LOG_HISTORICO_ALUNOS` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `financeiro`
--

LOCK TABLES `financeiro` WRITE;
/*!40000 ALTER TABLE `financeiro` DISABLE KEYS */;
INSERT INTO `financeiro` VALUES (1,'creditcard',500,25,1,475,0),(2,'boleto',500,25,1,475,0),(3,'pix',500,25,1,475,0),(4,'credito',500,25,1,475,0),(5,'boleto',500,25,1,475,0),(6,'boleto',500,25,1,475,0);
/*!40000 ALTER TABLE `financeiro` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'pago'),(2,2,'pendente'),(3,3,'pago'),(4,4,'recusado'),(5,5,'recusado'),(6,6,'recusado');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-17 20:31:37
