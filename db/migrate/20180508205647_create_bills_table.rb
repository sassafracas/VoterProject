class CreateBillsTable < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :name
      t.string :sponsors
    end
  end
end
