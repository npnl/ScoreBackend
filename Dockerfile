FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /score
WORKDIR /score
RUN gem update bundler
COPY Gemfile /score/Gemfile
COPY Gemfile.lock /score/Gemfile.lock
RUN bundle install
COPY . /score
ENTRYPOINT bundle exec rails s -p 3000 -b '0.0.0.0'