-- 1) ordenamento de tabelas
DELIMITER //
CREATE PROCEDURE `ordem_tabela` (t_nome VARCHAR(30), col_campo VARCHAR(30), ordem VARCHAR(5))
BEGIN
    IF ordem = 'ASC' OR ordem = 'asc' THEN
        SET @ordenamento = CONCAT('SELECT * FROM ', t_nome, ' ORDER BY ', col_campo, ' ASC;');
    ELSE
        SET @ordenamento = CONCAT('SELECT * FROM ', t_nome, ' ORDER BY ', col_campo, ' DESC;');
    END IF;

    PREPARE stmt FROM @ordenamento;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
//

-- 2) inserir novo aluno no db
DELIMITER // 
CREATE PROCEDURE `novo_aluno` (a_nome VARCHAR(50), a_dnasc DATE, turma INT)
BEGIN
    INSERT INTO alunos (nome, data_nascimento, id_turma) VALUES
    (a_nome, a_dnasc, turma);
END;
//