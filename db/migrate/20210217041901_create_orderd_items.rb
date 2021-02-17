class CreateOrderdItems < ActiveRecord::Migration[5.2]
  def change
    create_table :orderd_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :price
      t.integer :quantity
      t.integer :create_state

      t.timestamps
    end
  end
end
