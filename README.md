## Assume you already built a blog with many posts. When a new post get published, all user subscribed on your site will get a notification about new post via email. Now you want add an unsubscribed link to the email so that user can cancel subscription by clicking on that link. The link will expire after 3 days. Show the code to implement the unsubscribed link feature (only show code for model, services, migration, controller).


----------------------------------------------------
# Resume subscription
- Please focus many file. 
  + UserModel
  + SubscribeModel
  + UserController#unsubscribe
  + PostService
  + SubscribeService
  + db/migrate folder
  + SendEmailJob
  + PublishPostMailer
# Solution
- In the code I believe logic send notification when publish post work very well
- I only improve the code with new requirements unsubscribed link

# Explain

- I reproduce the code send email with delay job 
- I migrate new table subscribe, associate 1-1 with user

Table Subscribe:
| id         | integer  | primary key   | autoincrement             |   |
|------------|----------|---------------|---------------------------|---|
| status     | integer  | default: 1    |                           |   |
| expired_at | datetime | default: null |                           |   |
| user_id    | integer  | not null      | associate with user table |   |

- Model user:
has_one :subscribe

- Model subscribe
belongs_to :user

## Logic

- Beforehand, we send all user. But after apply new logic. We send email to user with subscribed status. Please review on PostService

- Every send email for user subscribed, we will update expired_at of table subscribe, calculate Time.now + 3.days. Please review code. PostService line 25. method name: update_unsubscribe_expire

- When send mail we add new link unsubscribe for user

- When user click to link unsubscribe. Call to link /users/:id/unsubscribe

- Then call UserController and method unsubscribe

- Then this method call to SubscribeService execute unsubscribe action.

- The unsubscribe action. It will check link user expired_at time > Time.now. If true allow change status from subscribe to unsubscribe. Then redirect to welcome page and show flash message successfully.

- But if expired_at time < Time.now. Link to expired and not update status then redirect to welcome page and show flash message error
