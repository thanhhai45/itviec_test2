class PublishPostMailer < ApplicationMailer
  default from: "admin@example.com"
  
  layout "mailer"

  def publish_notice user, post
    @user = user
    @post = post
    binding.break
    mail to: @user.email, subject: "Notification new post publish"
  end
end
