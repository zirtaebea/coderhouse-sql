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

-- 3) inserir aluno na tabela historico_alunos
DELIMITER //
CREATE PROCEDURE `inserir_historico`(pedido INT, turma INT, aluno INT, data_insc DATE, contato VARCHAR(20), experiencia BIT, expect VARCHAR(200), freq INT)
BEGIN
       INSERT INTO historico_alunos (id_pedido, id_turma, id_aluno, data_insc, contato, experiencia, expectativas, frequencia)
       VALUES (pedido, turma, aluno, data_insc, contato, experiencia, expect, freq);
END;
//
