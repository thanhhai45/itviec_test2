class SubscribeService
  def initialize(user_id:, flash:)
    @user_id = user_id
    @flash = flash
  end

  def unsubscribe
    return @flash[:error] = "Link unsubscribe expired" if expired?
    subscribe.update_column(:status, Subscribe.statuses[:unsubscribe])
    @flash[:success] = "You unsubscribe successfully"
    subscribe
  end

  def expired?
    subscribe.expired_at.to_i < Time.zone.now.to_i
  end

  def subscribe
    @subscribe ||= Subscribe.find_by(user_id: @user_id)
  end
end