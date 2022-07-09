# Assume you have a ecommerce site to sell some machines. There are four kinds of machine: MA, MB, MC, MD. Each kind has own unit price. Customers can buy machine in single-packs such as: 2MA, 3MA, 5MB, 20MC or multiple-packs such as: 2x2MA+3x5MB. Each pack has own discount. Administrators of the site can change discount of packs and the unit price of machine. Design models

# Design database table

Product table
| Column name | Type    | Option      | Default       |   |
|-------------|---------|-------------|---------------|---|
| id          | integer | primary key | autoincrement |   |
| name        | string  | not null    |               |   |
| price       | decimal | not null    |               |   |
|             |         |             |               |   |

Package table
| Column name | Type    | Option      | Default        |   |
|-------------|---------|-------------|----------------|---|
| id          | integer | primary key | auto increment |   |
| name        | string  | not null    |                |   |
| discount    | decimal | not null    | default: 0     |   |
|             |         |             |                |   |

Product_Package
| Column name | Type    | Option      | Default        |   |
|-------------|---------|-------------|----------------|---|
| id          | integer | primary key | auto increment |   |
| package_id  | integer | not null    | index          |   |
| product_id  | integer | not null    | index          |   |
| quantity    | integer | not null    | default: 0     |   |


# Design database model

Product:

- has_and_belongs_to_many :packages

Pakacge:

- has_and_belongs_to_many :products
