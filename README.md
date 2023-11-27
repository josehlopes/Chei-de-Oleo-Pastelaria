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
# Documentação do Código SQL

## Objetivo
O código SQL fornecido tem como objetivo criar um conjunto de tabelas para um sistema de gerenciamento de uma pastelaria chamada "Chei de Óleo". Essas tabelas abrangem informações sobre clientes, endereços, contatos, categorias de produtos, produtos, ingredientes, pasteis, ingredientes dos pasteis, status de pedidos, formas de pagamento, pedidos e itens de pedido.

## Estrutura do Banco de Dados
O banco de dados é chamado "Chei_de_oleo_pastelaria" e contém as seguintes tabelas:

### Tabela `clientes`
- Armazena informações sobre os clientes, como nome, CPF, data de nascimento, etc.

### Tabela `enderecos`
- Armazena informações sobre os endereços dos clientes.

### Tabela `contatos`
- Armazena informações de contato dos clientes, como telefone e e-mail.

### Tabela `categorias`
- Contém as categorias de produtos disponíveis na pastelaria.

### Tabela `produtos`
- Armazena informações sobre os produtos disponíveis, incluindo nome, preço base e categoria.

### Tabela `ingredientes`
- Contém informações sobre os ingredientes disponíveis na pastelaria.

### Tabela `pasteis`
- Descreve os pasteis disponíveis, incluindo tamanho, preço e categoria.

### Tabela `ingredientes_do_pastel`
- Associa ingredientes aos pasteis.

### Tabela `status_pedidos`
- Define os possíveis estados de um pedido, como aguardando pagamento, concluído, em andamento, etc.

### Tabela `formas_pagamentos`
- Contém informações sobre as formas de pagamento disponíveis, como dinheiro, cartão de crédito, débito ou PIX.

### Tabela `pedidos`
- Armazena informações sobre os pedidos feitos pelos clientes.

### Tabela `itens_pedido`
- Associa produtos, pasteis e ingredientes a pedidos, especificando a quantidade.

### Tabelas `log` e `log_preco`
- São tabelas de registro para operações gerais e alterações de preço, respectivamente.

## Relacionamentos
O código inclui chaves estrangeiras (`FOREIGN KEY`) para estabelecer relacionamentos entre as tabelas. Esses relacionamentos são essenciais para manter a integridade referencial do banco de dados.

## Observações
- A tabela `pasteis` possui um relacionamento com as tabelas `categorias` e `produtos`.
- A tabela `ingredientes_do_pastel` associa ingredientes a pasteis.
- As tabelas `pedidos` e `itens_pedido` estão relacionadas com as tabelas `clientes`, `status_pedidos` e `formas_pagamentos`.
- O banco de dados também possui tabelas de log para registrar operações e alterações de preço.

## Uso
Este script deve ser executado em um sistema de gerenciamento de banco de dados MySQL para criar o esquema de banco de dados necessário para a pastelaria "Chei de Óleo".

Lembre-se de que este é um esquema básico e pode ser expandido conforme necessário para atender aos requisitos específicos do negócio.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Documentação das Procedures

## Procedure `P_cadastrar_cliente`

### Objetivo
A procedure `P_cadastrar_cliente` tem como objetivo cadastrar um novo cliente na pastelaria, incluindo informações sobre o cliente, endereço e contato.

### Parâmetros
- `p_nomeCliente`: Nome completo do cliente.
- `p_nomePreferido`: Nome preferido do cliente.
- `p_cpf`: CPF do cliente.
- `p_dataNascimento`: Data de nascimento do cliente.
- `p_logradouro`: Logradouro do endereço do cliente.
- `p_numero`: Número do endereço.
- `p_cep`: CEP do endereço.
- `p_complemento`: Complemento do endereço.
- `p_estado`: Estado do endereço.
- `p_cidade`: Cidade do endereço.
- `p_bairro`: Bairro do endereço.
- `p_telefone1`: Primeiro número de telefone do cliente.
- `p_telefone2`: Segundo número de telefone do cliente.
- `p_email`: Endereço de e-mail do cliente.

