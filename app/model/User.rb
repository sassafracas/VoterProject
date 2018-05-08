class User < ActiveRecord::Base
  has_many :bills, through: :subscriptionlist
end
