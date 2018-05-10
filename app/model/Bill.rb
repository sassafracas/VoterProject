class Bill < ActiveRecord::Base
  has_many :subscriptionlists
  has_many :users, through: :subscriptionlists

def self.most_popular_bill
  self.all.max_by do |bill_obj|
    bill_obj.users.uniq.count
  end
end

def self.find_bill_by_name(bill_slug) #only ones in the db
  self.find_by(name: "#{bill_slug}")
end

end
