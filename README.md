# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_date         | date                | null: false               |


### Association

* has_many :items
* has_many :orders

## items table

| Column                      | Type       | Options                        |
|-----------------------------|------------|--------------------------------|
| user                        | references | null: false, foreign_key: true |
| item_name                   | string     | null: false                    |
| item_info                   | text       | null: false                    |
| item_category_id            | integer    | null: false                    |
| item_sales_status_id        | integer    | null: false                    |
| item_shipping_fee_status_id | integer    | null: false                    |
| prefecture_id               | integer    | null: false                    |
| item_scheduled_delivery_id  | integer    | null: false                    |
| sell_price                  | integer    | null: false                    |


### Association

- belongs_to :user
- has_one :order

##  orders table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping_address

##  shipping_addresses table

| Column        | Type       | Options                        |
|-------------  |------------|--------------------------------|
| order         | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |


### Association

- belongs_to :order
