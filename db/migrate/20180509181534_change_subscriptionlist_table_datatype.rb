class ChangeSubscriptionlistTableDatatype < ActiveRecord::Migration
  def change
    change_column :subscriptionlists, :user_id, :integer
    change_column :subscriptionlists, :bill_id, :integer
  end
end
