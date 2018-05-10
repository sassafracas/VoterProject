class Bill < ActiveRecord::Base
  has_many :subscriptionlists
  has_many :users, through: :subscriptionlists

    def save_recent_bill(recentbill)
      self.users << recentbill
    end

    

end
