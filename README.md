# アプリ名
RopeWay

# 概要
ヒモとパトロンのマッチングアプリ

# URL


# テスト用アカウント
### Basic認証
- ID:kbno
- pass:8878 
### テストアカウント
- ID:sample@sample.com
- pass:sample

# 利用方法
1. ユーザー登録
2. 他ユーザーのプロフィールを閲覧
3. 気になったユーザーにいいねをつける
4. お互いがいいねをつけたらトークルームが作成できる
5. トークルーム内でさらにお互いのことを知る

# 目指した課題解決
既存のマッチングアプリではなかなか言い出しづらい、「将来の関係性」についてのミスマッチを改善するために作成。
「趣味友」「飲み友」「恋人」など様々な関係がある中でも「ヒモとパトロン」という関係に特化したマッチングサービス。

# 要件
- ユーザー管理
- いいね
- トークルーム
- 検索
- タグ

# データベース設計
### users テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| phone              | string  | null: false, unique: true | 
| self_pr            | text    |                           |
| sex                | integer | null: false               |
| age                | integer | null: false               |
| residence_id       | integer | null: false               |
| rope_patron_id     | integer | null: false               |
#### Association
- has_many :likes
- has_many :rooms, through: room_users
- has_many :room_users
- has_many :messages


### likes テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| by_user_id | references | null: false, foreign_key: true |
| to_user_id | references | null: false, foreign_key: true |
#### Association
- belongs_to :user

### rooms テーブル
| Column | Type | Options |
| ------ | ---- | ------- |
|        |      |         |
#### Association
- has_many :users, through: room_users
- has_many :room_users

### room_users テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |
#### Association
- belongs_to :room
- belongs_to :user

### messages テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |
#### Association
- belongs_to :room
- belongs_to :user

# ローカルでの動作方法
1. コマンドでbundle installを実行し、gemのインストール
2. rails db:create
3. rails db:migrate
4. rails s

### パッケージ
- devise
- pry-rails
- mini_magick
- image_processing '~> 1.2'
- active_hash

### バージョン
- rails '~> 6.0.0'