CREATE database Projeto_final;
use Projeto_final;

-- criando tabelas
CREATE TABLE historico_alunos (
	n_matricula INT AUTO_INCREMENT PRIMARY KEY, -- CHAVE PRIMARIA
	id_turma INT NOT NULL, -- FK REFERENCIANDO PK id_turma DA TABELA turma
	id_aluno INT NOT NULL, -- FK REFERENCIANDO PK id_aluno DA TABELA alunos
	data_insc DATE NOT NULL,
	contato VARCHAR(20) NOT NULL,
	experiencia BIT NOT NULL,
	expectativas VARCHAR(200) DEFAULT 'Não respondeu',
	frequencia INT NOT NULL DEFAULT 0
);

CREATE TABLE pedidos (
	id_pedido INT AUTO_INCREMENT PRIMARY KEY, -- CHAVE PRIMARIA
	n_matricula INT NOT NULL, -- FK REFERENCIANDO PK n_matricula DA TABELA historico_alunos
	id_transacao INT NOT NULL, -- FK REFERENCIANDO PK id_transacao DA TABELA financeiro
	status_pagamento VARCHAR(20) 
);

CREATE TABLE financeiro (
	id_transacao INT AUTO_INCREMENT PRIMARY KEY, -- CHAVE PRIMARIA
	metodo_pagamento VARCHAR(20) NOT NULL,
	total_pago INT NOT NULL,
	vt_estornaveis INT NOT NULL DEFAULT 0,
	vt_n_estornaveis INT DEFAULT 0,
	v_liquido INT NOT NULL,
	estornado INT NOT NULL DEFAULT 0
);

CREATE TABLE alunos (
	id_aluno INT AUTO_INCREMENT PRIMARY KEY, -- CHAVE PRIMARIA
	nome VARCHAR(50) NOT NULL,
	data_nascimento DATE NOT NULL,
	id_turma INT NOT NULL -- FK REFERENCIANDO PK id_turma DA TABELA turma
);

CREATE TABLE turmas (
	id_turma INT AUTO_INCREMENT PRIMARY KEY, -- CHAVE PRIMARIA
	horario_turma VARCHAR(10) NOT NULL,
	qt_aulas INT NOT NULL
);

-- criando chaves estrangeiras
-- 1) historico_alunos 

-- FK ID TURMA REFERENCIANDO TABELA TURMA
ALTER TABLE historico_alunos 
ADD CONSTRAINT FK_HISTORICO_ALUNOS_ID_TURMA FOREIGN KEY FK_HISTORICO_ALUNOS_ID_TURMA (id_turma) 
	REFERENCES turmas (id_turma); 
    
-- FK ID ALUNO REFERENCIANDO TABELA ALUNO
ALTER TABLE historico_alunos 
ADD CONSTRAINT FK_HISTORICO_ALUNOS_ID_ALUNO FOREIGN KEY FK_HISTORICO_ALUNOS_ID_ALUNO (id_aluno) 
	REFERENCES alunos (id_aluno); 
    
-- 2) pedidos
-- FK N MATRICULA REFERENCIANDO TABELA HISTORICO ALUNOS
ALTER TABLE pedidos 
ADD CONSTRAINT FK_PEDIDOS_N_MATRICULA FOREIGN KEY FK_PEDIDOS_N_MATRICULA (n_matricula) 
	REFERENCES historico_alunos (n_matricula);
    
-- FK ID TRANSACAO REFERENCIANDO TABELA FINANCEIRO
ALTER TABLE pedidos 
ADD CONSTRAINT FK_PEDIDOS_ID_TRANSACAO FOREIGN KEY FK_PEDIDOS_ID_TRANSACAO (id_transacao) 
	REFERENCES financeiro (id_transacao);

-- 3) alunos 
-- FK ID TURMA REFERENCIANDO TABELA TURMAS    
ALTER TABLE alunos
ADD CONSTRAINT FK_ALUNOS_ID_TURMA FOREIGN KEY FK_ALUNOS_ID_TURMA (id_turma) 
	REFERENCES turmas (id_turma);



-- views 
-- n_matricula, nome, status_pagamento, total_pago -> consulta pagamento de alunos
-- ESPECIFICAR CAMPOS QUE NÃO SAO NULOS