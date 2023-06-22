CREATE TABLE pais (
    pais_id INT PRIMARY KEY,
    nome_pais VARCHAR(50)
);

CREATE TABLE localidade (
	localidade_id INT PRIMARY KEY, 
    pais_id INT, 
    nome_localidade VARCHAR(30));


-- Inserindo dados na tabela "pais"
INSERT INTO pais (pais_id, nome_pais) VALUES (1, 'Brasil');
INSERT INTO pais (pais_id, nome_pais) VALUES (2, 'Estados Unidos');
INSERT INTO pais (pais_id, nome_pais) VALUES (3, 'França');
INSERT INTO pais (pais_id, nome_pais) VALUES (4, 'Japão');


-- Inserindo dados na tabela "localidade"
INSERT INTO localidade (localidade_id, pais_id, nome_localidade) VALUES (1, 1, 'São Paulo');
INSERT INTO localidade (localidade_id, pais_id, nome_localidade) VALUES (2, 1, 'Rio de Janeiro');
INSERT INTO localidade (localidade_id, pais_id, nome_localidade) VALUES (3, 2, 'Nova York');
INSERT INTO localidade (localidade_id, pais_id, nome_localidade) VALUES (4, 2, 'Los Angeles');
INSERT INTO localidade (localidade_id, pais_id, nome_localidade) VALUES (5, 3, 'Paris');
INSERT INTO localidade (localidade_id, pais_id, nome_localidade) VALUES (6, 3, 'Marselha');
INSERT INTO localidade (localidade_id, pais_id, nome_localidade) VALUES (7, 4, 'Tóquio');
INSERT INTO localidade (localidade_id, pais_id, nome_localidade) VALUES (8, 4, 'Osaka');


-- USANDO DELETE SET NULL
ALTER TABLE localidade ADD CONSTRAINT FK_LOCALIDADE_PAIS_ID FOREIGN KEY FK_LOCALIDADE_PAIS_ID (pais_id) 
	REFERENCES pais (pais_id) ON DELETE SET NULL; 

DELETE FROM pais WHERE pais_id = 3;

select*from localidade;

ALTER TABLE localidade DROP CONSTRAINT FK_LOCALIDADE_PAIS_ID;

-- CASCADE
ALTER TABLE localidade ADD CONSTRAINT FK_LOCALIDADE_PAIS_ID FOREIGN KEY FK_LOCALIDADE_PAIS_ID (pais_id) 
	REFERENCES pais (pais_id) ON DELETE CASCADE; 
    
DELETE FROM pais WHERE pais_id = 1;

SELECT * FROM localidade;
