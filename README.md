# BILLINHO_API

  A API tem como objetivo a criaçao e visualização dos Students e Enrollments, podendo os mesmos serem feitos através de requests GET e POST, em todas as requisições o conteudo será em formato JSON e em rotas críticas um token no header terá que ser adicionado. 
  Também foram adicionados algumas gems para certas funcionalidades em nossa API.

  ## Sobre o BILLINHO_API

  ### Frameworks

  - ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-linux]

  - Rails 7.0.4

  - PostgreSQL 11.18 (Debian 11.18-0+deb10u1)

  ### Gems
  
  - kaminari
    - Utilizado para adicionar métodos que facilitam a páginação das requests.

  - cpf_cnpj
    - Possibilita verificar se um CPF ou CNPJ é válido.

  - validates_timeliness
    - Utilizado para verificar se a data era anterior a data corrente e validar que era do tipo data.

  - active_model_serializers
    - Ajudou a modelar as saidas JSON

  - bcrypt
    - Faz a encriptação da senha do User e quando tentado acessar pelo console aparece [FILTERED].

  - jwt
    - Faz a geração e autenticação dos token para validar se o User está logado.

  ## Requisitos para executar a aplicação

  - Docker

  - Framework de requisições

  ## Configuração

  - Clone o repositório localmente.

    `git clone git@github.com:AllanBNascimento/billinho_api.git`

  - Entre no repositório pelo console: 

    `cd billinho_api`

  - Para buildar e executar o container:

    `docker compose up -d`

  ## Criando e populando o banco de dados

  - Ainda no repositório, pelo console execute:
    
    `docker exec billinho_api bash`

  - Dentro do bash execute:
    
    `rails db:create`

    `rails db:migrate`

    `rails db:seed`

  - Pronto, agora temos um banco de dados criado e populado para fazer nossas requisições.

  ## Instruções para uso:

  - É recomendado o uso do Insomnia, mas fique á vontade para utilizar um framework de sua escolha para realizar as requisições.
  - As requisições serão passadas no formato:

  - ROTA

        {
          REQUEST_BODY
        }

  ### Requisições GET

  - http://localhost:3000/students

        {
          "page": 1,
          "count": 3
        } 

  - http://localhost:3000/enrollments

        {
          "page": 1,
          "count": 3
        }        

  ### Requisições POST

  - http://localhost:3000/students

        {
          "name": "Novo aluno mesmo",
          "cpf": "609.113.277-62",
          "birthdate": "23/10/1996",
          "payment_method": "boleto"
        }

  - Para acessar a rota critica `POST /enrollments` é necessário efetuar o login, este ultimo retornando o token (no headers) que será utillizado para acesso da rota. Ao pegar o token cole-o em Auth -> Bearer Token e efetue a requisição.     


  - http://localhost:3000/login

        {
          "username": "admin_ops",
          "password": "billinho"
        }

  - http://localhost:3000/enrollments

        {
          "amount": 20000,
          "installments": 3,
          "due_day": 5,
          "student_id": 1
        }