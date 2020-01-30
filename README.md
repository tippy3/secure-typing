# README


## テーブル設計

* id
* created_at
* updated_at

は自動生成される。

### users (has_many results)
* t.string :email
* t.string :name
* t.boolean :admin
* t.integer :level
* t.integer :experience
* t.integer :swapfont
* t.datetime :last_login
* t.string :password_digest

### sentences (belongs_to games)
* game_id
* sentence

### games (has_many sentences)
* title
* winners

### results (belongs_to users)
* user_id
* game_id
* speed

タイピング部分はinputbox





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
