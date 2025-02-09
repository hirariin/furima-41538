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
| image                       | text       | null: false                    |
| item_name                   | string     | null: false                    |
| item_info                   | text       | null: false                    |
| item_category               | text       | null: false                    |
| item_sales_status           | text       | null: false                    |
| item_shipping_fee_status    | text       | null: false                    |
| item_scheduled_delivery     | text       | null: false                    |
| sell_price                  | integer    | null: false                    |


### Association

- belongs_to :user
- has_one :order

##  orders table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| buyer       | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

##  shipping address table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| postal_code | string     | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| addresses   | string     | null: false                    |
| building    | string     | null: false                    |
| phone_number| string     | null: false                    |


### Association

- belongs_to :order
