# Chei de Oleo Pastelaria

 -- Trabalho proposto pelo professor Victor Moak, SENAI

 # Chei_de_oleo_pastelaria Database Schema

## Descrição
Este repositório contém o esquema do banco de dados para a aplicação "Chei_de_oleo_pastelaria", que representa uma pastelaria. O esquema inclui tabelas para clientes, endereços, contatos, produtos, pasteis, ingredientes, categorias, pedidos e detalhes do pedido.

## Tabelas

1. **clientes:**
   - `idCliente` (Chave Primária, INT): Identificador único do cliente.
   - `nomeCliente` (VARCHAR(100)): Nome do cliente.

2. **enderecos:**
   - `idEndereco` (Chave Primária, INT): Identificador único do endereço.
   - `logradouro`, `numero`, `cep`, `complemento` (VARCHAR): Detalhes do endereço.
   - `idCliente` (Chave Estrangeira referenciando clientes.idCliente).

3. **contatos:**
   - `idContato` (Chave Primária, INT): Identificador único do contato.
   - `telefone1`, `telefone2` (VARCHAR): Detalhes de contato.
   - `idCliente` (Chave Estrangeira referenciando clientes.idCliente).

4. **produtos:**
   - `idProduto` (Chave Primária, INT): Identificador único do produto.
   - `tipoProduto` (VARCHAR(100)): Tipo ou categoria do produto.
   - `preco` (DECIMAL(10, 2)): Preço do produto.

5. **pasteis:**
   - `idPastel` (Chave Primária, INT): Identificador único do pastel.
   - `descricao` (VARCHAR(100)): Descrição do pastel.
   - `tamanho`, `preco` (CHAR(1), DECIMAL(10, 2)): Tamanho e preço do pastel.
   - `idProduto` (Chave Estrangeira referenciando produtos.idProduto).

6. **ingredientes:**
   - `idIngrediente` (Chave Primária, INT): Identificador único do ingrediente.
   - `nome` (VARCHAR(100)): Nome do ingrediente.
   - `quantidade` (INT): Quantidade disponível.
   - `idProduto` (Chave Estrangeira referenciando produtos.idProduto).

7. **ingredientes_do_pastel:**
   - `idIdp` (Chave Primária, INT): Identificador único da relação entre pastel e ingrediente.
   - `idPastel`, `idIngrediente` (Chave Estrangeira referenciando pasteis.idPastel e ingredientes.idIngrediente).

8. **categorias:**
   - `idCategoria` (Chave Primária, INT): Identificador único da categoria.
   - `nome` (VARCHAR(10), DEFAULT 'Comum'): Nome da categoria.
   - `idProduto` (Chave Estrangeira referenciando produtos.idProduto).

9. **pedidos:**
   - `idPedido` (Chave Primária, INT): Identificador único do pedido.
   - `idCliente` (Chave Estrangeira referenciando clientes.idCliente).
   - `dataPedido` (DATE, DEFAULT (CURRENT_DATE)): Data do pedido.

10. **itens_pedido:**
    - `idDetalhe` (Chave Primária, INT): Identificador único do item do pedido.
    - `idPedido`, `idProduto` (Chave Estrangeira referenciando pedidos.idPedido e produtos.idProduto).
    - `quantidade` (INT): Quantidade do produto no pedido.

## Contribuições

    Trabalho feito pelo trio:
        https://github.com/YGerard324
        https://github.com/josehlopes
        @Elisson Nadson Souza Marques
        
## Licença
Este projeto está licenciado sob a [Licença MIT](LICENSE).

