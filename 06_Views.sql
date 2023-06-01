use sakila;

-- 1) nome e descrição da tabela de games
-- view
CREATE OR REPLACE VIEW games AS
    (SELECT name, description FROM game);
SELECT * FROM games;

-- 2) visualizar todos os videogames que possuem call of dutty no nome
-- faço a query primeiro e dps coloco dentro da busca da view
select name as nomejogo, description from games where name LIKE '%call of duty%';

-- VIEW
CREATE OR REPLACE VIEW games AS 
	(select name as nomejogo, description from game where name LIKE '%call of duty%');

-- CONSULTANDO
SELECT * FROM GAMES;

-- 3) aplicando filtros com uma view
CREATE OR REPLACE VIEW games AS 
	(SELECT name, description FROM game ORDER BY name DESC);
    
SELECT * FROM games; 

CREATE OR REPLACE VIEW games AS 
	(SELECT name, description 
    FROM game 
    WHERE name LIKE '%you%'
    ORDER BY name DESC);

SELECT * FROM games;

-- 4) view com mais de uma tabela
-- view que liste os nomes e descrição de diferentes jogos de videogame 
-- que nenhum usuario conseguiu completar

-- consultando a estrutura da tabela game
SELECT * FROM game; -- nome e descrição

-- consultando tabela play
SELECT * FROM play; -- completed

-- chave que une as duas tabelas = id_game
-- criando view
CREATE OR REPLACE VIEW games AS
	(SELECT DISTINCT name, description -- nome e descrição nao replicadas
	FROM game v JOIN PLAY p ON (v.id_game = p.id_game) -- qd o join nao ta especificado é inner join
	WHERE p.completed = false); -- filtrar jogos apenas que nao foram completos
 SELECT * FROM games;
 
-- PRATICA COM AS VIEWS - DESAFIO GENÉRICO
-- Sobre o esquema gamers, crie as seguintes views:
-- A) que mostre first_name e last_name dos usuários que tenham e-mail ‘webnode.com’;
CREATE OR REPLACE VIEW games_webnode AS
	(SELECT first_name, last_name FROM system_user 
    WHERE email LIKE '%webnode.com');
SELECT * FROM games_webnode;

-- B) que mostre todos os dados dos jogos que tenham sido finalizados;
-- fazer um innerjoin com a tabela play
CREATE OR REPLACE VIEW games_completed_info AS 
	(SELECT DISTINCT name, description, id_level, id_class 
    FROM game g JOIN play p ON (g.id_game = p.id_game) 
    WHERE p.completed = true);
SELECT * FROM games_completed_info;

-- C) que mostre os diferentes jogos que tiveram uma votação maior que 9;
CREATE OR REPLACE VIEW games_upper_9 AS 
	(SELECT DISTINCT name FROM game g JOIN vote v ON (g.id_game = v.id_game)
    WHERE v.value > 9);
SELECT * FROM games_upper_9;

-- D) que mostre nome, sobrenome e e-mail dos usuários que jogam o jogo FIFA 22.
-- system_user tem nome sobrenome e email 
-- game tem o nome do jogo
-- porem precisamos ligar as duas tabelas
-- play tem id_system_user (que nem system_user) e também tem id_game (encontrado tb em game)
CREATE OR REPLACE VIEW player_fifa AS
	(SELECT DISTINCT first_name, last_name, email FROM system_user su 
    JOIN play p ON (su.id_system_user = p.id_system_user)
    WHERE p.id_game IN (SELECT id_game FROM game WHERE name LIKE'FIFA 22%'));
 select * from player_fifa;
