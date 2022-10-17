* Database creation

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name_kanji    | string  | null: false               |
| first_name_kanji   | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

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
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address


## addresses テーブル

| Column        | Type       | Options                        |
| ---------     | ---------- | ------------------------------ |
| zip           | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| phone_number  | string     | null: false                    |
| building      | string     |                                |
| prefecture_id | integer    | null: false                    |
| order         | references | null: false                    |

### Association

- belongs_to :order