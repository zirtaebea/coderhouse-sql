-- função chamada get_game() na db gamers para obter
-- nome do jogo passando o parametro id_game

SELECT name FROM GAME;

DELIMITER $$ 
CREATE FUNCTION `get_game` (idjogo INT)
RETURNS VARCHAR(100)
DETERMINISTIC 
BEGIN
	DECLARE jogo VARCHAR(100);
    SET jogo = (SELECT name FROM GAME WHERE id_game = idjogo);
    RETURN jogo;
END;
$$

SELECT get_game(6) AS jogo_selecionado;