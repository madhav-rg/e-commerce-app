class AddUserIdToTables < ActiveRecord::Migration
  def change
  	add_column :customers, :user_id, :integer
    add_column :orders, :user_id, :integer
  end
end
