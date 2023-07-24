use Projeto_final;

-- dados turma
INSERT INTO turmas (horario_turma, qt_aulas) VALUES
('08h', 20),
('14h', 18),
('18h', 15),
('09h', 16),
('16h', 22);

-- alunos
INSERT INTO alunos (nome, data_nascimento, id_turma) VALUES
('Laura Silva', '1990-10-31', 2),
('Marina Fernandes', '1992-05-05', 1),
('Maria Silva', '1999-03-15', 1),
('João Souza', '2000-07-10', 2),
('Carlos Oliveira', '2002-01-25', 3),
('Ana Santos', '1998-11-03', 4),
('Pedro Almeida', '2001-06-20', 5),
('Lucia Pereira', '1997-09-12', 1),
('Felipe Rodrigues', '2003-02-08', 2),
('Laura Costa', '2000-04-30', 3),
('Rafaela Ferreira', '1999-12-18', 4),
('Rodrigo Martins', '2002-08-22', 5),
('Juliana Oliveira', '2000-03-05', 1),
('Gustavo Lima', '1998-10-14', 2),
('Fernanda Cardoso', '2001-07-28', 3),
('Diego Alves', '1999-11-25', 4),
('Isabela Santos', '2002-05-16', 5);

-- financeiro
INSERT INTO financeiro (metodo_pagamento, total_pago, vt_estornaveis, vt_n_estornaveis, v_liquido, estornado) VALUES
('creditcard', 500, 25, 1, 475,0),
('boleto', 500, 25, 1, 475,0),
('pix', 500, 25, 1, 475,0),
('Crédito', 500, 50, 20, 430, 0),
('Boleto Bancário', 400, 30, 10, 360, 0),
('Transferência', 300, 40, 15, 255, 0),
('PayPal', 350, 35, 12, 308, 0),
('Dinheiro', 200, 0, 0, 200, 0),
('Cheque', 500, 50, 20, 430, 0),
('PIX', 450, 55, 22, 383, 0),
('PicPay', 500, 50, 20, 430, 0),
('Boleto Bancário', 500, 50, 20, 430, 0),
('Crédito', 500, 50, 20, 430, 0),
('Boleto Bancário', 300, 25, 8, 267, 0),
('Crédito', 350, 40, 10, 300, 0),
('PIX', 400, 30, 15, 355, 0),
('Boleto Bancário', 250, 20, 5, 225, 0);

-- pedidos
SET FOREIGN_KEY_CHECKS=0;

INSERT INTO pedidos (id_transacao, status_pagamento) VALUES
(1, 'aprovado'),
(2, 'aprovado'),
(3, 'aprovado'),
(4, 'aprovado'),
(5, 'aprovado'),
(6, 'recusado'),
(7, 'aprovado'),
(8, 'recusado'),
(9, 'aprovado'),
(10, 'recusado'),
(11, 'pendente'),
(12, 'aprovado'),
(13, 'recusado'),
(14, 'aprovado'),
(15, 'pendente'),
(16, 'aprovado'),
(17, 'aprovado');
    
-- historico aluno 
-- a tabela historico aluno é menor que a tabela de alunos uma vez que só entram
-- no cadastro/historico aqueles que realizaram o pagamento
insert into historico_alunos (id_pedido, id_turma, id_aluno, data_insc, contato, experiencia, expectativas, frequencia) VALUES 
(1, 2, 1, '2022-10-11', 71999295556, 0, 'blabla', 4),
(2, 1, 2, '2023-06-05', 21999999999, 1, 'Andar na perna de pau', 1),
(3, 1, 3, '2023-06-05', 21988888888, 1, 'Realizar um sonho', 6),
(4, 2, 4, '2022-11-09','83999856675', 1, 'Espero melhorar minhas habilidades', 3),
(5, 3, 5, '2023-02-15', '21977777777', 0, 'Estou animada para as aulas', 4),
(7, 5, 7, '2021-08-07','31966666666', 0, 'Quero aprender coisas novas', 6),
(9, 2, 9, '2021-09-30', '81955555555', 1, 'Espero fazer novos amigos', 7),
(12, 5, 12, '2023-01-10', '21944444444', 1, 'Espero contribuir com o grupo', 6),
(14, 2, 14, '2022-05-09', '11933333333', 0, 'Ainda estou inseguro', 5),
(16, 4, 16, '2021-04-13', '85922222222' , 0, 'Espero aprender muito!', 8),
(17, 5, 17, '2022-02-01', '75911111111', 0, 'Gosto muito da área', 7);

SET FOREIGN_KEY_CHECKS=1;