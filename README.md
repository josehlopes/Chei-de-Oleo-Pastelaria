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
    Chei de Óleo Pastelaria - Banco de Dados

        Este script cria um banco de dados para a Chei de Óleo Pastelaria, organizando informações sobre clientes, endereços, contatos, produtos, pedidos e itens de pedido.

        --Tabelas--

        clientes:
        Armazena informações sobre os clientes, como nome, preferências e data de nascimento.

        enderecos:
        Contém detalhes dos endereços dos clientes.

        contatos:
        Guarda informações de contato dos clientes, como telefones e e-mails.

        produtos:
        Lista os produtos disponíveis na pastelaria, com tipos e preços.

        pasteis:
        Registra os pastéis oferecidos, incluindo descrição, tamanho e preço.

        ingredientes:
        Detalha os ingredientes usados nos produtos.

        ingredientes_do_pastel:
        Associa ingredientes aos pastéis disponíveis.

        categorias:
        Categoriza os produtos, sendo "Comum" a categoria padrão.

        status_pedidos:
        Define os status dos pedidos, como "Aguardando Pagamento" ou "Concluído".

        formas_pagamentos:
        Indica as formas de pagamento disponíveis, como "Dinheiro", "Cartão de Crédito", etc.

        pedidos:
        Registra os pedidos feitos pelos clientes, incluindo data, status, forma de pagamento e observações.

        itens_pedido:
        Lista os itens específicos incluídos em cada pedido, com a quantidade correspondente.

## Contribuições

    Trabalho feito pelo trio:
        https://github.com/YGerard324
        https://github.com/josehlopes
        @Elisson Nadson Souza Marques
        
## Licença
Este projeto está licenciado sob a [Licença MIT](LICENSE).

