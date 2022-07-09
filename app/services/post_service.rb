class PostService
  def initialize(post:)
    @post = post
  end

  def publish
    @user_subscribed.each do |user|
      update_unsubscribe_expire(user.id)
      SendEmailJob.perform_later(user, @post)
    end
  end

  # method I think before have unsubscribe link
  # def user_subscribed
  #   @user_subscribed || @User.all
  # end

  # method I think after have unsubscribe link
  def user_subscribed
    @user_subscribed ||= @User.joins(:subscribe).where("subscribe.status = ?", Subscribe.statuses[:subscribe])
  end

  private

  def update_unsubscribe_expire(user_id)
    sub = Subscribe.find_by(user_id: user_id)
    sub.update_column(expired_at: Time.zone.now+3.days)
  end
end