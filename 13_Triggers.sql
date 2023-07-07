-- Estrutura geral de um trigger
-- create trigger `trigger_nome` -- nome
-- (before | after) -- momento
-- [insert | update | delete] -- ação
-- on nome_da_tabela -- tabela
-- [for each row | for each column] -- escolha do registro
-- [corpo do trigger]

USE Gamers;

-- exemplo aula
-- 1) CRIANDO TABELA
CREATE TABLE NEW_GAMES (
	id_game INT PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(300)
	);
-- 2) CRIANDO TRIGGER 
CREATE TRIGGER `TR_ADD_NEW_GAME`
AFTER INSERT ON GAME 
FOR EACH ROW
-- CORPO DO TRIGGER
INSERT INTO NEW_GAMES (id_game, name, description) VALUES (NEW.id_game, NEW.name, NEW.description);

-- 3) INSERINDO VALORES NA TABELA GAME PARA TESTAR O TRIGGER
INSERT INTO GAME 
VALUES (150, 'Mortal Kombat', 'play_station', 2, 143);

SELECT * FROM NEW_GAMES;

-- exemplo 2
delimiter $$
CREATE TRIGGER `TR_REGISTRO_VOTOS`
AFTER INSERT ON VOTE
FOR EACH ROW
-- CORPO DO TRIGGER
BEGIN
	IF NEW.value <= 2 THEN
    INSERT INTO LOG_VOTE(id_vote, value, data_insercao) VALUES
    (NEW.id_vote, NEW.value, NEW.current_timestamp());
    END IF;
END
$$ 

-- exemplo 3
delimiter $$
CREATE TRIGGER `TR_VERIFICAR_COMMENT`
BEFORE INSERT ON COMMENTARY
FOR EACH ROW
BEGIN
	IF NEW.commentary IS NULL OR NEW.commentary = ''
	THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'O COMENTÁRIO DEVE CONTER UM TEXTO VÁLIDO';
	END IF;
END
$$

INSERT INTO COMMENTARY VALUES 
(878, 1, 1,  NOW(), NULL);