### Funcionalidade
1. Inicia uma transação.
2. Insere informações do cliente na tabela `clientes`.
3. Obtém o código do cliente inserido.
4. Insere informações de endereço na tabela `enderecos`.
5. Insere informações de contato na tabela `contatos`.
6. Confirma a transação se não houver erros, caso contrário, realiza rollback.

## Procedure `P_cadastrar_produto`

### Objetivo
A procedure `P_cadastrar_produto` tem como objetivo cadastrar um novo produto na pastelaria.

### Parâmetros
- `p_nomeProduto`: Nome do produto.
- `p_preco`: Preço base do produto.
- `p_idCategoria`: ID da categoria à qual o produto pertence.

### Funcionalidade
1. Inicia uma transação.
2. Insere informações do produto na tabela `produtos`.
3. Confirma a transação.

## Procedure `P_cadastrar_pastel`

### Objetivo
A procedure `P_cadastrar_pastel` tem como objetivo cadastrar um novo pastel na pastelaria.

### Parâmetros
- `p_descricao`: Descrição do pastel.
- `p_tamanho`: Tamanho do pastel (P, M, G).
- `p_preco`: Preço do pastel.
- `p_idProduto`: ID do produto associado ao pastel.
- `p_idCategoria`: ID da categoria à qual o pastel pertence.

### Funcionalidade
1. Inicia uma transação.
2. Insere informações do pastel na tabela `pasteis`.
3. Confirma a transação.

## Procedure `P_atualiza_preco_produto`

### Objetivo
A procedure `P_atualiza_preco_produto` tem como objetivo atualizar o preço de um produto existente na pastelaria.

### Parâmetros
- `p_nomeProduto`: Nome do produto a ser atualizado.
- `p_novoPreco`: Novo preço a ser atribuído ao produto.

### Funcionalidade
1. Atualiza o preço do produto na tabela `produtos`.

## Procedure `P_insere_pedido_cliente`

### Objetivo
A procedure `P_insere_pedido_cliente` tem como objetivo inserir um novo pedido para um cliente na pastelaria.

### Parâmetros
- `p_nomeCliente`: Nome do cliente para o qual o pedido será inserido.
- `p_idStatus`: ID do status do pedido.
- `p_idPagamento`: ID da forma de pagamento.
- `p_obs`: Observações adicionais sobre o pedido.

### Funcionalidade
1. Obtém o ID do cliente com base no nome fornecido.
2. Insere um novo pedido na tabela `pedidos` associado ao cliente.

## Procedure `P_insere_ingrediente_atualiza_preco`

### Objetivo
A procedure `P_insere_ingrediente_atualiza_preco` tem como objetivo inserir um novo ingrediente na pastelaria e atualizar o preço base dos produtos associados à categoria do ingrediente.

### Parâmetros
- `p_nomeIngrediente`: Nome do ingrediente a ser inserido.
- `p_preco`: Preço do ingrediente.
- `p_idCategoria`: ID da categoria à qual o ingrediente pertence.

### Funcionalidade
1. Insere informações do ingrediente na tabela `ingredientes`.
2. Atualiza o preço base dos produtos associados à categoria do ingrediente.

## Observações
- Cada procedure utiliza transações para garantir consistência nos dados.
- O tratamento de exceções é realizado para lidar com erros durante as transações.
- A procedure `P_insere_ingrediente_atualiza_preco` atualiza o preço base dos produtos para refletir o novo ingrediente adicionado.

## Uso
Cada procedure pode ser chamada individualmente para executar as operações relacionadas ao seu objetivo específico. Certifique-se de fornecer os parâmetros corretos ao chamar cada procedure.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Documentação das Triggers

## Trigger `TR_insere_ingredientes`

### Objetivo
O trigger `TR_insere_ingredientes` é acionado após a inserção de um novo pastel na tabela `pasteis`. Seu objetivo é inserir automaticamente um ingrediente associado a esse pastel na tabela `ingredientes_do_pastel`.

### Funcionalidade
1. Obtém o ID do pastel recém-inserido.
2. Insere na tabela `ingredientes_do_pastel` um registro associando o ID do pastel ao ID do ingrediente desejado (neste caso, o ID 3).

