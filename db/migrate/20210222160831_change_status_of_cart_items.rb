class ChangeStatusOfCartItems < ActiveRecord::Migration[5.2]
  def change
    change_column_default :cart_items, :amount, {:default => 0}
  end
end
