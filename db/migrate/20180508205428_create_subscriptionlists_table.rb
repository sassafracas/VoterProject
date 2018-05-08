class CreateSubscriptionlistsTable < ActiveRecord::Migration
  def change
    create_table :subscriptionlist do |t|
      t.string :user_id
      t.string :bill_id
    end
  end
end