## Trigger `TR_cliente_inserido`

### Objetivo
O trigger `TR_cliente_inserido` é acionado após a inserção de um novo cliente na tabela `clientes`. Ele registra a operação na tabela de log (`log`), incluindo informações sobre o usuário que fez a operação e a data e hora.

## Trigger `TR_preco_alterado`

### Objetivo
O trigger `TR_preco_alterado` é acionado antes de uma atualização na tabela `produtos`. Seu objetivo é registrar em `log_preco` as alterações de preço feitas nos produtos.

### Funcionalidade
1. Verifica se o preço base do produto foi alterado.
2. Se alterado, insere na tabela `log_preco` informações sobre a alteração, incluindo o ID do produto, o preço antigo, o novo preço e a data e hora da alteração.

## Trigger `TR_atualizacao_status_pedido`

### Objetivo
O trigger `TR_atualizacao_status_pedido` é acionado após a inserção de um novo item de pedido na tabela `itens_pedido`. Ele atualiza o status do pedido com base na quantidade de itens.

### Funcionalidade
1. Calcula o total de itens no pedido recém-inserido.
2. Se o total de itens for maior ou igual a 3, atualiza o status do pedido para 'Concluído' ('C'), caso contrário, atualiza para 'Em Andamento' ('EA').

## Trigger `TR_atualizacao_tamanho_pastel`

### Objetivo
O trigger `TR_atualizacao_tamanho_pastel` é acionado antes de uma atualização na tabela `pasteis`. Seu objetivo é dobrar o preço do pastel se o tamanho for alterado.

### Funcionalidade
1. Verifica se o tamanho do pastel foi alterado.
2. Se alterado, dobra o preço do pastel.

## Observações
- Cada trigger executa lógica específica antes ou após eventos específicos nas tabelas.
- Os testes das triggers incluem inserções e atualizações nas tabelas relacionadas para acionar as lógicas definidas pelos triggers.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Documentação das Views

## View `V_dados_dos_clientes`

### Objetivo
A view `V_dados_dos_clientes` foi criada para fornecer uma visão consolidada das informações relevantes dos clientes, incluindo nome, CPF, endereço (logradouro, número, complemento), telefone e e-mail.

### Funcionalidade
1. Utiliza JOINs para combinar dados das tabelas `clientes`, `enderecos`, e `contatos`.
2. Seleciona as colunas desejadas para compor a visão.

## View `V_ingredientes_do_pastel`

### Objetivo
A view `V_ingredientes_do_pastel` tem como objetivo mostrar a lista de ingredientes associados a cada pastel, incluindo a descrição do pastel, o tamanho e o nome do ingrediente.

### Funcionalidade
1. Utiliza JOINs entre as tabelas `pasteis`, `ingredientes_do_pastel` e `ingredientes`.
2. Ordena os resultados pela descrição do pastel.

## View `V_ver_bacon_e_queijo`

### Objetivo
A view `V_ver_bacon_e_queijo` foi criada para listar pasteis que contêm bacon e queijo, utilizando a tabela `ingredientes_do_pastel` para verificar a presença desses ingredientes.

### Funcionalidade
1. Utiliza JOINs entre as tabelas `pasteis`, `ingredientes_do_pastel` e `ingredientes`.
2. Filtra os resultados para incluir apenas pasteis com os ingredientes de ID 5 (bacon) e 2 (queijo).

## View `V_clientes_com_mais_pedidos`

### Objetivo
A view `V_clientes_com_mais_pedidos` visa mostrar a contagem de pedidos por cliente, agrupados por mês, exibindo o cliente com mais pedidos primeiro.

### Funcionalidade
1. Utiliza JOINs entre as tabelas `clientes` e `pedidos`.
2. Agrupa os resultados por nome do cliente e mês do pedido.
3. Ordena os resultados pela contagem de pedidos em ordem decrescente.

## View `V_pasteis_veganos_clientes18`

