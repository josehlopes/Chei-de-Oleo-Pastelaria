# Chei de Oleo Pastelaria

 -- Trabalho proposto pelo professor Victor Moak, SENAI

 # Chei_de_oleo_pastelaria Database Schema

## Descrição

   SENAI 
   CURSO TÉCNICO EM DESENVOLVIMENTO DE SISTEMAS 
   Unidade Curricular: Banco de Dados 
   Docente: Victor Moak
   
   --------------------AVALIAÇÃO DA APRENDIZAGEM II--------------------
   
Contexto:

 Você foi contratado pela empresa Órbita Tecnologia para uma vaga de residência em Banco de 
 Dados e a etapa seguinte consiste no projeto de uma plataforma de gestão de pastéis. A ideia é 
 que a pastelaria consiga armazenar os dados para fazer um BI futuramente baseando-se nas 
 informações ali existentes. Para isso, você usará as seguintes informações para implementar o seu 
 banco de dados: 
 Clientes da pastelaria: É importante obter as informações como Nome completo, Nome que gostaria 
 de ser chamado, cpf, data de nascimento, telefone, e-mail, bairro, cidade e estado. 
 Pastéis: Todos os pastéis são montados baseados em recheios, cada pastel tem um recheio 
 diferente e um tamanho diferente, além de nome e preço. Vale lembrar que também há os pastéis de 
 diferentes categorias, como os pastéis veganos, vegetarianos e sem lactose. 
 Todos os pedidos devem ser registrados e para a pastelaria, é fundamental que cada pedido tenha a 
 lista de produtos vendidos (pastéis, sucos, refrigerantes, etc.), forma de pagamento e cliente que 
 realizou o pedido, além da data desse pedido. 
 Para as operações a serem realizadas, seguem algumas orientações: 
 Para o BI, espera-se as seguintes informações importantes para tomada de decisão 
 das empresas em criar promoções e entender como está o negócio. 
 1. Liste os nomes de todos os pastéis veganos vendidos para pessoas com mais de 18 
 anos. 
 2. Liste os clientes com maior número de pedidos realizados em 1 ano agrupados por mês 
 3. Liste todos os pastéis que possuem bacon e queijo em seu recheio. 
 4. Mostre o valor de venda total de todos os pastéis cadastrados no sistema. 5. Liste todos os 
 pedidos onde há pelo menos um pastel e uma bebida. 
 6. Liste quais são os pastéis mais vendidos, incluindo a quantidade de vendas em ordem crescente.

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

