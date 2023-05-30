CREATE TABLE friend (
id_ int not null AUTO_INCREMENT PRIMARY KEY,
first_name varchar(30),
last_name varchar(30),
email varchar(30)
);

CREATE TABLE friend_bkp LIKE friend;

-- ALTER TABLE friend ADD age INT;
-- ALTER TABLE friend MODIFY email varchar(50) not null;
-- ALTER TABLE friend DROP COLUMN age;
-- DROP TABLE friend; 

INSERT INTO friend(first_name, last_name, email) 
VALUES
('Ricky', 'Hunter', 'ricky@gmail.com'),
('Logan', 'Roy', 'logan@waystar.com');

SELECT * FROM friend;

TRUNCATE TABLE friend;

SELECT * FROM friend;

-- junta os dados de duas colunas concat
SELECT concat(first_name, ' ', last_name)
AS complete_name
FROM system_user;

SELECT UCASE(description) FROM class; --  UPPER (case

SELECT concat(first_name, ' ', last_name)
AS complete_name,
upper(first_name) as upper_first_name,
lower(first_name) as lower_first_name
FROM system_user;

-- reverte a ordem dos caracteres de uma cadeia de texto
SELECT reverse(description) FROM class;

SELECT concat(first_name, ' ', last_name)
AS complete_name,
upper(first_name) as upper_first_name,
lower(first_name) as lower_first_name,
reverse(first_name) as reverse_first_name,
char_length(first_name) as quantidadecaracteres,
substring(first_name, 2) as charsubstring
FROM system_user;

INSERT INTO friend(first_name, last_name, email) 
VALUES
('Ricky', 'Hunter', 'ricky@gmail.com'),
('Logan', 'Roy', 'logan@waystar.com');

SELECT*FROM friend;

TRUNCATE TABLE friend;

SELECT * FROM friend;

INSERT INTO friend(first_name, last_name, email) 
VALUES
('Ricky', 'Hunter', 'ricky@gmail.com'),
('Logan', 'Roy', 'logan@waystar.com');

SELECT*FROM friend;

SELECT concat(first_name, ' ', last_name)
AS complete_name,
upper(first_name) as upper_first_name,
lower(first_name) as lower_first_name,
reverse(first_name) as reverse_first_name,
char_length(first_name) as quantidadecaracteres,
substring(first_name, 2) as charsubstring
FROM friend;

SELECT * FROM friend;

SELECT concat(first_name, ' ', last_name)
AS complete_name,
upper(first_name) as upper_first_name,
lower(first_name) as lower_first_name,
reverse(first_name) as reverse_first_name,
char_length(first_name) as quantidadecaracteres,
substring(first_name, 2) as charsubstring

FROM friend;