# Rubyのバージョンを指定
FROM ruby:2.6.5

# アプリケーションのコードを配置する作業ディレクトリを設定
WORKDIR /app

# 必要なファイルをコピー
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY config/database.yml /app/config/database.yml
COPY config/puma.rb /app/config/puma.rb
COPY . /app

# アプリケーションの依存関係をインストール
RUN bundle install

# pumaを起動するためのコマンドを設定
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]