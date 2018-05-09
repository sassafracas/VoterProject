class Bill < ActiveRecord::Base
  has_many :subscriptionlists
  has_many :users, through: :subscriptionlists

end
