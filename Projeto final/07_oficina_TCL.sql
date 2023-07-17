use Projeto_final;

-- 1) APAGAR ALUNOS QUE NÃO EFETIVARAM MATRICULA/PAGAMENTO
START TRANSACTION;
DELETE FROM alunos WHERE id_aluno > 3;
-- Se não estiver ok, ROLLBACK
ROLLBACK;
-- Se ok, COMMIT
COMMIT;

-- 2) ADICIONAR 55 NA FRENTE DOS NÚMEROS DE CONTATO
SET SQL_SAFE_UPDATES = 0;
START TRANSACTION;
UPDATE historico_alunos SET contato = concat('55', contato);
-- Se não estiver ok, ROLLBACK
ROLLBACK;
-- Se ok, COMMIT
COMMIT;

-- 3) INSERINDO NOVAS TURMAS
START TRANSACTION;
INSERT INTO turmas (horario_turma, qt_aulas) VALUES ('09h', 4);
INSERT INTO turmas (horario_turma, qt_aulas) VALUES ('13h', 3);
INSERT INTO turmas (horario_turma, qt_aulas) VALUES ('10h', 5);
INSERT INTO turmas (horario_turma, qt_aulas) VALUES ('18h', 2);
SAVEPOINT turmas_1;

INSERT INTO turmas (horario_turma, qt_aulas) VALUES ('12h', 3);
INSERT INTO turmas (horario_turma, qt_aulas) VALUES ('07h', 4);
INSERT INTO turmas (horario_turma, qt_aulas) VALUES ('16h', 2);
INSERT INTO turmas (horario_turma, qt_aulas) VALUES ('19h', 3);
SAVEPOINT turmas_2;

RELEASE SAVEPOINT turmas_1;

-- Se não estiver ok, ROLLBACK
ROLLBACK;
-- Se ok, COMMIT
COMMIT;