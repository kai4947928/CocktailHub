FROM ruby:3.2.6

RUN apt-get update -qq && apt-get install -y postgresql-client \
  build-essential \
  libpq-dev \
  libvips42 \
  nodejs \
  npm \
  git

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app

CMD ["bash"]