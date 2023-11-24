#FALTA TESTAR

DELIMITER $$

CREATE TRIGGER TR_insere_ingrediente
BEFORE INSERT ON pasteis
FOR EACH ROW
BEGIN
    DECLARE idIngredienteExistente INT;

    SELECT idIngrediente INTO idIngredienteExistente
    FROM ingredientes
    WHERE nome = NEW.descricao;

    IF idIngredienteExistente IS NULL THEN
        INSERT INTO ingredientes (nome, idCategoria)
        VALUES (NEW.descricao, NEW.idCategoria);
    END IF;
END $$

DELIMITER ;
