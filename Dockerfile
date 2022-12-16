FROM ruby:3.0.0
  
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
  
WORKDIR /billinho_api
COPY Gemfile /billinho_api/Gemfile
COPY Gemfile.lock /billinho_api/Gemfile.lock
RUN bundle install
RUN bundle update --bundler
CMD 'rails server -b 0.0.0.0'
  