# Assume you have a blog site with more than 5000 posts. Now you need to track page view of the posts to show number of page view in post detail page when user view a post. Everyday there will be 1 million new page view to your posts. Use Postgresql to store the data. How will you design the system to maximize the performance?

# Design table

Post table:

| Column name | type    | Option      | Default        |   |
|-------------|---------|-------------|----------------|---|
| id          | integer | primary key | auto increment |   |
| title       | string  | not null    |                |   |
| description | text    | not null    |                |   |
| views       | integer |             | default: 0     |   |

User table:
| Column name | type    | Option      | Default        |   |
|-------------|---------|-------------|----------------|---|
| id          | integer | primary key | auto increment |   |
| title       | string  | not null    |                |   |
| description | text    | not null    |                |   |
| views       | integer |             | default: 0     |   |

Views table:
| Column name | type    | Option      | Default        |   |
|-------------|---------|-------------|----------------|---|
| id          | integer | primary key | auto increment |   |
| post_id     | integer | not null    | index          |   |
| user_id     | integer | not null    | index          |   |

# Design model
class Post < ApplicationRecord
  has_and_belongs_to_many :views
end

class User < ApplicationRecord
  has_and_belongs_to_many :views
end

# Design system


![Untitled Diagram drawio](https://user-images.githubusercontent.com/22336859/178095968-100e672d-5d8e-40ab-b6b3-a2fd73152549.png)

