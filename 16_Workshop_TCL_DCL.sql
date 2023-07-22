use sakila;

-- Definir três usuários através da DCL
CREATE USER 'funcionarios@localhost' IDENTIFIED BY 'Funcionarios@1234$';
CREATE USER 'adm@localhost' IDENTIFIED BY 'Administrativo@1234$';
CREATE USER 'financeiro@localhost' IDENTIFIED BY 'Financeiro@1234$';

-- Estabelecer permissões de leitura sobre determinadas tabelas (usuário 1)
GRANT SELECT ON sakila.actor TO 'funcionarios@localhost';
GRANT SELECT ON sakila.film TO 'funcionarios@localhost';
GRANT SELECT ON sakila.film_actor TO 'funcionarios@localhost';
GRANT SELECT ON sakila.film_category TO 'funcionarios@localhost';
GRANT SELECT ON sakila.film_copy TO 'funcionarios@localhost';
GRANT SELECT ON sakila.film_text TO 'funcionarios@localhost';
GRANT SELECT ON sakila.inventory TO 'funcionarios@localhost';
GRANT SELECT ON sakila.rental TO 'funcionarios@localhost';
SHOW GRANTS FOR 'funcionarios@localhost';

-- Estabelecer permissões de leitura/escrita sobre todas as tabelas (usuário 2)
GRANT SELECT, INSERT, UPDATE ON sakila.* TO 'adm@localhost';
SHOW GRANTS FOR 'adm@localhost';

-- Estabelecer permissão de leitura/eliminação sobre todas as tabelas (usuário 3)
GRANT SELECT, INSERT, UPDATE, DELETE ON sakila.* TO 'financeiro@localhost';
SHOW GRANTS FOR 'financeiro@localhost';


