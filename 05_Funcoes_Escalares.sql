ALTER TABLE friend ADD datebirth date;
SELECT * FROM friend;
TRUNCATE TABLE friend;

-- 1) nome completo
select * from friend;
insert into friend (first_name, last_name, email, datebirth) values
('Beatriz', 'Santos', 'zirtaeb.dev@gmail.com', '1999-02-16');

-- 2) converta seu nome completo para minusculas depois para maiusculas;
SELECT concat(first_name, ' ', last_name) as complete_name,
upper(concat(first_name, ' ', last_name)) as name_upper,
lower(concat(first_name, ' ', last_name)) as name_lower
FROM friend;

-- 3) divida seu ano de nascimento por seu dia e mes
SELECT (1999/1602) as resultado;

-- 4) arredonde o nº acima para um inteiro absoluto
SELECT round(1999/1602) as resultado_inteiro;

-- 5) calcule os dias que se passaram desde o seu nascimento até hoje
SELECT to_days(datebirth) as dias_que_passaram 
FROM friend; 

-- 6) dia da semana que voce nasceu
SELECT dayofweek(datebirth) as dia_que_nasceu 
FROM friend;

SELECT dayname(datebirth) as dia_que_nasceu 
FROM friend;