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

/*///////////////////////////////////////////////////////////////////////TRIGGER 2 //////////////////////////////////////////////////////////////////////////////*/

DELIMITER $$
CREATE OR REPLACE TRIGGER T_atualiza_status_pedido
AFTER UPDATE ON formas_pagamentos
FOR EACH ROW
BEGIN
  IF NEW.tipoPagamento = 'D' THEN
    UPDATE pedidos SET idStatus = 2 WHERE idPagamento = NEW.idPagamento;
  END IF;
END$$
DELIMITER ;

UPDATE formas_pagamentos SET tipoPagamento = 'D' WHERE idPagamento = 1;
SELECT * FROM pedidos WHERE idPagamento = 1;

/*///////////////////////////////////////////////////////////////////////TRIGGER 3 //////////////////////////////////////////////////////////////////////////////*/

-- Gatilho para deletar todos os itens de um pedido quando o pedido é deletado:

DELIMITER $$
CREATE TRIGGER T_deleta_itens_pedido
AFTER DELETE ON pedidos
FOR EACH ROW
BEGIN
  DELETE FROM itens_pedido WHERE idPedido = OLD.idPedido;
END$$
DELIMITER ;


DELETE FROM pedidos WHERE idPedido = 1;
SELECT * FROM itens_pedido WHERE idPedido = 1;

/*///////////////////////////////////////////////////////////////////////TRIGGER 4 //////////////////////////////////////////////////////////////////////////////*/
-- Gatilho para deletar todos os itens_pedido de um pastel quando o pastel é deletado:

DELIMITER $$
CREATE TRIGGER T_deleta_itens_pedido_pastel
BEFORE DELETE ON pasteis
FOR EACH ROW
BEGIN
  DELETE FROM itens_pedido WHERE idPastel = OLD.idPastel;
END$$
DELIMITER ;


SELECT * FROM ingredientes_do_pastel WHERE idPastel = 1;
DELETE FROM pasteis WHERE idPastel = 1;
SELECT * FROM ingredientes_do_pastel WHERE idPastel = 1;



/*///////////////////////////////////////////////////////////////////////TRIGGER 5 //////////////////////////////////////////////////////////////////////////////*/
