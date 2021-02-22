class ChangeIsOrderState < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :state, :"0"
  end
end
