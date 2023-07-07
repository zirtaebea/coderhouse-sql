-- 1) log de alunos
use Projeto_final;

-- TABELA DO LOG
CREATE TABLE LOG_ALUNOS (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(50),
    user VARCHAR(100),
    data_alteracao DATETIME
);
-- TRIGGER
CREATE TRIGGER `TR_LOG_ALUNOS`
AFTER INSERT ON alunos
FOR EACH ROW
-- CORPO DO TRIGGER
INSERT INTO LOG_ALUNOS (id_aluno, nome, user, data_alteracao) 
VALUES (NEW.id_aluno, NEW.nome, SESSION_USER(), NOW());

-- 2) verificação de pagamentos para inserir na tabela historico alunos (só entra qm realizou o pagamento ou sob confirmacao
-- TABELA DO LOG
CREATE TABLE LOG_HISTORICO_ALUNOS (
    id_pedido INT,
    user VARCHAR(100),
    data_hora DATETIME
);
-- TRIGGER
DELIMITER $$
CREATE TRIGGER `TR_LOG_HISTORICO`
BEFORE INSERT ON historico_alunos
FOR EACH ROW
BEGIN 
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
END$$
DELIMITER ;
