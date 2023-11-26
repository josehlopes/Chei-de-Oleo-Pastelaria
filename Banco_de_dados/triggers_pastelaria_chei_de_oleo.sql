#FALTA TESTAR

DELIMITER $$

CREATE OR REPLACE TRIGGER TR_insere_ingredientes
AFTER INSERT ON pasteis
FOR EACH ROW
BEGIN    
    DECLARE idPastelNovo INT;
    SELECT idPastel INTO idPastelNovo FROM pasteis WHERE descricao = NEW.descricao AND tamanho = NEW.tamanho AND preco = NEW.preco;
	#TESTE COM PASTEL DE TOMATE 4
    INSERT INTO ingredientes_do_pastel (idPastel, idIngrediente)
    VALUES (idPastelNovo, 3); -- Substitua 1 pelo ID do ingrediente desejado
	#VALUES: REPETIR ID DO INGREDIENTE PARA idPastelNovo
END$$

DELIMITER ;


SELECT * FROM V_ingredientes_do_pastel;
