# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| user_image         | string |             |
| last_name          | string | null: false |
| first_name         | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- belongs_to :buyers
- belongs_to :cards


## buyers テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| user_id       | integer | null: false, foreign_key: true |
| last_name     | string  | null: false                    |
| first_name    | string  | null: false                    |
| prefecture    | string  | null: false                    |
| city          | string  | null: false                    |
| address       | string  | null: false                    |
| building_name | string  | null: false                    |
| phone_number  | string  | null: false                    |

### Association
- belongs_to :users


## cards テーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| user_id     | integer | null: false, foreign_key: true |
| customer_id | string  | null: false                    |
| card_id     | string  | null: false                    |

### Association
- belongs_to :users


## categories テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| ancestry | string |             |

### Association
- has_many :items


## items テーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| name        | string  | null: false                    |
| price       | string  | null: false                    |
| explanation | string  | null: false                    |
| status      | string  | null: false                    |
| judgment    | string  |                                |
| size        | string  | null: false                    |
| days        | string  | null: false                    |
| category_id | integer | null: false, foreign_key: true |
| brand_id    | integer | null: false, foreign_key: true |
| user_id     | integer | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :categories
- belongs_to :brands
- has_many :images
- belongs_to_active_hash :prefecture

## images テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| image   | string  | null: false                    |
| item_id | integer | null: false, foreign_key: true |

### Association
- belongs_to :items


## brands テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association
- has_many :items
