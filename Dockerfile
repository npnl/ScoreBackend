FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /score
WORKDIR /score
COPY Gemfile /score/Gemfile
COPY Gemfile.lock /score/Gemfile.lock
RUN bundle install
COPY . /score