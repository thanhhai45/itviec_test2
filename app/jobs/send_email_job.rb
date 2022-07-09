class SendEmailJob < ApplicationJob
  queue_as :default

  def perform user, post
    @user = user
    @post = post
    PublishPostMailer.publish_notice(@user, @post).deliver_later
  end
end
