class ChangeStateOfOrders < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :state, :integer, default: 0
  end
  
  def down
    change_column :orders, :state, :integer
  end
end
