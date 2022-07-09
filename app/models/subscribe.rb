class Subscribe < ApplicationRecord
  belongs_to :user

  enum status: { subscribe: 1, unsubscribe: 2 }
end
