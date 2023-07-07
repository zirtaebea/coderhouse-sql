use Projeto_final;

-- dados turma
INSERT INTO turmas (horario_turma, qt_aulas) VALUES
('08h', 6),
('11h', 6),
('14h', 6);

-- alunos
INSERT INTO alunos (nome, data_nascimento, id_turma) VALUES
('Bruno Rubinato', '1988-12-05', 1),
('Laura Silva', '1990-10-31', 2),
('Marina Fernandes', '1992-05-05', 1),
('Larissa Silva', '1999-09-12', 3),
('Mário Souza', '2003-01-04', 2); 

-- financeiro
INSERT INTO financeiro (metodo_pagamento, total_pago, vt_estornaveis, vt_n_estornaveis, v_liquido, estornado) VALUES
('creditcard', 500, 25, 1, 475,0),
('boleto', 500, 25, 1, 475,0),
('pix', 500, 25, 1, 475,0);

-- pedidos
INSERT INTO pedidos (id_transacao, status_pagamento) VALUES
(1, 'pago'),
(2, 'pendente'),
(3, 'pago');

-- historico aluno 
-- a tabela historico aluno é menor que a tabela de alunos uma vez que só entram
-- no cadastro/historico aqueles que realizaram o pagamento
insert into historico_alunos (id_pedido, id_turma, id_aluno, data_insc, contato, experiencia, expectativas, frequencia) VALUES 
(1, 2, 1, '2022-10-11', 71999295556, 0, 'blabla', 4),
(2, 2, 2,'2023-06-05', 21999999999, 1, 'Andar na perna de pau', 1),
(3, 1, 3,'2023-06-05', 21988888888, 1, 'Realizar um sonho', 6);


