# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# animal-searchのDB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :tweets
- has_many :comments

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|image|string|null: false|
|user_id|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many :tweets_categories
- has_many :categories, through: :tweets_categories

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :tweet
- belongs_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|ancestry|string|index: true|
### Association
- has_many :tweets_categories
- has_many :tweets, through: :tweets_categories
- has_ancesty

## posts_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|tweet_id|references|null: false|
|category_id|references|null: false|
### Association
- belongs_to :tweet
- belongs_to :category