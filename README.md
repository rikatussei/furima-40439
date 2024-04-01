# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |

### Association
- has_many :items
- has_one  :delivery_addresses


## items テーブル

| Column              | Type      | Options                        |
| ------------------- | --------- | ------------------------------ |
| product_name        | string    | null: false                    |
| product_description | text      | null: false                    |
| price               | integer   | null: false                    |
| seller_id           | references| null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one  :delivery_addresses


## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| city           | string     | null: false                    |
| street_address | string     | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | string     | null: false                    |
| buyer_id       | references | null: false, foreign_key: true |
| item_id        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item