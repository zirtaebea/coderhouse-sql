
-- apenas para testar os triggers
drop trigger TR_LOG_HISTORICO;
-- CALL novo_aluno('Matheus Lima', '1996-11-09', 3);
SELECT * FROM alunos;

INSERT INTO alunos (nome, data_nascimento, id_turma) VALUES ('Luana Silva', '1997-07-13', 1);
INSERT INTO financeiro (metodo_pagamento, total_pago, vt_estornaveis, vt_n_estornaveis, v_liquido, estornado) VALUES
('PIX', 500, 25, 1, 475,0);

SELECT * FROM financeiro;

INSERT INTO pedidos (id_transacao, status_pagamento) VALUES
(19, 'recusado');

SET SQL_SAFE_UPDATES=1;

select * from pedidos;

insert into historico_alunos (id_pedido, id_turma, id_aluno, data_insc, contato, experiencia, expectativas, frequencia) VALUES
(19, 1, 19, '2022-07-18', 11983837767, 1, 'teste de trigger 3', 5);

SELECT * FROM historico_alunos;

SELECT * FROM LOG_ALUNOS;
DELETE FROM historico_alunos WHERE n_matricula = 12;

