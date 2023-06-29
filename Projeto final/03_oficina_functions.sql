DELIMITER $$ 
CREATE FUNCTION `receita_total` (v_liquido INT, vt_n_estornaveis INT) RETURNS
CHAR(60)
DETERMINISTIC
BEGIN
	DECLARE resultado INT;
    SET resultado = (v_liquido - vt_n_estornaveis);
    RETURN resultado;
END;
$$

DELIMITER $$ 
CREATE FUNCTION `total_taxas` (vt_estornaveis INT, vt_n_estornaveis INT) RETURNS
INT
DETERMINISTIC
BEGIN
	DECLARE resultado INT;
    SET resultado = (vt_estornaveis + vt_n_estornaveis);
    RETURN resultado;
END;
$$