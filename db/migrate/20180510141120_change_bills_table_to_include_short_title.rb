class ChangeBillsTableToIncludeShortTitle < ActiveRecord::Migration[5.2]
  def change
    rename_column :bills, :sponsors, :sponsor
    add_column :bills, :short_title, :string

  end
end
