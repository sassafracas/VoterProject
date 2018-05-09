class CreateSubscriptionlistsTable < ActiveRecord::Migration
  def change
    create_table :subscriptionlists do |t|
      t.string :user_id
      t.string :bill_id
    end
  end
end
