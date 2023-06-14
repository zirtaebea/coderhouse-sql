-- insert update e delete com subconsultas
CREATE TABLE PAY (
	id_pay INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	amount REAL NOT NULL DEFAULT 0,
	currency VARCHAR(20) NOT NULL,
	date_pay DATE NOT NULL,
	pay_type VARCHAR(50),
	id_system_user INT NOT NULL,
	id_game INT NOT NULL

);

select * from PAY;
INSERT INTO PAY (amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (250, 'U$S', '2021-07-22', 'Paypal', 850, 77);
INSERT INTO PAY (id_pay, currency, date_pay, pay_type, id_system_user, id_game) VALUES (NULL, 'U$S', '2021-07-22', '', 127, 91);
select * from PAY;

INSERT INTO PAY VALUES 
(NULL, 250, 'U$S', '2021-07-22', 'Paypal', 850, 77),
(NULL, 3700, 'Pesos Arg', '2021-07-22', 'Visa', 38, 31),
(NULL, 180, 'Libras', '2021-07-22', 'Transfer', 175, 16);

select * from PAY;

UPDATE PAY SET currency = 'U$S' WHERE id_pay = 4;
UPDATE PAY SET currency = 'Pesos Arg' WHERE id_pay = 4;

select * from PAY;

-- ---------------------------------------------------

-- insert + subconsulta
-- criamos as tabelas novas; 
-- fazemos os inserts em NEW_CLASS; 
-- fazemos os inserts em NEW_LEVEL_GAME.

CREATE TABLE NEW_CLASS (
id_level int not null,
id_class int not null,
description varchar(200) not null,
constraint primary key (id_class, id_level)
);

drop table new_level_game;

CREATE TABLE NEW_LEVEL_GAME (
id_level int not null,
description varchar(200) not null,
constraint primary key (id_level)
);

-- inserindo dados new class
INSERT INTO NEW_CLASS (id_level, id_class, description) VALUES 
(17, 10, 'Adventure Other'), 
(15, 1, 'Spy Other'),
(17, 20, 'British Comedy'), 
(17, 30, 'Adventure'),
(14, 1, ''),
(18, 1, "");

-- consultando dados inseridos
select * from new_class;

-- VERIFICANDO QUAIS NÃO ESTÃO NO LEVEL GAME
SELECT DISTINCT id_level, 'New level' 
FROM new_class 
WHERE id_level NOT IN (SELECT id_level FROM level_game); -- que NAO ESTAO NO LEVEL GAME

SELECT id_level from LEVEL_GAME; -- todos os levels da tabela level_game

-- subc c insert -> inserindo novos levels usando subconsulta
INSERT INTO new_level_game (id_level, description)  
(SELECT DISTINCT id_level, 'New level' 
FROM new_class 
WHERE id_level NOT IN (SELECT id_level FROM level_game)
);

-- consultando
select * from new_level_game;

-- select into COMO SE FOSSE O CREATE TABLE 
-- novas tabelas a partir de uma ja existente
-- colocar o insert dentro do create table

CREATE TABLE PLAY_INCOMPLETED_w
(SELECT id_game, id_system_user FROM PLAY WHERE COMPLETED = 0);

select * from play_incompleted_w;

-- update + subconsulta
-- Devemos atualizar para nível 20 todos os registros da tabela NEW_CLASS em que seu identificador de id_level encontrar dentro da tabela NEW_LEVEL_GAME.

SET SQL_SAFE_UPDATES = 0; -- TIRANDO SAFE UPDATE
-- pra voltar o safe upd é só usar 1

UPDATE new_class SET id_level = 20 
WHERE id_level IN (select id_level FROM NEW_LEVEL_GAME);

SELECT * FROM new_class;

-- delete + subconsulta
-- drop table new_class;
-- drop table new_level_game;

select id_level from NEW_LEVEL_GAME;

DELETE FROM new_class WHERE id_level NOT IN (select id_level from NEW_LEVEL_GAME);
SELECT * FROM new_class;

-- PRA ATT CRIAR TABELAS DE BACKUP 

-- desafio generico
-- 1) criar a tabela de ADVERGAME
CREATE TABLE ADVERGAME (
id_game int not null PRIMARY KEY,
name varchar(100) not null,
description varchar(300),
id_level int not null,
id_class int not null);

-- 2) adicionar os dados de 5 jogos nessa tabela inst into
INSERT INTO ADVERGAME
(select distinct * from game where id_game between 7 and 12);
select * from advergame;


-- 3) criar uma tabela ADVERCLASS id level id class e desc
CREATE TABLE ADVERCLASS (
id_level int not null,
id_class int not null,
description varchar(300),
CONSTRAINT PRIMARY KEY (id_level, id_class)
);

-- 4) inserir os dados de id_level e id_class dos jogos que foram criados em ADVERGAME
-- insert into adverclass
insert into adverclass (select id_level, id_class, description from advergame);
select * from adverclass;

-- inserts novos
insert into advergame values ('323424', 'jogo 5', 'blalal', 522, 323);
insert into advergame values ('3234342', 'jogo 35', 'b4lalal', 232, 933);

-- selecionar apenas aquels que nao estao na tabela game
insert into adverclass (select id_level, id_class, description from advergame where id_class not in (select id_class from game));

-- novos inserts atualizados
select * from adverclass;
