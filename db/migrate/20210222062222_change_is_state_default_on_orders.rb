class ChangeIsStateDefaultOnOrders < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :state, to: 0
  end
end
