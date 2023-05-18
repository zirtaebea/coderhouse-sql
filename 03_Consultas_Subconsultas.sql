-- 1) union
-- unificar duas ou mais consultas select em um unico resultado
-- consultas feitas separadamente depois reunem o resultado de cada uma
-- DEVE SER A O MESMO Nº DE COLUNAS EM CADA UMA DAS TABELAS COM O MESMO TIPO DE DADO (uniao compativel)
-- exemplo
SELECT id_game, name, description, id_level, id_class
-- seleciona as colunas a cima da tabela game q possuem id_level = 1
FROM game
WHERE id_level = 1

UNION -- une os dois resultados

SELECT id_game, name, description, id_level, id_class -- ordenação das colunas deve ser a mesma e o nome da coluna tb (?)
-- seleciona as colunas a cima da tabela game q possuem id_level = 2
FROM game
WHERE id_level = 2;

-- 2) tipos de dados 
-- definir regras de conteudos para cada um dos campos da tabela 

-- 3) operador like
-- é feita em campos de tipo texto ou alfanumericos para buscar um valor coincidente
-- caractere coriga que serve de parametro para dados que se assemelham ao escrito '_'
SELECT * FROM game
WHERE name LIKE 'FIFA%'; -- TODOS OS NOMES QUE COMEÇAM COM FIFA

SELECT * FROM game WHERE name LIKE '%ULTIMATE%'; -- NAO É CASE SENSITIVE

SELECT * FROM game WHERE name LIKE '%Team';

-- caractere coringa
SELECT * FROM game WHERE name LIKE '%_RAN%'; -- PODE USAR COMBINADO COM O %

-- 4) combinar like e colchetes
-- expressoes regulares sao expressoes utilizadas pra encontrar strings ou cadeias de textos 
-- de forma mais abrangente
-- o uso de colchetes nos permite limitar o resultado da busca a uma variação inicial determinada de 
-- caracteres
SELECT * FROM game WHERE name LIKE '[A-C]%'; -- TODOS OS NOMES DE JOGAM QUE COMEÇAM ENTRE A E B
-- SO FUNCIONA NO POSTGRE
-- NO SQL: 
SELECT * FROM game WHERE name REGEXP '^[B-C]'; -- REGEXP DE REGULAR EXPRESSIONS (expressoes regulares)
-- dica regexp101 site

-- EXCLUIR PALAVRAS QUE INCLUEM TAL LETRA
SELECT * FROM game WHERE name regexp '^[^B-C]'; -- ACENTO DENTRO E FORA no inicio da string

-- palavras que incluem letra tal no FINAL DA STRING
SELECT * FROM system_user su 
WHERE first_name regexp 'as$'; -- fim da string

-- excluir palavras que incluem x letras usando NOT REGEXP
SELECT * FROM system_user su
WHERE first_name NOT REGEXP '^[A-X]';

SELECT * FROM system_user su 
WHERE first_name NOT regexp 'as$'; -- fim da string

-- DESAFIO GENERICO USO DO OPERADOR LIKE
-- 1) AQUELES USUARIOS CUJO NOME COMECE COM A LETRA J
SELECT * FROM system_user su
WHERE first_name LIKE 'J%';

-- 2) AQUELES USUARIOS CUJO SOBRENOME CONTENHA A LETRA W
SELECT * FROM system_user su
WHERE last_name LIKE '%W%';

-- 3) AQUELES USUARIOS CUJO NOME CONTENHA A LETRA I NA SEGUNDA POSIÇÃO 
SELECT * FROM system_user su 
WHERE first_name LIKE '_I%'; -- CARACTERE CORINGA

-- 4) AQUELES USUARIOS CUJO NOME TERMINE COM A LETRA K 
SELECT * FROM system_user su 
WHERE first_name LIKE '%_K';

-- 5) AQUELES USUARIOS CUJO NOME NÃO INCLUA AS LETRAS CH 
SELECT * FROM system_user su 
WHERE first_name not regexp '^[c-h]';

-- 6) AQUELES USUARIOS CUJO NOME INCLUA SOMENTE AS LETRAS CH 
SELECT * FROM system_user su 
WHERE first_name LIKE '%CH%';

-- SUBCONSULTAS
-- 16 SUBCONSULTAS NO MAXIMO
-- OCORRE ANTES DA CONSULTA PRINCIPAL
-- REGRAS:
-- Sempre deve estar entre parenteses
-- deve ter apenas UMA coluna OU expressao
-- não podemos usar LIKE OU BETWEEN 
-- não devemos colocar order by na subconsulta

-- selecionar o id user type máximo na tabela system user identificando primeiro qual eh o valor 
-- maximo do id user type pela subconsulta da tabela user type
 SELECT id_system_user, last_name, id_user_type
 FROM system_user
 WHERE id_user_type = (SELECT max(id_user_type) FROM user_type);
 
-- SELECT max(id_user_type) FROM user_type;
-- podem ser subconsultas numa mesma tabela
-- EXEMPLO: BUSCAR usuarios que votaram com uma pontuação superior a media 
SELECT id_system_user, value
FROM vote -- busca na tabela vote
WHERE  value > (SELECT FLOOR(AVG(value)) from vote); -- faz a subconsulta primeiro das médias da 
-- pontuações dadas
-- floor converte float pra inteiro


SELECT id_system_user, value
FROM vote
WHERE value >= (SELECT avg(value) FROM vote)
order by value;

-- SELECIONE AS COLUNAS ID SYSTEM USER E O ULTIMO NOME DO USARIO DA TABELA SYSTEM USER
-- ONDE O ID USER TYPE FOR O MAIOR DA TABELA USERTYPE 
-- ORDENANDO POR LAST NAME DE FORMA ASCENDENTE (A-Z)
SELECT id_system_user, last_name
FROM system_user
WHERE id_user_type = (SELECT max(id_user_type) from user_type)
ORDER BY last_name ASC;

-- INTEGRANDO GROUP BY EM CONSULTAS E SUBCONSULTAS
-- obter a soma de votos por jogo somente dos jogos nivel 1
SELECT id_game, sum(value) as votos
FROM vote
WHERE id_game IN (SELECT id_game FROM game WHERE id_level = 1)
GROUP BY id_game;

-- SELECIONAR OS JOGOS QUE TENHAM RECEBIDO MAIS DE UM VOTO 
SELECT id_game, name 
FROM game 
WHERE id_level = 1 AND id_game IN 
	(SELECT id_game 
	FROM vote 
	GROUP BY id_game 
	HAVING count(*) > 1);
-- SELECT id_game, count(*) FROM vote GROUP BY id_game HAVING count(*) > 1;