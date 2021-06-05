FROM ruby:3.0.1

RUN apt-get update -qq && apt-get install -y postgresql-client vim

RUN mkdir -p /app/latam_gateway_challenge
WORKDIR /app/latam_gateway_challenge

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundler install

ADD . /app/latam_gateway_challenge