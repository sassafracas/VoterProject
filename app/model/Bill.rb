class Bill < ActiveRecord::Base
  has_many :users, through: :subscriptionlist
end
