-- Crie um Stored Procedure que insira dados em uma tabela.

-- 1. Deve receber um parâmetro do tipo char(xx).
DELIMITER //
CREATE PROCEDURE `sp_generico` (IN parametro CHAR(50))
BEGIN
-- 3. Se o parâmetro char() recebido for igual a ‘’, retorne um erro que diga  ‘ERRO: não foi possível criar o produto indicado’
	IF parametro = '' THEN
		SELECT 'ERRO: não foi possível criar o produto indicado';
-- 2. Inserir esse parâmetro como um novo registro na tabela;
	ELSE
		INSERT INTO tabela1 (coluna1) values (parametro);
	
-- 4. Em seguida, execute um SELECT sobre a tabela ordenada de forma decrescente para ver o registro inserido em primeiro lugar.
        SELECT coluna1
        FROM tabela1
        ORDER BY coluna1 desc;
	END IF;
END;
//

