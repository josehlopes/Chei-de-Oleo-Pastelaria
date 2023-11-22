#__________________procedure 1 _________Nadson_______#

DELIMITER $$
CREATE PROCEDURE P_inserir_pastel(IN descricao_pastel VARCHAR(100), IN preco_pastel DECIMAL(10,2), IN idCategoria_pastel INT)
BEGIN
  INSERT INTO pasteis (descricao, preco, idCategoria)
  VALUES (descricao_pastel, preco_pastel, idCategoria_pastel);
END$$
DELIMITER ;


# teste da procedure 
CALL inserir_pastel('Pastel de Frango', 4.99, 4); 

#vendo se deu certo 
SELECT * FROM pasteis