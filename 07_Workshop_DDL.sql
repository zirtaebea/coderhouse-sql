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
-- costumer x rental
select c.first_name as clientes, count(r.customer_id) as n_locacoes_cliente
from rental r
join customer c on c.customer_id = r.customer_id
group by r.customer_id;

-- 10 principais filmes com maior nº de locações
-- film, inventory e rental

select * from film; -- film id
-- nome em film; id inventory p fzr link no inventorio e rental e contar por qtd no rental
select f.title as nome_filme, count(r.inventory_id) as n_locacoes
from film f 
join inventory i on i.film_id = f.film_id
join rental r on r.inventory_id = i.inventory_id
group by f.title
order by n_locacoes desc limit 10;

-- obter o total de pagamentos recebidos para cada funcionario
-- payment e staff
select * from staff;
select * from payment;

select round(sum(p.amount), 2) as total_pago, s.first_name from payment p
join staff s on s.staff_id = p.staff_id
group by p.staff_id;

-- calcular a media do valor das locações p cada filme
-- amount de payment; linkando com inventory id p ter o nome do filme e a quantid
-- de vezes que foi alugado em rental e ainda linkar inventory com film para ter o
-- nome do filme 
select round(avg(p.amount), 2) as media_valor, f.title from payment p 
join rental r on r.customer_id = p.customer_id
join inventory i on i.inventory_id = r.inventory_id
join film f on f.film_id = i.film_id
group by f.title
order by media_valor desc;
