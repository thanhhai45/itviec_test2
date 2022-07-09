# Assume you have a blog site with more than 5000 posts. Now you need to track page view of the posts to show number of page view in post detail page when user view a post. Everyday there will be 1 million new page view to your posts. Use Postgresql to store the data. How will you design the system to maximize the performance?

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
