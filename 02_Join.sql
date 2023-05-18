-- tabela play
SELECT * FROM PLAY p
LIMIT 10;

-- tabela system user
SELECT * FROM system_user su
LIMIT 32, 10;

-- qual o email dos usuarios que jogaram os jogos?
-- 1) left join
SELECT p.*, su.first_name, su.email
FROM PLAY p
LEFT JOIN system_user su
ON p.id_system_user = su.id_system_user
where p.id_system_user = 33;