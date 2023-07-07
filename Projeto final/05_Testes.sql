
-- apenas para testar os triggers
drop trigger TR_LOG_HISTORICO;
-- CALL novo_aluno('Matheus Lima', '1996-11-09', 3);
SELECT * FROM alunos;

INSERT INTO alunos (nome, data_nascimento, id_turma) VALUES ('Renato Borges', '1987-07-13', 2);
INSERT INTO financeiro (metodo_pagamento, total_pago, vt_estornaveis, vt_n_estornaveis, v_liquido, estornado) VALUES
('boleto', 500, 25, 1, 475,0);

INSERT INTO pedidos (id_transacao, status_pagamento) VALUES
(4, 'recusado');
insert into historico_alunos (id_pedido, id_turma, id_aluno, data_insc, contato, experiencia, expectativas, frequencia) VALUES
(4, 2, 6, '2023-05-17', 11987673453, 0, 'teste de trigger 2', 2);

SELECT * FROM pedidos;

