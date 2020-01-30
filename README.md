# README




## 作業ログ

rails new前後の手順のメモ

```
mkdir url-shortener

cd url-shortener

rbenv local 2.7.0

gem update bundler

bundle init

vi Gemfile
# GemfileにRailsを追加

bundle install --path vendor/bundle

bundle exec rails new . -B -M -C -S -T --database=mysql

vi Gemfile
# bcryptとi18nを追加

bundle install

bundle exec rails webpacker:install

yarn add bootstrap jquery popper.js @fortawesome/fontawesome-free

bundle exec rails db:create

bundle exec rails s
# localhost:3000で起動できていることを確認

```
