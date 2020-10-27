# テーブル設計

## users テーブル

<<<<<<< Updated upstream
| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| nickname         | string  | null: false                    |
| email            | string  | null: false, unique:true       |
| password         | string  | null: false                    |
| first_name       | string  | null: false                    |
| second_name      | string  | null: false                    |
| kana_first_name  | string  | null: false                    |
| kana_second_name | string  | null: false                    |
| birthday_year    | integer | null: false                    |
| birthday_month   | integer | null: false                    |
| birthday_day     | integer | null: false                    |

### Association
- has_many :items
- has_many :price_records


## items テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| item_image      | string     | null: false                   |
| item_name       | string     | null: false                   |
| description     | string     | null: false                   |
| delivery_id     | integer    | null: false                   |
| day_id          | integer    | null: false                   |
| price           | integer    | null: false                   |
| area_id         | integer    | null: false                   |
| status_id       | integer    | null: false                   |
| tag_id          | integer    | null: false                   |
| user_id         | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :price_records


## price_records テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| purchase_date | datetime   | null: false,                   |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

=======
| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| nickname           | string  | null: false                    |
| email              | string  | null: false, unique:true       |
| encrypted_password | string  | null: false                    |
| first_name         | string  | null: false                    |
| second_name        | string  | null: false                    |
| kana_first_name    | string  | null: false                    |
| kana_second_name   | string  | null: false                    |
| birthday           | date    | null: false                    |


### Association
- has_many :items
- has_many :price_records


## items テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| item_name       | string     | null: false                   |
| description     | text       | null: false                   |
| delivery_id     | integer    | null: false                   |
| day_id          | integer    | null: false                   |
| price           | integer    | null: false                   |
| area_id         | integer    | null: false                   |
| status_id       | integer    | null: false                   |
| tag_id          | integer    | null: false                   |
| user            | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :price_records


## price_records テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

>>>>>>> Stashed changes
### Association
- belongs_to :users
- belongs_to :items
- has_one :home_addresses


## home_addresses テーブル

<<<<<<< Updated upstream
| Column          | Type        | Options                       |
| --------------- | ----------- | ----------------------------- |
| postal_code     | integer(8)  | null: false                   |
| town            | string      | null: false                   |
| town_number     | string      | null: false                   |
| phone_number    | integer(11) | null: false                   |
| price_record_id | integer     | null: false,foreign_key: true |
=======
| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| postal_code   | string(8)  | null: false                   |
| town          | string     | null: false                   |
| town_number   | string     | null: false                   |
| building_name | string     | null: false                   |
| phone_number  | string(11) | null: false                   |
| price_record  | reference  | null: false,foreign_key: true |
>>>>>>> Stashed changes

### Association
- belongs_to :price_records
