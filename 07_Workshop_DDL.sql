create database sakila_2;
use sakila_2;

-- atividades do workshop
-- 1) consultas simples 
-- nomes e email de todos os clientes
SELECT first_name, last_name, email FROM customer;

-- nome completo 
SELECT first_name, last_name, email, concat(first_name, ' ', last_name) as full_name 
FROM customer;

-- filmes alugados por um cliente específico
-- film possui titulo do filme
-- inventory - inventory_id
-- rental inventory_id

select f.title, c.first_name, c.last_name from film f 
join inventory i on i.film_id = f.film_id
join rental r on r.inventory_id = i.inventory_id
join customer c on c.customer_id = r.customer_id
where c.first_name = 'JOHN';

select * from payment;
-- encontrar o nº de locações por cliente
-- 10 principais filmes com maior nº de locações
-- obter o total de pagamentos recebidos para cada funcionario
-- calcular a media do valor das locações p cada filme

-- DESAFIO: VIEW