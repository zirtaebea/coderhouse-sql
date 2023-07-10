use Projeto_final;

-- 1) criando usuarios
-- financeiro
CREATE USER 'financeiro@localhost' IDENTIFIED BY 'Financeiro@1234$';

-- rh
CREATE USER 'rh@localhost'IDENTIFIED BY 'loginDoRh@1234$';

-- administrativo
CREATE USER 'administrativo@localhost'IDENTIFIED BY 'Administra@1234$';

-- 2) permissões do user financeiro
-- apenas modificar a tabela pedido e financeiro, o resto só leitura
GRANT SELECT ON Projeto_final.historico_alunos TO 'financeiro@localhost';
GRANT SELECT ON Projeto_final.alunos TO 'financeiro@localhost';
GRANT SELECT ON Projeto_final.turmas TO 'financeiro@localhost';
-- modo leitura
GRANT SELECT, UPDATE, INSERT ON Projeto_final.pedidos TO 'financeiro@localhost';
GRANT SELECT, UPDATE, INSERT ON Projeto_final.financeiro TO 'financeiro@localhost';

-- mostrando permissões
SHOW GRANTS FOR 'financeiro@localhost';

-- 3) permissões user rh
-- apenas leitura
GRANT SELECT ON Projeto_final.historico_alunos TO 'rh@localhost';
GRANT SELECT ON Projeto_final.alunos TO 'rh@localhost';
GRANT SELECT ON Projeto_final.turma TO 'rh@localhost';
GRANT SELECT ON Projeto_final.pedidos TO 'rh@localhost';
GRANT SELECT ON Projeto_final.financeiro TO 'rh@localhost';

-- mostrando permissões
SHOW GRANTS FOR 'rh@localhost';

-- 4) permissões do user administrativo
-- apenas modificar historico_alunos, alunos e turma
GRANT SELECT, UPDATE, INSERT ON Projeto_final.historico_alunos TO 'administrativo@localhost';
GRANT SELECT, UPDATE, INSERT ON Projeto_final.alunos TO 'administrativo@localhost';
GRANT SELECT, UPDATE, INSERT ON Projeto_final.turmas TO 'administrativo@localhost';
-- modo leitura em pedidos e financeiro
GRANT SELECT ON Projeto_final.pedidos TO 'administrativo@localhost';
GRANT SELECT ON Projeto_final.financeiro TO 'administrativo@localhost';

-- mostrando permissões
SHOW GRANTS FOR 'administrativo@localhost';