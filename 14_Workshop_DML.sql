use sakila;

-- 1) manipular o conteudo
select * from actor;

-- insert
INSERT INTO actor (first_name, last_name) VALUES ('Beatriz', 'Gomes');

-- update
-- att dados do customer_id=1
set sql_safe_updates = 0;
-- backup
CREATE TABLE customer_copy (SELECT * FROM customer);
UPDATE customer_copy
SET active = 0
WHERE customer_id = 1;

SELECT * FROM customer_copy;

-- delete
CREATE TABLE film_copy (SELECT * FROM film);
SELECT * FROM film_copy;

DELETE FROM film_copy WHERE length <= 90;

-- 2) integrando subconsultas 
-- inserir valores numa tabela com o join e função agregada
-- contagem de filmes por ator 
-- film / actor / film actor
SELECT * FROM film_actor;

CREATE TABLE actor_film_count (
	actor_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    film_count INT
);

INSERT INTO actor_film_count (actor_id, first_name, last_name, film_count) 
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.actor_id) as film_count
FROM film_actor fa
LEFT JOIN actor a ON (a.actor_id = fa.actor_id)
GROUP BY fa.actor_id;

SELECT * FROM actor_film_count;

-- Ideia de funçao: Calcular a duração do aluguel de filmes por cliente
-- Função que calcula a duração total do tempo de aluguel de um filme para um cliente.
-- Essa funçao pode tomar o id do cliente como parâmetro, e retornar a soma do tempo total de aluguel de filme desse cliente





SELECT * FROM customer;
SELECT * FROM inventory;
SELECT * FROM film;
SELECT * FROM rental;


DELIMITER $$
CREATE FUNCTION calcula_tempo_aluguel (customer_id INT)
RETURNS INT 
DETERMINISTIC
BEGIN

DECLARE total_duration INT;
SELECT SUM(f.rental_duration) INTO total_duration
FROM film f
LEFT JOIN inventory i ON i.film_id = f.film_id
LEFT JOIN rental r ON r.inventory_id = i.inventory_id
WHERE r.customer_id = customer_id
GROUP BY r.customer_id;

RETURN total_duration;
END;
$$
-- LEFT JOIN customer c ON c.customer_id = r.customer_id;
SELECT calcula_tempo_aluguel(4);