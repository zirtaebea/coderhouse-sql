SELECT * FROM class WHERE id_level >= 14;

SELECT * FROM commentary WHERE comment_date >= '2019-01-01';

SELECT * FROM commentary WHERE comment_date < '2011-01-01';

SELECT id_system_user, commentary FROM COMMENTARY WHERE id_game = 73; 

SELECT id_system_user, commentary FROM COMMENTARY WHERE id_game != 73; 

SELECT * FROM GAME WHERE id_level >= 14;

SELECT * 
FROM GAME 
WHERE 
name = 'Riders Republic' OR 
name = 'The Dark Pictures: House Of Ashes';

SELECT *
FROM GAME
WHERE 
name IN ('Riders Republic','The Dark Pictures: House Of Ashes' );

SELECT *
FROM GAME
WHERE name LIKE 'Gran%';

SELECT * FROM GAME WHERE name LIKE '%field%';

SELECT *
FROM GAME 
ORDER BY name ASC;

SELECT * 
FROM GAME
WHERE name LIKE '%of%'
ORDER BY id_level DESC;

SELECT *
FROM GAME 
ORDER BY id_class DESC
LIMIT 5, 100;


