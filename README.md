# BILLINHO_API

A API vem a cumprir todos os requisitos do teste
Things you may want to cover:

## Requisitos para executar a aplicação
* Ruby 3.0.0

* Rails 7.0.4

* PostgreSQL 15.1

## Configuração

- Clone o repositório localmente.

- Entre no repositório pelo console 

- Execute:
  - bundle install

## Criando o banco de dados

- Agora vamos criar o banco de dados e populá-lo.

- Ainda no repositório, pelo console execute:
  - rails db:create
  - rails db:migrate
  - rails db:seed

* ...

## Instruções para uso:

* Baixe o Insomnia, ou outro framework de sua escolha para realizar as requisições

- Para acessar a rota critica `POST /enrollments` é necessário efetuar o login, este ultimo retornando o token (no headers) que será utillizado para acesso da rota. Ao pegar o toker cole-o em Auth -> Bearer Token e efetue a requisição.