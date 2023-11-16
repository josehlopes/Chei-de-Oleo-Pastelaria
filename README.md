# Chei de Oleo Pastelaria

      SENAI 
      CURSO TÉCNICO EM DESENVOLVIMENTO DE SISTEMAS 
      Unidade Curricular: Banco de Dados 
      Docente: Victor Moak
      
      AVALIAÇÃO DA APRENDIZAGEM II

        Resumo do Projeto de Banco de Dados para a Pastelaria - Órbita Tecnologia

        A empresa Órbita Tecnologia está contratando para uma vaga de residência em Banco de Dados, com a tarefa de projetar uma plataforma de gestão de pastéis para uma pastelaria. O objetivo é armazenar dados que permitirão análises futuras (BI) baseadas nessas informações. Aqui estão os principais requisitos e operações a serem realizadas:

        Entidades Principais:

        Clientes:

        Informações: Nome completo, Nome preferido, CPF, Data de nascimento, Telefone, E-mail, Bairro, Cidade, Estado.
        Pastéis:

        Atributos: Nome, Preço, Recheio, Tamanho, Categoria (Vegano, Vegetariano, Sem lactose).
        Pedidos:

        Detalhes: Lista de produtos, Forma de pagamento, Cliente, Data do pedido.
        Operações para BI:

        Listar os nomes de todos os pastéis veganos vendidos para pessoas com mais de 18 anos.
        Listar os clientes com maior número de pedidos realizados em 1 ano agrupados por mês.
        Listar todos os pastéis que possuem bacon e queijo em seu recheio.
        Mostrar o valor de venda total de todos os pastéis cadastrados no sistema.
        Listar todos os pedidos que incluem pelo menos um pastel e uma bebida.
        Listar os pastéis mais vendidos, incluindo a quantidade de vendas em ordem crescente.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
      Descrição das Tabelas
      1.Tabela clientes
          Armazena informações detalhadas sobre os clientes da pastelaria, incluindo nome completo, nome preferido, CPF, data de nascimento, e detalhes de contato.

          Campos Principais:
          idCliente: Identificador único do cliente.
          nomeCliente: Nome completo do cliente.
          nomePreferido: Nome pelo qual o cliente prefere ser chamado.
          cpf: CPF do cliente.
          dataNascimento: Data de nascimento do cliente.
          2. Tabela enderecos
          Registra os endereços associados aos clientes.

      2.Campos Principais:
          idEndereco: Identificador único do endereço.
          logradouro: Nome da rua/avenida.
          numero: Número do endereço.
          cep: CEP do local.
          complemento: Informações adicionais sobre o endereço.
          estado: Estado.
          cidade: Cidade.
          bairro: Bairro.
          idCliente: Chave estrangeira referenciando o cliente associado a este endereço.
          3. Tabela contatos
          Armazena informações de contato dos clientes, incluindo números de telefone e endereço de e-mail.

      3.Campos Principais:
          idContato: Identificador único do contato.
          telefone1: Primeiro número de telefone.
          telefone2: Segundo número de telefone (opcional).
          email: Endereço de e-mail.
          idCliente: Chave estrangeira referenciando o cliente associado a este contato.
          4. Tabela produtos
          Contém informações sobre os produtos oferecidos pela pastelaria.

      4.Campos Principais:
          idProduto: Identificador único do produto.
          tipoProduto: Tipo ou categoria do produto.
          preco: Preço do produto.
          5. Tabela pasteis
          Registra detalhes específicos sobre os pasteis, incluindo descrição, tamanho, preço, e a associação com um produto.

      5.Campos Principais:
          idPastel: Identificador único do pastel.
          descricao: Descrição do pastel.
          tamanho: Tamanho do pastel.
          preco: Preço do pastel.
          idProduto: Chave estrangeira referenciando o produto associado a este pastel.

      6.Tabela ingredientes
          Armazena informações sobre os ingredientes dos produtos.

      7.Campos Principais:
          idIngrediente: Identificador único do ingrediente.
          nome: Nome do ingrediente.
          quantidade: Quantidade do ingrediente.
          idProduto: Chave estrangeira referenciando o produto associado a este ingrediente.
          
      8.Tabela ingredientes_do_pastel
          Associa ingredientes aos pasteis, permitindo a composição de pasteis com diferentes ingredientes.

      9.Campos Principais:
          idIdp: Identificador único da relação entre ingrediente e pastel.
          idPastel: Chave estrangeira referenciando o pastel associado.
          idIngrediente: Chave estrangeira referenciando o ingrediente associado.

      8.Tabela categorias
          Define as categorias dos produtos, com uma categoria padrão.

      9.Campos Principais:
          idCategoria: Identificador único da categoria.
          nome: Nome da categoria.
          idProduto: Chave estrangeira referenciando o produto associado a esta categoria.

      10.Tabela status_pedidos
          Define os possíveis status de um pedido.

      11.Campos Principais:
          idStatus: Identificador único do status.
          descricao: Descrição do status.
          10. Tabela pedidos
          Registra informações sobre os pedidos, incluindo cliente, data do pedido, forma de pagamento, e status do pedido.

      12Campos Principais:
          idPedido: Identificador único do pedido.
          idCliente: Chave estrangeira referenciando o cliente associado a este pedido.
          dataPedido: Data do pedido.
          formaPagamento: Forma de pagamento.
          idStatus: Chave estrangeira referenciando o status associado a este pedido.

      13.Tabela itens_pedido
          Registra os itens individuais de cada pedido, incluindo produto, quantidade, e a associação com o pedido.

Campos Principais:
idDetalhe: Identificador único do item do pedido.
idPedido: Chave estrangeira referenciando o pedido associado a este item.
idProduto: Chave estrangeira referenciando o produto associado a este item.
quantidade: Quantidade do produto no pedido.


## Contribuições

    Trabalho feito pelo trio:
        https://github.com/YGerard324
        https://github.com/josehlopes
        @Elisson Nadson Souza Marques
        
## Licença
Este projeto está licenciado sob a [Licença MIT](LICENSE).

