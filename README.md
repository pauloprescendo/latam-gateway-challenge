# Teste LatamGateway

Api Rest para consulta de endereços informando o CEP.
***

## Pré-requisitos

* Docker
* Docker Compose

ou

* Postgresql 12
* Ruby 3.0.1
* Redis

***

## Instalação

### Com Docker

```bash
git clone https://github.com/pauloprescendo/latam-gateway-challenge.git
cd latam-gateway-challenge
docker-compose build
docker-compose run --rm web bin/setup
docker-compose up
```

### Sem Docker

Com os serviços `postgresql` e `redis` rodando faça:

```bash
bundle install
rails db:setup db:migrate db:seed
bundle exec sidekiq
rails s
```

A applicação rodará em http://localhost:3000/
***

## Testes

### Com Docker

```bash
docker-compose run -e "RAILS_ENV=test" --rm web rspec
```

### Sem Docker

```bash
bundle exec rspec
```