### Objetivo
A view `V_pasteis_veganos_clientes18` exibe pasteis veganos comprados por clientes com mais de 18 anos, incluindo detalhes como nome do cliente, idade, descrição do pastel e número do pedido.

### Funcionalidade
1. Utiliza JOINs entre as tabelas `clientes`, `pedidos`, `itens_pedido`, `pasteis`, `categorias` e `clientes`.
2. Filtra os resultados para incluir apenas pasteis da categoria 'Veganos' e clientes com mais de 18 anos.

## View `V_valor_total_pastel`

### Objetivo
A view `V_valor_total_pastel` calcula o valor total dos pasteis, mostrando o preço individual de cada pastel e o preço total de todos os pasteis.

### Funcionalidade
1. Utiliza UNION ALL para combinar duas consultas: a primeira retorna os detalhes individuais dos pasteis, e a segunda retorna o preço total.
2. Os resultados são rotulados como 'Pastel' para detalhes individuais e 'Total' para o preço total.

## View `V_pedidos_pastel_bebida`

### Objetivo
A view `V_pedidos_pastel_bebida` identifica os pedidos que incluem tanto pasteis quanto bebidas, utilizando as tabelas `pedidos`, `itens_pedido`, `produtos` e `categorias`.

### Funcionalidade
1. Utiliza JOINs para relacionar as tabelas `pedidos`, `itens_pedido`, `produtos` e `categorias`.
2. Filtra os resultados para incluir apenas pedidos que contenham pasteis e bebidas.

## View `V_pasteis_mais_vendidos`

### Objetivo
A view `V_pasteis_mais_vendidos` lista os pasteis mais vendidos, ordenados pela quantidade de vendas.

### Funcionalidade
1. Utiliza JOINs entre as tabelas `pasteis` e `itens_pedido`.
2. Agrupa os resultados por descrição do pastel e conta a quantidade de vendas.
3. Ordena os resultados pela quantidade de vendas em ordem decrescente.

## View `V_informacoes_dos_pedidos`

### Objetivo
A view `V_informacoes_dos_pedidos` apresenta informações detalhadas dos pedidos, incluindo nome do cliente, CPF, endereço, telefone, número do pedido, hora do pedido, status do pedido e forma de pagamento.

### Funcionalidade
1. Utiliza JOINs entre as tabelas `clientes`, `enderecos`, `contatos`, `pedidos`, `status_pedidos` e `formas_pagamentos`.
2. Ordena os resultados pelo número do pedido.

## View `V_telefones`

### Objetivo
A view `V_telefones` tem como objetivo apresentar os nomes dos clientes e seus respectivos números de telefone.

### Funcionalidade
1. Utiliza JOIN entre as tabelas `clientes` e `contatos`.
2. Seleciona os campos de nome do cliente, telefone1 e telefone2.

## View `V_nome`

### Objetivo
A view `V_nome` exibe os nomes dos clientes, incluindo o nome preferido, se disponível.

### Funcionalidade
1. Seleciona os campos de nome do cliente e nome preferido.

## View `V_estado`

### Objetivo
A view `V_estado` mostra os nomes dos clientes e seus estados, utilizando JOIN entre as tabelas `clientes` e `enderecos`.

### Funcionalidade
1. Seleciona os campos de nome do cliente e estado.

## View `V_endereco`

### Objetivo
A view `V_endereco` apresenta informações sobre o endereço dos clientes, incluindo logradouro, número, cep, complemento, estado, cidade e bairro.

### Funcionalidade
1. Utiliza JOIN entre as tabelas `clientes` e `enderecos`.
2. Seleciona os campos relevantes do endereço.

## Observações
- As views fornecem visões simplificadas e específicas dos dados armazenados nas tabelas.
- Foram realizados testes selecionando dados de cada view para verificar sua funcionalidade e corretude.
- Cada view tem uma função específica, facilitando consultas comuns e análises no banco de dados.

## Contribuições

    Trabalho feito pelo trio:
        https://github.com/YGerard324
        https://github.com/josehlopes
        https://github.com/ElissonNadson
        
## Licença
Este projeto está licenciado sob a [Licença MIT](LICENSE).

