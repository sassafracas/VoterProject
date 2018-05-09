class User < ActiveRecord::Base
  has_many :subscriptionlists
  has_many :bills, through: :subscriptionlists
end
