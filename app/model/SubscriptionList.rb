class UserSubsciption < ActiveRecord::Base
  has_many :users
  has_many :bills
end
