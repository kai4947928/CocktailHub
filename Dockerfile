FROM ruby:3.2

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  sqlite3 \
  git

# 作業ディレクトリを作成
RUN mkdir /app
WORKDIR /app

# GemfileとGemfile.lockをコンテナにコピー
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Bundlerを使って必要なGemをインストール
RUN bundle install

# アプリケーションのコードをコンテナにコピー
COPY . /app

# コンテナ起動時にRailsサーバーを立ち上げる
CMD ["bash"]