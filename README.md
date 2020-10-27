# テーブル設計

## users テーブル

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
- has_many :item
- has_many :price_record


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
- has_one :price_record


## price_records テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :home_address


## home_addresses テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| postal_code   | string(8)  | null: false                   |
| area_id       | integer    | null: false                   |
| town          | string     | null: false                   |
| town_number   | string     | null: false                   |
| building_name | string     | null: false                   |
| phone_number  | string(11) | null: false                   |
| price_record  | reference  | null: false,foreign_key: true |

### Association
- belongs_to :price_record
