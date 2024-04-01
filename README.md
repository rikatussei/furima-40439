# テーブル設計

## users"ユーザー情報" テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_year_id      | string | null: false               |
| birth_month_id     | string | null: false               |
| birth_day_id       | string | null: false               |

### Association
- has_many :items
- has_many :orders


## items"商品情報" テーブル

| Column              | Type      | Options                        |
| ------------------- | --------- | ------------------------------ |
| product_name        | string    | null: false                    |
| product_description | text      | null: false                    |
| category_id         | string    | null: false                    |
| item_condition_id   | string    | null: false                    |
| shipping_cost_id    | string    | null: false                    |
| delivery_time_id    | string    | null: false                    |
| departure_area_id   | string    | null: false                    |
| price               | integer   | null: false                    |
| user_id             | references| null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :order


## orders"購入履歴" テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| item_id        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :delivery_address


## delivery_addresses"住所" テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| city           | string     | null: false                    |
| street_address | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| order_id       | references | null: false, foreign_key: true |

### Association
belongs_to :order



