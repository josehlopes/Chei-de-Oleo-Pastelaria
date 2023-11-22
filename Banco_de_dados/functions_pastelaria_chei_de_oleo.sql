CREATE FUNCTION IF NOT EXISTS F_clientes18()
RETURNS TABLE
AS
SELECT nomeCliente, TIMESTAMPDIFF(YEAR, dataNascimento, CURDATE()) AS idade
FROM clientes 
WHERE TIMESTAMPDIFF(YEAR, dataNascimento, CURDATE()) > 18;

SELECT * FROM F_clientes18;
