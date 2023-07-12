use Gamers;

SELECT * FROM GAME;
SELECT @@autocommit;
SET autocommit = 0;

-- start transaction
START TRANSACTION;
USE Gamers;

SELECT * FROM CLASS;

-- COMMIT
UPDATE CLASS
SET description = 'TRAKPAD BT'
WHERE id_level = 10 AND id_class = 1;

SELECT * FROM CLASS;

COMMIT;

-- ROLLBACK
START TRANSACTION;
DELETE FROM USER_TYPE
WHERE id_user_type = 2;

SELECT * FROM USER_TYPE
ORDER BY id_user_type
LIMIT 10;

ROLLBACK;

-- commit 
START TRANSACTION; 
UPDATE CLASS
SET
	description = '2D Digital Animation'
WHERE 
	id_level = 7 AND id_class = 145;

SELECT * FROM CLASS
ORDER BY description
LIMIT 10;

COMMIT;

-- COM INSERT INTO
START TRANSACTION; 
INSERT INTO CLASS (id_level, id_class, description) VALUES (15, 99, 'TEST CLASS');
SELECT * FROM CLASS
ORDER BY description DESC
LIMIT 10;
ROLLBACK;

-- SAVEPOINT
START TRANSACTION;
INSERT INTO CLASS (id_level, id_class, description) VALUES (1, 1000,'class 1000');
INSERT INTO CLASS (id_level, id_class, description) VALUES (2, 1000,'class 1000');
INSERT INTO CLASS (id_level, id_class, description) VALUES (3, 1000,'class 1000');
INSERT INTO CLASS (id_level, id_class, description) VALUES (4, 1000,'class 1000');
INSERT INTO CLASS (id_level, id_class, description) VALUES (5, 1000,'class 1000');
INSERT INTO CLASS (id_level, id_class, description) VALUES (6, 1000,'class 1000');
INSERT INTO CLASS (id_level, id_class, description) VALUES (7, 1000,'class 1000');
INSERT INTO CLASS (id_level, id_class, description) VALUES (8, 1000,'class 1000');
savepoint lote_1;

INSERT INTO CLASS (id_level, id_class, description) VALUES (1, 1002,'class 1000');
INSERT INTO CLASS (id_level, id_class, description) VALUES (2, 1002,'class 1000');
INSERT INTO CLASS (id_level, id_class, description) VALUES (3, 1002,'class 1000');
INSERT INTO CLASS (id_level, id_class, description) VALUES (4, 1002,'class 1000');
INSERT INTO CLASS (id_level, id_class, description) VALUES (5, 1002,'class 1000');
INSERT INTO CLASS (id_level, id_class, description) VALUES (6, 1002,'class 1000');
INSERT INTO CLASS (id_level, id_class, description) VALUES (7, 1002,'class 1000');
INSERT INTO CLASS (id_level, id_class, description) VALUES (8, 1002,'class 1000');
savepoint lote_2;

SELECT * FROM CLASS WHERE description = 'class 1000';

ROLLBACK TO lote_1;
RELEASE SAVEPOINT lote_1;


-- desafio genérico

CREATE TABLE PAY (
	id_pay INT,
    amount INT,
    currency VARCHAR (50),
    date_pay DATE,
    pay_type VARCHAR (50),
    id_system_user INT,
    id_game INT
);

INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (1,250,'U$S','2021-07-22','Paypal',850,77);
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (2,0,'U$S','2021-07-22','',127,91);
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (3,250,'U$S','2021-07-22','Paypal',850,77);
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (4,3700,'Pesos Arg','2021-07-22','Visa',38,31);
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (5,180,'Libras','2021-07-22','Transfer',175,16);

SELECT * FROM PAY;
SET SQL_SAFE_UPDATES = 0;

-- 1) ELIMINE 3 PAGAMENTOS
START TRANSACTION; 
DELETE FROM PAY WHERE amount > 180;
ROLLBACK;
COMMIT;

SELECT * FROM PAY;

-- 15 LOTES DE PAGAMENTO COM SAVEPOINT APOS AO REGISTRO 5 E DPS APOS REGISTRO 10
START TRANSACTION;
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (6, 250, 'U$S', '2021-07-22', 'Paypal', 850, 77);
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (7, 500, 'U$S', '2021-07-23', 'Credit Card', 900, 88);
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (8, 750, 'U$S', '2021-07-24', 'Bank Transfer', 950, 99);
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (9, 1000, 'U$S', '2021-07-25', 'Paypal', 1000, 110);
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (10, 1250, 'U$S', '2021-07-26', 'Credit Card', 1050, 121);
SAVEPOINT registros_5;

INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (11, 1500, 'U$S', '2021-07-27', 'Bank Transfer', 1100, 132);
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (12, 1750, 'U$S', '2021-07-28', 'Paypal', 1150, 143);
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (13, 2000, 'U$S', '2021-07-29', 'Credit Card', 1200, 154);
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (14, 2250, 'U$S', '2021-07-30', 'Bank Transfer', 1250, 165);
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (15, 2500, 'U$S', '2021-07-31', 'Paypal', 1300, 176);
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (16, 2750, 'U$S', '2021-08-01', 'Credit Card', 1350, 187);
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (17, 3000, 'U$S', '2021-08-02', 'Bank Transfer', 1400, 198);
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (18, 3250, 'U$S', '2021-08-03', 'Paypal', 1450, 209);
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (19, 3500, 'U$S', '2021-08-04', 'Credit Card', 1500, 220);
INSERT INTO PAY (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game) VALUES (20, 3750, 'U$S', '2021-08-05', 'Bank Transfer', 1550, 231);
SAVEPOINT registros_10;

SELECT * FROM PAY;
COMMIT;
RELEASE SAVEPOINT registros_10;
COMMIT;