* Database creation

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| name_kanji         | string  | null: false               |
| name_kana          | string  | null: false               |
| birthday           | integer | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column        | Type       | Options                        |
| ----------    | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| explanation   | text       | null: false                    |
| price         | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| category_id   | integer    | null: false                    |
| state_id      | integer    | null: false                    |
| fee_id        | integer    | null: false                    |
| days_id       | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user


## orders テーブル

| Column        | Type       | Options                        |
| ---------     | ---------- | ------------------------------ |
| zip           | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | text       | null: false                    |
| phone_number  | integer    | null: false                    |
| building      | text       |                                |
| prefecture_id | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
